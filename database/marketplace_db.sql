-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: marketplace_db
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKt8o6pivur7nn124jehx7cygw5` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Electronics'),(3,'Health Care Service'),(4,'Other'),(2,'Vehicle');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listings`
--

DROP TABLE IF EXISTS `listings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `area` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `detail` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(38,2) NOT NULL,
  `state` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `category_id` bigint NOT NULL,
  `subcategory_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbyfn7t3i7g0f11pcy5veh088p` (`category_id`),
  KEY `FKchdkhuqsauiq3fn4uytmcwuoj` (`subcategory_id`),
  KEY `FKb5kgkbggc40jyxeq28onih2x1` (`user_id`),
  CONSTRAINT `FKb5kgkbggc40jyxeq28onih2x1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKbyfn7t3i7g0f11pcy5veh088p` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `FKchdkhuqsauiq3fn4uytmcwuoj` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listings`
--

LOCK TABLES `listings` WRITE;
/*!40000 ALTER TABLE `listings` DISABLE KEYS */;
INSERT INTO `listings` VALUES (2,'Safra Nagar','Indore','India','2026-09-27 01:57:38.540452','laptop for sale','Laptop',40000.00,'Madhya Pradesh','PRODUCT','2026-09-28 23:04:11.652948',1,10,1),(3,'Kokta','Bhopal','India','2026-09-27 20:35:57.746875','Scorpio is good condition','Scorpio',800000.00,'Madhya Pradesh','PRODUCT','2026-09-27 20:35:57.746875',2,3,1),(4,'gulabpuri','Gwalior','India','2026-09-27 21:38:55.048674','phone  is good condition','vivo v14 phone',8000.00,'Madhya Pradesh','PRODUCT','2026-09-27 21:38:55.048674',1,1,2),(5,'satlite junction','Locknop','India','2026-09-27 21:52:59.616068','Scorpio N is good condition','Scorpio N',900000.00,'Uttar Pradesh','PRODUCT','2026-09-27 21:52:59.616068',2,3,1),(7,'Ajay Nagar','Indore','India','2026-09-28 01:22:51.455503','Test laptop for sale',' Laptop',40000.00,'Madhya Pradesh','PRODUCT','2026-09-28 01:22:51.455503',1,1,2),(8,'Shivaji Nagar','Ujjain','India','2026-09-28 01:28:18.603873','Radio for sale','Radio',2000.00,'Madhya Pradesh','PRODUCT','2026-09-28 01:31:45.041283',1,1,2),(9,'Rani bhag','jaipur','India','2026-09-28 13:35:54.292161','good','Vehicle Repair',2000.00,'Rajasthan','SERVICE','2026-09-28 13:35:54.292161',2,3,1),(11,'Rani bhag','Indore','India','2026-09-28 14:37:59.549161','new phone with excellet condition','Samsung s21 ultra',60000.00,'Madhya Pradesh','PRODUCT','2026-09-28 14:37:59.549161',1,1,1),(12,'Rani bhag','Indore','India','2026-09-28 17:36:59.241126','we are professional harlth care service','ENT Specility',30000.00,'Madhya Pradesh','PRODUCT','2026-09-28 17:36:59.241126',3,7,1),(14,'Indrapuri','Bhopal','India','2026-09-28 20:52:04.750345','Wahing Machine is well condition','Wahing Machine',15000.00,'Madhya Pradesh','PRODUCT','2026-09-28 20:52:04.750345',1,10,1),(15,'Rajvada','Indore','India','2026-09-28 22:53:50.682569','i am sell auro  filter machine','Auro water purifire',3000.00,'Madhya Pradesh','PRODUCT','2026-09-28 22:53:50.682569',1,10,6),(16,'Rajvada','jaipur','India','2026-09-28 23:59:32.210168','keyboard is well condition','Keyboard',499.99,'Rajasthan','PRODUCT','2026-09-29 00:01:39.573548',1,10,7),(17,'Rajvada','jaipur','India','2026-09-29 00:36:39.754061','we are provide well maintened service furniture like chair, bench, table and other','repairing furniture',3000.00,'Rajasthan','SERVICE','2026-09-29 00:37:21.059392',4,8,8);
/*!40000 ALTER TABLE `listings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKiborb6ptvy1t1n3v6klb56l5s` (`category_id`),
  CONSTRAINT `FKiborb6ptvy1t1n3v6klb56l5s` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (1,'Mobile',1),(3,'car',2),(4,'Bike',2),(7,'Body Checkup',3),(8,'Other',4),(10,'Other Electronic Item',1);
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2026-09-27 01:57:09.429945','shiva@gmail.com','Shiva','$2a$10$X3TrC10AFJ.m5yTstme.m.jUw6XPpABfPiw.2xoqEjR3bLIyDjgW2','ADMIN'),(2,'2026-09-27 20:37:56.413079','pavangmail.com','pavan','$2a$10$PE30JSyTzIqKS1qFL8V96.SWzQ9Opv1wOgDZMBmKK8Lj6wrAxJrea','USER'),(3,'2026-09-27 23:20:01.253096','shivani@gmail.com','Shivani','$2a$10$pCQu/DFQp2vIzFfHKnNhQu3hoDPChrd68JUL.oN4H5IBTHfnYvDoq',''),(4,'2026-09-28 17:54:05.370997','shivam@gmail.com','shivam','$2a$10$pSwR1IH.CiXQ9H6JfW914e3In0iwG3B2Y6L1v6.G3Q/gCIOW90C7O','USER'),(5,'2026-09-28 17:59:16.654505','sanjay@gmail.com','Sanjay','$2a$10$v4T8G3GYhFHBAbdwx98Rq.HG6IP9CSvTA6SoBuNL41Ag1GZv8nkFS','USER'),(6,'2026-09-28 21:06:19.649895','anup@gmail.com','Anup','$2a$10$lkux0Qwjyy1xu1iZBv6BVOiRzh2fNK9iQb4/kO1j9dC.jC4Nbdd3O','USER'),(7,'2026-09-28 23:55:59.167201','test@gmail.com','Test User','$2a$10$XLs/Dh7ko5ePbQnuLdpx.unV9o7gTM.NlRDHTmjbVmPLKUZwI4G02','USER'),(8,'2026-09-29 00:33:19.665901','ankit@gmail.com','ankit','$2a$10$hKfVEoLPAKtUDJp75/OItOJBO.yRA4ZpRGSjifaAT6Y4k35qc1FAW','USER');
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

-- Dump completed on 2026-09-29  1:16:25
