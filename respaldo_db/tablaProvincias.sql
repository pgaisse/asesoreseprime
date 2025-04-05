-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: 190.107.177.239    Database: asesoresprime_web
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
-- Table structure for table `6Scr5XN_provincias`
--

DROP TABLE IF EXISTS `6Scr5XN_provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `6Scr5XN_provincias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provincia` varchar(64) NOT NULL,
  `region_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `6Scr5XN_provincias`
--

LOCK TABLES `6Scr5XN_provincias` WRITE;
/*!40000 ALTER TABLE `6Scr5XN_provincias` DISABLE KEYS */;
INSERT INTO `6Scr5XN_provincias` VALUES (1,'Arica',1),(2,'Parinacota',1),(3,'Iquique',2),(4,'El Tamarugal',2),(5,'Tocopilla',3),(6,'El Loa',3),(7,'Antofagasta',3),(8,'Chañaral',4),(9,'Copiapó',4),(10,'Huasco',4),(11,'Elqui',5),(12,'Limarí',5),(13,'Choapa',5),(14,'Petorca',6),(15,'Los Andes',6),(16,'San Felipe de Aconcagua',6),(17,'Quillota',6),(18,'Valparaiso',6),(19,'San Antonio',6),(20,'Isla de Pascua',6),(21,'Marga Marga',6),(22,'Chacabuco',7),(23,'Santiago',7),(24,'Cordillera',7),(25,'Maipo',7),(26,'Melipilla',7),(27,'Talagante',7),(28,'Cachapoal',8),(29,'Colchagua',8),(30,'Cardenal Caro',8),(31,'Curicó',9),(32,'Talca',9),(33,'Linares',9),(34,'Cauquenes',9),(35,'Diguillín',10),(36,'Itata',10),(37,'Punilla',10),(38,'Bio Bío',11),(39,'Concepción',11),(40,'Arauco',11),(41,'Malleco',12),(42,'Cautín',12),(43,'Valdivia',13),(44,'Ranco',13),(45,'Osorno',14),(46,'Llanquihue',14),(47,'Chiloé',14),(48,'Palena',14),(49,'Coyhaique',15),(50,'Aysén',15),(51,'General Carrera',15),(52,'Capitán Prat',15),(53,'Última Esperanza',16),(54,'Magallanes',16),(55,'Tierra del Fuego',16),(56,'Antártica Chilena',16);
/*!40000 ALTER TABLE `6Scr5XN_provincias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-04  7:17:06
