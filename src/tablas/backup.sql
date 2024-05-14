-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: cub
-- ------------------------------------------------------
-- Server version	8.0.36
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `6scr5xn_clientes`
--


--
-- Dumping data for table `advisers`
--

INSERT INTO `advisers` VALUES (1,'adv1','$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG','admin','hector','monsalves','123456789','galli.no@example.com','7792014','2024-04-08 12:51:48','1980-05-15');
INSERT INTO `advisers` VALUES (2,'adv2','$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG','worker','juan','perez','987654321','juan.perez@example.com','7722014','2024-04-08 12:51:48','1985-08-20');
INSERT INTO `advisers` VALUES (3,'adv3','$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG','admin','pedro','gonzalez','123456789','pgenzalez@example.com','7792014','2024-04-08 12:51:48','1980-05-15');
INSERT INTO `advisers` VALUES (4,'adv4','$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG','worker','cristian','moscoso','987654321','cm@example.com','7722014','2024-04-08 12:51:48','1985-08-20');

--
-- Dumping data for table `budgets`
--


--
-- Dumping data for table `c_d_s`
--

INSERT INTO `c_d_s` VALUES (15,26,6,2);
INSERT INTO `c_d_s` VALUES (18,26,2,5);
INSERT INTO `c_d_s` VALUES (19,26,6,5);
INSERT INTO `c_d_s` VALUES (20,26,2,5);
INSERT INTO `c_d_s` VALUES (105,26,12,1);
INSERT INTO `c_d_s` VALUES (106,26,15,1);
INSERT INTO `c_d_s` VALUES (107,15,15,1);

--
-- Dumping data for table `cases`
--

