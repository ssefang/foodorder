-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: food_order
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `tbl_cart`
--
use heroku_cf9a5281d9b0ac8;

DROP TABLE IF EXISTS `tbl_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `item_id` bigint DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cart`
--

LOCK TABLES `tbl_cart` WRITE;
/*!40000 ALTER TABLE `tbl_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `tbl_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `category_src` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (1,'pizza','/pics/1658159097026pisaicon.jpeg'),(2,'Ramen','/pics/1658159106861lamianicon.jpeg'),(3,'Hamburger','/pics/1658159115169hanbaobaoicon.jpeg'),(4,'Spaghetti','/pics/1658159124014yidalimianicon.jpeg');
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_city`
--

DROP TABLE IF EXISTS `tbl_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `tbl_city` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) DEFAULT NULL,
  `shipping_fee` double DEFAULT NULL,
  `shipping_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_city`
--

LOCK TABLES `tbl_city` WRITE;
/*!40000 ALTER TABLE `tbl_city` DISABLE KEYS */;
INSERT INTO `tbl_city` VALUES (1,'montreal',10,'30'),(2,'lasalle',10,'30');
/*!40000 ALTER TABLE `tbl_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_item`
--

DROP TABLE IF EXISTS `tbl_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `tbl_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_price` double DEFAULT NULL,
  `item_src` varchar(255) DEFAULT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn27ug21lw38ss31exiahhqh8b` (`category_id`),
  CONSTRAINT `FKn27ug21lw38ss31exiahhqh8b` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_item`
--

LOCK TABLES `tbl_item` WRITE;
/*!40000 ALTER TABLE `tbl_item` DISABLE KEYS */;
INSERT INTO `tbl_item` VALUES (1,0,'pizza','pizza',18,'/pics/1658159143519pisa1.jpeg',1),(2,0,'pizza','pizza',18,'/pics/1658159151628pisa2.jpeg',1),(3,0,'Ramen','ramen',20,'/pics/1658159165562lamian1.jpeg',2),(4,0,'Ramen','ramen',20,'/pics/1658159173409lamian2.jpeg',2),(5,0,'hamburger','hamburger',19,'/pics/1658159183057hanbaobao1.jpeg',3),(6,0,'hamburger','hamburger',19,'/pics/1658159191678hanbaobao2.jpeg',3),(7,0,'spaghetti','spaghetti',25,'/pics/1658159201100yidalimian1.png',4),(8,0,'spaghetti','spaghetti',25,'/pics/1658159209494yidalimian2.jpeg',4);
/*!40000 ALTER TABLE `tbl_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_order`
--

DROP TABLE IF EXISTS `tbl_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `tbl_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `item_total_price` double DEFAULT NULL,
  `order_date` datetime(6) DEFAULT NULL,
  `order_status` int DEFAULT NULL,
  `order_total_price` double DEFAULT NULL,
  `payment_id` bigint DEFAULT NULL,
  `shipping_fee` double DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_order`
--

LOCK TABLES `tbl_order` WRITE;
/*!40000 ALTER TABLE `tbl_order` DISABLE KEYS */;
INSERT INTO `tbl_order` VALUES (1,18,'2022-05-30 11:33:12.861000',1,32.2,1,10,4.2,2),(2,45,'2022-05-30 11:35:03.056000',1,63.25,2,10,8.25,2),(3,37,NULL,2,54.05,NULL,10,7.05,NULL),(4,68,NULL,3,89.7,NULL,10,11.7,NULL),(5,38,'2022-05-30 18:06:28.377000',0,55.2,NULL,10,7.2,2),(6,43,'2022-07-18 10:46:59.768000',0,60.95,NULL,10,7.95,2);
/*!40000 ALTER TABLE `tbl_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_order_detail`
--

DROP TABLE IF EXISTS `tbl_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `tbl_order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `item_id` bigint DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_order_detail`
--

LOCK TABLES `tbl_order_detail` WRITE;
/*!40000 ALTER TABLE `tbl_order_detail` DISABLE KEYS */;
INSERT INTO `tbl_order_detail` VALUES (1,1,1,18,1),(2,7,2,25,1),(3,3,2,20,1),(4,1,3,18,1),(5,5,3,19,1),(6,7,4,25,2),(7,1,4,18,1),(8,5,5,19,2),(9,11,6,18,1),(10,7,6,25,1);
/*!40000 ALTER TABLE `tbl_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_payment`
--

DROP TABLE IF EXISTS `tbl_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `tbl_payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bank_cardcvv` varchar(255) DEFAULT NULL,
  `bank_card_exp_date` varchar(255) DEFAULT NULL,
  `bank_card_num` varchar(255) DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `payment_status` int DEFAULT NULL,
  `payment_type` int DEFAULT NULL,
  `receiver_address` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `receiver_postcode` varchar(255) DEFAULT NULL,
  `transaction_num` int DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_payment`
--

LOCK TABLES `tbl_payment` WRITE;
/*!40000 ALTER TABLE `tbl_payment` DISABLE KEYS */;
INSERT INTO `tbl_payment` VALUES (1,'12','12','12',1,NULL,NULL,'12','sse','12',NULL,NULL),(2,'12','12','12',2,NULL,NULL,'12','12','12',NULL,NULL),(3,'12','12','12',3,NULL,NULL,'12','sse','12',NULL,NULL),(4,'12','12','12',4,NULL,NULL,'12','sse','12',NULL,NULL);
/*!40000 ALTER TABLE `tbl_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_type` int DEFAULT NULL,
  `city_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_npn1wf1yu1g5rjohbek375pp1` (`email`),
  UNIQUE KEY `UK_6jr81l5qqpxjp72fgi23ubqc9` (`user_name`),
  KEY `FKo99u7iq72qv4wmylqcxx3hho8` (`city_id`),
  CONSTRAINT `FKo99u7iq72qv4wmylqcxx3hho8` FOREIGN KEY (`city_id`) REFERENCES `tbl_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'admin','123@john.net','admin','$2a$10$8XM/GgrDtqBInuoLRVN0u.mgqAHf5VyscQNucChmJ3EC1B1kva7Ei','123456','admin',1,NULL),(2,'montreal','1@john.net','sse','$2a$10$I1Q0Kt5jBoXkt/X1R1I5qeBtnz5okhBkdDKhtsgVC370mb1RGkaV.','123456','sse',0,1);
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-18 14:57:14
