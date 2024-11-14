USE account_trade;
SET SQL_SAFE_UPDATES = 0;

Drop table shops;
CREATE TABLE shops (
    id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    owner_id int NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status ENUM('active', 'inactive', 'suspended') DEFAULT 'active',
    rating DECIMAL(3,2),
    total_sales DECIMAL(15,2) DEFAULT 0,
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

-- Shopping Cart table
CREATE TABLE shopping_cart (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Shopping Cart Items table
CREATE TABLE shopping_cart_items (
    cart_item_id INT PRIMARY KEY AUTO_INCREMENT,
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (cart_id) REFERENCES shopping_cart(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);


INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (1, 3, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (1, 17, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (2, 6, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (3, 19, 5);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (4, 8, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (5, 1, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (6, 10, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (7, 15, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (8, 12, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (9, 5, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (10, 20, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (2, 4, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (3, 14, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (1, 11, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (5, 7, 5);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (6, 9, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (7, 13, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (8, 2, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (9, 16, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (10, 18, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (4, 1, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (5, 3, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (6, 5, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (7, 9, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (8, 20, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (9, 7, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (10, 4, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (1, 8, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (2, 17, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (3, 6, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (4, 10, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (5, 14, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (6, 11, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (7, 18, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (8, 13, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (9, 2, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (10, 15, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (1, 19, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (2, 3, 5);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (3, 12, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (4, 9, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (5, 1, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (6, 8, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (7, 14, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (8, 5, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (9, 20, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (10, 16, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (1, 4, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (2, 10, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (3, 18, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (4, 7, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (5, 12, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (6, 13, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (7, 19, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (8, 1, 5);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (9, 15, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (10, 3, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (1, 2, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (2, 6, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (3, 17, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (4, 11, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (5, 8, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (6, 9, 5);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (7, 14, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (8, 10, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (9, 12, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (10, 4, 5);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (1, 15, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (2, 18, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (3, 1, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (4, 16, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (5, 19, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (6, 7, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (7, 20, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (8, 8, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (9, 3, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity) VALUES (10, 2, 5);


INSERT INTO users (gmail, username, password, full_name, balance, register_date, purchased_count) VALUES
('john.doe@gmail.com', 'johndoe', 'hashed_password_1', 'John Doe', 1000.00, '2023-01-15', 5),
('jane.smith@gmail.com', 'janesmith', 'hashed_password_2', 'Jane Smith', 1500.50, '2023-02-20', 8),
('mike.johnson@gmail.com', 'mikejohnson', 'hashed_password_3', 'Mike Johnson', 750.25, '2023-03-10', 3),
('emily.brown@gmail.com', 'emilybrown', 'hashed_password_4', 'Emily Brown', 2000.75, '2023-04-05', 12),
('david.wilson@gmail.com', 'davidwilson', 'hashed_password_5', 'David Wilson', 500.00, '2023-05-22', 2),
('sarah.lee@gmail.com', 'sarahlee', 'hashed_password_6', 'Sarah Lee', 1200.30, '2023-06-18', 7),
('chris.taylor@gmail.com', 'christaylor', 'hashed_password_7', 'Chris Taylor', 800.60, '2023-07-30', 4),
('lisa.anderson@gmail.com', 'lisaanderson', 'hashed_password_8', 'Lisa Anderson', 1800.90, '2023-08-12', 10),
('kevin.martin@gmail.com', 'kevinmartin', 'hashed_password_9', 'Kevin Martin', 300.45, '2023-09-25', 1),
('amanda.white@gmail.com', 'amandawhite', 'hashed_password_10', 'Amanda White', 950.70, '2023-10-08', 6);


INSERT INTO authorities (username, role) VALUES

('johndoe', 'ROLE_CUSTOMER'),
('janesmith', 'ROLE_SELLER'),
('mikejohnson', 'ROLE_CUSTOMER'),
('emilybrown', 'ROLE_SELLER'),
('davidwilson', 'ROLE_CUSTOMER'),
('sarahlee', 'ROLE_SELLER'),
('christaylor', 'ROLE_CUSTOMER'),
('lisaanderson', 'ROLE_SELLER'),
('kevinmartin', 'ROLE_CUSTOMER'),
('amandawhite', 'ROLE_SELLER'),
('johndoe', 'ROLE_SELLER'),
('janesmith', 'ROLE_CUSTOMER'),
('mikejohnson', 'ROLE_SELLER'),
('emilybrown', 'ROLE_CUSTOMER'),
('sarahlee', 'ROLE_CUSTOMER');

INSERT INTO shops (name, description, owner_id, status, rating, total_sales) VALUES
('TechHub', 'Your one-stop shop for all things tech', 1, 'active', 4.5, 250000),
('Fashion Forward', 'Trendy clothes for the modern individual', 2, 'active', 4.2, 180000),
('Home Sweet Home', 'Furniture and decor to make your house a home', 3, 'active', 4.7, 320000),
('Bookworm Paradise', 'A haven for book lovers', 4, 'active', 4.8, 95000),
('Sports Centraseller_idseller_idl', 'Gear up for your next adventure', 5, 'active', 4.3, 210000),
('Gourmet Delights', 'Premium food products for the discerning palate', 6, 'inactive', 3.9, 75000),
('Pet Pals', 'Everything your furry friend needs', 7, 'active', 4.6, 130000),
('Green Thumb', 'For all your gardening needs', 8, 'active', 4.1, 85000),
('Toy World', 'Bringing joy to children of all ages', 9, 'suspended', 3.7, 50000),
('Beauty Bliss', 'Enhance your natural beauty', 10, 'active', 4.4, 190000);

INSERT INTO categories (name) VALUES
('Quần áo nam'),
('Điện tử'),
('Đồ gia dụng'),
('Sách');

INSERT INTO products (name, description, category_id, seller_id, rating, buyers_count) VALUES
('Áo sơ mi nam', 'Áo sơ mi nam cao cấp', 1, 1, 4.5, 100),
('Quần jeans nam', 'Quần jeans nam skinny', 1, 2, 4.2, 80),
('Laptop Dell XPS', 'Laptop Dell XPS 13 inch', 2, 3, 4.8, 50),
('Smartphone Samsung', 'Samsung Galaxy S21', 2, 4, 4.6, 120),
('Nồi cơm điện', 'Nồi cơm điện thông minh', 3, 5, 4.3, 70),
('Bàn làm việc', 'Bàn làm việc gỗ oak', 3, 6, 4.4, 30),
('Sách "Đắc Nhân Tâm"', 'Sách best-seller của Dale Carnegie', 4, 7, 4.7, 200),
('Truyện Harry Potter', 'Bộ truyện Harry Potter (7 cuốn)', 4, 8, 4.9, 150),
('Áo khoác nam', 'Áo khoác nam mùa đông', 1, 1, 4.1, 60),
('Tai nghe Bluetooth', 'Tai nghe không dây chống ồn', 2, 2, 4.5, 90),
('Máy pha cà phê', 'Máy pha cà phê tự động', 3, 3, 4.2, 40),
('Sách "Sapiens"', 'Sách về lịch sử loài người', 4, 4, 4.6, 110),
('Quần short nam', 'Quần short nam mùa hè', 1, 5, 4.0, 75),
('Máy tính bảng iPad', 'iPad Pro 12.9 inch', 2, 6, 4.7, 65),
('Bộ nồi inox', 'Bộ nồi inox 5 món', 3, 7, 4.3, 55),
('Sách "Người giàu nhất thành Babylon"', 'Sách về tài chính cá nhân', 4, 8, 4.5, 95),
('Áo thun nam', 'Áo thun nam cotton 100%', 1, 1, 4.2, 130),
('Loa Bluetooth', 'Loa Bluetooth chống nước', 2, 2, 4.4, 70),
('Chảo chống dính', 'Chảo chống dính cao cấp', 3, 3, 4.1, 45),
('Sách "Nhà giả kim"', 'Tiểu thuyết của Paulo Coelho', 4, 4, 4.8, 180);

INSERT INTO product_versions (product_id, version_name, price) VALUES
(1, 'Trắng - Size M', 299000),
(1, 'Trắng - Size L', 299000),
(1, 'Xanh - Size M', 299000),
(2, 'Xanh đậm - 30', 499000),
(2, 'Xanh đậm - 32', 499000),
(2, 'Đen - 30', 499000),
(3, '8GB RAM - 256GB SSD', 25990000),
(3, '16GB RAM - 512GB SSD', 29990000),
(4, 'Đen - 128GB', 19990000),
(4, 'Trắng - 256GB', 21990000),
(5, '1.8L', 899000),
(5, '2.2L', 999000),
(6, '120x60cm', 1999000),
(6, '150x75cm', 2499000),
(7, 'Bìa cứng', 150000),
(7, 'Bìa mềm', 120000),
(8, 'Tiếng Anh', 1500000),
(8, 'Tiếng Việt', 1200000),
(9, 'Đen - Size L', 799000),
(9, 'Nâu - Size XL', 799000),
(10, 'Đen', 2990000),
(10, 'Trắng', 2990000),
(11, 'Đen', 1590000),
(11, 'Bạc', 1590000),
(12, 'Tiếng Anh', 250000),
(12, 'Tiếng Việt', 200000),
(13, 'Xanh navy - 30', 299000),
(13, 'Be - 32', 299000),
(14, 'Xám - 128GB', 24990000),
(14, 'Bạc - 256GB', 27990000);

CREATE TABLE addresses (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    street VARCHAR(100),
    district VARCHAR(100),
    city VARCHAR(100)
);

Alter table addresses CHANGE COLUMN `city` `city` ENUM(    'An Giang',
    'Bà Rịa - Vũng Tàu',
    'Bắc Giang',
    'Bắc Kạn',
    'Bạc Liêu',
    'Bắc Ninh',
    'Bến Tre',
    'Bình Định',
    'Bình Dương',
    'Bình Phước',
    'Bình Thuận',
    'Cà Mau',
    'Cần Thơ',
    'Cao Bằng',
    'Đà Nẵng',
    'Đắk Lắk',
    'Đắk Nông',
    'Điện Biên',
    'Đồng Nai',
    'Đồng Tháp',
    'Gia Lai',
    'Hà Giang',
    'Hà Nam',
    'Hà Nội',
    'Hà Tĩnh',
    'Hải Dương',
    'Hải Phòng',
    'Hậu Giang',
    'Hòa Bình',
    'Hưng Yên',
    'Khánh Hòa',
    'Kiên Giang',
    'Kon Tum',
    'Lai Châu',
    'Lâm Đồng',
    'Lạng Sơn',
    'Lào Cai',
    'Long An',
    'Nam Định',
    'Nghệ An',
    'Ninh Bình',
    'Ninh Thuận',
    'Phú Thọ',
    'Phú Yên',
    'Quảng Bình',
    'Quảng Nam',
    'Quảng Ngãi',
    'Quảng Ninh',
    'Quảng Trị',
    'Sóc Trăng',
    'Sơn La',
    'Tây Ninh',
    'Thái Bình',
    'Thái Nguyên',
    'Thanh Hóa',
    'Thừa Thiên Huế',
    'Tiền Giang',
    'TP. Hồ Chí Minh',
    'Trà Vinh',
    'Tuyên Quang',
    'Vĩnh Long',
    'Vĩnh Phúc',
    'Yên Bái') ;
    
INSERT INTO addresses (user_id, street, district, city) VALUES (1, '123 Lê Lợi', 'Hải Châu', 'Đà Nẵng');
INSERT INTO addresses (user_id, street, district, city) VALUES (2, '456 Trần Phú', 'Ba Đình', 'Hà Nội');
INSERT INTO addresses (user_id, street, district, city) VALUES (3, '789 Nguyễn Huệ', 'Quận 1', 'TP. Hồ Chí Minh');
INSERT INTO addresses (user_id, street, district, city) VALUES (4, '101 Nguyễn Trãi', 'Hồng Bàng', 'Hải Phòng');
INSERT INTO addresses (user_id, street, district, city) VALUES (5, '202 Lê Lợi', 'Ninh Kiều', 'Cần Thơ');
INSERT INTO addresses (user_id, street, district, city) VALUES (6, '303 Phan Chu Trinh', 'Phú Nhuận', 'Thừa Thiên Huế');
INSERT INTO addresses (user_id, street, district, city) VALUES (7, '404 Hoàng Văn Thụ', 'Thành phố Vũng Tàu', 'Bà Rịa - Vũng Tàu');
INSERT INTO addresses (user_id, street, district, city) VALUES (8, '505 Bạch Đằng', 'Phường 1', 'Sóc Trăng');
INSERT INTO addresses (user_id, street, district, city) VALUES (9, '606 Cách Mạng Tháng 8', 'Thành phố Bắc Ninh', 'Bắc Ninh');
INSERT INTO addresses (user_id, street, district, city) VALUES (10, '707 Hùng Vương', 'Thành phố Hạ Long', 'Quảng Ninh');

ALTER TABLE `account_trade`.`orders` 
AUTO_INCREMENT = 1 ;

INSERT INTO categories (name) VALUES
('Electronics'),
('Clothing'),
('Home & Garden'),
('Sports & Outdoors'),
('Books'),
('Toys & Games'),
('Beauty & Personal Care'),
('Automotive'),
('Health & Wellness'),
('Food & Beverages'),
('Jewelry'),
('Pet Supplies'),
('Office Products'),
('Musical Instruments'),
('Art & Crafts'),
('Baby Products'),
('Tools & Home Improvement'),
('Furniture'),
('Stationery'),
('Fitness Equipment');

-- Insert products
INSERT INTO products (name, description, category_id, seller_id, rating, buyers_count, image_path) VALUES
('Smartphone X', 'High-end smartphone with advanced features', 1, FLOOR(1 + RAND() * 10), ROUND(RAND() * 5, 2), FLOOR(RAND() * 1000), CONCAT('product/product-', FLOOR(1 + RAND() * 20), '.jpg')),
('Cotton T-Shirt', 'Comfortable cotton t-shirt for everyday wear', 2, FLOOR(1 + RAND() * 10), ROUND(RAND() * 5, 2), FLOOR(RAND() * 1000), CONCAT('product/product-', FLOOR(1 + RAND() * 20), '.jpg')),
('Garden Hose', 'Durable garden hose for watering plants', 3, FLOOR(1 + RAND() * 10), ROUND(RAND() * 5, 2), FLOOR(RAND() * 1000), CONCAT('product/product-', FLOOR(1 + RAND() * 20), '.jpg')),
('Tennis Racket', 'Professional-grade tennis racket', 4, FLOOR(1 + RAND() * 10), ROUND(RAND() * 5, 2), FLOOR(RAND() * 1000), CONCAT('product/product-', FLOOR(1 + RAND() * 20), '.jpg')),
('Bestselling Novel', 'Exciting novel by a renowned author', 5, FLOOR(1 + RAND() * 10), ROUND(RAND() * 5, 2), FLOOR(RAND() * 1000), CONCAT('product/product-', FLOOR(1 + RAND() * 20), '.jpg')),
('Board Game Set', 'Family-friendly board game for all ages', 6, FLOOR(1 + RAND() * 10), ROUND(RAND() * 5, 2), FLOOR(RAND() * 1000), CONCAT('product/product-', FLOOR(1 + RAND() * 20), '.jpg')),
('Face Cream', 'Moisturizing face cream for all skin types', 7, FLOOR(1 + RAND() * 10), ROUND(RAND() * 5, 2), FLOOR(RAND() * 1000), CONCAT('product/product-', FLOOR(1 + RAND() * 20), '.jpg')),
('Car Air Freshener', 'Long-lasting car air freshener', 8, FLOOR(1 + RAND() * 10), ROUND(RAND() * 5, 2), FLOOR(RAND() * 1000), CONCAT('product/product-', FLOOR(1 + RAND() * 20), '.jpg')),
('Multivitamin Tablets', 'Daily multivitamin supplement', 9, FLOOR(1 + RAND() * 10), ROUND(RAND() * 5, 2), FLOOR(RAND() * 1000), CONCAT('product/product-', FLOOR(1 + RAND() * 20), '.jpg')),
('Organic Coffee Beans', 'Premium organic coffee beans', 10, FLOOR(1 + RAND() * 10), ROUND(RAND() * 5, 2), FLOOR(RAND() * 1000), CONCAT('product/product-', FLOOR(1 + RAND() * 20), '.jpg')),
('Silver Necklace', 'Elegant silver necklace with pendant', 11, FLOOR(1 + RAND() * 10), ROUND(RAND() * 5, 2), FLOOR(RAND() * 1000), CONCAT('product/product-', FLOOR(1 + RAND() * 20), '.jpg')),
('Dog Food', 'Nutritious dry dog food', 12, FLOOR(1 + RAND() * 10), ROUND(RAND() * 5, 2), FLOOR(RAND() * 1000), CONCAT('product/product-', FLOOR(1 + RAND() * 20), '.jpg')),
('Desk Organizer', 'Multi-compartment desk organizer', 13, FLOOR(1 + RAND() * 10), ROUND(RAND() * 5, 2), FLOOR(RAND() * 1000), CONCAT('product/product-', FLOOR(1 + RAND() * 20), '.jpg')),
('Acoustic Guitar', 'Beginner-friendly acoustic guitar', 14, FLOOR(1 + RAND() * 10), ROUND(RAND() * 5, 2), FLOOR(RAND() * 1000), CONCAT('product/product-', FLOOR(1 + RAND() * 20), '.jpg')),
('Watercolor Paint Set', 'Professional watercolor paint set', 15, FLOOR(1 + RAND() * 10), ROUND(RAND() * 5, 2), FLOOR(RAND() * 1000), CONCAT('product/product-', FLOOR(1 + RAND() * 20), '.jpg')),
('Baby Stroller', 'Lightweight and foldable baby stroller', 16, FLOOR(1 + RAND() * 10), ROUND(RAND() * 5, 2), FLOOR(RAND() * 1000), CONCAT('product/product-', FLOOR(1 + RAND() * 20), '.jpg')),
('Power Drill', 'Cordless power drill with multiple attachments', 17, FLOOR(1 + RAND() * 10), ROUND(RAND() * 5, 2), FLOOR(RAND() * 1000), CONCAT('product/product-', FLOOR(1 + RAND() * 20), '.jpg')),
('Leather Sofa', 'Comfortable leather sofa for living room', 18, FLOOR(1 + RAND() * 10), ROUND(RAND() * 5, 2), FLOOR(RAND() * 1000), CONCAT('product/product-', FLOOR(1 + RAND() * 20), '.jpg')),
('Notebook Set', 'Set of 3 lined notebooks', 19, FLOOR(1 + RAND() * 10), ROUND(RAND() * 5, 2), FLOOR(RAND() * 1000), CONCAT('product/product-', FLOOR(1 + RAND() * 20), '.jpg')),
('Yoga Mat', 'Non-slip yoga mat for fitness enthusiasts', 20, FLOOR(1 + RAND() * 10), ROUND(RAND() * 5, 2), FLOOR(RAND() * 1000), CONCAT('product/product-', FLOOR(1 + RAND() * 20), '.jpg'));

-- Insert remaining 30 products (simplified for brevity)
INSERT INTO products (name, description, category_id, seller_id, rating, buyers_count, image_path)
SELECT 
    CONCAT('Product ', id + 20),
    CONCAT('Description for product ', id + 20),
    FLOOR(1 + RAND() * 20),
    FLOOR(1 + RAND() * 10),
    ROUND(RAND() * 5, 2),
    FLOOR(RAND() * 1000),
    CONCAT('product/product-', FLOOR(1 + RAND() * 20), '.jpg')
FROM (SELECT id FROM products LIMIT 30) AS t;

-- Insert product versions
INSERT INTO product_versions (product_id, version_name, price, stock)
SELECT 
    p.id,
    CASE 
        WHEN ROW_NUMBER() OVER (PARTITION BY p.id ORDER BY RAND()) = 1 THEN 'Standard'
        WHEN ROW_NUMBER() OVER (PARTITION BY p.id ORDER BY RAND()) = 2 THEN 'Deluxe'
        ELSE 'Premium'
    END,
    ROUND(10 + RAND() * 990, 2),
    FLOOR(RAND() * 100)
FROM products p
CROSS JOIN (SELECT 1 UNION SELECT 2 UNION SELECT 3) AS t
LIMIT 120;







DELIMITER //

CREATE TRIGGER update_product_min_price
AFTER INSERT ON product_versions
FOR EACH ROW
BEGIN
    UPDATE products p
    SET p.min_price = (
        SELECT MIN(v.price)
        FROM product_versions v
        WHERE v.product_id = p.id
    )
    WHERE p.id = NEW.product_id;
END;
//

CREATE TRIGGER update_product_min_price_on_update
AFTER UPDATE ON product_versions
FOR EACH ROW
BEGIN
    UPDATE products p
    SET p.min_price = (
        SELECT MIN(v.price)
        FROM product_versions v
        WHERE v.product_id = p.id
    )
    WHERE p.id = NEW.product_id;
END;
//

CREATE TRIGGER update_product_min_price_on_delete
AFTER DELETE ON product_versions
FOR EACH ROW
BEGIN
    UPDATE products p
    SET p.min_price = (
        SELECT MIN(v.price)
        FROM product_versions v
        WHERE v.product_id = p.id
    )
    WHERE p.id = OLD.product_id;
END;
//

DELIMITER ;
------
DELIMITER //

CREATE TRIGGER update_product_all_stock
AFTER INSERT ON product_versions
FOR EACH ROW
BEGIN
    UPDATE products p
    SET p.all_stock = (
        SELECT SUM(v.stock)
        FROM product_versions v
        WHERE v.product_id = p.id
    )
    WHERE p.id = NEW.product_id;
END;
//

CREATE TRIGGER update_product_all_stock_on_update
AFTER UPDATE ON product_versions
FOR EACH ROW
BEGIN
    UPDATE products p
    SET p.all_stock = (
        SELECT SUM(v.stock)
        FROM product_versions v
        WHERE v.product_id = p.id
    )
    WHERE p.id = NEW.product_id;
END;
//

CREATE TRIGGER update_product_all_stock_on_delete
AFTER DELETE ON product_versions
FOR EACH ROW
BEGIN
    UPDATE products p
    SET p.all_stock = (
        SELECT SUM(v.stock)
        FROM product_versions v
        WHERE v.product_id = p.id
    )
    WHERE p.id = OLD.product_id;
END;
//

DELIMITER ;

UPDATE products p
SET p.min_price = (
    SELECT MIN(v.price)
    FROM product_versions v
    WHERE v.product_id = p.id
);

UPDATE products p
SET p.all_stock = (
    SELECT SUM(v.stock)
    FROM product_versions v
    WHERE v.product_id = p.id
);

