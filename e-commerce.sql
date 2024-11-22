-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: account_trade
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
CREATE TABLE `addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  KEY `users_addresses_idx` (`user_id`),
  CONSTRAINT `users_addresses` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,3,'Phu thinh 1','Kim Dong 1','An Giang'),(2,1,'123 Lê Lợi','Hải Châu','Đà Nẵng'),(3,2,'456 Trần Phú','Ba Đình','Hà Nội'),(5,4,'101 Nguyễn Trãi','Hồng Bàng','Hải Phòng'),(6,5,'202 Lê Lợi','Ninh Kiều','Cần Thơ'),(7,6,'303 Phan Chu Trinh','Phú Nhuận','Thừa Thiên Huế'),(8,7,'404 Hoàng Văn Thụ','Thành phố Vũng Tàu','Bà Rịa - Vũng Tàu'),(9,8,'505 Bạch Đằng','Phường 1','Sóc Trăng'),(10,9,'606 Cách Mạng Tháng 8','Thành phố Bắc Ninh','Bắc Ninh'),(11,10,'707 Hùng Vương','Thành phố Hạ Long','Quảng Ninh'),(17,21,'thon 3','hoa lac','An Giang'),(18,22,'Phú Thịnh','Kim Động','Tây Ninh'),(19,19,'phu thinh','kim dong','An Giang'),(20,23,'so 1','quan 3','Phú Thọ');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authorities_idx_1` (`username`,`role`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES (13,'christaylor','ROLE_CUSTOMER'),(24,'christaylor','ROLE_SELLER'),(11,'davidwilson','ROLE_CUSTOMER'),(34,'diem3032004','ROLE_CUSTOMER'),(20,'emilybrown','ROLE_CUSTOMER'),(10,'emilybrown','ROLE_SELLER'),(22,'hellocaccau','ROLE_CUSTOMER'),(28,'hoangdayy','ROLE_CUSTOMER'),(23,'hoangnvhe181030','ROLE_CUSTOMER'),(1,'hoangptkd','ROLE_ADMIN'),(2,'hoangptkd','ROLE_CUSTOMER'),(3,'hoangptkd','ROLE_SELLER'),(4,'hoangptkd1','ROLE_CUSTOMER'),(5,'hoangptkd1','ROLE_SELLER'),(6,'hoangptkd2','ROLE_CUSTOMER'),(25,'hoangptkd2','ROLE_SELLER'),(29,'hoangptkd4','ROLE_CUSTOMER'),(30,'hoangptkd6','ROLE_CUSTOMER'),(31,'huyhy123','ROLE_CUSTOMER'),(33,'huyminhtran','ROLE_CUSTOMER'),(18,'janesmith','ROLE_CUSTOMER'),(8,'janesmith','ROLE_SELLER'),(7,'johndoe','ROLE_CUSTOMER'),(17,'johndoe','ROLE_SELLER'),(15,'kevinmartin','ROLE_CUSTOMER'),(32,'lisaanderson','ROLE_CUSTOMER'),(14,'lisaanderson','ROLE_SELLER'),(9,'mikejohnson','ROLE_CUSTOMER'),(19,'mikejohnson','ROLE_SELLER'),(21,'sarahlee','ROLE_CUSTOMER'),(12,'sarahlee','ROLE_SELLER');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (7,'Beauty & Personal Care'),(4,'Books'),(1,'Electronics'),(3,'Fashion'),(2,'Home Appliances'),(6,'Sports & Outdoors'),(5,'Toys & Games');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_version_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_version_id` (`product_version_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_version_id`) REFERENCES `product_versions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,19,1,19.99),(2,2,14,1,149.99);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `shop_id` int NOT NULL,
  `status` enum('pending','confirmed','received','cancelled') DEFAULT 'pending',
  `total` double NOT NULL,
  `pickup_address_id` int DEFAULT NULL,
  `ship_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `pick_address_idx` (`pickup_address_id`),
  KEY `shop_order_idx` (`shop_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `pick_address` FOREIGN KEY (`pickup_address_id`) REFERENCES `addresses` (`id`),
  CONSTRAINT `shop_order` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2024-11-15 09:40:01',2,'pending',19.99,3,'123 Lê Lợi, Hải Châu, Đà Nẵng'),(2,1,'2024-11-15 09:40:01',4,'pending',149.99,5,'123 Lê Lợi, Hải Châu, Đà Nẵng');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_versions`
--

