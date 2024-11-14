package com.example.mmo_shop.dao.model.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @ManyToOne()
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @JsonIgnoreProperties({"orders","cart","shop","address"})
    private User user;
    @Column(name = "order_date")
    @CreationTimestamp
    private Timestamp orderDate; // khong can dien
    @ManyToOne(fetch = FetchType.LAZY)
    @JsonBackReference(value = "shop-order")
    @JoinColumn(name = "shop_id", referencedColumnName = "id")
    private Shop shop; // khong can dien
    @Enumerated(EnumType.STRING)
    @Column(columnDefinition = "ENUM('pending', 'confirmed', 'received', 'cancelled') DEFAULT 'pending'")
    private DeliveryStatus status = DeliveryStatus.pending; // khong can dien

    @Column(name = "total", nullable = false)
    private double total; // khong can dien

    @Column(name = "ship_address")
    private String shippingAddress; // khong can dien

    @OneToOne()
    @JoinColumn(name = "pickup_address_id", referencedColumnName = "id")
    private Address pickupAddress; // khong can dien

    // Quan hệ 1-nhiều với OrderItem
    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JsonManagedReference
    private List<OrderItem> orderItems;

    // Constructor, getter và setter
    public Order() {
    }

    public Order(Shop shop) {
        this.shop = shop;
    }
// Các getter và setter cho các thuộc tính

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }


    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }


    public DeliveryStatus getStatus() {
        return status;
    }

    public void setStatus(DeliveryStatus status) {
        this.status = status;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal() {
        this.total = 0;
        this.orderItems.stream().forEach(
                orderItem -> this.total += (orderItem.getPrice() * orderItem.getQuantity())
        );
    }

    public String getShippingAddress() {
                                                            return shippingAddress;
    }

    public void setShippingAddress(Address shippingAddressEntity) {
        if (shippingAddressEntity == null) {
            this.shippingAddress = "";
            return;
        }
        this.shippingAddress = shippingAddressEntity.getStreet() + ", " + shippingAddressEntity.getDistrict() + ", " + shippingAddressEntity.getCity();
    }

    public Address getPickupAddress() {
        return pickupAddress;
    }

    public void setPickupAddress(Address pickupAddress) {
        this.pickupAddress = pickupAddress;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }
}
