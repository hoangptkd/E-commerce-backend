package com.example.mmo_shop.dao.repository;

import com.example.mmo_shop.dao.model.entity.Category;
import com.example.mmo_shop.dao.model.entity.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderItemRepository extends JpaRepository<OrderItem,Integer> {
}
