-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: asesoresprime_cub
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advisers`
--

DROP TABLE IF EXISTS `advisers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advisers` (
  `id_adviser` int NOT NULL AUTO_INCREMENT,
  `adviser_username` varchar(16) NOT NULL,
  `adviser_password` varchar(60) NOT NULL,
  `adviser_role` varchar(100) NOT NULL,
  `adviser_name` varchar(100) NOT NULL,
  `adviser_lastname` varchar(100) NOT NULL,
  `adviser_rut` varchar(100) NOT NULL,
  `adviser_email` varchar(100) NOT NULL,
  `adviser_phone` varchar(30) NOT NULL,
  `registeredAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `adviser_birthday` date NOT NULL,
  PRIMARY KEY (`id_adviser`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advisers`
--

LOCK TABLES `advisers` WRITE;
/*!40000 ALTER TABLE `advisers` DISABLE KEYS */;
INSERT INTO `advisers` VALUES (1,'adv1','$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG','admin','hector','monsalves','123456789','galli.no@example.com','7792014','2024-05-08 00:46:21','1980-05-15'),(2,'adv2','$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG','worker','juan','perez','987654321','juan.perez@example.com','7722014','2024-05-08 00:46:21','1985-08-20'),(3,'adv3','$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG','admin','pedro','gonzalez','123456789','pgenzalez@example.com','7792014','2024-05-08 00:46:21','1980-05-15'),(4,'adv4','$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG','worker','cristian','moscoso','987654321','cm@example.com','7722014','2024-05-08 00:46:21','1985-08-20');
/*!40000 ALTER TABLE `advisers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budgets`
--

DROP TABLE IF EXISTS `budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budgets` (
  `cases_id_case` int NOT NULL AUTO_INCREMENT,
  `budget` varchar(300) DEFAULT NULL,
  `id_case` int NOT NULL,
  `createAt` timestamp NOT NULL,
  KEY `fk_table1_cases1_idx` (`cases_id_case`),
  CONSTRAINT `fk_table1_cases1` FOREIGN KEY (`cases_id_case`) REFERENCES `cases` (`id_case`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgets`
--

LOCK TABLES `budgets` WRITE;
/*!40000 ALTER TABLE `budgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `budgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_d_s`
--

DROP TABLE IF EXISTS `c_d_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_d_s` (
  `id_c_d_s` int NOT NULL AUTO_INCREMENT,
  `id_damage` int DEFAULT NULL,
  `id_sector` int NOT NULL,
  `id_case` int NOT NULL,
  PRIMARY KEY (`id_c_d_s`),
  KEY `fk_cases_has_damages_damages1` (`id_damage`),
  KEY `fk_c_d_sectors1` (`id_sector`),
  KEY `fk_c_d_cases1` (`id_case`),
  CONSTRAINT `fk_c_d_cases1` FOREIGN KEY (`id_case`) REFERENCES `cases` (`id_case`) ON DELETE CASCADE,
  CONSTRAINT `fk_c_d_sectors1` FOREIGN KEY (`id_sector`) REFERENCES `sectors` (`id_sector`) ON DELETE CASCADE,
  CONSTRAINT `fk_cases_has_damages_damages1` FOREIGN KEY (`id_damage`) REFERENCES `damages` (`id_damage`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_d_s`
--

LOCK TABLES `c_d_s` WRITE;
/*!40000 ALTER TABLE `c_d_s` DISABLE KEYS */;
INSERT INTO `c_d_s` VALUES (1,6,15,1),(2,4,15,1),(3,18,15,1);
/*!40000 ALTER TABLE `c_d_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cases` (
  `id_case` int NOT NULL AUTO_INCREMENT,
  `id_status` int NOT NULL,
  `id_adviser` int DEFAULT NULL,
  `id_client` int NOT NULL,
  `id_incident` int NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `case_date` date NOT NULL,
  `case_img1` varchar(200) DEFAULT NULL,
  `case_img2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_case`),
  KEY `fk_cases_status1` (`id_status`),
  KEY `fk_cases_advisers1` (`id_adviser`),
  KEY `fk_cases_clients1` (`id_client`),
  KEY `fk_cases_incidents1` (`id_incident`),
  CONSTRAINT `fk_cases_advisers1` FOREIGN KEY (`id_adviser`) REFERENCES `advisers` (`id_adviser`) ON DELETE CASCADE,
  CONSTRAINT `fk_cases_clients1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE CASCADE,
  CONSTRAINT `fk_cases_incidents1` FOREIGN KEY (`id_incident`) REFERENCES `incidents` (`id_incident`) ON DELETE CASCADE,
  CONSTRAINT `fk_cases_status1` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
INSERT INTO `cases` VALUES (1,1,1,1,1,'2024-05-08 00:46:21','2015-05-22',NULL,NULL),(2,2,1,2,2,'2024-05-08 00:46:21','2015-05-23',NULL,NULL),(3,3,3,3,3,'2024-05-08 00:46:21','2015-05-24',NULL,NULL),(4,1,4,4,4,'2024-05-08 00:46:21','2015-05-25',NULL,NULL),(5,1,NULL,1,1,'2024-05-08 00:46:49','2015-05-22',NULL,NULL),(6,1,NULL,2,2,'2024-05-08 00:46:49','2015-05-23',NULL,NULL),(7,2,NULL,4,2,'2024-05-08 00:46:49','2015-05-24',NULL,NULL),(8,2,NULL,3,3,'2024-05-08 00:46:49','2015-05-25',NULL,NULL);
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `client_name` varchar(100) NOT NULL,
  `client_lastname` varchar(100) NOT NULL,
  `client_rut` varchar(100) NOT NULL,
  `client_birthday` date NOT NULL,
  `client_address` varchar(100) NOT NULL,
  `client_phone` varchar(100) NOT NULL,
  `client_email` varchar(100) NOT NULL,
  `registeredAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Ana','Ramos Sánchez','15.152.156-5','1982-02-20','OUTER HEBRIDES','(306) 906-7975','parkes@hotmail.com','2024-05-08 00:46:21'),(2,'Alfredo','Perez Reina','15.192.156-2','1991-02-19','82 Windsor Road','(452) 597-0784','sjava@yahoo.ca','2024-05-08 00:46:21'),(3,'Moncho','Pereira Reinaldo','15.142.156-2','1992-02-19','14-16 Oconnor ','(452) 037-0784','sjeewqava@yahoo.ca','2024-05-08 00:46:21'),(4,'Sergio','Garrido Arrizabalaga','15.192.156-3','1981-02-20','PH82 4OY','(363) 441-6561','jipsen@outlook.com','2024-05-08 00:46:21');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `d_c_d_s`
--

DROP TABLE IF EXISTS `d_c_d_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_c_d_s` (
  `id_d_c_d_s` int NOT NULL AUTO_INCREMENT,
  `id_c_d_s` int NOT NULL,
  `size` decimal(10,0) NOT NULL,
  `customized` int DEFAULT NULL,
  PRIMARY KEY (`id_d_c_d_s`),
  KEY `fk_d_c_d_s_c_d_s1` (`id_c_d_s`),
  CONSTRAINT `fk_d_c_d_s_c_d_s1` FOREIGN KEY (`id_c_d_s`) REFERENCES `c_d_s` (`id_c_d_s`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `d_c_d_s`
--

LOCK TABLES `d_c_d_s` WRITE;
/*!40000 ALTER TABLE `d_c_d_s` DISABLE KEYS */;
INSERT INTO `d_c_d_s` VALUES (1,1,10,0),(2,2,1,0),(3,3,20,0);
/*!40000 ALTER TABLE `d_c_d_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `damage_images`
--

DROP TABLE IF EXISTS `damage_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `damage_images` (
  `id_damage_images` int NOT NULL AUTO_INCREMENT,
  `image1` varchar(200) NOT NULL,
  `image2` varchar(200) DEFAULT NULL,
  `image3` varchar(200) DEFAULT NULL,
  `id_d_c_d_s` int NOT NULL,
  PRIMARY KEY (`id_damage_images`),
  KEY `fk_damage_images_d_c_d_s1` (`id_d_c_d_s`),
  CONSTRAINT `fk_damage_images_d_c_d_s1` FOREIGN KEY (`id_d_c_d_s`) REFERENCES `d_c_d_s` (`id_d_c_d_s`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `damage_images`
--

LOCK TABLES `damage_images` WRITE;
/*!40000 ALTER TABLE `damage_images` DISABLE KEYS */;
INSERT INTO `damage_images` VALUES (1,'acd067db-dd1d-4989-8a1d-384756b530ac.png','5d54246a-4929-41c0-b545-7700634d9507.png','e713b6bb-9d3b-4315-8725-a9ff9f4655c9.png',1),(2,'3de4fa59-62d3-4898-9aaa-ea962a6277b0.png','ebc137c4-fb27-4b6e-b658-1900c3ac2871.png','a5fd70f1-4416-4ef8-988e-36fab583a437.png',2),(3,'f95ed6ca-e94f-4d14-9cf7-84fe252f52f5.png','7f4bc1fa-c53c-44d9-a4b6-42299a23f9b9.png','751bef88-becc-4e4a-b563-b817a93c95fc.png',3);
/*!40000 ALTER TABLE `damage_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `damages`
--

DROP TABLE IF EXISTS `damages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `damages` (
  `id_damage` int NOT NULL AUTO_INCREMENT,
  `damage_name` varchar(150) NOT NULL,
  `damage_description` text,
  `damage_unit` varchar(40) NOT NULL,
  `createdby` varchar(40) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_damage`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `damages`
--

LOCK TABLES `damages` WRITE;
/*!40000 ALTER TABLE `damages` DISABLE KEYS */;
INSERT INTO `damages` VALUES (1,'fisura en muro','desc 1','mm',NULL,'2024-05-08 00:46:21'),(2,'fisura en sello de marco de puerta','desc 2','mm',NULL,'2024-05-08 00:46:21'),(3,'fisura en sello de marco de ventana','desc 3','mm',NULL,'2024-05-08 00:46:21'),(4,'fisura en cielo','desc 4','mm',NULL,'2024-05-08 00:46:21'),(5,'fisura dintel','desc 5','mm',NULL,'2024-05-08 00:46:21'),(6,'fisura antepecho','desc 6','mm',NULL,'2024-05-08 00:46:21'),(7,'fisura encuentro de muros','desc 7','mm',NULL,'2024-05-08 00:46:21'),(8,'fisura encuentro tabique y cielo','desc 8','mm',NULL,'2024-05-08 00:46:21'),(9,'fisura sello cornisa','desc 10','mm',NULL,'2024-05-08 00:46:21'),(10,'fijaciones a la vista en tabiques','desc 11','cm',NULL,'2024-05-08 00:46:21'),(11,'fijaciones a la vista en cielo','desc 12','cm',NULL,'2024-05-08 00:46:21'),(12,'cerámicas muro fisuradas','desc 13','cm',NULL,'2024-05-08 00:46:21'),(13,'cerámicas piso fisuradas','desc 14','cm',NULL,'2024-05-08 00:46:21'),(14,'fisura de emboquillado','desc 15','mm',NULL,'2024-05-08 00:46:21'),(15,'placas fisuradas','desc 16','uni',NULL,'2024-05-08 00:46:21'),(16,'pilares fisurados','desc 17','uni',NULL,'2024-05-08 00:46:21'),(17,'bardas fisurados','desc 18','mm',NULL,'2024-05-08 00:46:21'),(18,'pintura muro','desc 19','m',NULL,'2024-05-08 00:46:21');
/*!40000 ALTER TABLE `damages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `damages_repairs`
--

DROP TABLE IF EXISTS `damages_repairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `damages_repairs` (
  `id_damage_repair` int NOT NULL AUTO_INCREMENT,
  `id_damage` int NOT NULL,
  `id_repair` int NOT NULL,
  `createdby` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_damage_repair`),
  KEY `fk_damages_has_repairs_damages1` (`id_damage`),
  KEY `fk_damages_has_repairs_repairs1` (`id_repair`),
  CONSTRAINT `fk_damages_has_repairs_damages1` FOREIGN KEY (`id_damage`) REFERENCES `damages` (`id_damage`) ON DELETE CASCADE,
  CONSTRAINT `fk_damages_has_repairs_repairs1` FOREIGN KEY (`id_repair`) REFERENCES `repairs` (`id_repair`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `damages_repairs`
--

LOCK TABLES `damages_repairs` WRITE;
/*!40000 ALTER TABLE `damages_repairs` DISABLE KEYS */;
INSERT INTO `damages_repairs` VALUES (1,1,1,NULL),(2,1,2,NULL),(3,2,6,NULL),(4,3,6,NULL),(5,4,8,NULL),(6,4,9,NULL),(7,4,10,NULL),(8,4,11,NULL),(9,4,12,NULL),(10,5,1,NULL),(11,5,2,NULL),(12,5,3,NULL),(13,5,4,NULL),(14,5,5,NULL),(15,6,1,NULL),(16,6,2,NULL),(17,6,3,NULL),(18,6,4,NULL),(19,6,5,NULL),(20,7,1,NULL),(21,7,2,NULL),(22,7,3,NULL),(23,7,4,NULL),(24,7,5,NULL),(25,8,1,NULL),(26,8,2,NULL),(27,8,3,NULL),(28,8,4,NULL),(29,8,5,NULL),(30,8,8,NULL),(31,8,9,NULL),(32,8,10,NULL),(33,8,11,NULL),(34,8,12,NULL),(35,9,15,NULL),(36,10,2,NULL),(37,10,3,NULL),(38,10,4,NULL),(39,10,5,NULL),(40,11,9,NULL),(41,11,10,NULL),(42,11,11,NULL),(43,11,12,NULL),(44,12,18,NULL),(45,12,19,NULL),(46,12,20,NULL),(47,12,21,NULL),(48,12,22,NULL),(49,14,23,NULL),(50,15,24,NULL),(51,15,25,NULL),(52,16,26,NULL),(53,16,27,NULL),(54,17,28,NULL),(55,17,29,NULL),(56,18,30,NULL);
/*!40000 ALTER TABLE `damages_repairs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimentions`
--

DROP TABLE IF EXISTS `dimentions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimentions` (
  `id_dimention` int NOT NULL AUTO_INCREMENT,
  `sector_w_size` decimal(19,2) NOT NULL,
  `sector_l_size` decimal(19,2) NOT NULL,
  `sector_h_size` decimal(19,2) NOT NULL,
  `img1` varchar(200) NOT NULL,
  `img2` varchar(200) NOT NULL,
  `id_sector` int NOT NULL,
  `id_case` int NOT NULL,
  PRIMARY KEY (`id_dimention`),
  KEY `fk_dimentions_sectors1` (`id_sector`),
  KEY `fk_dimentions_cases1` (`id_case`),
  CONSTRAINT `fk_dimentions_cases1` FOREIGN KEY (`id_case`) REFERENCES `cases` (`id_case`) ON DELETE CASCADE,
  CONSTRAINT `fk_dimentions_sectors1` FOREIGN KEY (`id_sector`) REFERENCES `sectors` (`id_sector`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimentions`
--

LOCK TABLES `dimentions` WRITE;
/*!40000 ALTER TABLE `dimentions` DISABLE KEYS */;
INSERT INTO `dimentions` VALUES (1,10.00,20.00,1.00,'1979e937-15f4-4051-8e47-61aee7a3a786.png','295d42a1-b57f-446e-b400-21ec9c455581.png',15,1);
/*!40000 ALTER TABLE `dimentions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidents`
--

DROP TABLE IF EXISTS `incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidents` (
  `id_incident` int NOT NULL AUTO_INCREMENT,
  `incident_code` varchar(120) NOT NULL,
  `incident_date` date NOT NULL,
  `incident_description` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_incident`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidents`
--

LOCK TABLES `incidents` WRITE;
/*!40000 ALTER TABLE `incidents` DISABLE KEYS */;
INSERT INTO `incidents` VALUES (1,'AK420','2022-01-15','Terremoto en la región A, magnitud 6.5','2024-05-08 00:46:21'),(2,'AK421','2022-01-20','Alerta de tsunami a lo largo de las áreas costeras','2024-05-08 00:46:21'),(3,'AK422','2022-02-05','Inundaciones en la ciudad X debido a lluvias intensas','2024-05-08 00:46:21'),(4,'AK422','2022-02-12','Brote de incendios forestales en el bosque B','2024-05-08 00:46:21');
/*!40000 ALTER TABLE `incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repairs`
--

DROP TABLE IF EXISTS `repairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repairs` (
  `id_repair` int NOT NULL AUTO_INCREMENT,
  `repair_name` varchar(150) NOT NULL,
  `repair_unit` varchar(150) NOT NULL,
  `repair_price` decimal(19,2) NOT NULL,
  `repair_description` text,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_repair`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repairs`
--

LOCK TABLES `repairs` WRITE;
/*!40000 ALTER TABLE `repairs` DISABLE KEYS */;
INSERT INTO `repairs` VALUES (1,'Reparación de fisura en muro ','ML',20500.00,'desc_1','2024-05-08 00:46:21'),(2,'Empaste y lijado de muro ','M2',4750.00,'desc_2','2024-05-08 00:46:21'),(3,'Preparación de superficie de muro ','M2',2100.00,'desc_3','2024-05-08 00:46:21'),(4,'Aplicación de textura martellina muro','M2',7600.00,'desc_4','2024-05-08 00:46:21'),(5,'Aplicación de pintura de muro ','M2',7300.00,'desc_5','2024-05-08 00:46:21'),(6,'Sellado y pintura de marco de puerta','ML',3500.00,'desc_6','2024-05-08 00:46:21'),(7,'Sellado y pintura de marco de ventana','ML',3500.00,'desc_7','2024-05-08 00:46:21'),(8,'Reparación de fisura en cielo','ML',20500.00,'desc_8','2024-05-08 00:46:21'),(9,'Empaste y lijado de cielo','M2',4750.00,'desc_9','2024-05-08 00:46:21'),(10,'Preparación de superficie de cielo ','M2',2100.00,'desc_10','2024-05-08 00:46:21'),(11,'Aplicación de textura martellina cielo ','M2',7600.00,'desc_11','2024-05-08 00:46:21'),(12,'Aplicación de pintura de cielo ','M2',7300.00,'desc_12','2024-05-08 00:46:21'),(13,'Reparación de fisura en muro','ML',20500.00,'desc_13','2024-05-08 00:46:21'),(14,'Aplicación de textura martellina muro ','M2',7600.00,'desc_14','2024-05-08 00:46:21'),(15,'Sellado y pintura de cornisas','ML',3500.00,'desc_15','2024-05-08 00:46:21'),(16,'Preparación de superficie de cielo','M2',2100.00,'desc_16','2024-05-08 00:46:21'),(17,'Aplicación de pintura de cielo','M2',7300.00,'desc_17','2024-05-08 00:46:21'),(18,'Retiro de ceramica de muro ','M2',7300.00,'desc_18','2024-05-08 00:46:21'),(19,'Preparacion de superficie ','M2',3100.00,'desc_19','2024-05-08 00:46:21'),(20,'Provision e instalacion de ceramica de muro ','M2',18500.00,'desc_20','2024-05-08 00:46:21'),(21,'Fraguado de ceramica de muro ','M2',4100.00,'desc_21','2024-05-08 00:46:21'),(22,'Retiro e instalacion de artefacto','UN',32000.00,'desc_22','2024-05-08 00:46:21'),(23,'Revoque muro','ML',3500.00,'desc_23','2024-05-08 00:46:21'),(24,'Retiro de placas fisuradas','UN',4900.00,'desc_24','2024-05-08 00:46:21'),(25,'Instalación de placas nuevas','UN',11500.00,'desc_25','2024-05-08 00:46:21'),(26,'Retiro de pilares fisurados','UN',9500.00,'desc_26','2024-05-08 00:46:21'),(27,'Instalación de pilares nuevos','UN',16500.00,'desc_27','2024-05-08 00:46:21'),(28,'Retiro de bardas fisuradas','UN',3500.00,'desc_28','2024-05-08 00:46:21'),(29,'Instalación de bardas nuevas','UN',8100.00,'desc_29','2024-05-08 00:46:21'),(30,'Aplicación de pintura de muro ','M2',8200.00,'desc_30','2024-05-08 00:46:21'),(31,'Flete de materiales','UN',30000.00,'desc_31','2024-05-08 00:46:21'),(32,'Protección de areas de trabajo','GL',35000.00,'desc_32','2024-05-08 00:46:21'),(33,'Acomodo de mobiliario','GL',50000.00,'desc_33','2024-05-08 00:46:21'),(34,'Retiro de escombros','M3',50000.00,'desc_34','2024-05-08 00:46:21'),(35,'Aseo y entrega ','GL',75000.00,'desc_35','2024-05-08 00:46:21');
/*!40000 ALTER TABLE `repairs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectors`
--

DROP TABLE IF EXISTS `sectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sectors` (
  `id_sector` int NOT NULL AUTO_INCREMENT,
  `sector_name` varchar(150) NOT NULL,
  `sector_description` text,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sector`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectors`
--

LOCK TABLES `sectors` WRITE;
/*!40000 ALTER TABLE `sectors` DISABLE KEYS */;
INSERT INTO `sectors` VALUES (1,'fachada frontal ','desc_repair_1','2024-05-08 00:46:21'),(2,'living comedor','desc_repair_2','2024-05-08 00:46:21'),(3,'dormitorio 1 (principal)','desc_repair_3','2024-05-08 00:46:21'),(4,'ba?o (1er nive)','desc_repair_4','2024-05-08 00:46:21'),(5,'ba?o (2do nivel)','desc_repair_5','2024-05-08 00:46:21'),(6,'cocina','desc_repair_6','2024-05-08 00:46:21'),(7,'caja escala / sala de estar','desc_repair_7','2024-05-08 00:46:21'),(8,'dormitorio 2','desc_repair_8','2024-05-08 00:46:21'),(9,'cierre perimetral','desc_repair_9','2024-05-08 00:46:21'),(10,'logia','desc_repair_10','2024-05-08 00:46:21'),(11,'bodega','desc_repair_11','2024-05-08 00:46:21'),(12,'sala de estar primer piso','desc_repair_12','2024-05-08 00:46:21'),(13,'sala de estar segundo piso','desc_repair_13','2024-05-08 00:46:21'),(14,'hall de acceso','desc_repair_14','2024-05-08 00:46:21'),(15,'pasillo','desc_repair_15','2024-05-08 00:46:21');
/*!40000 ALTER TABLE `sectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('IS42TgfKdFIvzpdVkLNUUN_FVrU2jdho',1715216114,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":1},\"flash\":{}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id_status` int NOT NULL,
  `status_name` varchar(40) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'No iniciado','2024-05-08 00:46:21'),(2,'En proceso','2024-05-08 00:46:21'),(3,'completado','2024-05-08 00:46:21');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'asesoresprime_cub'
--
/*!50003 DROP PROCEDURE IF EXISTS `addDamageRepair` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addDamageRepair`(
        IN damage_name VARCHAR(100),
        IN damage_unit VARCHAR(10),
        IN damage_desc VARCHAR(200),
        IN cadena VARCHAR(200),
        IN adviser_name VARCHAR(100))
BEGIN
        DECLARE longitud INT;
        DECLARE posicion INT DEFAULT 1;
        DECLARE valor VARCHAR(255);

        INSERT into damages (id_damage,damage_name,damage_unit,damage_description, createdby)
        values (0,damage_name,damage_unit,damage_desc,adviser_name);
        SET @ultimo_id = LAST_INSERT_ID();
    



    
    SET longitud = LENGTH(cadena);

    
    WHILE posicion <= longitud DO
        
        SET posicion = IF(LOCATE(',', cadena) > 0, LOCATE(',', cadena), longitud + 1);
        
        SET valor = SUBSTRING(cadena, 1, posicion - 1);
        
        SET cadena = SUBSTRING(cadena, posicion + 1);
            insert into damages_repairs(id_damage_repair,id_damage, id_repair)
        values (0,@ultimo_id, valor);
        END WHILE;


        END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `budget` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `budget`(
        IN id_adviser INT,
        IN id_case INT)
BEGIN
        SELECT     
        damages.damage_name, damages.damage_description,a.id_adviser, c.id_case, sectors.sector_name,si.customized, sectors.id_sector, d.sector_w_size,d.sector_h_size,d.sector_l_size, d.img1, d.img2,
        si.size as damage_size, im.image1 as damage_image1, im.image2 as damage_image2, im.image3 as damage_image3, damages.damage_unit,cs.id_c_d_s,
        id_damage_images, sectors.createdAt as datec, repairs.repair_name, repairs.repair_unit, repairs.repair_price, c.case_img1, c.case_img2
        from cases c
        inner join advisers a
        on a.id_adviser=c.id_adviser

        inner join clients
        on clients.id_client=c.id_client

        inner join status
        on status.id_status=c.id_status

        inner join c_d_s as cs
        on cs.id_case=c.id_case

        inner join damages
        on damages.id_damage=cs.id_damage

        inner join damages_repairs
        on damages_repairs.id_damage=damages.id_damage

        inner join repairs
        on repairs.id_repair=damages_repairs.id_repair

        inner join sectors
        on sectors.id_sector=cs.id_sector

        inner join dimentions d
        on d.id_sector=cs.id_sector and d.id_case=c.id_case
        
        inner join incidents
        on incidents.id_incident=c.id_incident

        inner join d_c_d_s si
        on si.id_c_d_s=cs.id_c_d_s

        inner join damage_images im
        on im.id_d_c_d_s=si.id_d_c_d_s



        where cs.id_case=id_case and a.id_adviser=id_adviser;

        END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dataInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER // 
        DROP PROCEDURE IF EXISTS dataInsert;
        CREATE PROCEDURE dataInsert(
        IN id_sector INT,
        IN id_c_d_s INT,
        IN id_damage INT,
        IN damage_size INT,
        IN id_case INT,
        IN img1 VARCHAR(200),
        IN img2 VARCHAR(200),
        IN img3 VARCHAR(200),
        IN customized INT)
        BEGIN
        SELECT 'Se está ingresando al procedure' AS Mensaje;
                IF id_c_d_s = 0   THEN
                
                        SELECT 'Se está ingresando un nuevo daño' AS Mensaje;
   
                        INSERT INTO c_d_s(c_d_s.id_c_d_s,c_d_s.id_damage,c_d_s.id_case,c_d_s.id_sector)
                        VALUES (0,id_damage,id_case,id_sector);

                        SET @ultimo_id = LAST_INSERT_ID();

                        INSERT INTO d_c_d_s(d_c_d_s.id_d_c_d_s,d_c_d_s.id_c_d_s,d_c_d_s.size,d_c_d_s.customized)
                        VALUES (0,@ultimo_id,damage_size,customized);

                        SET @ultimo2_id = LAST_INSERT_ID();

                        INSERT INTO damage_images(damage_images.id_damage_images,damage_images.id_d_c_d_s, damage_images.image1, damage_images.image2, damage_images.image3)
                        VALUES (0,@ultimo2_id, img1,img2,img3);
                ELSE
                        SELECT 'Se está actualizando un nuevo daño' AS Mensaje;
                        UPDATE c_d_s SET c_d_s.id_damage = id_damage WHERE c_d_s.id_c_d_s  = id_c_d_s and c_d_s.id_sector=id_sector;

                        INSERT INTO d_c_d_s(id_d_c_d_s,id_c_d_s,size,customized)
                        VALUES (0,id_c_d_s,damage_size,customized);
                        SELECT CONCAT('se ha insertado datos en  d_c_d_s',0,id_c_d_s,damage_size) AS Mensaje;

                        SET @ultimo2_id = LAST_INSERT_ID();
                        INSERT INTO damage_images(id_damage_images,id_d_c_d_s, image1, image2, image3)
                        VALUES (0,@ultimo2_id, img1,img2,img3);

                END IF;
         END //

DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dataUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dataUpdate`(IN id_damage INT,
        IN id_c_d_s INT,
        IN damage_size INT,
        IN img1 VARCHAR(200),
        IN img2 VARCHAR(200),
        IN img3 VARCHAR(200))
BEGIN

        UPDATE d_c_d_s SET d_c_d_s.id_damage = id_damage WHERE id_c_d_s  = id_c_d_s;

        INSERT INTO d_c_d_s(id_d_c_d_s,id_c_d_s,size)
        VALUES (0,id_c_d_s,damage_size);
        SET @ultimo2_id = LAST_INSERT_ID();
        INSERT INTO damage_images(id_damage_images,id_d_c_d_s, image1, image2, image3)
        VALUES (0,@ultimo2_id, img1,img2,img3);

        END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `queryDamages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `queryDamages`(
        IN id_sector INT,
        IN id_adviser INT,
        IN id_case INT)
BEGIN
        SELECT     
        damages.damage_name, damages.damage_description,a.id_adviser, c.id_case, sectors.sector_name, sectors.id_sector,si.customized,
        si.size as damage_size, im.image1 as damage_image1, im.image2 as damage_image2, im.image3 as damage_image3, damages.damage_unit,cs.id_c_d_s,
        id_damage_images

        from cases c
        inner join advisers a
        on a.id_adviser=c.id_adviser

        inner join clients
        on clients.id_client=c.id_client

        inner join status
        on status.id_status=c.id_status

        inner join c_d_s as cs
        on cs.id_case=c.id_case

        inner join damages
        on damages.id_damage=cs.id_damage

        inner join sectors
        on sectors.id_sector=cs.id_sector

        inner join dimentions d
        on d.id_sector=cs.id_sector and d.id_case=c.id_case
        
        inner join incidents
        on incidents.id_incident=c.id_incident

        inner join d_c_d_s si
        on si.id_c_d_s=cs.id_c_d_s

        inner join damage_images im
        on im.id_d_c_d_s=si.id_d_c_d_s

        where cs.id_case=id_case and a.id_adviser=id_adviser and cs.id_sector=id_sector;

        END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `queryDamages2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `queryDamages2`(
        IN id_adviser INT,
        IN id_case INT)
BEGIN
        SELECT     
        damages.damage_name, damages.damage_description,a.id_adviser, c.id_case, sectors.sector_name,si.customized, sectors.id_sector, d.sector_w_size,d.sector_h_size,d.sector_l_size, d.img1, d.img2,
        si.size as damage_size, im.image1 as damage_image1, im.image2 as damage_image2, im.image3 as damage_image3, damages.damage_unit,cs.id_c_d_s,
        id_damage_images, sectors.createdAt as datec
        from cases c
        inner join advisers a
        on a.id_adviser=c.id_adviser

        inner join clients
        on clients.id_client=c.id_client

        inner join status
        on status.id_status=c.id_status

        inner join c_d_s as cs
        on cs.id_case=c.id_case

        inner join damages
        on damages.id_damage=cs.id_damage

        inner join sectors
        on sectors.id_sector=cs.id_sector

        inner join dimentions d
        on d.id_sector=cs.id_sector and d.id_case=c.id_case
        
        inner join incidents
        on incidents.id_incident=c.id_incident

        inner join d_c_d_s si
        on si.id_c_d_s=cs.id_c_d_s

        inner join damage_images im
        on im.id_d_c_d_s=si.id_d_c_d_s

        where cs.id_case=id_case and a.id_adviser=id_adviser;

        END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `showAllCases` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `showAllCases`(
    IN ntable VARCHAR(40),
    IN nfield VARCHAR(40),
    IN op VARCHAR(40),
    IN nvalue VARCHAR(40)
)
BEGIN
    
    SET @query = CONCAT('SELECT cases.id_case, status.status_name, cases.case_date, advisers.id_adviser, advisers.adviser_name, 
    advisers.adviser_lastname, incidents.incident_code, clients.client_name, clients.client_lastname, 
    clients.client_rut, clients.client_address FROM cases INNER JOIN clients ON clients.id_client = cases.id_client 
    LEFT JOIN advisers 
    ON advisers.id_adviser = cases.id_adviser 
    INNER JOIN status 
    ON status.id_status = cases.id_status 
    INNER JOIN incidents 
    ON incidents.id_incident = cases.id_incident WHERE ', ntable, '.', nfield, ' ', op, ' "', nvalue, '"
    ORDER BY (cases.id_adviser IS NULL) DESC;
    
    ');
    
    
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `showCase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DROP PROCEDURE IF EXISTS showCase;
DELIMITER ;; 
CREATE DEFINER=`root`@`localhost` PROCEDURE `showCase`(
        IN id_case INT,
        IN id_adviser INT)
BEGIN
        SELECT cl.client_address, cl.client_email, cl.client_name, cl.client_lastname, cl.client_rut,cl.id_client, cl.client_phone, 
         a.adviser_name, a.adviser_lastname, a.adviser_rut,a.adviser_email,a.adviser_username,a.adviser_role,a.adviser_phone,
               i.incident_code, i.incident_date, i.incident_description,i.incident_type,cl.client_city, i.incident_scale,
               c.id_case, c.case_img1,c.case_img2,a.id_adviser,
               st.status_name, st.id_status               
               FROM cases as c
               INNER JOIN clients as cl
               ON cl.id_client=c.id_client
               LEFT JOIN advisers as a
               ON a.id_adviser=c.id_adviser
               INNER JOIN status as st
               ON st.id_status=c.id_status
               INNER JOIN incidents as i
               ON i.id_incident=c.id_incident
               WHERE c.id_case=id_case;
        

        END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `showCases` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `showCases`(IN adviser INT)
BEGIN
        SELECT 
        (select count(cs2.id_sector) from c_d_s cs2 inner join cases c2 
        ON c2.id_case=cs2.id_case where c2.id_adviser=1 and cs2.id_case=cs.id_case) as nsectors, 
        cs.id_case, 
        cases.case_date,
        cases.img1,
        cases.img2,
        clients.client_name, 
        clients.client_lastname,
        clients.client_address, 
        clients.client_rut,
        status.status_name
        from c_d_s  as cs
        inner join cases
        on cases.id_case=cs.id_case
        inner join advisers
        on advisers.id_adviser=cases.id_adviser
        inner join status
        on status.id_status=cases.id_status
        inner join clients
        on clients.id_client=cases.id_client
        where advisers.id_adviser=1
        group by cs.id_case;

        END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `showSectors` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `showSectors`(
        IN id_adviser INT,
        IN id_case INT)
BEGIN
        

        SELECT
 
        c.id_case,c.id_adviser,
	
 (
            select count(*) from c_d_s cs2
            inner join cases c2
            on c2.id_case= cs2.id_case
            where cs2.id_sector=cs.id_sector AND c2.id_case=id_case and c2.id_adviser=id_adviser and cs2.id_damage is not null)  as ndamages, 
            
        s.sector_name,s.id_sector,d.sector_w_size,d.sector_h_size,d.sector_l_size,d.img1, d.img2,
        clients.client_name as client_name, 
        clients.client_lastname as client_lastname, 
        clients.client_address as client_address, 
        clients.client_rut as client_rut

        from cases c
        inner join advisers a
        on a.id_adviser=c.id_adviser

        left join clients
        on clients.id_client=c.id_client

        left join status
        on status.id_status=c.id_status

        left join c_d_s as cs
        on cs.id_case=c.id_case

        left join sectors s
        on s.id_sector=cs.id_sector

        left join dimentions d
        on d.id_sector=s.id_sector  and d.id_case=c.id_case

        inner join incidents
        on incidents.id_incident=c.id_incident


        where c.id_case=id_case and a.id_adviser=id_adviser
        group by s.sector_name,s.id_sector,d.sector_w_size,d.sector_h_size,d.sector_l_size, cs.id_case,d.img1, d.img2, cs.id_sector,c.id_case; 




        
        
        END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-08 10:55:33
