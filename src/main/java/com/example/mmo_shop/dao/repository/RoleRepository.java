package com.example.mmo_shop.dao.repository;

import com.example.mmo_shop.dao.model.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long> {
}