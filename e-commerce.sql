CREATE
DATABASE  IF NOT EXISTS `account_trade` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE
`account_trade`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: account_trade
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses`
(
    `id`       int NOT NULL AUTO_INCREMENT,
    `user_id`  int          DEFAULT NULL,
    `street`   varchar(100) DEFAULT NULL,
    `district` varchar(100) DEFAULT NULL,
    `city`     enum('An Giang','Bà Rịa - Vũng Tàu','Bắc Giang','Bắc Kạn','Bạc Liêu','Bắc Ninh','Bến Tre','Bình Định','Bình Dương','Bình Phước','Bình Thuận','Cà Mau','Cần Thơ','Cao Bằng','Đà Nẵng','Đắk Lắk','Đắk Nông','Điện Biên','Đồng Nai','Đồng Tháp','Gia Lai','Hà Giang','Hà Nam','Hà Nội','Hà Tĩnh','Hải Dương','Hải Phòng','Hậu Giang','Hòa Bình','Hưng Yên','Khánh Hòa','Kiên Giang','Kon Tum','Lai Châu','Lâm Đồng','Lạng Sơn','Lào Cai','Long An','Nam Định','Nghệ An','Ninh Bình','Ninh Thuận','Phú Thọ','Phú Yên','Quảng Bình','Quảng Nam','Quảng Ngãi','Quảng Ninh','Quảng Trị','Sóc Trăng','Sơn La','Tây Ninh','Thái Bình','Thái Nguyên','Thanh Hóa','Thừa Thiên Huế','Tiền Giang','TP. Hồ Chí Minh','Trà Vinh','Tuyên Quang','Vĩnh Long','Vĩnh Phúc','Yên Bái') DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    UNIQUE KEY `user_id_UNIQUE` (`user_id`),
    KEY        `users_addresses_idx` (`user_id`),
    CONSTRAINT `users_addresses` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK
TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses`
VALUES (1, 3, 'Phu thinh 1', 'Kim Dong 1', 'An Giang'),
       (2, 1, '123 Lê Lợi', 'Hải Châu', 'Đà Nẵng'),
       (3, 2, '456 Trần Phú', 'Ba Đình', 'Hà Nội'),
       (5, 4, '101 Nguyễn Trãi', 'Hồng Bàng', 'Hải Phòng'),
       (6, 5, '202 Lê Lợi', 'Ninh Kiều', 'Cần Thơ'),
       (7, 6, '303 Phan Chu Trinh', 'Phú Nhuận', 'Thừa Thiên Huế'),
       (8, 7, '404 Hoàng Văn Thụ', 'Thành phố Vũng Tàu', 'Bà Rịa - Vũng Tàu'),
       (9, 8, '505 Bạch Đằng', 'Phường 1', 'Sóc Trăng'),
       (10, 9, '606 Cách Mạng Tháng 8', 'Thành phố Bắc Ninh', 'Bắc Ninh'),
       (11, 10, '707 Hùng Vương', 'Thành phố Hạ Long', 'Quảng Ninh'),
       (17, 21, 'thon 3', 'hoa lac', 'An Giang'),
       (18, 22, 'Phú Thịnh', 'Kim Động', 'Tây Ninh'),
       (19, 19, 'phu thinh', 'kim dong', 'An Giang'),
       (20, 23, 'so 1', 'quan 3', 'Phú Thọ');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorities`
(
    `id`       int          NOT NULL AUTO_INCREMENT,
    `username` varchar(255) NOT NULL,
    `role`     varchar(255) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `authorities_idx_1` (`username`,`role`),
    CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK
TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities`
VALUES (13, 'christaylor', 'ROLE_CUSTOMER'),
       (24, 'christaylor', 'ROLE_SELLER'),
       (11, 'davidwilson', 'ROLE_CUSTOMER'),
       (20, 'emilybrown', 'ROLE_CUSTOMER'),
       (10, 'emilybrown', 'ROLE_SELLER'),
       (22, 'hellocaccau', 'ROLE_CUSTOMER'),
       (28, 'hoangdayy', 'ROLE_CUSTOMER'),
       (23, 'hoangnvhe181030', 'ROLE_CUSTOMER'),
       (1, 'hoangptkd', 'ROLE_ADMIN'),
       (2, 'hoangptkd', 'ROLE_CUSTOMER'),
       (3, 'hoangptkd', 'ROLE_SELLER'),
       (4, 'hoangptkd1', 'ROLE_CUSTOMER'),
       (5, 'hoangptkd1', 'ROLE_SELLER'),
       (6, 'hoangptkd2', 'ROLE_CUSTOMER'),
       (25, 'hoangptkd2', 'ROLE_SELLER'),
       (29, 'hoangptkd4', 'ROLE_CUSTOMER'),
       (30, 'hoangptkd6', 'ROLE_CUSTOMER'),
       (31, 'huyhy123', 'ROLE_CUSTOMER'),
       (33, 'huyminhtran', 'ROLE_CUSTOMER'),
       (18, 'janesmith', 'ROLE_CUSTOMER'),
       (8, 'janesmith', 'ROLE_SELLER'),
       (7, 'johndoe', 'ROLE_CUSTOMER'),
       (17, 'johndoe', 'ROLE_SELLER'),
       (15, 'kevinmartin', 'ROLE_CUSTOMER'),
       (32, 'lisaanderson', 'ROLE_CUSTOMER'),
       (14, 'lisaanderson', 'ROLE_SELLER'),
       (9, 'mikejohnson', 'ROLE_CUSTOMER'),
       (19, 'mikejohnson', 'ROLE_SELLER'),
       (21, 'sarahlee', 'ROLE_CUSTOMER'),
       (12, 'sarahlee', 'ROLE_SELLER');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories`
(
    `id`   int         NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK
TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories`
VALUES (22, 'Art & Crafts'),
       (15, 'Automotive'),
       (23, 'Baby Products'),
       (14, 'Beauty & Personal Care'),
       (12, 'Books'),
       (9, 'Clothing'),
       (5, 'Điện tử'),
       (6, 'Đồ gia dụng'),
       (8, 'Electronics'),
       (27, 'Fitness Equipment'),
       (17, 'Food & Beverages'),
       (25, 'Furniture'),
       (16, 'Health & Wellness'),
       (10, 'Home & Garden'),
       (18, 'Jewelry'),
       (2,
        'men\'s clothing'),(21,'Musical Instruments'),(20,'Office Products'),(19,'Pet Supplies'),(4,'Quần áo nam'),(7,'Sách'),(11,'Sports & Outdoors'),(26,'Stationery'),(1,'Tài Khoản'),(24,'Tools & Home Improvement'),(13,'Toys & Games'),(3,'women\'s clothing');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items`
(
    `id`                 int NOT NULL AUTO_INCREMENT,
    `order_id`           int NOT NULL,
    `product_version_id` int NOT NULL,
    `quantity`           int NOT NULL,
    `price` double NOT NULL,
    PRIMARY KEY (`id`),
    KEY                  `order_id` (`order_id`),
    KEY                  `product_version_id` (`product_version_id`),
    CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
    CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_version_id`) REFERENCES `product_versions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK
TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items`
VALUES (46, 1, 10, 5, 109950000),
       (47, 2, 4, 3, 1497000),
       (48, 3, 7, 5, 129950000),
       (49, 4, 2, 3, 897000),
       (50, 4, 3, 5, 1495000),
       (51, 5, 2, 3, 897000),
       (52, 5, 3, 5, 1495000),
       (53, 6, 10, 5, 109950000),
       (54, 7, 7, 5, 129950000),
       (55, 8, 4, 3, 1497000),
       (58, 10, 10, 5, 109950000),
       (59, 11, 4, 3, 1497000),
       (60, 12, 7, 5, 129950000),
       (61, 13, 4, 3, 1497000),
       (62, 14, 7, 5, 129950000),
       (63, 15, 10, 5, 109950000),
       (64, 16, 2, 3, 897000),
       (65, 16, 3, 5, 1495000),
       (66, 17, 14, 1, 2499000),
       (67, 18, 19, 1, 799000),
       (68, 19, 7, 1, 25990000),
       (69, 20, 19, 1, 799000),
       (70, 21, 19, 1, 799000),
       (71, 22, 19, 1, 799000),
       (72, 23, 6, 1, 499000),
       (73, 24, 159, 3, 124.5),
       (74, 25, 10, 1, 21990000),
       (75, 26, 8, 2, 59980000),
       (76, 27, 11, 3, 2697000),
       (77, 28, 118, 1, 288.7),
       (80, 31, 118, 1, 288.7),
       (81, 31, 148, 1, 890.01),
       (82, 32, 9, 3, 59970000),
       (83, 33, 5, 2, 998000),
       (84, 34, 118, 2, 577.4),
       (85, 34, 119, 1, 592.64),
       (86, 35, 9, 3, 59970000),
       (87, 36, 9, 2, 39980000),
       (88, 37, 19, 3, 2397000),
       (89, 37, 6, 3, 1497000),
       (90, 38, 19, 1, 799000),
       (91, 39, 7, 3, 77970000),
       (92, 40, 19, 1, 799000),
       (93, 41, 106, 1, 976.56),
       (94, 41, 107, 1, 353.46),
       (95, 42, 106, 1, 976.56);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders`
(
    `id`                int NOT NULL AUTO_INCREMENT,
    `user_id`           int NOT NULL,
    `order_date`        timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `shop_id`           int NOT NULL,
    `status`            enum('pending','confirmed','received','cancelled') DEFAULT 'pending',
    `total` double NOT NULL,
    `pickup_address_id` int DEFAULT NULL,
    `ship_address`      mediumtext,
    PRIMARY KEY (`id`),
    KEY                 `user_id` (`user_id`),
    KEY                 `pick_address_idx` (`pickup_address_id`),
    KEY                 `shop_order_idx` (`shop_id`),
    CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    CONSTRAINT `pick_address` FOREIGN KEY (`pickup_address_id`) REFERENCES `addresses` (`id`),
    CONSTRAINT `shop_order` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK
TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders`
VALUES (1, 3, '2024-10-09 06:19:38', 4, 'pending', 109950000, 5, 'phu thinh , kim dong, hung yen'),
       (2, 3, '2024-10-09 06:19:38', 2, 'confirmed', 1497000, 3, 'thọ vinh, hòa lạc'),
       (3, 3, '2024-10-09 06:19:38', 3, 'confirmed', 129950000, 1, 'bình yên, thạch thất'),
       (4, 3, '2024-10-09 06:19:39', 1, 'received', 2392000, 2, 'Hồng Bàng, Hải Phòng'),
       (5, 3, '2024-10-09 09:35:04', 1, 'cancelled', 2392000, 2, 'Hồng Bàng, Hải Phòng'),
       (6, 3, '2024-10-09 09:35:04', 4, 'pending', 109950000, 5, 'Hồng Bàng, Hải Phòng'),
       (7, 3, '2024-10-09 09:35:04', 3, 'received', 129950000, 1, 'Hồng Bàng, Hải Phòng'),
       (8, 3, '2024-10-09 09:35:04', 2, 'pending', 1497000, 3, 'Hồng Bàng, Hải Phòng'),
       (10, 3, '2024-10-09 09:38:35', 4, 'pending', 109950000, 5, 'Hồng Bàng, Hải Phòng'),
       (11, 3, '2024-10-09 09:38:35', 2, 'pending', 1497000, 3, 'Hồng Bàng, Hải Phòng'),
       (12, 3, '2024-10-09 09:38:35', 3, 'pending', 129950000, 1, 'Hồng Bàng, Hải Phòng'),
       (13, 3, '2024-10-15 07:51:46', 2, 'pending', 1497000, 3, 'Hồng Bàng, Hải Phòng'),
       (14, 3, '2024-10-15 07:51:46', 3, 'pending', 129950000, 1, 'Hồng Bàng, Hải Phòng'),
       (15, 3, '2024-10-15 07:51:46', 4, 'pending', 109950000, 5, 'Hồng Bàng, Hải Phòng'),
       (16, 3, '2024-10-15 07:51:46', 1, 'cancelled', 2392000, 2, 'Hồng Bàng, Hải Phòng'),
       (17, 3, '2024-10-15 08:15:25', 6, 'pending', 2499000, 7, 'Hồng Bàng, Hải Phòng'),
       (18, 3, '2024-10-15 08:15:25', 2, 'pending', 799000, 3, 'Hồng Bàng, Hải Phòng'),
       (19, 3, '2024-10-15 08:15:25', 3, 'pending', 25990000, 1, 'Hồng Bàng, Hải Phòng'),
       (20, 3, '2024-10-15 08:27:55', 2, 'pending', 799000, 3, 'Hồng Bàng, Hải Phòng'),
       (21, 3, '2024-10-15 08:28:32', 2, 'pending', 799000, 3, 'Hồng Bàng, Hải Phòng'),
       (22, 3, '2024-10-15 08:37:27', 2, 'pending', 799000, 3, 'Hồng Bàng, Hải Phòng'),
       (23, 3, '2024-10-15 08:38:45', 2, 'pending', 499000, 3, 'Hồng Bàng, Hải Phòng'),
       (24, 2, '2024-10-16 17:09:10', 1, 'cancelled', 124.5, 2, 'Hồng Bàng, Hải Phòng'),
       (25, 2, '2024-10-18 09:12:05', 4, 'pending', 21990000, 5, 'Hồng Bàng, Hải Phòng'),
       (26, 1, '2024-10-24 05:39:55', 3, 'pending', 59980000, 1, 'Hồng Bàng, Hải Phòng'),
       (27, 1, '2024-10-24 05:39:55', 5, 'pending', 2697000, 6, 'Hồng Bàng, Hải Phòng'),
       (28, 1, '2024-10-24 05:44:43', 1, 'received', 288.7, 2, 'Phu thinh, Kim Dong, Hưng Yên'),
       (31, 19, '2024-10-27 04:40:47', 1, 'confirmed', 1178.71, 2, 'Phu thinh, Kim Dong, Hưng Yên'),
       (32, 20, '2024-10-28 15:39:18', 4, 'pending', 59970000, 5, 'Phu thinh, Kim Dong, Hưng Yên'),
       (33, 20, '2024-10-28 15:39:18', 2, 'pending', 998000, 3, 'Phu thinh, Kim Dong, Hưng Yên'),
       (34, 20, '2024-10-28 16:35:48', 1, 'received', 1747.44, 2, 'Phu thinh, Kim Dong, Hưng Yên'),
       (35, 20, '2024-10-28 16:35:48', 4, 'pending', 179910000, 5, 'Phu thinh, Kim Dong, Hưng Yên'),
       (36, 3, '2024-10-29 08:04:25', 4, 'pending', 79960000, 5, 'Phu thinh, Kim Dong, Hưng Yên'),
       (37, 3, '2024-10-29 08:04:25', 2, 'pending', 11682000, 3, 'Phu thinh, Kim Dong, Hưng Yên'),
       (38, 1, '2024-10-31 09:14:56', 2, 'pending', 799000, 3, '123 Lê Lợi, Hải Châu, Đà Nẵng'),
       (39, 19, '2024-11-04 04:28:58', 3, 'pending', 233910000, 1, 'phu thinh, kim dong, An Giang'),
       (40, 1, '2024-11-04 06:17:26', 2, 'pending', 799000, 3, '123 Lê Lợi, Hải Châu, Đà Nẵng'),
       (41, 1, '2024-11-04 06:17:26', 6, 'pending', 1330.02, 7, '123 Lê Lợi, Hải Châu, Đà Nẵng'),
       (42, 1, '2024-11-13 16:28:02', 6, 'pending', 976.56, 7, '123 Lê Lợi, Hải Châu, Đà Nẵng');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `product_versions`
