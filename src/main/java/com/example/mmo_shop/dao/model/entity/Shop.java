package com.example.mmo_shop.dao.model.entity;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;  // Sử dụng gói `jakarta.persistence` cho JPA 3.x trở lên, hoặc `javax.persistence` cho các phiên bản cũ hơn.
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "shops")  // Đặt tên bảng tương ứng với bảng `shops` trong cơ sở dữ liệu.
public class Shop {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // ID tự động tăng (AUTO_INCREMENT).
    private int id;

    @Column(nullable = false)
    private String name;

    private String description;

    @OneToOne
    @JoinColumn(name = "owner_id",referencedColumnName = "id")
    @JsonBackReference(value = "shop_user")
    private User user;

    @Column(name = "created_at", nullable = false, updatable = false, insertable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private Timestamp createdAt;

    @Column(name = "updated_at", nullable = false, insertable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP")
    private Timestamp updatedAt;

    @Enumerated(EnumType.STRING)  // Ánh xạ cột ENUM thành kiểu dữ liệu Enum trong Java.
    @Column(columnDefinition = "ENUM('active', 'inactive', 'suspended') DEFAULT 'active'")
    private Status status = Status.active;

    @Column(precision = 3, scale = 2)  // `DECIMAL(3,2)` trong cơ sở dữ liệu.
    private BigDecimal rating;

    @Column(name = "total_sales", precision = 15, scale = 2, nullable = false, columnDefinition = "DECIMAL(15,2) DEFAULT 0")
    private BigDecimal totalSales;

    @OneToMany(mappedBy = "shop", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JsonManagedReference(value = "shop-product")
    private Set<Product> product;

    @OneToMany(mappedBy = "shop", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JsonManagedReference(value = "shop-order")
    private List<Order> order;
    // Constructor không đối số là bắt buộc cho JPA
    public Shop() {}

    // Getter và Setter cho tất cả các trường dữ liệu
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

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public BigDecimal getRating() {
        return rating;
    }

    public void setRating(BigDecimal rating) {
        this.rating = rating;
    }

    public BigDecimal getTotalSales() {
        return totalSales;
    }

    public void setTotalSales(BigDecimal totalSales) {
        this.totalSales = totalSales;
    }

    public User getUser() {
        return user;
    }

    public Set<Product> getProduct() {
        return product;
    }

    public void setProduct(Set<Product> product) {
        this.product = product;
    }

    public List<Order> getOrder() {
        return order;
    }

    public void setOrder(List<Order> order) {
        this.order = order;
    }

}