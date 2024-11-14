package com.example.mmo_shop.dao.model.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(name = "product_versions")
@JsonIgnoreProperties(ignoreUnknown = true)

public class ProductVersion {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private int id;
    @ManyToOne()
    @JoinColumn(name = "product_id", referencedColumnName = "id")
    @JsonIgnoreProperties("versions")
    private Product product;
    @Column(name = "version_name")
    private String versionName;
    private double price;
    private Integer stock;
    private int status;
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public void setProduct(Product product) {
        this.product = product;
    }

    public Product getProduct() {
        return product;
    }

    public String getVersionName() {
        return versionName;
    }

    public void setVersionName(String versionName) {
        this.versionName = versionName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }



    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