--

DROP TABLE IF EXISTS `product_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_versions`
(
    `id`           int NOT NULL AUTO_INCREMENT,
    `product_id`   int NOT NULL,
    `version_name` varchar(100) DEFAULT NULL,
    `price` double NOT NULL,
    `stock`        int          DEFAULT NULL,
    `status`       int          DEFAULT '1',
    PRIMARY KEY (`id`),
    KEY            `product_id` (`product_id`),
    CONSTRAINT `product_versions_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_versions`
--

LOCK
TABLES `product_versions` WRITE;
/*!40000 ALTER TABLE `product_versions` DISABLE KEYS */;
INSERT INTO `product_versions`
VALUES (1, 1, 'Trắng - Size M', 299000, NULL, 0),
       (2, 1, 'Trắng - Size L', 299000, NULL, 0),
       (3, 1, 'Xanh - Size M', 299000, NULL, 0),
       (4, 2, 'Xanh đậm - 30', 499000, NULL, 1),
       (5, 2, 'Xanh đậm - 32', 499000, NULL, 1),
       (6, 2, 'Đen - 30', 499000, NULL, 1),
       (7, 3, '8GB RAM - 256GB SSD', 25990000, NULL, 1),
       (8, 3, '16GB RAM - 512GB SSD', 29990000, NULL, 0),
       (9, 4, 'Đen - 128GB', 19990000, NULL, 1),
       (10, 4, 'Trắng - 256GB', 21990000, NULL, 1),
       (11, 5, '1.8L', 899000, NULL, 1),
       (12, 5, '2.2L', 999000, NULL, 1),
       (13, 6, '120x60cm', 1999000, NULL, 1),
       (14, 6, '150x75cm', 2499000, NULL, 1),
       (15, 7, 'Bìa cứng', 150000, NULL, 1),
       (16, 7, 'Bìa mềm', 120000, NULL, 1),
       (17, 8, 'Tiếng Anh', 1500000, NULL, 1),
       (18, 8, 'Tiếng Việt', 1200000, NULL, 1),
       (19, 9, 'Đen - Size L', 799000, NULL, 1),
       (20, 9, 'Nâu - Size XL', 799000, NULL, 1),
       (21, 10, 'Đen', 2990000, NULL, 1),
       (22, 10, 'Trắng', 2990000, NULL, 1),
       (23, 11, 'Đen', 1590000, NULL, 1),
       (24, 11, 'Bạc', 1590000, NULL, 1),
       (25, 12, 'Tiếng Anh', 250000, NULL, 1),
       (26, 12, 'Tiếng Việt', 200000, NULL, 1),
       (27, 13, 'Xanh navy - 30', 299000, NULL, 1),
       (28, 13, 'Be - 32', 299000, NULL, 1),
       (29, 14, 'Xám - 128GB', 24990000, NULL, 1),
       (30, 14, 'Bạc - 256GB', 27990000, NULL, 1),
       (31, 1, 'Standard', 486.23, 41, 0),
       (32, 1, 'Deluxe', 284.19, 35, 0),
       (33, 1, 'Premium', 567.08, 14, 0),
       (34, 2, 'Standard', 477.17, 66, 1),
       (35, 2, 'Deluxe', 360.19, 99, 1),
       (36, 2, 'Premium', 990.12, 32, 1),
       (37, 3, 'Standard', 326.11, 45, 0),
       (38, 3, 'Deluxe', 425.46, 25, 0),
       (39, 3, 'Premium', 720.12, 49, 0),
       (40, 4, 'Standard', 712.21, 52, 1),
       (41, 4, 'Deluxe', 245.55, 79, 1),
       (42, 4, 'Premium', 708.43, 84, 1),
       (43, 5, 'Standard', 796.36, 42, 1),
       (44, 5, 'Deluxe', 844.91, 44, 1),
       (45, 5, 'Premium', 956.89, 93, 1),
       (46, 6, 'Standard', 547.58, 46, 1),
       (47, 6, 'Deluxe', 561.29, 37, 1),
       (48, 6, 'Premium', 27.66, 29, 1),
       (49, 7, 'Standard', 606.36, 38, 1),
       (50, 7, 'Deluxe', 887.57, 8, 1),
       (51, 7, 'Premium', 261.33, 76, 1),
       (52, 8, 'Standard', 849.62, 28, 1),
       (53, 8, 'Deluxe', 454.62, 35, 1),
       (54, 8, 'Premium', 64.37, 41, 1),
       (55, 9, 'Standard', 151.07, 52, 1),
       (56, 9, 'Deluxe', 825.91, 63, 1),
       (57, 9, 'Premium', 145.06, 95, 1),
       (58, 10, 'Standard', 631.88, 89, 1),
       (59, 10, 'Deluxe', 44.55, 4, 1),
       (60, 10, 'Premium', 149.65, 73, 1),
       (61, 11, 'Standard', 89.19, 76, 1),
       (62, 11, 'Deluxe', 449.72, 29, 1),
       (63, 11, 'Premium', 869.35, 74, 1),
       (64, 12, 'Standard', 477.78, 2, 1),
       (65, 12, 'Deluxe', 285.23, 94, 1),
       (66, 12, 'Premium', 154.1, 93, 1),
       (67, 13, 'Standard', 768.36, 15, 1),
       (68, 13, 'Deluxe', 143.07, 23, 1),
       (69, 13, 'Premium', 860.02, 74, 1),
       (70, 14, 'Standard', 951.81, 71, 1),
       (71, 14, 'Deluxe', 22.69, 28, 1),
       (72, 14, 'Premium', 272.44, 85, 1),
       (73, 31, 'Standard', 897.07, 35, 1),
       (74, 31, 'Deluxe', 635.34, 1, 1),
       (75, 31, 'Premium', 458.65, 49, 1),
       (76, 32, 'Standard', 354.73, 33, 1),
       (77, 32, 'Deluxe', 67.72, 70, 1),
       (78, 32, 'Premium', 793.85, 28, 1),
       (79, 33, 'Standard', 425.35, 47, 1),
       (80, 33, 'Deluxe', 21.37, 75, 1),
       (81, 33, 'Premium', 211.9, 31, 1),
       (82, 34, 'Standard', 538.41, 52, 1),
       (83, 34, 'Deluxe', 705.22, 84, 1),
       (84, 34, 'Premium', 870.13, 74, 1),
       (85, 35, 'Standard', 660.76, 45, 1),
       (86, 35, 'Deluxe', 747, 62, 1),
       (87, 35, 'Premium', 445.71, 31, 1),
       (88, 36, 'Standard', 350.78, 61, 1),
       (89, 36, 'Deluxe', 752.47, 61, 1),
       (90, 36, 'Premium', 759.44, 48, 0),
       (91, 37, 'Standard', 302.11, 92, 1),
       (92, 37, 'Deluxe', 517.61, 94, 1),
       (93, 37, 'Premium', 640.35, 21, 1),
       (94, 38, 'Standard', 459.12, 53, 1),
       (95, 38, 'Deluxe', 310.33, 89, 1),
       (96, 38, 'Premium', 677.32, 40, 1),
       (97, 39, 'Standard', 817.25, 64, 1),
       (98, 39, 'Deluxe', 398.45, 92, 1),
       (99, 39, 'Premium', 444.21, 32, 1),
       (100, 40, 'Standard', 116.86, 51, 1),
       (101, 40, 'Deluxe', 320.56, 85, 1),
       (102, 40, 'Premium', 89.31, 59, 1),
       (103, 41, 'Standard', 283.85, 6, 1),
       (104, 41, 'Deluxe', 323.43, 46, 1),
       (105, 41, 'Premium', 193.86, 55, 1),
       (106, 42, 'Standard', 976.56, 83, 1),
       (107, 42, 'Deluxe', 353.46, 24, 1),
       (108, 42, 'Premium', 40.95, 15, 1),
       (109, 43, 'Standard', 853.88, 5, 1),
       (110, 43, 'Deluxe', 249.47, 74, 1),
       (111, 43, 'Premium', 923.71, 25, 1),
       (112, 44, 'Standard', 66.59, 29, 1),
       (113, 44, 'Deluxe', 566.56, 69, 1),
       (114, 44, 'Premium', 207.64, 23, 1),
       (115, 45, 'Standard', 747.15, 3, 1),
       (116, 45, 'Deluxe', 407.57, 5, 1),
       (117, 45, 'Premium', 975.47, 81, 1),
       (118, 46, 'Standard', 288.7, 1, 0),
       (119, 46, 'Deluxe', 592.64, 42, 0),
       (120, 46, 'Premium', 53.78, 68, 0),
       (121, 47, 'Standard', 104.25, 0, 1),
       (122, 47, 'Deluxe', 95.48, 80, 1),
       (123, 47, 'Premium', 665.75, 93, 1),
       (124, 48, 'Standard', 916.53, 34, 1),
       (125, 48, 'Deluxe', 737.19, 27, 1),
       (126, 48, 'Premium', 979.52, 58, 1),
       (127, 49, 'Standard', 938.77, 31, 1),
       (128, 49, 'Deluxe', 597.92, 80, 1),
       (129, 49, 'Premium', 617.81, 76, 1),
       (130, 50, 'Standard', 662.82, 56, 1),
       (131, 50, 'Deluxe', 877.04, 56, 1),
       (132, 50, 'Premium', 617.91, 6, 1),
       (133, 51, 'Standard', 438.4, 80, 1),
       (134, 51, 'Deluxe', 99.03, 3, 1),
       (135, 51, 'Premium', 899.39, 84, 1),
       (136, 52, 'Standard', 67.26, 84, 1),
       (137, 52, 'Deluxe', 65.69, 39, 1),
       (138, 52, 'Premium', 613.61, 65, 1),
       (139, 53, 'Standard', 624.76, 2, 1),
       (140, 53, 'Deluxe', 501.14, 70, 1),
       (141, 53, 'Premium', 866.09, 37, 1),
       (142, 54, 'Standard', 972.9, 71, 1),
       (143, 54, 'Deluxe', 632.01, 79, 1),
       (144, 54, 'Premium', 724.7, 64, 1),
       (145, 55, 'Standard', 528.43, 31, 1),
       (146, 55, 'Deluxe', 87.21, 51, 1),
       (147, 55, 'Premium', 86.09, 33, 1),
       (148, 56, 'Standard', 890.01, 9, 1),
       (149, 56, 'Deluxe', 772.22, 78, 1),
       (150, 56, 'Premium', 98.81, 36, 1),
       (158, 57, NULL, 56.2, 20, 1),
       (159, 58, NULL, 41.5, 20, 1),
       (160, 59, NULL, 222.4, 40, 1),
       (161, 60, '', 550.5, 15, 1),
       (162, 61, 'a', 200, 10, 1),
       (163, 61, 'ab', 100, 20, 1),
       (164, 84, 'loai 1', 230, 100, 0),
       (165, 84, 'loai 2', 300, 200, 0),
       (166, 84, 'loai 3', 230, 300, 0),
       (167, 85, NULL, 20, 30, 0),
       (168, 85, NULL, 30, 20, 0),
       (169, 86, 'size 28', 300000, 10, 1),
       (170, 86, 'size 29', 100000, 18, 1),
       (171, 86, 'size 5', 20000, 20, 1),
       (172, 91, 'acacs', 20, 30, 1),
       (173, 92, 'sdvsd', 30, 30, 1),
       (174, 92, 'cxzzx', 20, 20, 1),
       (175, 93, 'ádasd', 20, 20, 1),
       (176, 93, 'scaasc', 30, 30, 1),
       (177, 94, 'size 20', 100000, 100, 1),
       (178, 94, 'size 21', 120000, 150, 1),
       (179, 94, 'size 19', 299999, 120, 1),
       (180, 95, 'quần dài', 100000, 200, 1),
       (181, 95, 'quần ngắn', 200000, 100, 1),
       (182, 36, 'linh tinh', 200, 20, 0),
       (183, 3, '20GB RAM - 512GB SSD', 28888880, 20, 1),
       (184, 96, 'abc', 20, 20, 0),
       (185, 96, 'vcvx', 16, 14, 0),
       (186, 97, 'csasca', 20, 20, 0),
       (187, 97, 'cas', 20, 20, 0),
       (188, 98, '20', 20, 20, 0),
       (189, 99, 'csacs', 20, 10, 0),
       (190, 99, 'ádas', 20, 20, 0),
       (191, 100, 'cs', 20, 20, 0),
       (192, 101, 'ác', 20, 20, 1),
       (193, 101, 'bh', 10, 15, 1),
       (194, 102, 'cxz', 20, 20, 1);
/*!40000 ALTER TABLE `product_versions` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products`
(
    `id`            int          NOT NULL AUTO_INCREMENT,
    `name`          varchar(100) NOT NULL,
    `description`   text,
    `category_id`   int         DEFAULT NULL,
    `seller_id`     int          NOT NULL,
    `rating` double DEFAULT '0',
    `buyers_count`  int         DEFAULT '0',
    `image_path`    varchar(45) DEFAULT NULL,
    `min_price` double DEFAULT '0',
    `all_stock`     int         DEFAULT NULL,
    `status`        int         DEFAULT '1',
    `register_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY             `category_id` (`category_id`),
    KEY             `products_ibfk_2_idx` (`seller_id`),
    CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK
TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products`
VALUES (1, 'Áo sơ mi nam', 'Áo sơ mi nam cao cấp', 1, 1, 4.5, 100, 'product/product-1.jpg', 284.19, 90, 0,
        '2024-10-30 10:41:52'),
       (2, 'Quần jeans nam', 'Quần jeans nam skinny', 1, 2, 4.2, 80, 'product/product-2.jpg', 360.19, 197, 1,
        '2024-10-30 10:41:52'),
       (3, 'Laptop Dell XPS', 'Laptop Dell XPS 13 inch', 2, 3, 4.8, 50, 'product/product-3.jpg', 326.11, 139, 1,
        '2024-10-30 10:41:52'),
       (4, 'Smartphone Samsung', 'Samsung Galaxy S21', 2, 4, 4.6, 120, 'product/product-4.jpg', 245.55, 215, 1,
        '2024-10-30 10:41:52'),
       (5, 'Nồi cơm điện', 'Nồi cơm điện thông minh', 3, 5, 4.3, 70, 'product/product-5.jpg', 796.36, 179, 1,
        '2024-10-30 10:41:52'),
       (6, 'Bàn làm việc', 'Bàn làm việc gỗ oak', 3, 6, 4.4, 30, 'product/product-6.jpg', 27.66, 112, 1,
        '2024-10-30 10:41:52'),
       (7, 'Sách \"Đắc Nhân Tâm\"', 'Sách best-seller của Dale Carnegie', 4, 7, 4.7, 200, 'product/product-7.jpg',
        261.33, 122, 1, '2024-10-30 10:41:52'),
       (8, 'Truyện Harry Potter', 'Bộ truyện Harry Potter (7 cuốn)', 4, 8, 4.9, 150, 'product/product-8.jpg', 64.37,
        104, 1, '2024-10-30 10:41:52'),
       (9, 'Áo khoác nam sieu dep trai', 'Áo khoác nam mùa dong ve em o dau', 1, 2, 4.1, 50, 'product/product-9.jpg',
        145.06, 210, 1, '2024-10-30 10:41:52'),
       (10, 'Tai nghe Bluetooth', 'Tai nghe không dây chống ồn', 2, 2, 4.5, 90, 'product/product-10.jpg', 44.55, 166, 1,
        '2024-10-30 10:41:52'),
       (11, 'Máy pha cà phê', 'Máy pha cà phê tự động', 3, 3, 4.2, 40, 'product/product-11.jpg', 89.19, 179, 1,
        '2024-10-30 10:41:52'),
       (12, 'Sách \"Sapiens\"', 'Sách về lịch sử loài người', 4, 4, 4.6, 110, 'product/product-12.jpg', 154.1, 189, 1,
        '2024-10-30 10:41:52'),
       (13, 'Quần short nam', 'Quần short nam mùa hè', 1, 5, 4, 75, 'product/product-1.jpg', 143.07, 112, 1,
        '2024-10-30 10:41:52'),
       (14, 'Máy tính bảng iPad', 'iPad Pro 12.9 inch', 2, 6, 4.7, 65, 'product/product-1.jpg', 22.69, 184, 1,
        '2024-10-30 10:41:52'),
       (31, 'Smartphone X', 'High-end smartphone with advanced features', 1, 5, 0.47, 233, 'product/product-18.jpg',
        458.65, 85, 1, '2024-10-30 10:41:52'),
       (32, 'Cotton T-Shirt', 'Comfortable cotton t-shirt for everyday wear', 2, 8, 0.02, 817, 'product/product-2.jpg',
        67.72, 131, 1, '2024-10-30 10:41:52'),
       (33, 'Garden Hose', 'Durable garden hose for watering plants', 3, 10, 2.23, 420, 'product/product-16.jpg', 21.37,
        153, 1, '2024-10-30 10:41:52'),
       (34, 'Tennis Racket', 'Professional-grade tennis racket', 4, 6, 2.89, 157, 'product/product-2.jpg', 538.41, 210,
        1, '2024-10-30 10:41:52'),
       (35, 'Bestselling Novel', 'Exciting novel by a renowned author', 5, 9, 4.53, 82, 'product/product-14.jpg',
        445.71, 138, 1, '2024-10-30 10:41:52'),
       (36, 'Board Game Set', 'Family-friendly board game for all ages', 6, 3, 0.36, 665, 'product/product-3.jpg', 200,
        190, 1, '2024-10-30 10:41:52'),
       (37, 'Face Cream', 'Moisturizing face cream for all skin types', 7, 6, 2.28, 610, 'product/product-14.jpg',
        302.11, 207, 1, '2024-10-30 10:41:52'),
       (38, 'Car Air Freshener', 'Long-lasting car air freshener', 8, 6, 4.4, 640, 'product/product-12.jpg', 310.33,
        182, 1, '2024-10-30 10:41:52'),
       (39, 'Multivitamin Tablets', 'Daily multivitamin supplement', 9, 9, 3.86, 184, 'product/product-13.jpg', 398.45,
        188, 1, '2024-10-30 10:41:52'),
       (40, 'Organic Coffee Beans', 'Premium organic coffee beans', 10, 5, 2.85, 418, 'product/product-8.jpg', 89.31,
        195, 1, '2024-10-30 10:41:52'),
       (41, 'Silver Necklace', 'Elegant silver necklace with pendant', 11, 7, 0.49, 547, 'product/product-9.jpg',
        193.86, 107, 1, '2024-10-30 10:41:52'),
       (42, 'Dog Food', 'Nutritious dry dog food', 12, 6, 2.72, 996, 'product/product-7.jpg', 40.95, 122, 1,
        '2024-10-30 10:41:52'),
       (43, 'Desk Organizer', 'Multi-compartment desk organizer', 13, 8, 3.54, 285, 'product/product-7.jpg', 249.47,
        104, 1, '2024-10-30 10:41:52'),
       (44, 'Acoustic Guitar', 'Beginner-friendly acoustic guitar', 14, 7, 2.22, 201, 'product/product-14.jpg', 66.59,
        121, 1, '2024-10-30 10:41:52'),
       (45, 'Watercolor Paint Set', 'Professional watercolor paint set', 15, 8, 4.4, 55, 'product/product-13.jpg',
        407.57, 89, 1, '2024-10-30 10:41:52'),
       (46, 'Baby Strolleracs', 'Lightweight and foldable baby stroller aca', 2, 1, 0.87, 817, 'product/product-12.jpg',
        53.78, 111, 0, '2024-10-30 10:41:52'),
       (47, 'Power Drill', 'Cordless power drill with multiple attachments', 17, 4, 0.91, 785, 'product/product-8.jpg',
        95.48, 173, 1, '2024-10-30 10:41:52'),
       (48, 'Leather Sofa', 'Comfortable leather sofa for living room', 18, 6, 2.87, 240, 'product/product-10.jpg',
        737.19, 119, 1, '2024-10-30 10:41:52'),
       (49, 'Notebook Set', 'Set of 3 lined notebooks', 19, 7, 4.93, 872, 'product/product-9.jpg', 597.92, 187, 1,
        '2024-10-30 10:41:52'),
       (50, 'Yoga Mat', 'Non-slip yoga mat for fitness enthusiasts', 20, 5, 4.18, 946, 'product/product-5.jpg', 617.91,
        118, 1, '2024-10-30 10:41:52'),
       (51, 'Product 21', 'Description for product 21', 6, 8, 4.35, 119, 'product/product-20.jpg', 99.03, 167, 1,
        '2024-10-30 10:41:52'),
       (52, 'Product 66', 'Description for product 66', 12, 9, 3.76, 86, 'product/product-4.jpg', 65.69, 188, 1,
        '2024-10-30 10:41:52'),
       (53, 'Product 22', 'Description for product 22', 13, 6, 3.85, 291, 'product/product-3.jpg', 501.14, 109, 1,
        '2024-10-30 10:41:52'),
       (54, 'Product 29', 'Description for product 29', 18, 10, 4.82, 66, 'product/product-9.jpg', 632.01, 214, 1,
        '2024-10-30 10:41:52'),
       (55, 'Product 30', 'Description for product 30', 1, 8, 3.59, 331, 'product/product-11.jpg', 86.09, 115, 1,
        '2024-10-30 10:41:52'),
       (56, 'Product 23', 'Description for product 23', 11, 1, 3.48, 348, 'product/product-14.jpg', 98.81, 123, 1,
        '2024-10-30 10:41:52'),
       (57, 'Product 31', 'Description for product 31', 5, 2, 4.84, 473, 'product/product-10.jpg', 56.2, 20, 1,
        '2024-10-30 10:41:52'),
       (58, 'Product 56', 'Description for product 56', 18, 1, 2.98, 821, 'product/product-7.jpg', 41.5, 20, 1,
        '2024-10-30 10:41:52'),
       (59, 'Product 24', 'Description for product 24', 4, 8, 2.35, 0, 'product/product-12.jpg', 222.4, 40, 1,
        '2024-10-30 10:41:52'),
       (60, 'Product 32', 'Description for product 32', 19, 10, 4.37, 555, 'product/product-4.jpg', 550.5, 15, 1,
        '2024-10-30 10:41:52'),
       (61, 'product 33', 'acasc', 10, 1, 0, 0, 'product/product-14.jpg', 100, 30, 1, '2024-10-30 10:41:52'),
       (84, 'hoang dep trai', 'day la hoang dep trai', 1, 1, 0, 0, 'product/product-4.jpg', 230, 600, 0,
        '2024-10-30 10:41:52'),
       (85, 'cxzxczxcczx', 'asddasasd', 9, 1, 0, 0, 'product/product-12.jpg', 20, 50, 0, '2024-10-30 10:41:52'),
       (86, 'áo da đẹp', 'áo da sản xuất từ thiên nhiên', 27, 1, 0, 0, 'product/product-11.jpg', 100000, 28, 1,
        '2024-10-30 10:41:52'),
       (91, 'ascascs', 'asccascas', 22, 1, 0, 0, 'product/product-12.jpg', 20, 30, 1, '2024-10-30 10:41:52'),
       (92, 'xcvxcv', 'sdvvsd', 23, 1, 0, 0, 'product/product-11.jpg', 20, 50, 1, '2024-10-30 10:41:52'),
       (93, 'do dung hoc tap', 'do dung hoc tap', 15, 1, 0, 0, 'product/product-12.jpg', 20, 50, 1,
        '2024-10-30 10:41:52'),
       (94, 'Áo nam  1', 'áo nam siêu đẹp 1', 15, 3, 0, 0, 'product/product-11.jpg', 100000, 370, 1,
        '2024-10-30 10:41:52'),
       (95, 'quần dài đẹp', 'quần dài rất đẹp', 22, 3, 0, 0, 'product/product-10.jpg', 100000, 300, 1,
        '2024-10-31 02:42:56'),
       (96, 'san pham moi', 'abc', 22, 1, 0, 0, NULL, 16, 34, 0, '2024-11-10 07:26:02'),
       (97, 'scacsa', 'csacsa', 23, 1, 0, 0, NULL, 20, 40, 0, '2024-11-10 07:26:25'),
       (98, 'acsc', 'casasc', 22, 1, 0, 0, NULL, 20, 20, 0, '2024-11-10 08:34:27'),
       (99, 'abc', 'dá', 25, 1, 0, 0, NULL, 20, 30, 0, '2024-11-10 09:03:23'),
       (100, 'cá', 'sac', 2, 1, 0, 0, NULL, 20, 20, 0, '2024-11-10 09:04:34'),
       (101, 'ấccs', 'csacs', 18, 1, 0, 0, 'product\\Screenshot 2024-11-09 140409.png', 10, 35, 1,
        '2024-11-10 09:10:04'),
       (102, 'cxzczx', 'xczcx', 2, 1, 0, 0, 'product\\Screenshot 2024-11-10 121221.png', 20, 20, 1,
        '2024-11-10 09:27:36');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart`
(
    `id`         int NOT NULL AUTO_INCREMENT,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK
TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart`
VALUES (1, '2024-10-03 08:27:19', '2024-10-03 08:27:19'),
       (2, '2024-10-03 08:27:19', '2024-10-03 08:27:19'),
       (3, '2024-10-03 08:27:19', '2024-10-03 08:27:19'),
       (4, '2024-10-03 08:27:19', '2024-10-03 08:27:19'),
       (5, '2024-10-03 08:27:19', '2024-10-03 08:27:19'),
       (6, '2024-10-03 08:27:19', '2024-10-03 08:27:19'),
       (7, '2024-10-03 08:27:19', '2024-10-03 08:27:19'),
       (8, '2024-10-03 08:27:19', '2024-10-03 08:27:19'),
       (9, '2024-10-03 08:27:19', '2024-10-03 08:27:19'),
       (10, '2024-10-03 08:27:19', '2024-10-03 08:27:19'),
       (11, NULL, NULL),
       (12, NULL, NULL),
       (13, NULL, NULL),
       (14, NULL, NULL),
       (15, NULL, NULL),
       (16, NULL, NULL),
       (17, NULL, NULL),
       (18, NULL, NULL),
       (19, NULL, NULL),
       (20, NULL, NULL);
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `shopping_cart_items`
--

DROP TABLE IF EXISTS `shopping_cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart_items`
(
    `cart_item_id`       int NOT NULL AUTO_INCREMENT,
    `cart_id`            int NOT NULL,
    `product_version_id` int NOT NULL,
    `quantity`           int NOT NULL,
    PRIMARY KEY (`cart_item_id`),
    KEY                  `cart_id` (`cart_id`),
    KEY                  `shopping_cart_items_ibfk_2_idx` (`product_version_id`),
    CONSTRAINT `shopping_cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `shopping_cart` (`id`) ON DELETE CASCADE,
    CONSTRAINT `shopping_cart_items_ibfk_2` FOREIGN KEY (`product_version_id`) REFERENCES `product_versions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart_items`
--

LOCK
TABLES `shopping_cart_items` WRITE;
/*!40000 ALTER TABLE `shopping_cart_items` DISABLE KEYS */;
INSERT INTO `shopping_cart_items`
VALUES (4, 3, 19, 3),
       (5, 4, 8, 2),
       (6, 5, 1, 4),
       (7, 6, 10, 1),
       (8, 7, 15, 2),
       (9, 8, 12, 3),
       (10, 9, 5, 4),
       (11, 10, 20, 2),
       (13, 3, 14, 3),
       (15, 5, 7, 5),
       (16, 6, 9, 1),
       (17, 7, 13, 4),
       (18, 8, 2, 3),
       (19, 9, 16, 2),
       (20, 10, 18, 1),
       (21, 4, 1, 2),
       (22, 5, 3, 3),
       (23, 6, 5, 1),
       (24, 7, 9, 4),
       (25, 8, 20, 1),
       (26, 9, 7, 2),
       (27, 10, 4, 3),
       (28, 1, 8, 2),
       (29, 2, 17, 5),
       (30, 3, 6, 3),
       (31, 4, 10, 2),
       (32, 5, 14, 1),
       (33, 6, 11, 3),
       (34, 7, 18, 2),
       (35, 8, 13, 1),
       (36, 9, 2, 4),
       (37, 10, 15, 3),
       (38, 1, 19, 1),
       (41, 4, 9, 3),
       (42, 5, 1, 2),
       (43, 6, 8, 4),
       (44, 7, 14, 1),
       (45, 8, 5, 3),
       (46, 9, 20, 2),
       (47, 10, 16, 4),
       (48, 1, 4, 3),
       (49, 2, 10, 1),
       (51, 4, 7, 4),
       (52, 5, 12, 3),
       (53, 6, 13, 2),
       (54, 7, 19, 1),
       (55, 8, 1, 5),
       (56, 9, 15, 2),
       (57, 10, 3, 3),
       (58, 1, 2, 1),
       (61, 4, 11, 3),
       (62, 5, 8, 1),
       (63, 6, 9, 5),
       (64, 7, 14, 2),
       (65, 8, 10, 3),
       (66, 9, 12, 1),
       (67, 10, 4, 5),
       (69, 2, 18, 4),
       (71, 4, 16, 4),
       (72, 5, 19, 1),
       (73, 6, 7, 3),
       (74, 7, 20, 2),
       (75, 8, 8, 1),
       (76, 9, 3, 4),
       (77, 10, 2, 5),
       (80, 3, 7, 2),
       (81, 3, 9, 2),
       (85, 3, 11, 3),
       (88, 3, 23, 2),
       (103, 2, 106, 1),
       (104, 3, 1, 1),
       (105, 11, 1, 1),
       (106, 11, 2, 3),
       (107, 11, 7, 3),
       (108, 11, 118, 2),
       (109, 11, 148, 2),
       (110, 11, 4, 1),
       (111, 12, 5, 2),
       (112, 12, 9, 3),
       (113, 12, 118, 2),
       (114, 12, 119, 1),
       (115, 12, 130, 1),
       (116, 3, 4, 3),
       (117, 13, 106, 2),
       (118, 13, 130, 1),
       (119, 14, 106, 1),
       (120, 14, 107, 1),
       (121, 14, 4, 1),
       (122, 14, 6, 1),
       (123, 11, 106, 1),
       (124, 15, 4, 1),
       (125, 20, 4, 1),
       (126, 20, 5, 1),
       (127, 1, 106, 1),
       (128, 1, 107, 1);
/*!40000 ALTER TABLE `shopping_cart_items` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops`
(
    `id`          int          NOT NULL AUTO_INCREMENT,
    `name`        varchar(255) NOT NULL,
    `description` text,
    `owner_id`    int          NOT NULL,
    `status`      enum('active','inactive','suspended') DEFAULT 'active',
    `created_at`  timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `rating`      decimal(3, 2)  DEFAULT NULL,
    `total_sales` decimal(15, 2) DEFAULT '0.00',
    PRIMARY KEY (`id`),
    UNIQUE KEY `owner_id_UNIQUE` (`owner_id`),
    CONSTRAINT `shops_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK
TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops`
VALUES (1, 'TechHub', 'Your one-stop shop for all things tech', 1, 'active', '2024-09-27 16:51:56',
        '2024-09-27 16:51:56', 4.50, 250000.00),
       (2, 'Fashion Forward', 'Trendy clothes for the modern individual', 2, 'active', '2024-09-27 16:51:56',
        '2024-09-27 16:51:56', 4.20, 180000.00),
       (3, 'Home Sweet Home', 'Furniture and decor to make your house a home', 3, 'active', '2024-09-27 16:51:56',
        '2024-09-27 16:51:56', 4.70, 320000.00),
       (4, 'Bookworm Paradise', 'A haven for book lovers', 4, 'active', '2024-09-27 16:51:56', '2024-09-27 16:51:56',
        4.80, 95000.00),
       (5, 'Sports Central', 'Gear up for your next adventure', 5, 'active', '2024-09-27 16:51:56',
        '2024-09-27 16:51:56', 4.30, 210000.00),
       (6, 'Gourmet Delights', 'Premium food products for the discerning palate', 6, 'inactive', '2024-09-27 16:51:56',
        '2024-09-27 16:51:56', 3.90, 75000.00),
       (7, 'Pet Pals', 'Everything your furry friend needs', 7, 'active', '2024-09-27 16:51:56', '2024-09-27 16:51:56',
        4.60, 130000.00),
       (8, 'Green Thumb', 'For all your gardening needs', 8, 'active', '2024-09-27 16:51:56', '2024-09-27 16:51:56',
        4.10, 85000.00),
       (9, 'Toy World', 'Bringing joy to children of all ages', 9, 'suspended', '2024-09-27 16:51:56',
        '2024-09-27 16:51:56', 3.70, 50000.00),
       (10, 'Beauty Bliss', 'Enhance your natural beauty', 10, 'active', '2024-09-27 16:51:56', '2024-09-27 16:51:56',
        4.40, 190000.00);
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users`
(
    `id`              int          NOT NULL AUTO_INCREMENT,
    `gmail`           varchar(255) DEFAULT NULL,
    `username`        varchar(255) NOT NULL,
    `password`        varchar(255) NOT NULL,
    `full_name`       varchar(255) DEFAULT NULL,
    `balance`         bigint       DEFAULT NULL,
    `register_date`   timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `purchased_count` int          DEFAULT '0',
    `cart_id`         int          DEFAULT NULL,
    `status`          enum('active','inactive','suspended') DEFAULT 'active',
    `phone`           varchar(15)  DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `username` (`username`),
    UNIQUE KEY `gmail` (`gmail`),
    KEY               `user_cart_idx` (`cart_id`),
    CONSTRAINT `user_cart` FOREIGN KEY (`cart_id`) REFERENCES `shopping_cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK
TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users`
VALUES (1, 'hoangptkdhy@gmail.com', 'hoangptkd', '{noop}hoang123', 'Nguyễn Văn Hoàng', 100000000, '2024-08-04 14:59:25',
        0, 1, 'active', '0375559322'),
       (2, 'hn447529@gmail.com', 'hoangptkd1', '{noop}hoang123', 'Nguyễn Văn Hoàng1', 100000000, '2024-08-04 14:59:25',
        0, 2, 'active', '0883933'),
       (3, 'black2k4hy@gmail.com', 'hoangptkd2', '{noop}hoang123', 'Nguyễn Văn Hoàng23', 100000000,
        '2024-08-04 14:59:25', 0, 3, 'active', '0932432422'),
       (4, 'john.doe@gmail.com', 'johndoe', '{noop}hashed_password_1', 'John Doe', 1000, '2023-01-14 17:00:00', 5, 4,
        'inactive', '0943432'),
       (5, 'jane.smith@gmail.com', 'janesmith', '{noop}hashed_password_2', 'Jane Smith', 1501, '2023-02-19 17:00:00', 8,
        5, 'active', '0932432422'),
       (6, 'mike.johnson@gmail.com', 'mikejohnson', '{noop}hashed_password_3', 'Mike Johnson', 750,
        '2023-03-09 17:00:00', 3, 6, 'active', '0932432422'),
       (7, 'emily.brown@gmail.com', 'emilybrown', '{noop}hashed_password_4', 'Emily Brown', 2001, '2023-04-04 17:00:00',
        12, 7, 'active', '0932432422'),
       (8, 'david.wilson@gmail.com', 'davidwilson', '{noop}hashed_password_5', 'David Wilson', 500,
        '2023-05-21 17:00:00', 2, 8, 'active', '0932432422'),
       (9, 'sarah.lee@gmail.com', 'sarahlee', '{noop}hashed_password_6', 'Sarah Lee', 1200, '2023-06-17 17:00:00', 7, 9,
        'active', '0932432422'),
       (10, 'chris.taylor@gmail.com', 'christaylor', '{noop}hashed_password_7', 'Chris Taylor', 801,
        '2023-07-29 17:00:00', 4, 10, 'active', '0932432422'),
       (11, 'lisa.anderson@gmail.com', 'lisaanderson', '{noop}hashed_password_8', 'Lisa Anderson', 1801,
        '2023-08-11 17:00:00', 10, NULL, 'active', '0932432422'),
       (12, 'kevin.martin@gmail.com', 'kevinmartin', '{noop}hashed_password_9', 'Kevin Martin', 300,
        '2023-09-24 17:00:00', 1, NULL, 'active', '0932432422'),
       (13, 'amanda.white@gmail.com', 'amandawhite', '{noop}hashed_password_10', 'Amanda White', 951,
        '2023-10-07 17:00:00', 6, NULL, 'active', '0932432422'),
       (15, 'kienhy123min@gmail.com', 'hellocaccau', '{noop}hoanghy123', 'nguyen van hoang', 0, '2024-10-07 09:20:08',
        0, NULL, 'active', '0932432422'),
       (16, 'tn280146@gmail.com', 'hoangnvhe181030', '{noop}hoang123', 'Nguyễn Văn Nam', 0, '2024-10-14 13:33:20', 0,
        NULL, 'active', '0932432422'),
       (19, 'minhlan1q@gmail.com', 'hoangdayy', '{noop}hoang123', 'nguyen anh nam', 0, '2024-10-26 10:44:09', 0, 11,
        'active', '0375559377'),
       (20, 'hoangptkdhy1@gmail.com', 'hoangptkd4', '{noop}hoang123', 'nguyen', 0, '2024-10-28 15:38:43', 0, 12,
        'active', '0375559386'),
       (21, 'minhlan3q@gmail.com', 'hoangptkd6', '{noop}hoang123', 'Nguyen Pham Tuan', 0, '2024-10-31 08:36:08', 0, 13,
        'active', '0375559352'),
       (22, 'huyhy123@gmail.com', 'huyhy123', '{noop}hoang123', 'Nguyễn đắc huy', 0, '2024-11-03 07:18:39', 0, 14,
        'active', '0375559357'),
       (23, 'hoangpt22@gmail.com', 'huyminhtran', '{noop}hoang123', 'Tran minh hieu', 0, '2024-11-03 16:53:20', 0, 20,
        'active', '0943665555');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK
TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-15 15:45:34
