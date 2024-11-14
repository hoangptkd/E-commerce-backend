package com.example.mmo_shop.rest;

import com.example.mmo_shop.dao.model.dto.ProductDTO;
import com.example.mmo_shop.dao.model.dto.DtoMapper;
import com.example.mmo_shop.dao.model.entity.Category;
import com.example.mmo_shop.dao.model.entity.Shop;
import com.example.mmo_shop.dao.model.entity.User;
import com.example.mmo_shop.dao.repository.ShopRepository;
import com.example.mmo_shop.service.Imple.ImageService;
import com.example.mmo_shop.service.ProductService;
import com.example.mmo_shop.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import com.example.mmo_shop.dao.model.entity.Product;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;
import java.util.Set;

@RestController
@RequestMapping("/api/products")
public class RestProduct {
    private final ProductService productService;

    private final ImageService imageService;
    @Autowired
    public RestProduct(ProductService productService, ImageService imageService) {
        this.productService = productService;
        this.imageService = imageService;
    }

    @Autowired
    private ShopRepository shopRepository;


    @PostMapping("/upload")
    public String uploadImage(@RequestParam("image") MultipartFile file) {
        return imageService.uploadImage(file);
    }

    @GetMapping("/getCategories")
    public Set<Category> getCategories(@RequestParam String name) {
        return productService.getCategoriesBySearch(name);
    }
    @GetMapping("/getAllCategories")
    public List<Category> getAllCategories() {
        return productService.getCategories();
    }
    @GetMapping("/getTopCategories")
    public List<Category> getTopCategories() {
        return productService.getSpecialCategories();
    }
    @GetMapping("/listAll")
    @PreAuthorize("hasAnyRole('ADMIN')")
    public Page<Product> getAllProducts(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "12") int size,
            @RequestParam(required = false) String sortBy,
            @RequestParam(defaultValue = "asc") String sortDir) {
        return productService.findAllByPage(page,size,sortBy,sortDir);
    }

    @GetMapping("/listSpecial")
    public Page<Product> getSpecialProduct(
           @RequestParam(defaultValue = "0") int page,
           @RequestParam(defaultValue = "12") int size,
           @RequestParam(defaultValue = "buyersCount") String sortBy,
           @RequestParam(defaultValue = "0") int categoryId
   ) {
        return productService.findSpecialProduct(page,size,sortBy,categoryId);
   }
    @GetMapping("/listNew")
    public Page<Product> getNewProduct(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "12") int size,
            @RequestParam(defaultValue = "registerDate") String sortBy
    ) {
        return productService.findNewProduct(page,size,sortBy);
    }
    @GetMapping("/search")
    public Page<Product> getProductsBySearch(
            @RequestParam String name,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "12") int size,
            @RequestParam(required = false) String sortBy,
            @RequestParam(defaultValue = "asc") String sortDir,
            @RequestParam(required = false) int categoryId,
            @RequestParam(required = false) int priceFrom,
            @RequestParam(required = false) int priceTo
    ) {

       return productService.search(name,page,size,sortBy,sortDir,categoryId,priceFrom,priceTo);


    }

    @GetMapping("/listByCategory")
    public List<ProductDTO> getProductsByCategory(@RequestParam int categoryId) {
        List<Product> productsByCategory = productService.findByCategory(categoryId);
        return productsByCategory.stream().map(DtoMapper::toDto).toList();
    }

    @GetMapping("/listProductInShop")
    public List<ProductDTO> getProductsByShop(@RequestParam int shopId) {
        List<Product> productsByShop = productService.findByShop(shopId);
        return productsByShop.stream().map(DtoMapper::toDto).toList();
    }

    @GetMapping("/listByShop")
    @PreAuthorize("hasAnyRole('SELLER')")
    public List<Product> getProductsByShop() {
        User user = SecurityService.getAuth();
        int shopId = user.getShop().getId();
        List<Product> productsByShop = productService.findByShop(shopId);
        return productsByShop;
    }

    @GetMapping("/{productId}/similar")
    public List<Product> getSimilarProducts(@PathVariable int productId) {
        Product currentProduct = productService.findByID(productId);
        // Lấy danh sách sản phẩm tương tự
        List<Product> similarProducts = productService.findSimilarProducts(
                currentProduct.getCategory().getId(),
                productId
        );

        return similarProducts;

    }
    @PostMapping("/add")
    @PreAuthorize("hasAnyRole('SELLER')")
    public Product addProduct(@RequestBody Product product) {
        return productService.newSave(product);
    }

    @PutMapping("/update/{productId}")
    @PreAuthorize("hasAnyRole('SELLER')")
    public Product updateProduct(@PathVariable int productId, @RequestBody Product product) {
        User user = SecurityService.getAuth();
        assert user != null;
        Shop shop = user.getShop();
        List<Product> productListByShop = productService.findByShop(shop.getId());
        Optional<Product> findProduct = productListByShop.stream().filter(checkProduct -> checkProduct.getId() == productId).findFirst();
        if (findProduct.isPresent()) {
            return productService.update(product);
        }
        return null;
    }

    @DeleteMapping("/delete/{productId}")
    @PreAuthorize("hasAnyRole('SELLER')")
    public Product deleteProduct(@PathVariable int productId ) {
        return productService.deleteByID(productId);
    }
}
