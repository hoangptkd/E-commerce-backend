package com.example.mmo_shop.dao.repository;

import com.example.mmo_shop.dao.model.entity.Cart;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CartRepository extends JpaRepository<Cart, Integer> {
}
