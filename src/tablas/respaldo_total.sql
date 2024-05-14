-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: cub
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
-- Table structure for table `6scr5xn_clientes`
--

DROP TABLE IF EXISTS `6scr5xn_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `6scr5xn_clientes` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `rut` varchar(13) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `estado` varchar(80) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nacionalidad` varchar(100) DEFAULT NULL,
  `estado_civil` varchar(80) DEFAULT NULL,
  `profesion_ocupacion` varchar(200) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `tipo_inmueble` varchar(150) DEFAULT NULL,
  `region` varchar(70) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `comuna` varchar(100) DEFAULT NULL,
  `banco` varchar(150) DEFAULT NULL,
  `aseguradora` varchar(200) DEFAULT NULL,
  `archivo` varchar(200) DEFAULT NULL,
  `nombre_archivos` varchar(1000) DEFAULT NULL,
  `exc_prorroga` tinyint(1) DEFAULT NULL,
  `exc_pendiente` tinyint(1) DEFAULT NULL,
  `observaciones` text,
  `tipo_entidad` varchar(100) NOT NULL,
  `tipo_siniestros` varchar(100) NOT NULL,
  `num_bancoestado` varchar(30) DEFAULT NULL,
  `monto_indemnizado` int DEFAULT NULL,
  `porcentaje` int DEFAULT NULL,
  `honorarios` int DEFAULT NULL,
  `pago_honorarios` date DEFAULT NULL,
  `correo_enviado` tinyint(1) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `notas_internas` text,
  `vencimiento_estado` date DEFAULT NULL,
  `numero_caso` int DEFAULT NULL,
  `fecha_siniestro` date DEFAULT NULL,
  PRIMARY KEY (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci CONNECTION='mysql://asesoresprime_asesoresprimeCub:XX;6sU2q46NR@203.30.15.56:3306/asesoresprime_web/6Scr5XN_clientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `6scr5xn_clientes`
--

LOCK TABLES `6scr5xn_clientes` WRITE;
/*!40000 ALTER TABLE `6scr5xn_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `6scr5xn_clientes` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `advisers` VALUES (1,'adv1','$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG','admin','hector','monsalves','123456789','galli.no@example.com','7792014','2024-04-08 12:51:48','1980-05-15'),(2,'adv2','$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG','worker','juan','perez','987654321','juan.perez@example.com','7722014','2024-04-08 12:51:48','1985-08-20'),(3,'adv3','$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG','admin','pedro','gonzalez','123456789','pgenzalez@example.com','7792014','2024-04-08 12:51:48','1980-05-15'),(4,'adv4','$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG','worker','cristian','moscoso','987654321','cm@example.com','7722014','2024-04-08 12:51:48','1985-08-20');
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
  KEY `fk_cases_has_damages_damages1_idx` (`id_damage`),
  KEY `fk_c_d_sectors1_idx` (`id_sector`),
  KEY `fk_c_d_cases1_idx` (`id_case`),
  CONSTRAINT `fk_c_d_cases1` FOREIGN KEY (`id_case`) REFERENCES `cases` (`id_case`) ON DELETE CASCADE,
  CONSTRAINT `fk_c_d_sectors1` FOREIGN KEY (`id_sector`) REFERENCES `sectors` (`id_sector`) ON DELETE CASCADE,
  CONSTRAINT `fk_cases_has_damages_damages1` FOREIGN KEY (`id_damage`) REFERENCES `damages` (`id_damage`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_d_s`
--

LOCK TABLES `c_d_s` WRITE;
/*!40000 ALTER TABLE `c_d_s` DISABLE KEYS */;
INSERT INTO `c_d_s` VALUES (15,26,6,2),(18,26,2,5),(19,26,6,5),(20,26,2,5),(105,26,12,1),(106,26,15,1),(107,15,15,1);
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
  `case_date` timestamp NOT NULL,
  `case_img1` varchar(200) DEFAULT NULL,
  `case_img2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_case`),
  KEY `fk_cases_status1_idx` (`id_status`),
  KEY `fk_cases_advisers1_idx` (`id_adviser`),
  KEY `fk_cases_clients1_idx` (`id_client`),
  KEY `fk_cases_incidents1_idx` (`id_incident`),
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
INSERT INTO `cases` VALUES (1,1,1,1,1,'2024-04-08 12:51:48','2015-05-21 14:00:00','d2131545-e8f6-4670-85af-aad436e4ae61.png','b4046eb0-ad75-4182-bc21-a5d21594a80c.png'),(2,1,1,2,2,'2024-04-08 12:51:48','2015-05-22 14:00:00','329f288f-4961-4e13-aa4e-9132df12c203.png','50169188-0b8a-4e8a-8715-448f3646cc87.png'),(3,3,3,3,3,'2024-04-08 12:51:48','2015-05-23 14:00:00',NULL,NULL),(4,2,4,4,4,'2024-04-08 12:51:48','2015-05-24 14:00:00',NULL,NULL),(5,1,2,1,1,'2024-04-08 12:51:48','2015-05-21 14:00:00',NULL,NULL),(6,1,NULL,2,2,'2024-04-08 12:51:48','2015-05-22 14:00:00',NULL,NULL),(7,1,NULL,4,2,'2024-04-08 12:51:48','2015-05-23 14:00:00',NULL,NULL),(8,2,3,3,3,'2024-04-08 12:51:48','2015-05-24 14:00:00',NULL,NULL);
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
INSERT INTO `clients` VALUES (1,'Ana','Ramos Sánchez','15.152.156-5','1982-02-20','OUTER HEBRIDES','(306) 906-7975','parkes@hotmail.com','2024-04-08 12:51:48'),(2,'Alfredo','Perez Reina','15.192.156-2','1991-02-19','82 Windsor Road','(452) 597-0784','sjava@yahoo.ca','2024-04-08 12:51:48'),(3,'Moncho','Pereira Reinaldo','15.142.156-2','1992-02-19','14-16 Oconnor ','(452) 037-0784','sjeewqava@yahoo.ca','2024-04-08 12:51:48'),(4,'Sergio','Garrido Arrizabalaga','15.192.156-3','1981-02-20','PH82 4OY','(363) 441-6561','jipsen@outlook.com','2024-04-08 12:51:48');
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
  KEY `fk_d_c_d_s_c_d_s1_idx` (`id_c_d_s`),
  CONSTRAINT `fk_d_c_d_s_c_d_s1` FOREIGN KEY (`id_c_d_s`) REFERENCES `c_d_s` (`id_c_d_s`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `d_c_d_s`
--

LOCK TABLES `d_c_d_s` WRITE;
/*!40000 ALTER TABLE `d_c_d_s` DISABLE KEYS */;
INSERT INTO `d_c_d_s` VALUES (15,15,118,NULL),(18,18,24,NULL),(19,19,23,NULL),(20,20,23,NULL),(97,105,23,0),(98,106,45,0),(99,107,56,0);
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
  UNIQUE KEY `id_damage_images_UNIQUE` (`id_damage_images`),
  KEY `fk_damage_images_d_c_d_s1_idx` (`id_d_c_d_s`),
  CONSTRAINT `fk_damage_images_d_c_d_s1` FOREIGN KEY (`id_d_c_d_s`) REFERENCES `d_c_d_s` (`id_d_c_d_s`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `damage_images`
--

LOCK TABLES `damage_images` WRITE;
/*!40000 ALTER TABLE `damage_images` DISABLE KEYS */;
INSERT INTO `damage_images` VALUES (15,'img151','img1q5','img15ewq',15),(18,'a8cbc105-2e91-4106-b506-424395cd0c91.jpeg','5b4d7bfd-160b-4343-93c1-f610651506f4.jpeg','50aabfd3-d4c4-4d5a-a06a-1e1ce3435210.jpeg',18),(19,'95d2e0f0-90b2-45c8-8e90-934c7f976805.jpeg','84ef937e-af39-41c4-9113-9d0b67a628c4.jpeg','eb58f73a-4d95-4d4d-aae3-f261e4b03ffe.jpg',19),(20,'2d29c2a3-e6d7-4c94-9667-b00149ec5023.jpeg','65c7a343-8f3c-4aa6-8759-0f9d1f278636.jpeg','b31d8b63-b83e-42fc-9c16-fcd0d8b62549.jpeg',20),(97,'631e31af-b0ec-4ec6-a6f5-eea44712b303.png','92da6d21-e2ad-4959-b02b-982c51b92210.png','66acbed7-59c2-4977-99ae-d6ee457fdc02.png',97),(98,'270993aa-e38d-4e14-b4ab-e86d9b1e72ce.png','d36d5ddc-8da8-4d39-82af-e65ba2c09bca.png','4c6b4753-b747-4a44-8646-773c80e208f7.png',98),(99,'3606088d-cbcf-416c-a8af-de2b89ce713a.png','db629d6b-c594-44c0-a58c-f5a5722fa026.png','24e5656d-0901-4d80-a37f-f0abf602eb23.png',99);
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
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_damage`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `damages`
--

LOCK TABLES `damages` WRITE;
/*!40000 ALTER TABLE `damages` DISABLE KEYS */;
INSERT INTO `damages` VALUES (1,'fisura en muro','desc 1','mm','2024-04-08 12:51:48',NULL),(2,'fisura en sello de marco de puerta','desc 2','mm','2024-04-08 12:51:48',NULL),(3,'fisura en sello de marco de ventana','desc 3','mm','2024-04-08 12:51:48',NULL),(4,'fisura en cielo','desc 4','mm','2024-04-08 12:51:48',NULL),(5,'fisura dintel','desc 5','mm','2024-04-08 12:51:48',NULL),(6,'fisura antepecho','desc 6','mm','2024-04-08 12:51:48',NULL),(7,'fisura encuentro de muros','desc 7','mm','2024-04-08 12:51:48',NULL),(8,'fisura encuentro tabique y cielo','desc 8','mm','2024-04-08 12:51:48',NULL),(9,'fisura sello cornisa','desc 10','mm','2024-04-08 12:51:48',NULL),(10,'fijaciones a la vista en tabiques','desc 11','cm','2024-04-08 12:51:48',NULL),(11,'fijaciones a la vista en cielo','desc 12','cm','2024-04-08 12:51:48',NULL),(12,'cerámicas muro fisuradas','desc 13','cm','2024-04-08 12:51:48',NULL),(13,'cerámicas piso fisuradas','desc 14','cm','2024-04-08 12:51:48',NULL),(14,'fisura de emboquillado','desc 15','mm','2024-04-08 12:51:48',NULL),(15,'placas fisuradas','desc 16','uni','2024-04-08 12:51:48',NULL),(16,'pilares fisurados','desc 17','uni','2024-04-08 12:51:48',NULL),(17,'bardas fisurados','desc 18','mm','2024-04-08 12:51:48',NULL),(18,'pintura muro','desc 19','m','2024-04-08 12:51:48',NULL),(19,'desc 1','mm','Da?o de prueba 1','2024-04-14 03:59:02','TITO'),(20,'desc 1','mm','Da?o de prueba 1','2024-04-14 04:01:00','TITO'),(21,'Da?o de prueba 1','desc 1','mm','2024-04-14 04:01:48','TITO'),(22,'damage de prueba 2','descrip2','mm','2024-04-14 04:38:57','tito'),(23,'daño 3 test','desc 3','uni','2024-04-14 05:01:41','hector monsalves'),(24,'daño 4 test','desc 4','uni','2024-04-14 05:29:02','hector monsalves'),(25,'dasdsad','fdsfdsf','uni','2024-04-14 06:05:10','hector monsalves'),(26,'moco en la pared','blablabla','uni','2024-04-14 08:11:41','hector monsalves');
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
  PRIMARY KEY (`id_damage_repair`),
  KEY `fk_damages_has_repairs_repairs1_idx` (`id_repair`),
  KEY `fk_damages_has_repairs_damages1_idx` (`id_damage`),
  CONSTRAINT `fk_damages_has_repairs_damages1` FOREIGN KEY (`id_damage`) REFERENCES `damages` (`id_damage`) ON DELETE CASCADE,
  CONSTRAINT `fk_damages_has_repairs_repairs1` FOREIGN KEY (`id_repair`) REFERENCES `repairs` (`id_repair`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `damages_repairs`
--

LOCK TABLES `damages_repairs` WRITE;
/*!40000 ALTER TABLE `damages_repairs` DISABLE KEYS */;
INSERT INTO `damages_repairs` VALUES (1,1,1),(2,1,2),(3,2,6),(4,3,6),(5,4,8),(6,4,9),(7,4,10),(8,4,11),(9,4,12),(10,5,1),(11,5,2),(12,5,3),(13,5,4),(14,5,5),(15,6,1),(16,6,2),(17,6,3),(18,6,4),(19,6,5),(20,7,1),(21,7,2),(22,7,3),(23,7,4),(24,7,5),(25,8,1),(26,8,2),(27,8,3),(28,8,4),(29,8,5),(30,8,8),(31,8,9),(32,8,10),(33,8,11),(34,8,12),(35,9,15),(36,10,2),(37,10,3),(38,10,4),(39,10,5),(40,11,9),(41,11,10),(42,11,11),(43,11,12),(44,12,18),(45,12,19),(46,12,20),(47,12,21),(48,12,22),(49,14,23),(50,15,24),(51,15,25),(52,16,26),(53,16,27),(54,17,28),(55,17,29),(56,18,30),(57,22,2),(58,22,3),(59,22,4),(60,22,5),(61,23,32),(62,23,26),(63,23,18),(64,23,12),(65,24,30),(66,24,22),(67,24,6),(68,24,4),(69,25,29),(70,25,21),(71,25,5),(72,26,29),(73,26,22),(74,26,19),(75,26,13),(76,26,9);
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
  KEY `fk_dimentions_sectors1_idx` (`id_sector`),
  KEY `fk_dimentions_cases1_idx` (`id_case`),
  CONSTRAINT `fk_dimentions_cases1` FOREIGN KEY (`id_case`) REFERENCES `cases` (`id_case`) ON DELETE CASCADE,
  CONSTRAINT `fk_dimentions_sectors1` FOREIGN KEY (`id_sector`) REFERENCES `sectors` (`id_sector`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimentions`
--

LOCK TABLES `dimentions` WRITE;
/*!40000 ALTER TABLE `dimentions` DISABLE KEYS */;
INSERT INTO `dimentions` VALUES (6,19.00,6.00,2.00,'img1','img2',6,2),(10,32.00,20.00,12.00,'b836ab98-ca7a-4495-b6e8-2b531538e399.jpg','1bb4492e-5f26-4df0-877b-16c8f84b815e.png',6,5);
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
INSERT INTO `incidents` VALUES (1,'AK420','2022-01-15','Terremoto en la región A, magnitud 6.5','2024-04-08 12:51:48'),(2,'AK421','2022-01-20','Alerta de tsunami a lo largo de las áreas costeras','2024-04-08 12:51:48'),(3,'AK422','2022-02-05','Inundaciones en la ciudad X debido a lluvias intensas','2024-04-08 12:51:48'),(4,'AK422','2022-02-12','Brote de incendios forestales en el bosque B','2024-04-08 12:51:48');
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
  `createdby` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_repair`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repairs`
--

LOCK TABLES `repairs` WRITE;
/*!40000 ALTER TABLE `repairs` DISABLE KEYS */;
INSERT INTO `repairs` VALUES (1,'Reparación de fisura en muro ','ML',20500.00,'desc_1','2024-04-08 12:51:48',NULL),(2,'Empaste y lijado de muro ','M2',4750.00,'desc_2','2024-04-08 12:51:48',NULL),(3,'Preparación de superficie de muro ','M2',2100.00,'desc_3','2024-04-08 12:51:48',NULL),(4,'Aplicación de textura martellina muro','M2',7600.00,'desc_4','2024-04-08 12:51:48',NULL),(5,'Aplicación de pintura de muro ','M2',7300.00,'desc_5','2024-04-08 12:51:48',NULL),(6,'Sellado y pintura de marco de puerta','ML',3500.00,'desc_6','2024-04-08 12:51:48',NULL),(7,'Sellado y pintura de marco de ventana','ML',3500.00,'desc_7','2024-04-08 12:51:48',NULL),(8,'Reparación de fisura en cielo','ML',20500.00,'desc_8','2024-04-08 12:51:48',NULL),(9,'Empaste y lijado de cielo','M2',4750.00,'desc_9','2024-04-08 12:51:48',NULL),(10,'Preparación de superficie de cielo ','M2',2100.00,'desc_10','2024-04-08 12:51:48',NULL),(11,'Aplicación de textura martellina cielo ','M2',7600.00,'desc_11','2024-04-08 12:51:48',NULL),(12,'Aplicación de pintura de cielo ','M2',7300.00,'desc_12','2024-04-08 12:51:48',NULL),(13,'Reparación de fisura en muro','ML',20500.00,'desc_13','2024-04-08 12:51:48',NULL),(14,'Aplicación de textura martellina muro ','M2',7600.00,'desc_14','2024-04-08 12:51:48',NULL),(15,'Sellado y pintura de cornisas','ML',3500.00,'desc_15','2024-04-08 12:51:48',NULL),(16,'Preparación de superficie de cielo','M2',2100.00,'desc_16','2024-04-08 12:51:48',NULL),(17,'Aplicación de pintura de cielo','M2',7300.00,'desc_17','2024-04-08 12:51:48',NULL),(18,'Retiro de ceramica de muro ','M2',7300.00,'desc_18','2024-04-08 12:51:48',NULL),(19,'Preparacion de superficie ','M2',3100.00,'desc_19','2024-04-08 12:51:48',NULL),(20,'Provision e instalacion de ceramica de muro ','M2',18500.00,'desc_20','2024-04-08 12:51:48',NULL),(21,'Fraguado de ceramica de muro ','M2',4100.00,'desc_21','2024-04-08 12:51:48',NULL),(22,'Retiro e instalacion de artefacto','UN',32000.00,'desc_22','2024-04-08 12:51:48',NULL),(23,'Revoque muro','ML',3500.00,'desc_23','2024-04-08 12:51:48',NULL),(24,'Retiro de placas fisuradas','UN',4900.00,'desc_24','2024-04-08 12:51:48',NULL),(25,'Instalación de placas nuevas','UN',11500.00,'desc_25','2024-04-08 12:51:48',NULL),(26,'Retiro de pilares fisurados','UN',9500.00,'desc_26','2024-04-08 12:51:48',NULL),(27,'Instalación de pilares nuevos','UN',16500.00,'desc_27','2024-04-08 12:51:48',NULL),(28,'Retiro de bardas fisuradas','UN',3500.00,'desc_28','2024-04-08 12:51:48',NULL),(29,'Instalación de bardas nuevas','UN',8100.00,'desc_29','2024-04-08 12:51:48',NULL),(30,'Aplicación de pintura de muro ','M2',8200.00,'desc_30','2024-04-08 12:51:48',NULL),(31,'Flete de materiales','UN',30000.00,'desc_31','2024-04-08 12:51:48',NULL),(32,'Protección de areas de trabajo','GL',35000.00,'desc_32','2024-04-08 12:51:48',NULL),(33,'Acomodo de mobiliario','GL',50000.00,'desc_33','2024-04-08 12:51:48',NULL),(34,'Retiro de escombros','M3',50000.00,'desc_34','2024-04-08 12:51:48',NULL),(35,'Aseo y entrega ','GL',75000.00,'desc_35','2024-04-08 12:51:48',NULL);
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
INSERT INTO `sectors` VALUES (1,'fachada frontal ','desc_repair_1','2024-04-08 12:51:48'),(2,'living comedor','desc_repair_2','2024-04-08 12:51:48'),(3,'dormitorio 1 (principal)','desc_repair_3','2024-04-08 12:51:48'),(4,'ba?o (1er nive)','desc_repair_4','2024-04-08 12:51:48'),(5,'ba?o (2do nivel)','desc_repair_5','2024-04-08 12:51:48'),(6,'cocina','desc_repair_6','2024-04-08 12:51:48'),(7,'caja escala / sala de estar','desc_repair_7','2024-04-08 12:51:48'),(8,'dormitorio 2','desc_repair_8','2024-04-08 12:51:48'),(9,'cierre perimetral','desc_repair_9','2024-04-08 12:51:48'),(10,'logia','desc_repair_10','2024-04-08 12:51:48'),(11,'bodega','desc_repair_11','2024-04-08 12:51:48'),(12,'sala de estar primer piso','desc_repair_12','2024-04-08 12:51:48'),(13,'sala de estar segundo piso','desc_repair_13','2024-04-08 12:51:48'),(14,'hall de acceso','desc_repair_14','2024-04-08 12:51:48'),(15,'pasillo','desc_repair_15','2024-04-08 12:51:48');
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
INSERT INTO `sessions` VALUES ('ycQZ83ess7iOYYzOTMsXfAZz7my4On4j',1715180897,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":1},\"flash\":{}}');
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
INSERT INTO `status` VALUES (1,'No iniciado','2024-04-08 12:51:48'),(2,'En proceso','2024-04-08 12:51:48'),(3,'completado','2024-04-08 12:51:48');
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

-- Dump completed on 2024-05-14  0:35:13