INSERT INTO `cases` VALUES (1,1,1,1,1,'2024-04-08 12:51:48','2015-05-21 14:00:00','d2131545-e8f6-4670-85af-aad436e4ae61.png','b4046eb0-ad75-4182-bc21-a5d21594a80c.png');
INSERT INTO `cases` VALUES (2,1,1,2,2,'2024-04-08 12:51:48','2015-05-22 14:00:00','329f288f-4961-4e13-aa4e-9132df12c203.png','50169188-0b8a-4e8a-8715-448f3646cc87.png');
INSERT INTO `cases` VALUES (3,3,3,3,3,'2024-04-08 12:51:48','2015-05-23 14:00:00',NULL,NULL);
INSERT INTO `cases` VALUES (4,2,4,4,4,'2024-04-08 12:51:48','2015-05-24 14:00:00',NULL,NULL);
INSERT INTO `cases` VALUES (5,1,2,1,1,'2024-04-08 12:51:48','2015-05-21 14:00:00',NULL,NULL);
INSERT INTO `cases` VALUES (6,1,NULL,2,2,'2024-04-08 12:51:48','2015-05-22 14:00:00',NULL,NULL);
INSERT INTO `cases` VALUES (7,1,NULL,4,2,'2024-04-08 12:51:48','2015-05-23 14:00:00',NULL,NULL);
INSERT INTO `cases` VALUES (8,2,3,3,3,'2024-04-08 12:51:48','2015-05-24 14:00:00',NULL,NULL);

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` VALUES (1,'Ana','Ramos Sánchez','15.152.156-5','1982-02-20','OUTER HEBRIDES','(306) 906-7975','parkes@hotmail.com','2024-04-08 12:51:48');
INSERT INTO `clients` VALUES (2,'Alfredo','Perez Reina','15.192.156-2','1991-02-19','82 Windsor Road','(452) 597-0784','sjava@yahoo.ca','2024-04-08 12:51:48');
INSERT INTO `clients` VALUES (3,'Moncho','Pereira Reinaldo','15.142.156-2','1992-02-19','14-16 Oconnor ','(452) 037-0784','sjeewqava@yahoo.ca','2024-04-08 12:51:48');
INSERT INTO `clients` VALUES (4,'Sergio','Garrido Arrizabalaga','15.192.156-3','1981-02-20','PH82 4OY','(363) 441-6561','jipsen@outlook.com','2024-04-08 12:51:48');

--
-- Dumping data for table `d_c_d_s`
--

INSERT INTO `d_c_d_s` VALUES (15,15,118,NULL);
INSERT INTO `d_c_d_s` VALUES (18,18,24,NULL);
INSERT INTO `d_c_d_s` VALUES (19,19,23,NULL);
INSERT INTO `d_c_d_s` VALUES (20,20,23,NULL);
INSERT INTO `d_c_d_s` VALUES (97,105,23,0);
INSERT INTO `d_c_d_s` VALUES (98,106,45,0);
INSERT INTO `d_c_d_s` VALUES (99,107,56,0);

--
-- Dumping data for table `damage_images`
--

INSERT INTO `damage_images` VALUES (15,'img151','img1q5','img15ewq',15);
INSERT INTO `damage_images` VALUES (18,'a8cbc105-2e91-4106-b506-424395cd0c91.jpeg','5b4d7bfd-160b-4343-93c1-f610651506f4.jpeg','50aabfd3-d4c4-4d5a-a06a-1e1ce3435210.jpeg',18);
INSERT INTO `damage_images` VALUES (19,'95d2e0f0-90b2-45c8-8e90-934c7f976805.jpeg','84ef937e-af39-41c4-9113-9d0b67a628c4.jpeg','eb58f73a-4d95-4d4d-aae3-f261e4b03ffe.jpg',19);
INSERT INTO `damage_images` VALUES (20,'2d29c2a3-e6d7-4c94-9667-b00149ec5023.jpeg','65c7a343-8f3c-4aa6-8759-0f9d1f278636.jpeg','b31d8b63-b83e-42fc-9c16-fcd0d8b62549.jpeg',20);
INSERT INTO `damage_images` VALUES (97,'631e31af-b0ec-4ec6-a6f5-eea44712b303.png','92da6d21-e2ad-4959-b02b-982c51b92210.png','66acbed7-59c2-4977-99ae-d6ee457fdc02.png',97);
INSERT INTO `damage_images` VALUES (98,'270993aa-e38d-4e14-b4ab-e86d9b1e72ce.png','d36d5ddc-8da8-4d39-82af-e65ba2c09bca.png','4c6b4753-b747-4a44-8646-773c80e208f7.png',98);
INSERT INTO `damage_images` VALUES (99,'3606088d-cbcf-416c-a8af-de2b89ce713a.png','db629d6b-c594-44c0-a58c-f5a5722fa026.png','24e5656d-0901-4d80-a37f-f0abf602eb23.png',99);

--
-- Dumping data for table `damages`
--

INSERT INTO `damages` VALUES (1,'fisura en muro','desc 1','mm','2024-04-08 12:51:48',NULL);
INSERT INTO `damages` VALUES (2,'fisura en sello de marco de puerta','desc 2','mm','2024-04-08 12:51:48',NULL);
INSERT INTO `damages` VALUES (3,'fisura en sello de marco de ventana','desc 3','mm','2024-04-08 12:51:48',NULL);
INSERT INTO `damages` VALUES (4,'fisura en cielo','desc 4','mm','2024-04-08 12:51:48',NULL);
INSERT INTO `damages` VALUES (5,'fisura dintel','desc 5','mm','2024-04-08 12:51:48',NULL);
INSERT INTO `damages` VALUES (6,'fisura antepecho','desc 6','mm','2024-04-08 12:51:48',NULL);
INSERT INTO `damages` VALUES (7,'fisura encuentro de muros','desc 7','mm','2024-04-08 12:51:48',NULL);
INSERT INTO `damages` VALUES (8,'fisura encuentro tabique y cielo','desc 8','mm','2024-04-08 12:51:48',NULL);
INSERT INTO `damages` VALUES (9,'fisura sello cornisa','desc 10','mm','2024-04-08 12:51:48',NULL);
INSERT INTO `damages` VALUES (10,'fijaciones a la vista en tabiques','desc 11','cm','2024-04-08 12:51:48',NULL);
INSERT INTO `damages` VALUES (11,'fijaciones a la vista en cielo','desc 12','cm','2024-04-08 12:51:48',NULL);
INSERT INTO `damages` VALUES (12,'cerámicas muro fisuradas','desc 13','cm','2024-04-08 12:51:48',NULL);
INSERT INTO `damages` VALUES (13,'cerámicas piso fisuradas','desc 14','cm','2024-04-08 12:51:48',NULL);
INSERT INTO `damages` VALUES (14,'fisura de emboquillado','desc 15','mm','2024-04-08 12:51:48',NULL);
INSERT INTO `damages` VALUES (15,'placas fisuradas','desc 16','uni','2024-04-08 12:51:48',NULL);
INSERT INTO `damages` VALUES (16,'pilares fisurados','desc 17','uni','2024-04-08 12:51:48',NULL);
INSERT INTO `damages` VALUES (17,'bardas fisurados','desc 18','mm','2024-04-08 12:51:48',NULL);
INSERT INTO `damages` VALUES (18,'pintura muro','desc 19','m','2024-04-08 12:51:48',NULL);
INSERT INTO `damages` VALUES (19,'desc 1','mm','Da?o de prueba 1','2024-04-14 03:59:02','TITO');
INSERT INTO `damages` VALUES (20,'desc 1','mm','Da?o de prueba 1','2024-04-14 04:01:00','TITO');
INSERT INTO `damages` VALUES (21,'Da?o de prueba 1','desc 1','mm','2024-04-14 04:01:48','TITO');
INSERT INTO `damages` VALUES (22,'damage de prueba 2','descrip2','mm','2024-04-14 04:38:57','tito');
INSERT INTO `damages` VALUES (23,'daño 3 test','desc 3','uni','2024-04-14 05:01:41','hector monsalves');
INSERT INTO `damages` VALUES (24,'daño 4 test','desc 4','uni','2024-04-14 05:29:02','hector monsalves');
INSERT INTO `damages` VALUES (25,'dasdsad','fdsfdsf','uni','2024-04-14 06:05:10','hector monsalves');
INSERT INTO `damages` VALUES (26,'moco en la pared','blablabla','uni','2024-04-14 08:11:41','hector monsalves');

--
-- Dumping data for table `damages_repairs`
--

INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (1,1,1);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (2,1,2);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (3,2,6);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (4,3,6);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (5,4,8);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (6,4,9);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (7,4,10);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (8,4,11);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (9,4,12);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (10,5,1);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (11,5,2);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (12,5,3);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (13,5,4);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (14,5,5);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (15,6,1);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (16,6,2);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (17,6,3);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (18,6,4);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (19,6,5);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (20,7,1);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (21,7,2);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (22,7,3);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (23,7,4);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (24,7,5);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (25,8,1);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (26,8,2);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (27,8,3);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (28,8,4);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (29,8,5);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (30,8,8);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (31,8,9);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (32,8,10);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (33,8,11);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (34,8,12);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (35,9,15);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (36,10,2);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (37,10,3);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (38,10,4);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (39,10,5);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (40,11,9);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (41,11,10);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (42,11,11);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (43,11,12);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (44,12,18);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (45,12,19);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (46,12,20);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (47,12,21);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (48,12,22);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (49,14,23);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (50,15,24);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (51,15,25);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (52,16,26);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (53,16,27);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (54,17,28);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (55,17,29);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (56,18,30);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (57,22,2);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (58,22,3);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (59,22,4);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (60,22,5);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (61,23,32);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (62,23,26);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (63,23,18);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (64,23,12);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (65,24,30);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (66,24,22);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (67,24,6);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (68,24,4);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (69,25,29);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (70,25,21);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (71,25,5);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (72,26,29);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (73,26,22);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (74,26,19);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (75,26,13);
INSERT INTO `damages_repairs` (id_damage_repair, id_damage, id_repair) VALUES (76,26,9);

--
-- Dumping data for table `dimentions`
--

INSERT INTO `dimentions` VALUES (6,19.00,6.00,2.00,'img1','img2',6,2);
INSERT INTO `dimentions` VALUES (10,32.00,20.00,12.00,'b836ab98-ca7a-4495-b6e8-2b531538e399.jpg','1bb4492e-5f26-4df0-877b-16c8f84b815e.png',6,5);

--
-- Dumping data for table `incidents`
--

INSERT INTO `incidents` VALUES (1,'AK420','2022-01-15','Terremoto en la región A, magnitud 6.5','2024-04-08 12:51:48');
INSERT INTO `incidents` VALUES (2,'AK421','2022-01-20','Alerta de tsunami a lo largo de las áreas costeras','2024-04-08 12:51:48');
INSERT INTO `incidents` VALUES (3,'AK422','2022-02-05','Inundaciones en la ciudad X debido a lluvias intensas','2024-04-08 12:51:48');
INSERT INTO `incidents` VALUES (4,'AK422','2022-02-12','Brote de incendios forestales en el bosque B','2024-04-08 12:51:48');

--
-- Dumping data for table `repairs`
--

INSERT INTO `repairs` VALUES (1,'Reparación de fisura en muro ','ML',20500.00,'desc_1','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (2,'Empaste y lijado de muro ','M2',4750.00,'desc_2','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (3,'Preparación de superficie de muro ','M2',2100.00,'desc_3','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (4,'Aplicación de textura martellina muro','M2',7600.00,'desc_4','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (5,'Aplicación de pintura de muro ','M2',7300.00,'desc_5','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (6,'Sellado y pintura de marco de puerta','ML',3500.00,'desc_6','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (7,'Sellado y pintura de marco de ventana','ML',3500.00,'desc_7','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (8,'Reparación de fisura en cielo','ML',20500.00,'desc_8','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (9,'Empaste y lijado de cielo','M2',4750.00,'desc_9','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (10,'Preparación de superficie de cielo ','M2',2100.00,'desc_10','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (11,'Aplicación de textura martellina cielo ','M2',7600.00,'desc_11','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (12,'Aplicación de pintura de cielo ','M2',7300.00,'desc_12','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (13,'Reparación de fisura en muro','ML',20500.00,'desc_13','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (14,'Aplicación de textura martellina muro ','M2',7600.00,'desc_14','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (15,'Sellado y pintura de cornisas','ML',3500.00,'desc_15','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (16,'Preparación de superficie de cielo','M2',2100.00,'desc_16','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (17,'Aplicación de pintura de cielo','M2',7300.00,'desc_17','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (18,'Retiro de ceramica de muro ','M2',7300.00,'desc_18','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (19,'Preparacion de superficie ','M2',3100.00,'desc_19','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (20,'Provision e instalacion de ceramica de muro ','M2',18500.00,'desc_20','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (21,'Fraguado de ceramica de muro ','M2',4100.00,'desc_21','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (22,'Retiro e instalacion de artefacto','UN',32000.00,'desc_22','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (23,'Revoque muro','ML',3500.00,'desc_23','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (24,'Retiro de placas fisuradas','UN',4900.00,'desc_24','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (25,'Instalación de placas nuevas','UN',11500.00,'desc_25','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (26,'Retiro de pilares fisurados','UN',9500.00,'desc_26','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (27,'Instalación de pilares nuevos','UN',16500.00,'desc_27','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (28,'Retiro de bardas fisuradas','UN',3500.00,'desc_28','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (29,'Instalación de bardas nuevas','UN',8100.00,'desc_29','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (30,'Aplicación de pintura de muro ','M2',8200.00,'desc_30','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (31,'Flete de materiales','UN',30000.00,'desc_31','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (32,'Protección de areas de trabajo','GL',35000.00,'desc_32','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (33,'Acomodo de mobiliario','GL',50000.00,'desc_33','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (34,'Retiro de escombros','M3',50000.00,'desc_34','2024-04-08 12:51:48');
INSERT INTO `repairs` VALUES (35,'Aseo y entrega ','GL',75000.00,'desc_35','2024-04-08 12:51:48');

--
-- Dumping data for table `sectors`
--

INSERT INTO `sectors` VALUES (1,'fachada frontal ','desc_repair_1','2024-04-08 12:51:48');
INSERT INTO `sectors` VALUES (2,'living comedor','desc_repair_2','2024-04-08 12:51:48');
INSERT INTO `sectors` VALUES (3,'dormitorio 1 (principal)','desc_repair_3','2024-04-08 12:51:48');
INSERT INTO `sectors` VALUES (4,'ba?o (1er nive)','desc_repair_4','2024-04-08 12:51:48');
INSERT INTO `sectors` VALUES (5,'ba?o (2do nivel)','desc_repair_5','2024-04-08 12:51:48');
INSERT INTO `sectors` VALUES (6,'cocina','desc_repair_6','2024-04-08 12:51:48');
INSERT INTO `sectors` VALUES (7,'caja escala / sala de estar','desc_repair_7','2024-04-08 12:51:48');
INSERT INTO `sectors` VALUES (8,'dormitorio 2','desc_repair_8','2024-04-08 12:51:48');
INSERT INTO `sectors` VALUES (9,'cierre perimetral','desc_repair_9','2024-04-08 12:51:48');
INSERT INTO `sectors` VALUES (10,'logia','desc_repair_10','2024-04-08 12:51:48');
INSERT INTO `sectors` VALUES (11,'bodega','desc_repair_11','2024-04-08 12:51:48');
INSERT INTO `sectors` VALUES (12,'sala de estar primer piso','desc_repair_12','2024-04-08 12:51:48');
INSERT INTO `sectors` VALUES (13,'sala de estar segundo piso','desc_repair_13','2024-04-08 12:51:48');
INSERT INTO `sectors` VALUES (14,'hall de acceso','desc_repair_14','2024-04-08 12:51:48');
INSERT INTO `sectors` VALUES (15,'pasillo','desc_repair_15','2024-04-08 12:51:48');

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` VALUES ('ycQZ83ess7iOYYzOTMsXfAZz7my4On4j',1715180897,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":1},\"flash\":{}}');

--
-- Dumping data for table `status`
--

INSERT INTO `status` VALUES (1,'No iniciado','2024-04-08 12:51:48');
INSERT INTO `status` VALUES (2,'En proceso','2024-04-08 12:51:48');
INSERT INTO `status` VALUES (3,'completado','2024-04-08 12:51:48');

--
-- Dumping routines for database 'cub'
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `addDamageRepair`(
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
DELIMITER ;;
CREATE PROCEDURE `budget`(
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
DELIMITER ;;
CREATE PROCEDURE `dataInsert`(
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
        SELECT 'Se est�� ingresando al procedure' AS Mensaje;
                IF id_c_d_s = 0  THEN
                
                        SELECT 'Se est�� ingresando un nuevo da?o' AS Mensaje;
   
                        INSERT INTO c_d_s(id_c_d_s,id_damage,id_case,id_sector)
                        VALUES (0,id_damage,id_case,id_sector);

                        SET @ultimo_id = LAST_INSERT_ID();

                        INSERT INTO d_c_d_s(id_d_c_d_s,id_c_d_s,size,customized)
                        VALUES (0,@ultimo_id,damage_size,customized);

                        SET @ultimo2_id = LAST_INSERT_ID();

                        INSERT INTO damage_images(id_damage_images,id_d_c_d_s, image1, image2, image3)
                        VALUES (0,@ultimo2_id, img1,img2,img3);
                ELSE
                        SELECT 'Se est�� actualizando un nuevo da?o' AS Mensaje;
                        UPDATE c_d_s SET c_d_s.id_damage = id_damage WHERE id_c_d_s  = id_c_d_s;

                        INSERT INTO d_c_d_s(id_d_c_d_s,id_c_d_s,size,customized)
                        VALUES (0,id_c_d_s,damage_size,customized);
                        SELECT CONCAT('se ha insertado datos en  d_c_d_s',0,id_c_d_s,damage_size) AS Mensaje;

                        SET @ultimo2_id = LAST_INSERT_ID();
                        INSERT INTO damage_images(id_damage_images,id_d_c_d_s, image1, image2, image3)
                        VALUES (0,@ultimo2_id, img1,img2,img3);

                END IF;
         END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `dataUpdate`(IN id_damage INT,
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
DELIMITER ;;
CREATE PROCEDURE `queryDamages`(
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
DELIMITER ;;
CREATE PROCEDURE `queryDamages2`(
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
DELIMITER ;;
CREATE PROCEDURE `showAllCases`(
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
DELIMITER ;;
CREATE PROCEDURE `showCase`(
        IN id_case INT,
        IN id_adviser INT)
BEGIN
        SELECT cl.client_address, cl.client_email, cl.client_name, cl.client_lastname, cl.client_rut,cl.id_client, cl.client_phone,
         a.adviser_name, a.adviser_lastname, a.adviser_rut,a.adviser_email,a.adviser_username,a.adviser_role,a.adviser_phone,
               i.incident_code, i.incident_date, i.incident_description,
               c.id_case, c.case_img1,c.case_img2,a.id_adviser,
               st.status_name, st.id_status               
               FROM cases as c
               INNER JOIN Clients as cl
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
DELIMITER ;;
CREATE PROCEDURE `showCases`(IN adviser INT)
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
DELIMITER ;;
CREATE PROCEDURE `showSectors`(
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
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-14  1:39:10