DROP TABLE IF EXISTS `product_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_versions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `version_name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `stock` int DEFAULT NULL,
  `status` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_versions_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_versions`
--

LOCK TABLES `product_versions` WRITE;
/*!40000 ALTER TABLE `product_versions` DISABLE KEYS */;
INSERT INTO `product_versions` VALUES (1,1,'Samsung Galaxy S22 128GB',799.99,150,1),(2,1,'Samsung Galaxy S22 256GB',899.99,120,1),(3,2,'Sony 4K Smart TV 55\"',1200,80,1),(4,2,'Sony 4K Smart TV 65\"',1500,60,1),(5,3,'Nike Running Shoes Men Size 10',89.99,50,1),(6,3,'Nike Running Shoes Men Size 11',89.99,40,1),(7,4,'Harry Potter Box Set Paperback',120,500,1),(8,5,'Lego City Police Station Set',49.99,200,1),(9,5,'Lego City Fire Truck Set',59.99,150,1),(10,6,'Adidas Sports Shorts Black',29.99,80,1),(11,6,'Adidas Sports Shorts Grey',29.99,60,1),(12,7,'Kindle Paperwhite 8GB',129.99,300,1),(13,7,'Kindle Paperwhite 32GB',159.99,150,1),(14,8,'Fitbit Charge 4 Black',149.99,100,1),(15,8,'Fitbit Charge 4 Blue',149.99,120,1),(16,9,'Nikon DSLR Camera D3500',599.99,80,1),(17,9,'Nikon DSLR Camera D5600',799.99,60,1),(18,10,'Puma Soccer Ball Size 5',19.99,200,1),(19,10,'Puma Soccer Ball Size 4',19.99,150,1),(20,11,'Blender 500W White',39.99,180,1),(21,11,'Blender 500W Black',39.99,100,1),(22,12,'Apple MacBook Pro M1 256GB',1299.99,50,1),(23,12,'Apple MacBook Pro M1 512GB',1499.99,40,1),(24,13,'Samsung Galaxy Buds Pro Black',199.99,150,1),(25,13,'Samsung Galaxy Buds Pro White',199.99,120,1),(26,14,'Canon EOS 90D Camera',1299.99,60,1),(27,14,'Canon EOS 70D Camera',999.99,50,1),(28,15,'Bose SoundLink Revolve Bluetooth Speaker',199.99,100,1),(29,15,'Bose SoundLink Revolve+ Bluetooth Speaker',249.99,80,1),(30,16,'Xiaomi Mi Band 6',39.99,250,1),(31,16,'Xiaomi Mi Band 5',29.99,300,1),(32,17,'Levi\'s 501 Original Fit Jeans',59.99,100,1),(33,17,'Levi\'s 511 Slim Fit Jeans',69.99,120,1),(34,18,'Sony WH-1000XM4 Noise Cancelling Headphones',349.99,70,1),(35,18,'Sony WH-1000XM3 Noise Cancelling Headphones',299.99,90,1),(36,19,'Xbox Series X Console',499.99,150,1),(37,19,'Xbox Series S Console',299.99,200,1),(38,20,'Philips Hue White LED Bulb',19.99,150,1),(39,20,'Philips Hue White and Color Ambiance Bulb',49.99,120,1),(40,21,'PlayStation 5 Console',499.99,100,1),(41,21,'PlayStation 5 Digital Edition',399.99,50,1),(42,22,'Apple iPhone 13 128GB',799.99,250,1),(43,22,'Apple iPhone 13 256GB',899.99,200,1),(44,23,'Whirlpool 10kg Washing Machine',499.99,70,1),(45,23,'Whirlpool 7kg Washing Machine',399.99,90,1),(46,24,'JBL Charge 4 Portable Bluetooth Speaker',129.99,150,1),(47,24,'JBL Flip 5 Portable Bluetooth Speaker',119.99,120,1),(48,25,'Samsung Smart Refrigerator 350L',999.99,40,1),(49,25,'Samsung Smart Refrigerator 450L',1199.99,30,1),(50,26,'GoPro HERO9 Black',399.99,120,1),(51,26,'GoPro HERO8 Black',299.99,150,1);
/*!40000 ALTER TABLE `product_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `seller_id` int NOT NULL,
  `rating` double DEFAULT '0',
  `buyers_count` int DEFAULT '0',
  `image_path` varchar(255) DEFAULT NULL,
  `min_price` double DEFAULT '0',
  `all_stock` int DEFAULT NULL,
  `status` int DEFAULT '1',
  `register_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `products_ibfk_2_idx` (`seller_id`),
  CONSTRAINT `FK8vdsn4v84hv49jlqcsc2jr7j2` FOREIGN KEY (`seller_id`) REFERENCES `shops` (`id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Samsung Galaxy S22','Latest model of Samsung Galaxy S series with 5G support and a great camera.',1,1,4.7,1500,'product/product-1.jpg',799.99,270,1,'2024-11-15 09:02:55'),(2,'Sony 4K Smart TV','55 inch 4K Ultra HD Smart TV with Android OS.',2,2,4.5,980,'product/product-2.jpg',1200,140,1,'2024-11-15 09:02:55'),(3,'Nike Running Shoes','Lightweight and comfortable running shoes for men.',3,3,4.3,250,'product/product-3.jpg',89.99,90,1,'2024-11-15 09:02:55'),(4,'Harry Potter Collection','All 7 books of the Harry Potter series in one collection.',4,4,4.9,3000,'product/product-4.jpg',120,500,1,'2024-11-15 09:02:55'),(5,'Lego Building Set','Creative building set for kids, comes with over 100 pieces.',5,1,4.6,600,'product/product-5.jpg',49.99,350,1,'2024-11-15 09:02:55'),(6,'Adidas Sports Shorts','Breathable sports shorts for men and women.',3,2,4.4,180,'product/product-6.jpg',29.99,140,1,'2024-11-15 09:02:55'),(7,'Kindle Paperwhite','E-reader with built-in light and waterproof design.',4,3,4.8,2500,'product/product-7.jpg',129.99,450,1,'2024-11-15 09:02:55'),(8,'Fitbit Charge 4','Fitness tracker with built-in GPS and heart rate monitor.',2,4,4.6,800,'product/product-8.jpg',149.99,220,1,'2024-11-15 09:02:55'),(9,'Nikon DSLR Camera','High-quality DSLR camera with 24.2 MP and 4K video recording.',1,1,4.7,150,'product/product-9.jpg',599.99,140,1,'2024-11-15 09:02:55'),(10,'Puma Soccer Ball','Official soccer ball for training and matches.',6,2,4.3,200,'product/product-10.jpg',19.99,350,1,'2024-11-15 09:02:55'),(11,'Blender 500W','Powerful blender with multiple speed settings for smoothies and soups.',2,3,4.5,700,'product/product-11.jpg',39.99,280,1,'2024-11-15 09:02:55'),(12,'Apple MacBook Pro','Apple’s high-performance laptop with M1 chip and 16GB RAM.',1,4,4.9,1000,'product/product-12.jpg',1299.99,90,1,'2024-11-15 09:02:55'),(13,'Samsung Galaxy Buds Pro','Wireless earbuds with noise cancellation and long battery life.',1,1,4.8,1500,'product/product-13.jpg',199.99,270,1,'2024-11-15 09:02:55'),(14,'Canon EOS 90D','Advanced DSLR camera with a 32.5 MP sensor and 4K video recording.',1,2,4.6,300,'product/product-14.jpg',999.99,110,1,'2024-11-15 09:02:55'),(15,'Bose SoundLink Revolve','Portable Bluetooth speaker with 360-degree sound.',2,3,4.7,1200,'product/product-15.jpg',199.99,180,1,'2024-11-15 09:02:55'),(16,'Xiaomi Mi Band 6','Affordable fitness band with AMOLED display and heart rate monitoring.',2,4,4.6,500,'product/product-16.jpg',29.99,550,1,'2024-11-15 09:02:55'),(17,'Levi\'s 501 Jeans','Classic straight-fit jeans for men, comfortable and durable.',3,1,4.4,950,'product/product-17.jpg',59.99,220,1,'2024-11-15 09:02:55'),(18,'Sony Noise Cancelling Headphones','Over-ear headphones with noise-cancellation and superior sound quality.',1,2,4.7,400,'product/product-18.jpg',299.99,160,1,'2024-11-15 09:02:55'),(19,'Xbox Series X','The latest Xbox gaming console with 4K gaming support and fast load times.',6,3,4.9,2000,'product/product-19.jpg',299.99,350,1,'2024-11-15 09:02:55'),(20,'Philips Hue Smart Bulbs','Set of smart LED bulbs that can be controlled via mobile app.',2,4,4.5,850,'product/product-20.jpg',19.99,270,1,'2024-11-15 09:02:55'),(21,'Sony PlayStation 5','Next-gen PlayStation console with ultra-fast SSD and 4K resolution.',6,1,4.8,5000,'product/product-1.jpg',399.99,150,1,'2024-11-15 09:02:55'),(22,'Apple iPhone 13','Latest iPhone with A15 Bionic chip, amazing camera, and 5G support.',1,2,4.9,4500,'product/product-11.jpg',799.99,450,1,'2024-11-15 09:02:55'),(23,'Whirlpool Washing Machine','High-efficiency washing machine with 10kg load capacity.',2,3,4.4,600,'product/product-4.jpg',399.99,160,1,'2024-11-15 09:02:55'),(24,'JBL Portable Speaker','Durable portable speaker with deep bass and waterproof design.',2,4,4.6,1200,'product/product-6.jpg',119.99,270,1,'2024-11-15 09:02:55'),(25,'Samsungs Refrigerator','Smart refrigerator with AI and Wi-Fi connectivity.',2,1,4.8,400,'product/product-3.jpg',999.99,70,1,'2024-11-15 09:02:55'),(26,'GoPro HERO9 Black','Action camera with 5K video and HyperSmooth stabilization.',6,2,4.8,700,'product/product-1.jpg',299.99,270,1,'2024-11-15 09:02:55');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (1,'2024-10-03 08:27:19','2024-10-03 08:27:19'),(2,'2024-10-03 08:27:19','2024-10-03 08:27:19'),(3,'2024-10-03 08:27:19','2024-10-03 08:27:19'),(4,'2024-10-03 08:27:19','2024-10-03 08:27:19'),(5,'2024-10-03 08:27:19','2024-10-03 08:27:19'),(6,'2024-10-03 08:27:19','2024-10-03 08:27:19'),(7,'2024-10-03 08:27:19','2024-10-03 08:27:19'),(8,'2024-10-03 08:27:19','2024-10-03 08:27:19'),(9,'2024-10-03 08:27:19','2024-10-03 08:27:19'),(10,'2024-10-03 08:27:19','2024-10-03 08:27:19'),(11,NULL,NULL),(12,NULL,NULL),(13,NULL,NULL),(14,NULL,NULL),(15,NULL,NULL),(16,NULL,NULL),(17,NULL,NULL),(18,NULL,NULL),(19,NULL,NULL),(20,NULL,NULL),(21,NULL,NULL);
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart_items`
--

DROP TABLE IF EXISTS `shopping_cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart_items` (
  `cart_item_id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `product_version_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`cart_item_id`),
  KEY `cart_id` (`cart_id`),
  KEY `shopping_cart_items_ibfk_2_idx` (`product_version_id`),
  CONSTRAINT `shopping_cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `shopping_cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shopping_cart_items_ibfk_2` FOREIGN KEY (`product_version_id`) REFERENCES `product_versions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart_items`
