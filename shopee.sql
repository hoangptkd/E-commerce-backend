USE
account_trade;
SET
SQL_SAFE_UPDATES = 0;

Drop table shops;
CREATE TABLE shops
(
    id          int PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(255) NOT NULL,
    description TEXT,
    owner_id    int          NOT NULL,
    created_at  TIMESTAMP      DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status      ENUM('active', 'inactive', 'suspended') DEFAULT 'active',
    rating      DECIMAL(3, 2),
    total_sales DECIMAL(15, 2) DEFAULT 0,
    FOREIGN KEY (owner_id) REFERENCES users (id)
);

-- Shopping Cart table
CREATE TABLE shopping_cart
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    user_id    INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

-- Shopping Cart Items table
CREATE TABLE shopping_cart_items
(
    cart_item_id INT PRIMARY KEY AUTO_INCREMENT,
    cart_id      INT NOT NULL,
    product_id   INT NOT NULL,
    quantity     INT NOT NULL,
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (cart_id) REFERENCES shopping_cart (id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE
);


INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (1, 3, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (1, 17, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (2, 6, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (3, 19, 5);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (4, 8, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (5, 1, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (6, 10, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (7, 15, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (8, 12, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (9, 5, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (10, 20, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (2, 4, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (3, 14, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (1, 11, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (5, 7, 5);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (6, 9, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (7, 13, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (8, 2, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (9, 16, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (10, 18, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (4, 1, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (5, 3, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (6, 5, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (7, 9, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (8, 20, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (9, 7, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (10, 4, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (1, 8, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (2, 17, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (3, 6, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (4, 10, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (5, 14, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (6, 11, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (7, 18, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (8, 13, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (9, 2, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (10, 15, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (1, 19, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (2, 3, 5);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (3, 12, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (4, 9, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (5, 1, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (6, 8, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (7, 14, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (8, 5, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (9, 20, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (10, 16, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (1, 4, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (2, 10, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (3, 18, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (4, 7, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (5, 12, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (6, 13, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (7, 19, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (8, 1, 5);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (9, 15, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (10, 3, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (1, 2, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (2, 6, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (3, 17, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (4, 11, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (5, 8, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (6, 9, 5);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (7, 14, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (8, 10, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (9, 12, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (10, 4, 5);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (1, 15, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (2, 18, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (3, 1, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (4, 16, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (5, 19, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (6, 7, 3);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (7, 20, 2);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (8, 8, 1);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (9, 3, 4);
INSERT INTO shopping_cart_items (cart_id, product_id, quantity)
VALUES (10, 2, 5);


INSERT INTO users (gmail, username, password, full_name, balance, register_date, purchased_count)
VALUES ('john.doe@gmail.com', 'johndoe', 'hashed_password_1', 'John Doe', 1000.00, '2023-01-15', 5),
       ('jane.smith@gmail.com', 'janesmith', 'hashed_password_2', 'Jane Smith', 1500.50, '2023-02-20', 8),
       ('mike.johnson@gmail.com', 'mikejohnson', 'hashed_password_3', 'Mike Johnson', 750.25, '2023-03-10', 3),
       ('emily.brown@gmail.com', 'emilybrown', 'hashed_password_4', 'Emily Brown', 2000.75, '2023-04-05', 12),
       ('david.wilson@gmail.com', 'davidwilson', 'hashed_password_5', 'David Wilson', 500.00, '2023-05-22', 2),
       ('sarah.lee@gmail.com', 'sarahlee', 'hashed_password_6', 'Sarah Lee', 1200.30, '2023-06-18', 7),
       ('chris.taylor@gmail.com', 'christaylor', 'hashed_password_7', 'Chris Taylor', 800.60, '2023-07-30', 4),
       ('lisa.anderson@gmail.com', 'lisaanderson', 'hashed_password_8', 'Lisa Anderson', 1800.90, '2023-08-12', 10),
       ('kevin.martin@gmail.com', 'kevinmartin', 'hashed_password_9', 'Kevin Martin', 300.45, '2023-09-25', 1),
       ('amanda.white@gmail.com', 'amandawhite', 'hashed_password_10', 'Amanda White', 950.70, '2023-10-08', 6);


INSERT INTO authorities (username, role)
VALUES ('johndoe', 'ROLE_CUSTOMER'),
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

INSERT INTO shops (name, description, owner_id, status, rating, total_sales)
VALUES ('TechHub', 'Your one-stop shop for all things tech', 1, 'active', 4.5, 250000),
       ('Fashion Forward', 'Trendy clothes for the modern individual', 2, 'active', 4.2, 180000),
       ('Home Sweet Home', 'Furniture and decor to make your house a home', 3, 'active', 4.7, 320000),
       ('Bookworm Paradise', 'A haven for book lovers', 4, 'active', 4.8, 95000),
       ('Sports Centraseller_idseller_idl', 'Gear up for your next adventure', 5, 'active', 4.3, 210000),
       ('Gourmet Delights', 'Premium food products for the discerning palate', 6, 'inactive', 3.9, 75000),
       ('Pet Pals', 'Everything your furry friend needs', 7, 'active', 4.6, 130000),
       ('Green Thumb', 'For all your gardening needs', 8, 'active', 4.1, 85000),
       ('Toy World', 'Bringing joy to children of all ages', 9, 'suspended', 3.7, 50000),
       ('Beauty Bliss', 'Enhance your natural beauty', 10, 'active', 4.4, 190000);

INSERT INTO categories (name)
VALUES ('Quần áo nam'),
       ('Điện tử'),
       ('Đồ gia dụng'),
       ('Sách');

INSERT INTO products (name, description, category_id, seller_id, rating, buyers_count)
VALUES ('Áo sơ mi nam', 'Áo sơ mi nam cao cấp', 1, 1, 4.5, 100),
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

INSERT INTO product_versions (product_id, version_name, price)
VALUES (1, 'Trắng - Size M', 299000),
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

CREATE TABLE addresses
(
    id       SERIAL PRIMARY KEY,
    user_id  INT REFERENCES users (id),
    street   VARCHAR(100),
    district VARCHAR(100),
    city     VARCHAR(100)
);

Alter table addresses CHANGE COLUMN `city` `city` ENUM( 'An Giang',
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
    'Yên Bái');

INSERT INTO addresses (user_id, street, district, city)
VALUES (1, '123 Lê Lợi', 'Hải Châu', 'Đà Nẵng');
INSERT INTO addresses (user_id, street, district, city)
VALUES (2, '456 Trần Phú', 'Ba Đình', 'Hà Nội');
INSERT INTO addresses (user_id, street, district, city)
VALUES (3, '789 Nguyễn Huệ', 'Quận 1', 'TP. Hồ Chí Minh');
INSERT INTO addresses (user_id, street, district, city)
VALUES (4, '101 Nguyễn Trãi', 'Hồng Bàng', 'Hải Phòng');
INSERT INTO addresses (user_id, street, district, city)
VALUES (5, '202 Lê Lợi', 'Ninh Kiều', 'Cần Thơ');
INSERT INTO addresses (user_id, street, district, city)
VALUES (6, '303 Phan Chu Trinh', 'Phú Nhuận', 'Thừa Thiên Huế');
INSERT INTO addresses (user_id, street, district, city)
VALUES (7, '404 Hoàng Văn Thụ', 'Thành phố Vũng Tàu', 'Bà Rịa - Vũng Tàu');
INSERT INTO addresses (user_id, street, district, city)
VALUES (8, '505 Bạch Đằng', 'Phường 1', 'Sóc Trăng');
INSERT INTO addresses (user_id, street, district, city)
VALUES (9, '606 Cách Mạng Tháng 8', 'Thành phố Bắc Ninh', 'Bắc Ninh');
INSERT INTO addresses (user_id, street, district, city)
VALUES (10, '707 Hùng Vương', 'Thành phố Hạ Long', 'Quảng Ninh');


INSERT INTO `categories` (`name`)
VALUES ('Electronics'),
       ('Home Appliances'),
       ('Fashion'),
       ('Books'),
       ('Toys & Games'),
       ('Sports & Outdoors'),
       ('Beauty & Personal Care');

-- Insert products
INSERT INTO `products` (`name`, `description`, `category_id`, `seller_id`, `rating`, `buyers_count`, `image_path`,
                        `min_price`, `all_stock`, `status`)
VALUES ('Samsung Galaxy S22', 'Latest model of Samsung Galaxy S series with 5G support and a great camera.', 1, 101,
        4.7, 1500, 'images/samsung_galaxy_s22.jpg', 799.99, 200, 1),
       ('Sony 4K Smart TV', '55 inch 4K Ultra HD Smart TV with Android OS.', 2, 102, 4.5, 980, 'images/sony_4k_tv.jpg',
        1200.00, 150, 1),
       ('Nike Running Shoes', 'Lightweight and comfortable running shoes for men.', 3, 103, 4.3, 250,
        'images/nike_shoes.jpg', 89.99, 50, 1),
       ('Harry Potter Collection', 'All 7 books of the Harry Potter series in one collection.', 4, 104, 4.9, 3000,
        'images/harry_potter_books.jpg', 120.00, 500, 1),
       ('Lego Building Set', 'Creative building set for kids, comes with over 100 pieces.', 5, 105, 4.6, 600,
        'images/lego_building_set.jpg', 49.99, 100, 1),
       ('Adidas Sports Shorts', 'Breathable sports shorts for men and women.', 3, 106, 4.4, 180,
        'images/adidas_shorts.jpg', 29.99, 75, 1),
       ('Kindle Paperwhite', 'E-reader with built-in light and waterproof design.', 4, 107, 4.8, 2500,
        'images/kindle_paperwhite.jpg', 129.99, 300, 1),
       ('Fitbit Charge 4', 'Fitness tracker with built-in GPS and heart rate monitor.', 2, 108, 4.6, 800,
        'images/fitbit_charge_4.jpg', 149.99, 120, 1),
       ('Nikon DSLR Camera', 'High-quality DSLR camera with 24.2 MP and 4K video recording.', 1, 109, 4.7, 150,
        'images/nikon_dslr.jpg', 599.99, 50, 1),
       ('Puma Soccer Ball', 'Official soccer ball for training and matches.', 6, 110, 4.3, 200,
        'images/puma_soccer_ball.jpg', 19.99, 300, 1),
       ('Blender 500W', 'Powerful blender with multiple speed settings for smoothies and soups.', 2, 111, 4.5, 700,
        'images/blender_500w.jpg', 39.99, 180, 1),
       ('Apple MacBook Pro', 'Apple’s high-performance laptop with M1 chip and 16GB RAM.', 1, 112, 4.9, 1000,
        'images/macbook_pro.jpg', 1299.99, 100, 1),
       ('Samsung Galaxy Buds Pro', 'Wireless earbuds with noise cancellation and long battery life.', 1, 113, 4.8, 1500,
        'images/samsung_buds.jpg', 199.99, 200, 1),
       ('Canon EOS 90D', 'Advanced DSLR camera with a 32.5 MP sensor and 4K video recording.', 1, 114, 4.6, 300,
        'images/canon_eos_90d.jpg', 1299.99, 80, 1),
       ('Bose SoundLink Revolve', 'Portable Bluetooth speaker with 360-degree sound.', 2, 115, 4.7, 1200,
        'images/bose_soundlink.jpg', 199.99, 100, 1),
       ('Xiaomi Mi Band 6', 'Affordable fitness band with AMOLED display and heart rate monitoring.', 2, 116, 4.6, 500,
        'images/xiaomi_mi_band.jpg', 39.99, 250, 1),
       ('Levi\'s 501 Jeans', 'Classic straight-fit jeans for men,
        comfortable and durable.', 3, 117, 4.4, 950, ' images/levis_501.jpg ', 59.99, 200, 1),
(' Sony Noise Cancelling Headphones ', ' Over-ear headphones with noise-cancellation and superior sound quality.', 1, 118, 4.7, 400, ' images/sony_headphones.jpg ', 349.99, 150, 1),
(' Xbox Series X', ' The latest Xbox gaming console with 4K gaming support and fast load times.', 6, 119, 4.9, 2000, ' images/xbox_series_x.jpg ', 499.99, 180, 1),
(' Philips Hue Smart Bulbs ', ' Set of smart LED bulbs that can be controlled via mobile app.', 2, 120, 4.5, 850, ' images/philips_hue.jpg ', 99.99, 300, 1),
(' Sony PlayStation 5', 'Next-gen PlayStation console with ultra-fast SSD and 4K resolution.', 6, 121, 4.8, 5000, 'images/ps5.jpg', 499.99, 100, 1),
('Apple iPhone 13', 'Latest iPhone with A15 Bionic chip, amazing camera, and 5G support.', 1, 122, 4.9, 4500, ' images /
        iphone_13.jpg ', 799.99, 250, 1),
(' Whirlpool Washing Machine ', ' High - efficiency washing machine with 10kg load capacity.', 2, 123, 4.4, 600, '
        images / whirlpool_washing_machine.jpg ', 499.99, 150, 1),
(' JBL Portable Speaker ', ' Durable portable speaker with deep bass and waterproof design.', 2, 124, 4.6, 1200, '
        images / jbl_speaker.jpg ', 129.99, 100, 1),
(' Samsungs Refrigerator ', ' Smart refrigerator with AI and Wi - Fi connectivity.', 2, 125, 4.8, 400, ' images /
        samsung_fridge.jpg ', 999.99, 60, 1),
(' GoPro HERO9 Black ', ' Action camera with 5K video and HyperSmooth stabilization.', 6, 126, 4.8, 700, ' images /
        gopro_hero9.jpg ', 399.99, 120, 1);

INSERT INTO `product_versions` (`product_id`, `version_name`, `price`, `stock`, `status`) VALUES
(1, ' Samsung Galaxy S22 128GB ', 799.99, 150, 1),
(1, ' Samsung Galaxy S22 256GB ', 899.99, 120, 1),
(2, ' Sony 4K Smart TV 55 "', 1200.00, 80, 1),
(2, 'Sony 4K Smart TV 65" ', 1500.00, 60, 1),
(3, ' Nike Running Shoes Men Size 10 ', 89.99, 50, 1),
(3, ' Nike Running Shoes Men Size 11 ', 89.99, 40, 1),
(4, ' Harry Potter Box Set Paperback ', 120.00, 500, 1),
(5, ' Lego City Police Station Set ', 49.99, 200, 1),
(5, ' Lego City Fire Truck Set ', 59.99, 150, 1),
(6, ' Adidas Sports Shorts Black ', 29.99, 80, 1),
(6, ' Adidas Sports Shorts Grey ', 29.99, 60, 1),
(7, ' Kindle Paperwhite 8GB ', 129.99, 300, 1),
(7, ' Kindle Paperwhite 32GB ', 159.99, 150, 1),
(8, ' Fitbit Charge 4 Black ', 149.99, 100, 1),
(8, ' Fitbit Charge 4 Blue ', 149.99, 120, 1),
(9, ' Nikon DSLR Camera D3500 ', 599.99, 80, 1),
(9, ' Nikon DSLR Camera D5600 ', 799.99, 60, 1),
(10, ' Puma Soccer Ball Size 5 ', 19.99, 200, 1),
(10, ' Puma Soccer Ball Size 4 ', 19.99, 150, 1),
(11, ' Blender 500W White ', 39.99, 180, 1),
(11, ' Blender 500W Black ', 39.99, 100, 1),
(12, ' Apple MacBook Pro M1 256GB ', 1299.99, 50, 1),
(12, ' Apple MacBook Pro M1 512GB ', 1499.99, 40, 1),
(13, ' Samsung Galaxy Buds Pro Black ', 199.99, 150, 1),
(13, ' Samsung Galaxy Buds Pro White ', 199.99, 120, 1),
(14, ' Canon EOS 90D Camera ', 1299.99, 60, 1),
(14, ' Canon EOS 70D Camera ', 999.99, 50, 1),
(15, ' Bose SoundLink Revolve Bluetooth Speaker ', 199.99, 100, 1),
(15, ' Bose SoundLink Revolve + Bluetooth Speaker ', 249.99, 80, 1),
(16, ' Xiaomi Mi Band 6 ', 39.99, 250, 1),
(16, ' Xiaomi Mi Band 5 ', 29.99, 300, 1),
(17, ' Levi\'s 501 Original Fit Jeans', 59.99, 100, 1),
       (17, 'Levi\'s 511 Slim Fit Jeans', 69.99, 120, 1),
(18, 'Sony WH-1000XM4 Noise Cancelling Headphones', 349.99, 70, 1),
(18, 'Sony WH-1000XM3 Noise Cancelling Headphones', 299.99, 90, 1),
(19, 'Xbox Series X Console', 499.99, 150, 1),
(19, 'Xbox Series S Console', 299.99, 200, 1),
(20, 'Philips Hue White LED Bulb', 19.99, 150, 1),
(20, 'Philips Hue White and Color Ambiance Bulb', 49.99, 120, 1),
(21, 'PlayStation 5 Console', 499.99, 100, 1),
(21, 'PlayStation 5 Digital Edition', 399.99, 50, 1),
(22, 'Apple iPhone 13 128GB', 799.99, 250, 1),
(22, 'Apple iPhone 13 256GB', 899.99, 200, 1),
(23, 'Whirlpool 10kg Washing Machine', 499.99, 70, 1),
(23, 'Whirlpool 7kg Washing Machine', 399.99, 90, 1),
(24, 'JBL Charge 4 Portable Bluetooth Speaker', 129.99, 150, 1),
(24, 'JBL Flip 5 Portable Bluetooth Speaker', 119.99, 120, 1),
(25, 'Samsung Smart Refrigerator 350L', 999.99, 40, 1),
(25, 'Samsung Smart Refrigerator 450L', 1199.99, 30, 1),
(26, 'GoPro HERO9 Black', 399.99, 120, 1),
(26, 'GoPro HERO8 Black', 299.99, 150, 1);
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

