package com.example.mmo_shop.dao.model.dto;

import java.util.List;

public class ProductDTO {
    private int id;
    private String name;
    private String description;
    private String categoryName;
    private String shopName;
    private double rating;
    private int buyersCount;
    private List<String> versionsName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public int getBuyersCount() {
        return buyersCount;
    }

    public void setBuyersCount(int buyersCount) {
        this.buyersCount = buyersCount;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public void setVersionsName(List<String> versionsName) {
    }

    public List<String> getVersionsName(List<String> list) {
        return versionsName;
    }
}
