package com.example.mmo_shop.service;


import com.example.mmo_shop.dao.model.entity.User;
import org.springframework.data.domain.Page;


public interface UserService {
    Page<User> findAll(int page, int size, String sortBy, String sortDir);

    User findByID(int id);

    User findByUsername(String username);

    User findByGmail(String gmail);

    String createUser(User user);

    User updateUser(User user);

    void deleteByID(int id);


    String logout(String jwt, long expTime);

    String createCode(String username);

    String confirmCode(String username, int code);
}
