package com.example.mmo_shop.dao.model.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;

@Entity
@Table(name = "products")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    @Column(name = "image_path")
    private String imagePath;
    private String description;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id", referencedColumnName = "id")
    @JsonIgnoreProperties("products")
    private Category category;
    @Column(name = "min_price")
    private double price;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "seller_id", referencedColumnName = "id")
    @JsonBackReference(value = "shop-product")
    private Shop shop;
    @Column(name = "rating")
    private Double rating = 0.0;
    @Column(name = "buyers_count")
    private int buyersCount = 0;
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JsonIgnoreProperties("product")
    private List<ProductVersion> versions = new LinkedList<>();
    @Column(name = "register_date")
    @CreationTimestamp
    private Timestamp registerDate; // khong can dien
    @Column(name = "all_stock")
    private int allStock;
    private int status;
    public Product() {
    }

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

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    public Double getRating() {
        return rating;
    }

    public void setBuyersCount(int buyersCount) {
        this.buyersCount = buyersCount;
    }

    public void setRating(Double rating) {
        this.rating = rating;
    }

    public int getBuyersCount() {
        return buyersCount;
    }


    public void setVersions(List<ProductVersion> versions) {
        this.versions = versions;
    }

    public List<ProductVersion> getVersions() {

        return versions.stream().filter(productVersion -> productVersion.getStatus() == 1).toList();
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Double getPrice() {
        return price;
    }

    public int getAllStock() {
        return allStock;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Timestamp getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Timestamp registerDate) {
        this.registerDate = registerDate;
    }
}
