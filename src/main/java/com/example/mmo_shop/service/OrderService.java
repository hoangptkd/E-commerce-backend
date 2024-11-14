package com.example.mmo_shop.service;

import com.example.mmo_shop.dao.model.dto.OrderDTO;
import com.example.mmo_shop.dao.model.entity.CartItem;
import com.example.mmo_shop.dao.model.entity.DeliveryStatus;
import com.example.mmo_shop.dao.model.entity.Order;
import com.example.mmo_shop.dao.model.entity.OrderItem;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.Map;

public interface OrderService {
    List<Order> findByUser();
    Page<Order> findByShop(int page);
    OrderDTO addOrder(Order order);
    Order changeStatusOrder(int orderId, DeliveryStatus status);
    OrderItem addOrderItem(OrderItem orderItem);
    OrderDTO update(CartItem cartItem);
    void deleteByID(int id);

    Map<DeliveryStatus, Long> getQuantityData();

    List<Order> findAll();

    Map<DeliveryStatus, Long> getAllData();
}
