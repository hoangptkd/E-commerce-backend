package com.example.mmo_shop.dao.model.dto;

import com.example.mmo_shop.dao.model.entity.Address;
import com.example.mmo_shop.dao.model.entity.OrderItem;

import java.util.List;

public class OrderRequest {
        private List<OrderItem> orderItems;
        private Address address;

    public OrderRequest(List<OrderItem> orderItems, Address address) {
        this.orderItems = orderItems;
        this.address = address;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }
}
