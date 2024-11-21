package com.example.mmo_shop.rest;

import com.example.mmo_shop.dao.model.dto.OrderDTO;
import com.example.mmo_shop.dao.model.entity.*;
import com.example.mmo_shop.dao.repository.ProductVersionRepository;
import com.example.mmo_shop.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/order")
public class RestOrder {
    @Autowired
    private OrderService orderService;
    @Autowired
    private ProductVersionRepository productVersionRepository;

    @PostMapping("/create")
    @Transactional
    public List<OrderDTO> createOrder(@RequestBody List<OrderItem> orderItems) {
        List<OrderDTO> orderDTOList = new ArrayList<>();
        Map<Shop, List<OrderItem>> groupOrderItem = orderItems.stream().collect(Collectors.groupingBy(
                orderItem -> {
                    ProductVersion productVersion = productVersionRepository.findById(orderItem.getProductVersion().getId()).get();
                    orderItem.setPrice(productVersion.getPrice() * orderItem.getQuantity());
                    return productVersion.getProduct().getShop();
                }
        ));
        for (Map.Entry<Shop, List<OrderItem>> shopMap : groupOrderItem.entrySet()) {
            Order order = new Order(shopMap.getKey());
            order.setOrderItems(new ArrayList<>());
            List<OrderItem> orderItemList = shopMap.getValue();
            orderItemList.stream().forEach(
                    orderItem -> {
                        orderItem.setOrder(order);
                        order.getOrderItems().add(orderItem);
                    }
            );

            order.setTotal();
            orderDTOList.add(orderService.addOrder(order));

        }
        return orderDTOList;
    }

    @GetMapping("/allOrderFromUser")
    public List<Order> findAllOrderFromUser() {
        return orderService.findByUser();
    }

    @GetMapping("/selectOrder/{orderId}")
    public Order selectOrder(@PathVariable int orderId) {
        List<Order> orders = orderService.findByUser();
        for (Order order : orders) {
            if (order.getId() == orderId) {
                return order;
            }
        }
        return null;
    }

    @GetMapping("/allOrder")
    @PreAuthorize("hasAnyRole('ADMIN')")
    public List<Order> findAllOrder() {
        return orderService.findAll();
    }

    @GetMapping("/allOrderByShop")
    public Page<Order> findAllOrderByShop(@RequestParam int page) {
        return orderService.findByShop(page);
    }

    @PutMapping("/editOrder/{status}")
    public void editOrder(@PathVariable String status, @RequestParam int orderId) {
        DeliveryStatus deliveryStatus;
        switch (status) {
            case "confirmed":
                deliveryStatus = DeliveryStatus.confirmed;
                break;
            case "cancelled":
                deliveryStatus = DeliveryStatus.cancelled;
                break;
            case "received":
                deliveryStatus = DeliveryStatus.received;
                break;
            default:
                deliveryStatus = DeliveryStatus.pending;
                break;
        }
        orderService.changeStatusOrder(orderId, deliveryStatus);
    }


    @GetMapping("/getQuantityData")
    @PreAuthorize("hasAnyRole('SELLER')")
    public Map<DeliveryStatus, Long> getData() {
        return orderService.getQuantityData();
    }

    @GetMapping("/getAllData")
    @PreAuthorize("hasAnyRole('ADMIN')")
    public Map<DeliveryStatus, Long> getAllData() {
        return orderService.getAllData();
    }
}
