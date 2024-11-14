package com.example.mmo_shop.service;

import com.example.mmo_shop.dao.model.entity.Address;
import com.example.mmo_shop.dao.model.entity.Role;
import com.example.mmo_shop.dao.model.entity.User;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.Set;

public interface UserService {
    Page<User> findAll(int page, int size, String sortBy, String sortDir);
    User findByID(int id);
    User findByUsername(String username);

    User findByGmail(String gmail);

    void createUser(User user, Set<Role> roleSet);
    User updateUser(User user);
    void deleteByID(int id);
}
