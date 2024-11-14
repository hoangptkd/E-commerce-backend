package com.example.mmo_shop.service.Imple;

import com.example.mmo_shop.dao.model.dto.DtoMapper;
import com.example.mmo_shop.dao.model.dto.OrderDTO;
import com.example.mmo_shop.dao.model.entity.*;
import com.example.mmo_shop.dao.repository.OrderItemRepository;
import com.example.mmo_shop.dao.repository.OrderRepository;
import com.example.mmo_shop.service.OrderService;
import com.example.mmo_shop.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class OrderServiceImple implements OrderService {
    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderItemRepository orderItemRepository;
    @Override
    public List<Order> findAll() {
        return orderRepository.findAll();
    }
    @Override
    public List<Order> findByUser() {
        User user = SecurityService.getAuth();

        return orderRepository.findAllByUser(user);
    }

    @Override
    public Page<Order> findByShop(int page) {
        User user = SecurityService.getAuth();
        Shop shop = user.getShop();
        Pageable pageable= PageRequest.of(page,20);
        return orderRepository.getOrdersByShop(shop,pageable);
    }
    @Override
    public OrderDTO addOrder(Order order) {
        User user = SecurityService.getAuth();
        order.setUser(user);
        if (order.getShippingAddress() == null) {
            order.setShippingAddress(user.getAddress());
        }
        order.setPickupAddress(order.getShop().getUser().getAddress());
        return DtoMapper.toOrderDto(orderRepository.save(order));
    }

    @Override
    public Order changeStatusOrder(int orderId,DeliveryStatus status) {
        User user = SecurityService.getAuth();
        Shop shop = user.getShop();
        Order order = orderRepository.getOrderById(orderId);
        if (shop.getId() != order.getShop().getId()) {
            return null;
        }
        order.setStatus(status);
        return orderRepository.save(order);
    }

    @Override
    public OrderItem addOrderItem(OrderItem orderItem) {
        return orderItemRepository.save(orderItem);
    }

    @Override
    public OrderDTO update(CartItem cartItem) {
        return null;
    }

    @Override
    public void deleteByID(int id) {
        orderRepository.deleteById(id);
    }
    @Override
    public Map<DeliveryStatus, Long> getQuantityData() {
        User user = SecurityService.getAuth();
        Shop shop = user.getShop();
        List<Order> orderList= orderRepository.getOrdersByShop(shop);
        Map<DeliveryStatus, Long> quantityData = orderList.stream().collect(Collectors.groupingBy(
            order -> (order.getStatus()),
            Collectors.counting()
        ));
        return quantityData;
    }
    @Override
    public Map<DeliveryStatus, Long> getAllData() {
        List<Order> orderList= orderRepository.findAll();
        Map<DeliveryStatus, Long> quantityData = orderList.stream().collect(Collectors.groupingBy(
                order -> (order.getStatus()),
                Collectors.counting()
        ));
        return quantityData;
    }
}
