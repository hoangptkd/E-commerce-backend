package com.example.mmo_shop.rest;

import com.example.mmo_shop.dao.model.entity.Status;
import com.example.mmo_shop.dao.model.entity.User;
import com.example.mmo_shop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/admin")
public class RestAdmin {
    @Autowired
    private UserService userService;
    @GetMapping("/getAllUser")
    public Page<User> getAllUser(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "12") int size,
            @RequestParam(required = false) String sortBy,
            @RequestParam(defaultValue = "asc") String sortDir
    ) {
        return userService.findAll(page,size,sortBy,sortDir);
    }
    @PutMapping("/editStatus/{userId}")
    public User editStatus(@PathVariable int userId,@RequestParam Status status) {
        User user = userService.findByID(userId);
        user.setStatus(status);
        return userService.updateUser(user);
    }
}
