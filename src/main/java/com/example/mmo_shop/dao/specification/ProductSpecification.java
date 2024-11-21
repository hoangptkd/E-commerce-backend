package com.example.mmo_shop.dao.specification;

import com.example.mmo_shop.dao.model.entity.Product;
import org.springframework.data.jpa.domain.Specification;


public class ProductSpecification {
    public static Specification<Product> hasName(String name) {
        return (root, query, cb) -> cb.like(root.get("name"), "%" + name + "%");
    }

    public static Specification<Product> hasCategory(int categoryId) {
        return (root, query, cb) -> cb.equal(root.get("category").get("id"), categoryId);
    }

    public static Specification<Product> hasPriceBetween(double priceFrom, double priceTo) {
        return (root, query, cb) -> cb.between(root.get("price"), priceFrom, priceTo);
    }

    public static Specification<Product> hasStatus(int status) {
        return (root, query, cb) -> cb.equal(root.get("status"), status);
    }

}
