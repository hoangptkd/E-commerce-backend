package com.example.mmo_shop.dao.repository;

import com.example.mmo_shop.dao.model.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {
    User findByUsername(String username);

    User findByGmail(String gmail);
}
