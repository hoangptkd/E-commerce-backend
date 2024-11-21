package com.example.mmo_shop.service.Imple;

import com.example.mmo_shop.dao.model.entity.*;
import com.example.mmo_shop.dao.repository.CategoryRepository;
import com.example.mmo_shop.dao.repository.ProductRepository;
import com.example.mmo_shop.dao.repository.ProductVersionRepository;
import com.example.mmo_shop.dao.repository.ShopRepository;
import com.example.mmo_shop.dao.specification.ProductSpecification;
import com.example.mmo_shop.service.ProductService;
import com.example.mmo_shop.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class ProductServiceImple implements ProductService {

    private final ProductRepository productRepository;
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private ShopRepository shopRepository;
    @Autowired
    private ProductVersionRepository productVersionRepository;

    public ProductServiceImple(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Override
    public List<Category> getCategories() {

        return categoryRepository.findAll();
    }

    @Override
    public List<Category> getSpecialCategories() {
        Pageable pageable = PageRequest.of(0, 4);
        return categoryRepository.findTopCategoriesSortedByProductCount(pageable);
    }

    @Override
    public Set<Category> getCategoriesBySearch(String name) {
        List<Product> productsBySearch = productRepository.findByNameContainingIgnoreCase(name);
        Map<Category, List<Product>> categoryMap = productsBySearch.stream().filter(product -> product.getCategory() != null).collect(Collectors.groupingBy(
                Product::getCategory,
                LinkedHashMap::new,
                Collectors.toList()
        ));

        return categoryMap.keySet();
    }

    @Override
    public Page<Product> findAllByPage(int page, int size, String sortBy, String sortDir) {
        Pageable pageable;

        if (sortBy != null && !sortBy.isEmpty()) {
            Sort sort = sortDir.equalsIgnoreCase("asc")
                    ? Sort.by(sortBy).ascending()
                    : Sort.by(sortBy).descending();
            pageable = PageRequest.of(page, size, sort);
        } else {
            pageable = PageRequest.of(page, size);
        }

        return productRepository.findAll(pageable);
    }

    @Override
    public List<Product> findByCategory(int categoryId) {
        Category category = categoryRepository.findById(categoryId).orElse(null);
        return productRepository.findByCategory(category);
    }

    @Override
    public Page<Product> findSpecialProduct(int page, int size, String sortBy, int categoryId) {
        Category category = categoryRepository.findById(categoryId).orElse(null);
        Sort sort = Sort.by(sortBy).descending();
        Pageable pageable = PageRequest.of(page, size, sort);
        if (category == null) {
            return productRepository.findByStatus(1, pageable);
        } else {
            return productRepository.findByCategoryAndStatus(category, 1, pageable);
        }
    }

    @Override
    public Page<Product> findNewProduct(int page, int size, String sortBy) {
        Sort sort = Sort.by(sortBy).descending();
        Pageable pageable = PageRequest.of(page, size, sort);
        return productRepository.findByStatus(1, pageable);

    }

    @Override
    public List<Product> findByShop(int shopId) {
        Shop shop = shopRepository.findById(shopId).orElse(null);
        return productRepository.findByShop(shop).stream().filter(product -> product.getStatus() != 0).toList();
    }


    @Override
    public Product findByID(int id) {
        Optional<Product> product = productRepository.findById(id);
        if (product.isEmpty()) {
            throw new RuntimeException("Product id not found -" + id);
        }
        return product.orElse(null);
    }

    @Override
    public List<Product> findSimilarProducts(int categoryId, int productId) {
        return productRepository.findSimilarProducts(categoryId, productId);
    }

    @Override
    public Page<Product> search(String name, int page, int size, String sortBy, String sortDir, int categoryId, int priceFrom, int priceTo) {
        Pageable pageable;
        if (sortBy != null && !sortBy.isEmpty()) {
            Sort sort = sortDir.equalsIgnoreCase("asc")
                    ? Sort.by(sortBy).ascending()
                    : Sort.by(sortBy).descending();
            pageable = PageRequest.of(page, size, sort);
        } else {
            pageable = PageRequest.of(page, size);
        }

        /*Specification*/
        Specification<Product> spec = Specification.where(null);
        if (name != null && !name.trim().isEmpty()) {
            spec = spec.and(ProductSpecification.hasName(name));
        }
        if (categoryId != 0) {
            spec = spec.and(ProductSpecification.hasCategory(categoryId));
        }
        if (priceTo != 0) {
            spec = spec.and(ProductSpecification.hasPriceBetween(priceFrom, priceTo));
        }
        spec = spec.and(ProductSpecification.hasStatus(1));
        return productRepository.findAll(spec, pageable);
    }

    @Transactional
    @Override
    public Product save(Product product) {
        User user = SecurityService.getAuth();
        Shop shop = user.getShop();
        product.setShop(shop);
        List<ProductVersion> changeProductVersions = product.getVersions();
        for (ProductVersion productVersion : changeProductVersions) {
            productVersion.setStatus(1);
            productVersion.setProduct(product);
        }
        productRepository.save(product);
        return product;
    }

    @Transactional
    @Override
    public Product update(Product product) {
        List<ProductVersion> productVersionList = productVersionRepository.getProductVersionsByProduct(product);
        List<ProductVersion> deleteProductVersions = productVersionList.stream().filter(productVersion -> !product.getVersions().contains(productVersion)).toList();
        deleteProductVersions.forEach(productVersion -> productVersion.setStatus(0));
        save(product);
        return product;
    }

    @Override
    public void updateBuyersCount(Product product, int quantity) {
        int buyersCount = product.getBuyersCount();
        product.setBuyersCount(buyersCount + quantity);
        productRepository.save(product);
    }

    @Transactional
    @Override
    public Product newSave(Product product) {
        product.setStatus(1);
        save(product);
        return product;
    }


    @Override
    @Transactional
    public Product deleteByID(int id) {
        Product product = findByID(id);
        User user = SecurityService.getAuth();
        Shop shop = user.getShop();
        if (shop.getProduct().stream().noneMatch(product1 -> product1.getId() == product.getId())) {
            System.out.println("Sản phẩm không trong shop");
            return null;
        }
        if (product != null) {
            product.setStatus(0);
            List<ProductVersion> productVersionList = product.getVersions().stream().map(productVersion -> {
                productVersion.setStatus(0);
                return productVersion;
            }).toList();
            productVersionRepository.saveAll(productVersionList);
            productRepository.save(product);
        }
        return product;
    }


}
