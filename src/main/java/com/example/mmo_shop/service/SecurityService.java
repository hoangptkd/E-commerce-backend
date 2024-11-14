package com.example.mmo_shop.service;

import com.example.mmo_shop.dao.model.dto.CustomUserDetails;
import com.example.mmo_shop.dao.model.entity.Role;
import com.example.mmo_shop.dao.model.entity.User;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Transactional
public class SecurityService {

    public static User getAuth() {
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
            User user = userDetails.getUser();
            if (user.getStatus().equals("inactive")) {
                return null;
            }
            return userDetails.getUser();
        } catch (ClassCastException e) {
            return null;
        }
    }

    public static List<GrantedAuthority> checkRoles() {
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();

            List<GrantedAuthority> roles = new ArrayList<>(userDetails.getAuthorities());
            return roles;
        } catch (ClassCastException e) {
            return null;
        }
    }
}
