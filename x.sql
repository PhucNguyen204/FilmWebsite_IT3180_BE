-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: web_film_update
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `booking_details`
--

DROP TABLE IF EXISTS `booking_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `seat_id` bigint(20) NOT NULL,
  `schedule_id` bigint(20) NOT NULL,
  `original_price` bigint(20) DEFAULT NULL,
  `discounted_price` bigint(20) DEFAULT NULL,
  `order_time` datetime DEFAULT current_timestamp(),
  `payment_status` tinyint(1) DEFAULT 0,
  `created_date` datetime(6) DEFAULT NULL,
  `modified_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_details_ibfk_1` (`seat_id`),
  KEY `booking_details_ibfk_2` (`schedule_id`),
  KEY `booking_details_ibfk_3` (`user_id`),
  CONSTRAINT `booking_details_ibfk_1` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`id`) ON DELETE CASCADE,
  CONSTRAINT `booking_details_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`) ON DELETE CASCADE,
  CONSTRAINT `booking_details_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `createddate` datetime(6) DEFAULT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `modified_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cinemas`
--

DROP TABLE IF EXISTS `cinemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cinema_name` varchar(255) NOT NULL,
  `cinema_address` varchar(255) NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `discount_percentage` bigint(20) NOT NULL,
  `notification_title` varchar(255) DEFAULT NULL,
  `notification_content` varchar(255) DEFAULT NULL,
  `movie_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discount_ibfk_1` (`movie_id`),
  CONSTRAINT `discount_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movie_seat_prices`
--

DROP TABLE IF EXISTS `movie_seat_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_seat_prices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `movie_id` bigint(20) NOT NULL,
  `seat_type` varchar(255) NOT NULL,
  `base_price` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_seat_prices_ibfk_1` (`movie_id`),
  CONSTRAINT `movie_seat_prices_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `movie_name` varchar(255) NOT NULL,
  `movie_category_id` bigint(20) NOT NULL,
  `movie_description` varchar(255) DEFAULT NULL,
  `movie_directors` varchar(255) DEFAULT NULL,
  `movie_cast` varchar(255) DEFAULT NULL,
  `running_time` time DEFAULT '00:00:00',
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `trailer_url` varchar(255) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `modified_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movies_ibfk_1` (`movie_category_id`),
  CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`movie_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `movie_id` bigint(20) NOT NULL,
  `rating_value` bigint(20) DEFAULT NULL,
  `rating_comment` varchar(255) DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ratings_ibfk_1` (`user_id`),
  KEY `ratings_ibfk_2` (`movie_id`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `modified_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `movie_id` bigint(20) NOT NULL,
  `cinema_id` bigint(20) NOT NULL,
  `schedule_date` date DEFAULT NULL,
  `shift_id` bigint(20) NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `modified_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_ibfk_2` (`cinema_id`),
  KEY `schedule_ibfk_3` (`shift_id`),
  KEY `schedule_ibfk_1` (`movie_id`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`cinema_id`) REFERENCES `cinemas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seat_schedule_status`
--

DROP TABLE IF EXISTS `seat_schedule_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat_schedule_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `seat_id` bigint(20) NOT NULL,
  `schedule_id` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `seat_schedule_status_ibfk_1` (`seat_id`),
  KEY `seat_schedule_status_ibfk_2` (`schedule_id`),
  CONSTRAINT `seat_schedule_status_ibfk_1` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`id`) ON DELETE CASCADE,
  CONSTRAINT `seat_schedule_status_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seats` (
  `id` bigint(20) NOT NULL,
  `seat_type` varchar(50) NOT NULL,
  `cinema_id` bigint(20) NOT NULL,
  `seat_row` varchar(2) DEFAULT NULL,
  `seat_number` bigint(20) NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seats_ibfk_1` (`cinema_id`),
  CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `cinemas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shifts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `shift_start` time NOT NULL,
  `shift_end` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `avatar` longtext DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `account_balance` bigint(20) DEFAULT NULL,
  `order_count` bigint(20) DEFAULT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `token_expiration` datetime DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `modified_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_ibfk_1` (`roleid`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'web_film_update'
--

--
-- Dumping routines for database 'web_film_update'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-04 22:05:39
