package com.example.mmo_shop.dao.model.dto;

import java.util.ArrayList;
import java.util.List;

public class ShopCartDTO {
    private int shopId;
    private String shopName;
    private List<CartItemDTO> items;


    public ShopCartDTO() {
    }

    // Constructors
    public ShopCartDTO(int shopId, String shopName) {
        this.shopId = shopId;
        this.shopName = shopName;
        this.items = new ArrayList<>();
    }

    // Getters and setters


    public int getShopId() {
        return shopId;
    }

    public void setShopId(int shopId) {
        this.shopId = shopId;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public List<CartItemDTO> getItems() {
        return items;
    }

    public void setItems(List<CartItemDTO> items) {
        this.items = items;
    }
}
