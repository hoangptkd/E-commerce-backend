package com.example.mmo_shop.dao.repository;

import com.example.mmo_shop.dao.model.entity.Category;
import com.example.mmo_shop.dao.model.entity.Product;
import com.example.mmo_shop.dao.model.entity.Shop;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product,Integer>{

    Page<Product> findByNameContainingIgnoreCaseAndStatus(String name,int status, Pageable pageable);

    List<Product> findByCategory(Category category);

    List<Product> findByShop(Shop shop);

    List<Product> findByNameContainingIgnoreCase(String name);

    Page<Product> findByCategoryAndStatus(Category category,int status, Pageable pageable);
    Page<Product> findByStatus(int status, Pageable pageable);
    @Query("""
        SELECT p FROM Product p 
        WHERE p.category.id = :categoryId 
        AND p.id != :productId
        ORDER BY p.rating DESC, p.buyersCount DESC 
        LIMIT 5
        """)
    List<Product> findSimilarProducts(
            @Param("categoryId") int categoryId,
            @Param("productId") int productId
    );

    Page<Product> findByNameContainingIgnoreCaseAndStatusAndCategory(String name, int i,Category category, Pageable pageable);
    Page<Product> findByNameContainingIgnoreCaseAndStatusAndPriceBetween(String name, int i,double priceFrom, double priceTo, Pageable pageable);
    Page<Product> findByNameContainingIgnoreCaseAndStatusAndCategoryAndPriceBetween(String name, int i,Category category,double priceFrom, double priceTo, Pageable pageable);
}