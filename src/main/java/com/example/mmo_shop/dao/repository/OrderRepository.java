package com.example.mmo_shop.dao.repository;

import com.example.mmo_shop.dao.model.entity.Order;
import com.example.mmo_shop.dao.model.entity.Shop;
import com.example.mmo_shop.dao.model.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {
    Page<Order> getOrdersByShop(Shop shop, Pageable pageable);

    List<Order> getOrdersByShop(Shop shop);

    List<Order> findAllByUser(User user);

    Order getOrderById(int id);
}
