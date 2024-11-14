package com.example.mmo_shop.dao.repository;

import com.example.mmo_shop.dao.model.entity.Product;
import com.example.mmo_shop.dao.model.entity.ProductVersion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductVersionRepository extends JpaRepository<ProductVersion,Integer> {
    List<ProductVersion> getProductVersionsByProduct(Product product);
}
