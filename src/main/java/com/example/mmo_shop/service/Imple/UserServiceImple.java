package com.example.mmo_shop.service.Imple;

import com.example.mmo_shop.dao.model.dto.CustomUserDetails;
import com.example.mmo_shop.dao.model.entity.Cart;
import com.example.mmo_shop.dao.model.entity.EmailMessage;
import com.example.mmo_shop.dao.model.entity.Role;
import com.example.mmo_shop.dao.model.entity.User;
import com.example.mmo_shop.dao.repository.RoleRepository;
import com.example.mmo_shop.dao.repository.UserRepository;
import com.example.mmo_shop.service.JwtBlacklistService;
import com.example.mmo_shop.service.JwtUtil;
import com.example.mmo_shop.service.UserService;
import com.example.mmo_shop.service.mail.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Duration;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class UserServiceImple implements UserService, UserDetailsService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private JwtBlacklistService jwtBlacklistService;
    @Autowired
    private RedisTemplate<String, Object> redisTemplate;
    @Autowired
    private JwtUtil jwtUtil;
    private final Random random = new Random();
    @Autowired
    private EmailService emailService;

    @Autowired
    public UserServiceImple(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    @Override
    public Page<User> findAll(int page, int size, String sortBy, String sortDir) {
        Pageable pageable;
        if (sortBy != null && !sortBy.isEmpty()) {
            Sort sort = sortDir.equalsIgnoreCase("asc")
                    ? Sort.by(sortBy).ascending()
                    : Sort.by(sortBy).descending();
            pageable = PageRequest.of(page, size, sort);
        } else {
            pageable = PageRequest.of(page, size);
        }
        return userRepository.findAll(pageable);
    }

    @Override
    public User findByID(int id) {

        Optional<User> user = userRepository.findById(id);
        return user.orElse(null);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public User findByGmail(String gmail) {
        return userRepository.findByGmail(gmail);
    }

    @Transactional
    @Override
    public String createUser(User user) {
        if (findByUsername(user.getUsername()) != null) {
            return "ErrorUsername";
        }
        if (findByGmail(user.getGmail()) != null) {
            return "ErrorGmail";
        }
        if (!isValidEmail(user.getGmail())) {
            return "ErrorValidateGmail";
        }
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        if (user.getBalance() == 0) {
            user.setBalance(0);
        }
        Date date = new Date();
        user.setRegister_date(date);
        user.setCart(new Cart());
        Set<Role> roleSet = new HashSet<>();
        roleSet.add(new Role(user, "ROLE_CUSTOMER"));
        for (Role role : roleSet) {

            userRepository.save(user);
            // Cập nhật username trong bảng authorities
            roleRepository.save(role);
        }
        return "Success";
    }

    public static boolean isValidEmail(String email) {
        // Biểu thức chính quy để xác thực định dạng email
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@gmail\\.com$";

        Pattern pattern = Pattern.compile(emailRegex);
        if (email == null) {
            return false;
        }
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    @Override
    public User updateUser(User user) {
        userRepository.save(user);
        return user;
    }

    @Override
    public void deleteByID(int id) {
        userRepository.deleteById(id);
    }

    @Override
    public String logout(String jwt, long expTime) {
        jwtBlacklistService.blacklistToken(jwt, expTime);
        return "success";
    }

    @Override
    public String createCode(String username) {
        User user = findByUsername(username);
        if (user == null) {
            return "noUser";
        }
        int code = 100000 + random.nextInt(900000);
        EmailMessage emailMessage = new EmailMessage(user.getGmail(), "Code", "Ma xac thuc: " + code);
        emailService.sendEmail(emailMessage);
        String key = "validCode:" + username + "|" + code;
        long ttl = 5 * 60 * 1000;
        redisTemplate.opsForValue().set(key, "1", Duration.ofMillis(ttl));
        return "success";
    }

    @Override
    public String confirmCode(String username, int code) {
        if (Boolean.TRUE.equals(redisTemplate.hasKey("validCode:" + username + "|" + code))) {
            redisTemplate.delete("validCode:" + username + "|" + code);
            return jwtUtil.generateToken(username);
        } else {
            return "fail";
        }
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException(username);
        }
        return new CustomUserDetails(user);
    }
}
