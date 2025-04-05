-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: 190.107.177.239    Database: asesoresprime_cub
-- ------------------------------------------------------
-- Server version	5.7.28-cll-lve

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
  `id_adviser` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advisers`
--

LOCK TABLES `advisers` WRITE;
/*!40000 ALTER TABLE `advisers` DISABLE KEYS */;
INSERT INTO `advisers` VALUES (1,'adv1','$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG','admin','hector','monsalves','123456789','galli.no@example.com','7792014','2024-05-08 00:46:21','1980-05-15'),(2,'adv2','$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG','worker','juan','perez','987654321','juan.perez@example.com','7722014','2024-05-08 00:46:21','1985-08-20'),(3,'adv3','$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG','admin','pedro','gonzalez','123456789','pgenzalez@example.com','7792014','2024-05-08 00:46:21','1980-05-15'),(4,'adv4','$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG','worker','cristian','moscoso','987654321','cm@example.com','7722014','2024-05-08 00:46:21','1985-08-20'),(5,'pgaisse','$2a$10$E620EBQrce0tY43CTg9Rie2Xvq1FbynE25JJu8WOqZRcT6OEtuvFy','adviser','Patricio','Gaisse','17622724.-9','p.gaisse@gmail.com','0493337826','2024-05-21 17:16:20','1990-02-22'),(6,'pgaisse2','$2a$10$QR69a/w.pIrgu/VsFj3T0.EhiPzSRezqiUU0ktnAMgHh3Q9nhh3FO','adviser','Patricio','Gaisse','17622724.-9','p.gaisse@gmail.com','0493337826','2024-05-21 17:24:20','0000-00-00'),(7,'Test_user','$2a$10$3Sxr1d14pCMKvJ6yBzxN0ug3A8y8wMfO6SiLXI8rCrfwjfdVugOG2','admin','Test name','Test lastname','111111119','tesemail@test.cl','66555555','2024-05-24 22:40:41','2024-05-08');
/*!40000 ALTER TABLE `advisers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asesoresprime_web.6Scr5XN_clientes`
--

DROP TABLE IF EXISTS `asesoresprime_web.6Scr5XN_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients2` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(100) NOT NULL,
  `client_lastname` varchar(100) NOT NULL,
  `client_rut` varchar(100) NOT NULL,
  `client_birthday` date NOT NULL,
  `client_address` varchar(100) NOT NULL,
  `client_phone` varchar(100) NOT NULL,
  `client_email` varchar(100) NOT NULL,
  `registeredAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_client`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asesoresprime_web.6Scr5XN_clientes`
--

