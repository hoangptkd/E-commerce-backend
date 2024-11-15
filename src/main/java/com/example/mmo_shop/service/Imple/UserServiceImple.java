package com.example.mmo_shop.service.Imple;

import com.example.mmo_shop.dao.repository.RoleRepository;
import com.example.mmo_shop.dao.repository.UserRepository;
import com.example.mmo_shop.dao.model.dto.CustomUserDetails;
import com.example.mmo_shop.dao.model.entity.Role;
import com.example.mmo_shop.dao.model.entity.User;
import com.example.mmo_shop.service.JwtBlacklistService;
import com.example.mmo_shop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;
import java.util.Set;

@Service
public class UserServiceImple implements UserService, UserDetailsService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    @Autowired
    private JwtBlacklistService jwtBlacklistService;

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
            pageable = PageRequest.of(page, size,sort);
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
    public User findByGmail(String gmail) {return userRepository.findByGmail(gmail);}
    @Transactional
    @Override
    public void createUser(User user, Set<Role> roleSet) {
        for (Role role: roleSet) {
            user.setPassword("{noop}" + user.getPassword());

            userRepository.save(user);
            // Cập nhật username trong bảng authorities
            roleRepository.save(role);
        }
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
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException(username);
        }
        return new CustomUserDetails(user);
    }
}