--

LOCK TABLES `shopping_cart_items` WRITE;
/*!40000 ALTER TABLE `shopping_cart_items` DISABLE KEYS */;
INSERT INTO `shopping_cart_items` VALUES (129,1,1,1),(130,1,14,1),(131,1,19,1);
/*!40000 ALTER TABLE `shopping_cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `owner_id` int NOT NULL,
  `status` enum('active','inactive','suspended') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rating` decimal(3,2) DEFAULT NULL,
  `total_sales` decimal(15,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner_id_UNIQUE` (`owner_id`),
  CONSTRAINT `shops_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES (1,'TechHub','Your one-stop shop for all things tech',1,'active','2024-09-27 16:51:56','2024-09-27 16:51:56',4.50,250000.00),(2,'Fashion Forward','Trendy clothes for the modern individual',2,'active','2024-09-27 16:51:56','2024-09-27 16:51:56',4.20,180000.00),(3,'Home Sweet Home','Furniture and decor to make your house a home',3,'active','2024-09-27 16:51:56','2024-09-27 16:51:56',4.70,320000.00),(4,'Bookworm Paradise','A haven for book lovers',4,'active','2024-09-27 16:51:56','2024-09-27 16:51:56',4.80,95000.00),(5,'Sports Central','Gear up for your next adventure',5,'active','2024-09-27 16:51:56','2024-09-27 16:51:56',4.30,210000.00),(6,'Gourmet Delights','Premium food products for the discerning palate',6,'inactive','2024-09-27 16:51:56','2024-09-27 16:51:56',3.90,75000.00),(7,'Pet Pals','Everything your furry friend needs',7,'active','2024-09-27 16:51:56','2024-09-27 16:51:56',4.60,130000.00),(8,'Green Thumb','For all your gardening needs',8,'active','2024-09-27 16:51:56','2024-09-27 16:51:56',4.10,85000.00),(9,'Toy World','Bringing joy to children of all ages',9,'suspended','2024-09-27 16:51:56','2024-09-27 16:51:56',3.70,50000.00),(10,'Beauty Bliss','Enhance your natural beauty',10,'active','2024-09-27 16:51:56','2024-09-27 16:51:56',4.40,190000.00);
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gmail` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `balance` bigint DEFAULT NULL,
  `register_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `purchased_count` int DEFAULT '0',
  `cart_id` int DEFAULT NULL,
  `status` enum('active','inactive','suspended') DEFAULT 'active',
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `gmail` (`gmail`),
  KEY `user_cart_idx` (`cart_id`),
  CONSTRAINT `user_cart` FOREIGN KEY (`cart_id`) REFERENCES `shopping_cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'hoangptkdhy@gmail.com','hoangptkd','{noop}hoang123','Nguyễn Văn Hoàng',100000000,'2024-08-04 14:59:25',0,1,'active','0375559322'),(2,'hn447529@gmail.com','hoangptkd1','$2a$10$aboDGef1hREpylZhZb2ZXunfTycufGNUcaEH0cUMa46dAtvsJRWLa','Nguyễn Văn Hoàng1',100000000,'2024-08-04 14:59:25',0,2,'active','0883933'),(3,'black2k4hy@gmail.com','hoangptkd2','{noop}hoang123','Nguyễn Văn Hoàng23',100000000,'2024-08-04 14:59:25',0,3,'active','0932432422'),(4,'john.doe@gmail.com','johndoe','{noop}hashed_password_1','John Doe',1000,'2023-01-14 17:00:00',5,4,'inactive','0943432'),(5,'jane.smith@gmail.com','janesmith','{noop}hashed_password_2','Jane Smith',1501,'2023-02-19 17:00:00',8,5,'active','0932432422'),(6,'mike.johnson@gmail.com','mikejohnson','{noop}hashed_password_3','Mike Johnson',750,'2023-03-09 17:00:00',3,6,'active','0932432422'),(7,'emily.brown@gmail.com','emilybrown','{noop}hashed_password_4','Emily Brown',2001,'2023-04-04 17:00:00',12,7,'active','0932432422'),(8,'david.wilson@gmail.com','davidwilson','{noop}hashed_password_5','David Wilson',500,'2023-05-21 17:00:00',2,8,'active','0932432422'),(9,'sarah.lee@gmail.com','sarahlee','{noop}hashed_password_6','Sarah Lee',1200,'2023-06-17 17:00:00',7,9,'active','0932432422'),(10,'chris.taylor@gmail.com','christaylor','{noop}hashed_password_7','Chris Taylor',801,'2023-07-29 17:00:00',4,10,'active','0932432422'),(11,'lisa.anderson@gmail.com','lisaanderson','{noop}hashed_password_8','Lisa Anderson',1801,'2023-08-11 17:00:00',10,NULL,'active','0932432422'),(12,'kevin.martin@gmail.com','kevinmartin','{noop}hashed_password_9','Kevin Martin',300,'2023-09-24 17:00:00',1,NULL,'active','0932432422'),(13,'amanda.white@gmail.com','amandawhite','{noop}hashed_password_10','Amanda White',951,'2023-10-07 17:00:00',6,NULL,'active','0932432422'),(15,'kienhy123min@gmail.com','hellocaccau','{noop}hoanghy123','nguyen van hoang',0,'2024-10-07 09:20:08',0,NULL,'active','0932432422'),(16,'tn280146@gmail.com','hoangnvhe181030','{noop}hoang123','Nguyễn Văn Nam',0,'2024-10-14 13:33:20',0,NULL,'active','0932432422'),(19,'minhlan1q@gmail.com','hoangdayy','{noop}hoang123','nguyen anh nam',0,'2024-10-26 10:44:09',0,11,'active','0375559377'),(20,'hoangptkdhy1@gmail.com','hoangptkd4','{noop}hoang123','nguyen',0,'2024-10-28 15:38:43',0,12,'active','0375559386'),(21,'minhlan3q@gmail.com','hoangptkd6','{noop}hoang123','Nguyen Pham Tuan',0,'2024-10-31 08:36:08',0,13,'active','0375559352'),(22,'huyhy123@gmail.com','huyhy123','{noop}hoang123','Nguyễn đắc huy',0,'2024-11-03 07:18:39',0,14,'active','0375559357'),(23,'hoangpt22@gmail.com','huyminhtran','{noop}hoang123','Tran minh hieu',0,'2024-11-03 16:53:20',0,20,'active','0943665555'),(24,'diem3032004@gmail.com','diem3032004','$2a$10$RicOBSNAflzOrDUQ8NYJr.FmpYM8BW/ac77BPX7NuZLc4kFH1LyzW','Lê Thị Diễm',0,'2024-11-20 14:51:28',0,21,'active',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-22 13:44:04