LOCK TABLES `asesoresprime_web.6Scr5XN_clientes` WRITE;
/*!40000 ALTER TABLE `asesoresprime_web.6Scr5XN_clientes` DISABLE KEYS */;
INSERT INTO `asesoresprime_web.6Scr5XN_clientes` VALUES (1,'Ana','Ramos S','15.152.156-5','1982-02-20','OUTER HEBRIDES','(306) 906-7975','parkes@hotmail.com','2024-05-08 00:46:21'),(2,'Alfredo','Perez Reina','15.192.156-2','1991-02-19','82 Windsor Road','(452) 597-0784','sjava@yahoo.ca','2024-05-08 00:46:21'),(3,'Moncho','Pereira Reinaldo','15.142.156-2','1992-02-19','14-16 Oconnor ','(452) 037-0784','sjeewqava@yahoo.ca','2024-05-08 00:46:21'),(4,'Sergio','Garrido Arrizabalaga','15.192.156-3','1981-02-20','PH82 4OY','(363) 441-6561','jipsen@outlook.com','2024-05-08 00:46:21');
/*!40000 ALTER TABLE `asesoresprime_web.6Scr5XN_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budgets`
--

DROP TABLE IF EXISTS `budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budgets` (
  `cases_id_case` int(11) NOT NULL AUTO_INCREMENT,
  `budget` varchar(300) DEFAULT NULL,
  `id_case` int(11) NOT NULL,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `fk_table1_cases1_idx` (`cases_id_case`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
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
  `id_c_d_s` int(11) NOT NULL AUTO_INCREMENT,
  `id_damage` int(11) DEFAULT NULL,
  `id_sector` int(11) NOT NULL,
  `id_case` int(11) NOT NULL,
  `uploadAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_c_d_s`),
  KEY `fk_cases_has_damages_damages1` (`id_damage`),
  KEY `fk_c_d_sectors1` (`id_sector`),
  KEY `fk_c_d_cases1` (`id_case`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_d_s`
--

LOCK TABLES `c_d_s` WRITE;
/*!40000 ALTER TABLE `c_d_s` DISABLE KEYS */;
INSERT INTO `c_d_s` VALUES (4,10,3,1,'2025-01-03 01:54:51'),(3,NULL,3,1,'2025-01-03 01:53:55'),(5,18,3,1,'2025-01-03 02:05:30'),(6,19,3,1,'2025-01-03 02:08:03');
/*!40000 ALTER TABLE `c_d_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cases` (
  `id_case` int(11) NOT NULL AUTO_INCREMENT,
  `id_status` int(11) NOT NULL,
  `id_incident` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `case_date` date NOT NULL,
  `case_img1` varchar(200) DEFAULT NULL,
  `case_img2` varchar(200) DEFAULT NULL,
  `num_case` int(11) DEFAULT NULL,
  `id_adviser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_case`),
  KEY `fk_cases_status1` (`id_status`),
  KEY `fk_cases_incidents1` (`id_incident`),
  KEY `id_case` (`id_case`),
  KEY `id_case_2` (`id_case`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
INSERT INTO `cases` VALUES (1,1,3,'2024-06-01 00:09:22','0000-00-00','03b7f6a4-f235-49b2-a1c6-5b7fcfd0c02c.png','e6cbd69f-1a69-42d3-a417-bebf7ea17a79.png',1886372,1),(2,1,3,'2024-06-01 00:09:40','2024-01-20',NULL,NULL,1887828,1),(3,1,3,'2024-06-01 00:09:54','2024-12-10',NULL,NULL,1886124,2),(4,5,3,'2024-06-01 00:12:33','2024-05-03',NULL,NULL,1887052,4),(5,1,3,'2024-06-01 00:14:47','0000-00-00',NULL,NULL,1886363,NULL),(6,1,3,'2025-01-05 02:40:27','0000-00-00',NULL,NULL,1887066,NULL);
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_clients`
--

DROP TABLE IF EXISTS `cases_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cases_clients` (
  `id_case_clients` int(11) NOT NULL AUTO_INCREMENT,
  `id_case` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_case_clients`),
  KEY `fk_cases_has_cases_clients1` (`id_case`),
  KEY `fk_cases_has_clients_clients1` (`id_client`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_clients`
--

LOCK TABLES `cases_clients` WRITE;
/*!40000 ALTER TABLE `cases_clients` DISABLE KEYS */;
INSERT INTO `cases_clients` VALUES (1,1,2,'2024-06-01 00:09:22'),(2,2,4,'2024-06-01 00:09:40'),(3,3,3,'2024-06-01 00:09:54'),(4,4,8,'2024-06-01 00:12:33'),(5,5,9,'2024-06-01 00:14:47'),(6,6,7,'2025-01-05 02:40:27');
/*!40000 ALTER TABLE `cases_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(100) NOT NULL,
  `client_lastname` varchar(100) NOT NULL,
  `client_rut` varchar(100) NOT NULL,
  `client_birthday` date NOT NULL,
  `client_address` varchar(100) NOT NULL,
  `client_phone` varchar(100) NOT NULL,
  `client_email` varchar(100) NOT NULL,
  `registeredAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `region` varchar(70) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `comuna` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Ana','Ramos S','15.152.156-5','1982-02-20','OUTER HEBRIDES','(306) 906-7975','parkes@hotmail.com','2024-05-08 00:46:21','maule','OUTER HEBRIDES','talca','curico'),(2,'Alfredo','Perez Reina','15.192.156-2','1991-02-19','82 Windsor Road','(452) 597-0784','sjava@yahoo.ca','2024-05-08 00:46:21','maule','82 Windsor Road','talca','curico'),(3,'Moncho','Pereira Reinaldo','15.142.156-2','1992-02-19','14-16 Oconnor ','(452) 037-0784','sjeewqava@yahoo.ca','2024-05-08 00:46:21','maule','14-16 Oconnor ','talca','talca'),(4,'Sergio','Garrido Arrizabalaga','15.192.156-3','1981-02-20','PH82 4OY','(363) 441-6561','jipsen@outlook.com','2024-05-08 00:46:21','maule','PH82 4OY','talca','talca');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `d_c_d_s`
--

DROP TABLE IF EXISTS `d_c_d_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_c_d_s` (
  `id_d_c_d_s` int(11) NOT NULL AUTO_INCREMENT,
  `id_c_d_s` int(11) NOT NULL,
  `size` decimal(10,2) DEFAULT NULL,
  `customized` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_d_c_d_s`),
  KEY `fk_d_c_d_s_c_d_s1` (`id_c_d_s`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `d_c_d_s`
--

LOCK TABLES `d_c_d_s` WRITE;
/*!40000 ALTER TABLE `d_c_d_s` DISABLE KEYS */;
INSERT INTO `d_c_d_s` VALUES (1,2,30.00,0),(2,4,60.00,0),(3,5,10.00,0),(4,6,100.00,0);
/*!40000 ALTER TABLE `d_c_d_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `damage_images`
--

DROP TABLE IF EXISTS `damage_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `damage_images` (
  `id_damage_images` int(11) NOT NULL AUTO_INCREMENT,
  `image1` varchar(200) NOT NULL,
  `image2` varchar(200) DEFAULT NULL,
  `image3` varchar(200) DEFAULT NULL,
  `id_d_c_d_s` int(11) NOT NULL,
  PRIMARY KEY (`id_damage_images`),
  KEY `fk_damage_images_d_c_d_s1` (`id_d_c_d_s`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `damage_images`
--

LOCK TABLES `damage_images` WRITE;
/*!40000 ALTER TABLE `damage_images` DISABLE KEYS */;
INSERT INTO `damage_images` VALUES (2,'f1196fa8-cc08-4e17-9039-5c7f4c5828ec.png','2ce8b5dd-eb5e-4dea-914f-23a7e0e36eba.png','6b702fa6-2dae-46bd-b8e2-54dab85ec15b.png',2),(3,'e046a76b-e561-4193-84a4-34aded831984.png','c5c7d909-19fc-4c66-8209-fe9f267e821b.png','4ae54a0f-bc33-4895-8301-7d3abd5985e5.png',3),(4,'4d973dd1-4683-450b-82a6-9d2a8dfb8ae2.png','f5197b41-3c04-4662-9d43-4022285b1e3a.png','2f3c47b2-d840-4c07-9081-a81c8bbc73eb.png',4);
/*!40000 ALTER TABLE `damage_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `damages`
--

DROP TABLE IF EXISTS `damages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `damages` (
  `id_damage` int(11) NOT NULL AUTO_INCREMENT,
  `damage_name` varchar(150) NOT NULL,
  `damage_description` text,
  `damage_unit` varchar(40) NOT NULL,
  `createdby` varchar(40) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_incident` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_damage`),
  KEY `fk_c_d_cases1` (`id_incident`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `damages`
--

LOCK TABLES `damages` WRITE;
/*!40000 ALTER TABLE `damages` DISABLE KEYS */;
INSERT INTO `damages` VALUES (1,'fisura en muro','desc 1','mm',NULL,'2024-05-08 00:46:21',1),(2,'fisura en sello de marco de puerta','desc 2','mm',NULL,'2024-05-08 00:46:21',1),(3,'fisura en sello de marco de ventana','desc 3','mm',NULL,'2024-05-08 00:46:21',1),(4,'fisura en cielo','desc 4','mm',NULL,'2024-05-08 00:46:21',1),(5,'fisura dintel','desc 5','mm',NULL,'2024-05-08 00:46:21',1),(6,'fisura antepecho','desc 6','mm',NULL,'2024-05-08 00:46:21',1),(7,'fisura encuentro de muros','desc 7','mm',NULL,'2024-05-08 00:46:21',1),(8,'fisura encuentro tabique y cielo','desc 8','mm',NULL,'2024-05-08 00:46:21',1),(9,'fisura sello cornisa','desc 10','mm',NULL,'2024-05-08 00:46:21',1),(10,'fijaciones a la vista en tabiques','desc 11','cm',NULL,'2024-05-08 00:46:21',1),(11,'fijaciones a la vista en cielo','desc 12','cm',NULL,'2024-05-08 00:46:21',1),(12,'cer','desc 13','cm',NULL,'2024-05-08 00:46:21',1),(13,'cer','desc 14','cm',NULL,'2024-05-08 00:46:21',2),(14,'fisura de emboquillado','desc 15','mm',NULL,'2024-05-08 00:46:21',1),(15,'placas fisuradas','desc 16','uni',NULL,'2024-05-08 00:46:21',1),(16,'pilares fisurados','desc 17','uni',NULL,'2024-05-08 00:46:21',1),(17,'bardas fisurados','desc 18','mm',NULL,'2024-05-08 00:46:21',1),(18,'pintura muro','desc 19','m',NULL,'2024-05-08 00:46:21',1),(19,'Picoteo de gallina','Este daño se presenta cuando una persona con complejos de gallina se da de picotazos en diferentes superficies de la casa','uni','hector monsalves','2025-01-03 02:07:19',NULL);
/*!40000 ALTER TABLE `damages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `damages_repairs`
--

DROP TABLE IF EXISTS `damages_repairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `damages_repairs` (
  `id_damage_repair` int(11) NOT NULL AUTO_INCREMENT,
  `id_damage` int(11) NOT NULL,
  `id_repair` int(11) NOT NULL,
  `createdby` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_damage_repair`),
  KEY `fk_damages_has_repairs_damages1` (`id_damage`),
  KEY `fk_damages_has_repairs_repairs1` (`id_repair`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `damages_repairs`
--

LOCK TABLES `damages_repairs` WRITE;
/*!40000 ALTER TABLE `damages_repairs` DISABLE KEYS */;
INSERT INTO `damages_repairs` VALUES (1,1,1,NULL),(2,1,2,NULL),(3,2,6,NULL),(4,3,6,NULL),(5,4,8,NULL),(6,4,9,NULL),(7,4,10,NULL),(8,4,11,NULL),(9,4,12,NULL),(10,5,1,NULL),(11,5,2,NULL),(12,5,3,NULL),(13,5,4,NULL),(14,5,5,NULL),(15,6,1,NULL),(16,6,2,NULL),(17,6,3,NULL),(18,6,4,NULL),(19,6,5,NULL),(20,7,1,NULL),(21,7,2,NULL),(22,7,3,NULL),(23,7,4,NULL),(24,7,5,NULL),(25,8,1,NULL),(26,8,2,NULL),(27,8,3,NULL),(28,8,4,NULL),(29,8,5,NULL),(30,8,8,NULL),(31,8,9,NULL),(32,8,10,NULL),(33,8,11,NULL),(34,8,12,NULL),(35,9,15,NULL),(36,10,2,NULL),(37,10,3,NULL),(38,10,4,NULL),(39,10,5,NULL),(40,11,9,NULL),(41,11,10,NULL),(42,11,11,NULL),(43,11,12,NULL),(44,12,18,NULL),(45,12,19,NULL),(46,12,20,NULL),(47,12,21,NULL),(48,12,22,NULL),(49,14,23,NULL),(50,15,24,NULL),(51,15,25,NULL),(52,16,26,NULL),(53,16,27,NULL),(54,17,28,NULL),(55,17,29,NULL),(56,18,30,NULL),(57,19,28,NULL),(58,19,19,NULL),(59,19,7,NULL),(60,19,2,NULL);
/*!40000 ALTER TABLE `damages_repairs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimentions`
--

DROP TABLE IF EXISTS `dimentions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimentions` (
  `id_dimention` int(11) NOT NULL AUTO_INCREMENT,
  `sector_w_size` decimal(19,2) NOT NULL,
  `sector_l_size` decimal(19,2) NOT NULL,
  `sector_h_size` decimal(19,2) NOT NULL,
  `img1` varchar(200) NOT NULL,
  `img2` varchar(200) NOT NULL,
  `id_sector` int(11) NOT NULL,
  `id_case` int(11) NOT NULL,
  PRIMARY KEY (`id_dimention`),
  KEY `fk_dimentions_sectors1` (`id_sector`),
  KEY `fk_dimentions_cases1` (`id_case`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimentions`
--

LOCK TABLES `dimentions` WRITE;
/*!40000 ALTER TABLE `dimentions` DISABLE KEYS */;
INSERT INTO `dimentions` VALUES (2,32.00,45.00,33.00,'f44a3411-5864-4ba1-a95d-6c427998d7a9.png','e10d9e2d-a89f-4b80-a3a1-4060df8ac3e6.png',3,1);
/*!40000 ALTER TABLE `dimentions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidents`
--

DROP TABLE IF EXISTS `incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidents` (
  `id_incident` int(11) NOT NULL AUTO_INCREMENT,
  `incident_code` varchar(120) NOT NULL,
  `incident_date` date NOT NULL,
  `incident_description` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `incident_type` varchar(120) NOT NULL,
  `incident_scale` varchar(120) NOT NULL,
  PRIMARY KEY (`id_incident`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidents`
--

LOCK TABLES `incidents` WRITE;
/*!40000 ALTER TABLE `incidents` DISABLE KEYS */;
INSERT INTO `incidents` VALUES (1,'Sismo','2022-01-15','Terremoto en la regi','2024-05-08 04:46:21','Sismo','R'),(2,'Incendio','2022-01-20','Alerta de tsunami a lo largo de las ','2024-05-08 04:46:21','Incendio','R'),(3,'Rotura de ca?erias','2022-02-05','Inundaciones en la ciudad X debido a lluvias intensas','2024-05-08 04:46:21','Rotura de ca?erias','M'),(4,'Fen??menos de la naturaleza','2022-02-12','Brote de incendios forestales en el bosque B','2024-05-08 04:46:21','Fen??menos de la naturaleza','M');
/*!40000 ALTER TABLE `incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repairs`
--

DROP TABLE IF EXISTS `repairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repairs` (
  `id_repair` int(11) NOT NULL AUTO_INCREMENT,
  `repair_name` varchar(150) NOT NULL,
  `repair_unit` varchar(150) NOT NULL,
  `repair_price` decimal(19,2) NOT NULL,
  `repair_description` text,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_repair`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repairs`
--

LOCK TABLES `repairs` WRITE;
/*!40000 ALTER TABLE `repairs` DISABLE KEYS */;
INSERT INTO `repairs` VALUES (1,'Reparaci','ML',20500.00,'desc_1','2024-05-08 00:46:21'),(2,'Empaste y lijado de muro ','M2',4750.00,'desc_2','2024-05-08 00:46:21'),(3,'Preparaci','M2',2100.00,'desc_3','2024-05-08 00:46:21'),(4,'Aplicaci','M2',7600.00,'desc_4','2024-05-08 00:46:21'),(5,'Aplicaci','M2',7300.00,'desc_5','2024-05-08 00:46:21'),(6,'Sellado y pintura de marco de puerta','ML',3500.00,'desc_6','2024-05-08 00:46:21'),(7,'Sellado y pintura de marco de ventana','ML',3500.00,'desc_7','2024-05-08 00:46:21'),(8,'Reparaci','ML',20500.00,'desc_8','2024-05-08 00:46:21'),(9,'Empaste y lijado de cielo','M2',4750.00,'desc_9','2024-05-08 00:46:21'),(10,'Preparaci','M2',2100.00,'desc_10','2024-05-08 00:46:21'),(11,'Aplicaci','M2',7600.00,'desc_11','2024-05-08 00:46:21'),(12,'Aplicaci','M2',7300.00,'desc_12','2024-05-08 00:46:21'),(13,'Reparaci','ML',20500.00,'desc_13','2024-05-08 00:46:21'),(14,'Aplicaci','M2',7600.00,'desc_14','2024-05-08 00:46:21'),(15,'Sellado y pintura de cornisas','ML',3500.00,'desc_15','2024-05-08 00:46:21'),(16,'Preparaci','M2',2100.00,'desc_16','2024-05-08 00:46:21'),(17,'Aplicaci','M2',7300.00,'desc_17','2024-05-08 00:46:21'),(18,'Retiro de ceramica de muro ','M2',7300.00,'desc_18','2024-05-08 00:46:21'),(19,'Preparacion de superficie ','M2',3100.00,'desc_19','2024-05-08 00:46:21'),(20,'Provision e instalacion de ceramica de muro ','M2',18500.00,'desc_20','2024-05-08 00:46:21'),(21,'Fraguado de ceramica de muro ','M2',4100.00,'desc_21','2024-05-08 00:46:21'),(22,'Retiro e instalacion de artefacto','UN',32000.00,'desc_22','2024-05-08 00:46:21'),(23,'Revoque muro','ML',3500.00,'desc_23','2024-05-08 00:46:21'),(24,'Retiro de placas fisuradas','UN',4900.00,'desc_24','2024-05-08 00:46:21'),(25,'Instalaci','UN',11500.00,'desc_25','2024-05-08 00:46:21'),(26,'Retiro de pilares fisurados','UN',9500.00,'desc_26','2024-05-08 00:46:21'),(27,'Instalaci','UN',16500.00,'desc_27','2024-05-08 00:46:21'),(28,'Retiro de bardas fisuradas','UN',3500.00,'desc_28','2024-05-08 00:46:21'),(29,'Instalaci','UN',8100.00,'desc_29','2024-05-08 00:46:21'),(30,'Aplicaci','M2',8200.00,'desc_30','2024-05-08 00:46:21'),(31,'Flete de materiales','UN',30000.00,'desc_31','2024-05-08 00:46:21'),(32,'Protecci','GL',35000.00,'desc_32','2024-05-08 00:46:21'),(33,'Acomodo de mobiliario','GL',50000.00,'desc_33','2024-05-08 00:46:21'),(34,'Retiro de escombros','M3',50000.00,'desc_34','2024-05-08 00:46:21'),(35,'Aseo y entrega ','GL',75000.00,'desc_35','2024-05-08 00:46:21');
/*!40000 ALTER TABLE `repairs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectors`
--

DROP TABLE IF EXISTS `sectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sectors` (
  `id_sector` int(11) NOT NULL AUTO_INCREMENT,
  `sector_name` varchar(150) NOT NULL,
  `sector_description` text,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sector`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
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
  `expires` int(10) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('42eOph80lWF00lRY_hv75Ez-Resit8fu',1743829894,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":1},\"flash\":{}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id_status` int(11) NOT NULL,
  `status_name` varchar(40) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (5,'asignado','2024-05-27 04:04:30'),(1,'inspección abierta','2024-05-27 04:04:44'),(2,'inspección finalizada','2024-05-27 04:04:52'),(3,'caso finalizado','2024-05-27 04:05:22'),(4,'caso editado','2024-05-27 04:05:31');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-04  5:32:53
