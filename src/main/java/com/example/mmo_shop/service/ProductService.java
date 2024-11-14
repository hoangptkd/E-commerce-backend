package com.example.mmo_shop.service;

import com.example.mmo_shop.dao.model.entity.Category;
import com.example.mmo_shop.dao.model.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

public interface ProductService {
    List<Category> getCategories();

    List<Category> getSpecialCategories();

    Set<Category> getCategoriesBySearch(String name);

    Page<Product> findAllByPage(int page, int size, String sortBy, String sortDir);
    List<Product> findByCategory(int categoryId);

    Page<Product> findNewProduct(int page, int size, String sortBy);

    List<Product> findByShop(int shopId);
    Product findByID(int id);


    List<Product> findSimilarProducts(int categoryId, int productId);

    Page<Product> search(String name, int page, int size, String sortBy, String sortDir,int categoryId,int priceFrom,int priceTo);


    Product save(Product product);

    @Transactional
    Product newSave(Product product);

    Product deleteByID(int id);

    Page<Product> findSpecialProduct(int page, int size, String sortBy,int categoryId);

    Product update(Product product);
}
