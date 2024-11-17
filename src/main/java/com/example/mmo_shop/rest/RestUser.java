package com.example.mmo_shop.rest;

import com.example.mmo_shop.dao.model.dto.DtoMapper;
import com.example.mmo_shop.dao.model.dto.UserDTO;
import com.example.mmo_shop.dao.model.entity.*;
import com.example.mmo_shop.service.Imple.UserProfileService;
import com.example.mmo_shop.service.JwtUtil;
import com.example.mmo_shop.dao.model.dto.AuthRequest;
import com.example.mmo_shop.service.SecurityService;
import com.example.mmo_shop.service.UserService;
import com.example.mmo_shop.service.mail.KafkaProducer;
import io.jsonwebtoken.Header;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
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
import java.util.Random;

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

    @PostMapping("/signup")
    public String register(@RequestBody User user) {
        return userService.createUser(user);

    }

    @PostMapping("/logout")
    public String logout(@RequestHeader("Authorization") String authorizationHeader) {
        String jwt = null;
        if (authorizationHeader != null && authorizationHeader.startsWith("Bearer ") && !authorizationHeader.equals("Bearer null")) {
            jwt = authorizationHeader.substring(7);
            return userService.logout(jwt,jwtUtil.getExpirationTime(jwt));
        }
        return "failLogout";
    }

    @PostMapping("/forgotPassword/{username}")
    public String forgotPassword(@PathVariable String username ) {
        return userService.createCode(username);
    }
    @PostMapping("/forgotPassword/confirmCode/{username}")
    public String confirmCode(@PathVariable String username, @RequestParam int code) {
        return userService.confirmCode(username,code);
    }
    @PutMapping("/changeNewPassword")
    public void newPassword(@RequestParam String newPass ) {
        userProfileService.changePass(newPass);
    }
    @PutMapping("/changePassword")
    public void forgotPassword(@RequestParam String currentPass, @RequestParam String newPass ) {
        userProfileService.changePass(currentPass,newPass);
    }

    @GetMapping("/getMainAddress")
    @PreAuthorize("hasAnyRole('CUSTOMER')")
    public Address getAddress() {
        return userProfileService.getAddress();
    }

    @Transactional
    @PutMapping("/updateProfile")
    @PreAuthorize("hasAnyRole('CUSTOMER')")
    public User updateAddress(@RequestBody UserDTO userDTO) {
        return userProfileService.updateProfile(userDTO);
    }



}
