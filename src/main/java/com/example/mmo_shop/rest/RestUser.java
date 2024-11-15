package com.example.mmo_shop.rest;

import com.example.mmo_shop.dao.model.dto.DtoMapper;
import com.example.mmo_shop.dao.model.dto.UserDTO;
import com.example.mmo_shop.dao.model.entity.Address;
import com.example.mmo_shop.dao.model.entity.Cart;
import com.example.mmo_shop.dao.model.entity.Role;
import com.example.mmo_shop.dao.model.entity.User;
import com.example.mmo_shop.service.Imple.UserProfileService;
import com.example.mmo_shop.service.JwtUtil;
import com.example.mmo_shop.dao.model.dto.AuthRequest;
import com.example.mmo_shop.service.SecurityService;
import com.example.mmo_shop.service.UserService;
import io.jsonwebtoken.Header;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@RestController
@RequestMapping("/api/user")
public class RestUser {
    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtUtil jwtUtil;
    @Autowired
    private UserService userService;
    @Autowired
    private UserProfileService userProfileService;


    @GetMapping("/check")
    public UserDTO checkToken() {
        User user = SecurityService.getAuth();
        return user!= null ? DtoMapper.toUserDTO(user) :null;
    }
    @GetMapping("/checkShop")
    public List<GrantedAuthority> checkShopToken() {
        List<GrantedAuthority> roles = SecurityService.checkRoles();
        return roles;
    }

    @PostMapping("/login")
    public String login(@RequestBody AuthRequest authRequest) {

        try {
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(authRequest.getUsername(), authRequest.getPassword())
            );
            return jwtUtil.generateToken(authRequest.getUsername());
        } catch (AuthenticationException e) {
            return "Login failed: " + e.getMessage();
        }
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
    @PostMapping("/signup")
    public String register(@RequestBody User user) {
        if (userService.findByUsername(user.getUsername()) != null) {
            return "ErrorUsername";
        }
        if (userService.findByGmail(user.getGmail()) != null) {
            return "ErrorGmail";
        }
        if (!isValidEmail(user.getGmail())) {
            return "ErrorValidateGmail";
        }
        if (user.getBalance() == 0) {
            user.setBalance(0); // Giá trị mặc định
        }
        Date date = new Date();
        user.setRegister_date(date);
        user.setCart(new Cart());
        Set<Role> roleSet = new HashSet<>();
        roleSet.add(new Role(user,"ROLE_CUSTOMER"));
        userService.createUser(user, roleSet);
        return "Success";
    }

    @PutMapping("/forgotPassword/{username}")
    public void forgotPassword(@PathVariable String username ) {
        User user = userService.findByUsername(username);

    }
    @PutMapping("/changePassword")
    public void forgotPassword(@RequestParam String currentPass, @RequestParam String newPass ) {
        userProfileService.changePass(currentPass,newPass);
    }
    @GetMapping("/getMainAddress")
    public Address getAddress() {
        return userProfileService.getAddress();
    }

    @Transactional
    @PutMapping("/updateProfile")
    public User updateAddress(@RequestBody UserDTO userDTO) {
        return userProfileService.updateProfile(userDTO);
    }


}
