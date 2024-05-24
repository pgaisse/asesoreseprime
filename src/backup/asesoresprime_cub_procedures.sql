-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
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
-- Dumping routines for database 'asesoresprime_cub'
--
/*!50003 DROP PROCEDURE IF EXISTS `addCase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
drop procedure if EXISTS addCase;
DELIMITER ;;
CREATE DEFINER=`asesoresprime_asesoresprimeCub`@`203.30.15.56` PROCEDURE `addCase`(
        IN id_client INT,
        IN incident_first VARCHAR(10)
        )
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    SELECT 'ERROR';
    ROLLBACK;
  END;
  START TRANSACTION;
    SET AUTOCOMMIT=0;
    SET @filtro = CONCAT(incident_first, '%');
    SET @status = (select id_incident  from incidents where incident_code like @filtro);
        INSERT INTO cases (id_case, id_incident, id_status, case_date)
        values (0, @status,1, (select fecha_siniestro from asesoresprime_web.6Scr5XN_clientes where cliente_id=id_client)) ;           
        SELECT CONCAT('Se est�� ingresando al procedure', @status ) AS Mensaje;
        SET @ultimo_id = LAST_INSERT_ID();
        insert into cases_clients (id_client,id_case)
        values (id_client,@ultimo_id);
        SELECT 'OK';
        COMMIT;

END ;;
DELIMITER ;

drop procedure if EXISTS delImgCase;
DELIMITER ;;
CREATE  PROCEDURE `delImgCase`(
        IN image1 varchar(200),
        IN image2 varchar(200),
        IN id_case_v INT
        )
BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
          SELECT 'ERROR';
          ROLLBACK;
        END;
        START TRANSACTION;
        SET AUTOCOMMIT=0;
        update cases set case_img1= image2, case_img2=image1 WHERE id_case=id_case_v;
        SELECT 'OK';
        COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addDamageRepair` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
drop procedure if EXISTS addDamageRepair;
DELIMITER ;;
CREATE DEFINER=`asesoresprime_asesoresprimeCub`@`203.30.15.56` PROCEDURE `addDamageRepair`(
        IN damage_name VARCHAR(100),
        IN damage_unit VARCHAR(10),
        IN damage_desc VARCHAR(200),
        IN cadena VARCHAR(200),
        IN adviser_name VARCHAR(100))
BEGIN   
        DECLARE longitud INT;
        DECLARE posicion INT DEFAULT 1;
        DECLARE valor VARCHAR(255);
DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    SELECT 'ERROR';
    ROLLBACK;
  END;
  START TRANSACTION;
        SET AUTOCOMMIT=0;


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
        COMMIT;


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
CREATE DEFINER=`asesoresprime_asesoresprimeCub`@`203.30.15.56` PROCEDURE `budget`(
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

        inner join asesoresprime_web.6Scr5XN_clientes
        on asesoresprime_web.6Scr5XN_clientes.cliente_id=c.id_client

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
drop procedure if EXISTS dataInsert;
DELIMITER ;;
CREATE DEFINER=`asesoresprime_asesoresprimeCub`@`203.30.15.56` PROCEDURE `dataInsert`(
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
DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    SELECT 'ERROR';
    ROLLBACK;
  END;
  START TRANSACTION;
        SET AUTOCOMMIT=0;
        SELECT 'Se está ingresando al procedure' AS Mensaje;
                IF id_c_d_s = 0   THEN
                
                        SELECT 'Se est�� ingresando un nuevo da?o' AS Mensaje;
   
                        INSERT INTO c_d_s(c_d_s.id_c_d_s,c_d_s.id_damage,c_d_s.id_case,c_d_s.id_sector)
                        VALUES (0,id_damage,id_case,id_sector);

                        SET @ultimo_id = LAST_INSERT_ID();

                        INSERT INTO d_c_d_s(d_c_d_s.id_d_c_d_s,d_c_d_s.id_c_d_s,d_c_d_s.size,d_c_d_s.customized)
                        VALUES (0,@ultimo_id,damage_size,customized);

                        SET @ultimo2_id = LAST_INSERT_ID();

                        INSERT INTO damage_images(damage_images.id_damage_images,damage_images.id_d_c_d_s, damage_images.image1, damage_images.image2, damage_images.image3)
                        VALUES (0,@ultimo2_id, img1,img2,img3);
                ELSE
                        SELECT 'Se est�� actualizando un nuevo da?o' AS Mensaje;
                        UPDATE c_d_s SET c_d_s.id_damage = id_damage WHERE c_d_s.id_c_d_s  = id_c_d_s and c_d_s.id_sector=id_sector;

                        INSERT INTO d_c_d_s(id_d_c_d_s,id_c_d_s,size,customized)
                        VALUES (0,id_c_d_s,damage_size,customized);
                        SELECT CONCAT('se ha insertado datos en  d_c_d_s',0,id_c_d_s,damage_size) AS Mensaje;

                        SET @ultimo2_id = LAST_INSERT_ID();
                        INSERT INTO damage_images(id_damage_images,id_d_c_d_s, image1, image2, image3)
                        VALUES (0,@ultimo2_id, img1,img2,img3);

                END IF;
                commit;
         END ;;
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
drop procedure if EXISTS `dataUpdate`;
DELIMITER ;;
CREATE DEFINER=`asesoresprime_asesoresprimeCub`@`203.30.15.56` PROCEDURE `dataUpdate`(IN id_damage INT,
        IN id_c_d_s INT,
        IN damage_size INT,
        IN img1 VARCHAR(200),
        IN img2 VARCHAR(200),
        IN img3 VARCHAR(200))
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    SELECT 'ERROR';
    ROLLBACK;
  END;
  START TRANSACTION;
        SET AUTOCOMMIT=0;
        UPDATE d_c_d_s SET d_c_d_s.id_damage = id_damage WHERE id_c_d_s  = id_c_d_s;

        INSERT INTO d_c_d_s(id_d_c_d_s,id_c_d_s,size)
        VALUES (0,id_c_d_s,damage_size);
        SET @ultimo2_id = LAST_INSERT_ID();
        INSERT INTO damage_images(id_damage_images,id_d_c_d_s, image1, image2, image3)
        VALUES (0,@ultimo2_id, img1,img2,img3);
        COMMIT;
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
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`asesoresprime_asesoresprimeCub`@`203.30.15.56` PROCEDURE `queryDamages`(
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

        inner join cases_clients
        on cases_clients.id_case=c.id_case

        inner join asesoresprime_web.6Scr5XN_clientes
        on asesoresprime_web.6Scr5XN_clientes.cliente_id=cases_clients.id_client

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
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`asesoresprime_asesoresprimeCub`@`203.30.15.56` PROCEDURE `queryDamages2`(
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

        inner join cases_clients
        on cases_clients.id_case=c.id_case

        inner join asesoresprime_web.6Scr5XN_clientes
        on asesoresprime_web.6Scr5XN_clientes.cliente_id=cases_clients.id_client

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
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`asesoresprime_asesoresprimeCub`@`203.30.15.56` PROCEDURE `showAllCases`(
    IN ntable VARCHAR(40),
    IN nfield VARCHAR(40),
    IN op VARCHAR(40),
    IN nvalue VARCHAR(40)
)
BEGIN
    
    SET @query = CONCAT('SELECT 
    cases.id_case, status.status_name, cases.case_date, advisers.id_adviser, advisers.adviser_name, 
    advisers.adviser_lastname, incidents.incident_code, asesoresprime_web.6Scr5XN_clientes.nombre client_name,
    asesoresprime_web.6Scr5XN_clientes.apellidos client_lastname, 
    asesoresprime_web.6Scr5XN_clientes.rut client_rut,
    asesoresprime_web.6Scr5XN_clientes.direccion  client_address FROM cases 
    Inner JOIN cases_clients 
    on cases_clients.id_case=cases.id_case
    INNER JOIN asesoresprime_web.6Scr5XN_clientes 
    ON asesoresprime_web.6Scr5XN_clientes.cliente_id = cases_clients.id_client 
    LEFT JOIN advisers 
    ON advisers.id_adviser = cases.id_adviser 
    INNER JOIN status 
    ON status.id_status = cases.id_status 
    INNER JOIN incidents 
    ON incidents.id_incident = cases.id_incident WHERE ', ntable, '.', nfield, ' ', op, ' "', nvalue, '";');
    
    
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
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`asesoresprime_asesoresprimeCub`@`203.30.15.56` PROCEDURE `showCase`(
        IN id_case INT,
        IN id_adviser INT)
BEGIN
        SELECT cl.direccion client_address, cl.email client_email, cl.nombre client_name, cl.apellidos client_lastname, cl.rut client_rut,cl.cliente_id id_client, cl.telefono client_phone, 
         a.adviser_name, a.adviser_lastname, a.adviser_rut,a.adviser_email,a.adviser_username,a.adviser_role,a.adviser_phone,
               i.incident_code, i.incident_date, i.incident_description,i.incident_type,(select p2.provincia from asesoresprime_web.6Scr5XN_clientes c2 inner join asesoresprime_web.6Scr5XN_provincias p2 ON p2.id=c2.ciudad where c2.cliente_id=cl.cliente_id) client_city, i.incident_scale,
               c.id_case, c.case_img1,c.case_img2,a.id_adviser,
               st.status_name, st.id_status               
               FROM cases as c
               INNER JOIN cases_clients
               ON cases_clients.id_case=c.id_case
               INNER JOIN asesoresprime_web.6Scr5XN_clientes as cl
               ON cl.cliente_id=cases_clients.id_client
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
CREATE DEFINER=`asesoresprime_asesoresprimeCub`@`203.30.15.56` PROCEDURE `showCases`(IN adviser INT)
BEGIN
        SELECT 
        (select count(cs2.id_sector) from c_d_s cs2 inner join cases c2 
        ON c2.id_case=cs2.id_case where c2.id_adviser=1 and cs2.id_case=cs.id_case) as nsectors, 
        cs.id_case, 
        cases.case_date,
        cases.img1,
        cases.img2,
        asesoresprime_web.6Scr5XN_clientes.nombre client_name, 
        asesoresprime_web.6Scr5XN_clientes.apellidos client_lastname,
        asesoresprime_web.6Scr5XN_clientes.direccion client_address, 
        asesoresprime_web.6Scr5XN_clientes.rut client_rut,
        status.status_name
        from c_d_s  as cs
        inner join cases
        on cases.id_case=cs.id_case
        inner join advisers
        on advisers.id_adviser=cases.id_adviser
        inner join status
        on status.id_status=cases.id_status
        inner join asesoresprime_web.6Scr5XN_clientes
        on asesoresprime_web.6Scr5XN_clientes.cliente_id=cases.id_client
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
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`asesoresprime_asesoresprimeCub`@`203.30.15.56` PROCEDURE `showSectors`(
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
        asesoresprime_web.6Scr5XN_clientes.nombre as client_name, 
        asesoresprime_web.6Scr5XN_clientes.apellidos as client_lastname, 
        asesoresprime_web.6Scr5XN_clientes.direccion as client_address, 
        asesoresprime_web.6Scr5XN_clientes.rut as client_rut

        from cases c
        inner join advisers a
        on a.id_adviser=c.id_adviser
        INNER JOIN cases_clients
        ON cases_clients.id_case=c.id_case

        left join asesoresprime_web.6Scr5XN_clientes
        on asesoresprime_web.6Scr5XN_clientes.cliente_id=cases_clients.id_client

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
drop procedure if EXISTS `addsector`;
DELIMITER ;;
CREATE DEFINER=`asesoresprime_asesoresprimeCub`@`203.30.15.56` PROCEDURE `addsector`(IN id_sector_ INT,
        IN id_case_ INT,
        IN sector_w_size_ DECIMAL,
        IN sector_l_size_ DECIMAL,
        IN sector_h_size_ DECIMAL,
        IN img_ VARCHAR(200),
        IN img1_ VARCHAR(200))
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    SELECT 'ERROR';
    ROLLBACK;
  END;
  START TRANSACTION;
        SET AUTOCOMMIT=0;
        insert into c_d_s (id_sector, id_case) values (id_sector_ ,id_case_);
        insert into dimentions (id_case, id_sector, sector_w_size, sector_l_size, sector_h_size, img1, img2)
        values (id_case_, id_sector_, sector_w_size_,sector_l_size_,sector_h_size_,img_, img1_);
        SELECT 'OK';
        COMMIT;
        END ;;
DELIMITER ;

drop procedure if EXISTS `delsector`;
DELIMITER ;;
CREATE DEFINER=`asesoresprime_asesoresprimeCub`@`203.30.15.56` PROCEDURE `delsector`(
        IN id_sector_ INT,
        IN id_case_ INT,
        IN id_adviser_ INT)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    SHOW ERRORS; 
    SELECT 'ERROR';
    ROLLBACK;
  END;
  START TRANSACTION;
        SET AUTOCOMMIT=0;

        delete di from c_d_s cd
        inner join d_c_d_s dc
        on dc.id_c_d_s=cd.id_c_d_s
        inner join damage_images di
        on di.id_d_c_d_s=dc.id_d_c_d_s
        inner join cases 
        on cases.id_case= cd.id_case
        inner join advisers ON advisers.id_adviser=cases.id_adviser
        where cd.id_sector=id_sector_  and cd.id_case=id_case_ and (cases.id_adviser=id_adviser_ OR advisers.adviser_role='admin');

        delete dimentions from dimentions 
        inner join cases on cases.id_case=dimentions.id_case 
        inner join advisers ON advisers.id_adviser=cases.id_adviser
        where dimentions.id_sector = id_sector_ and cases.id_case=id_case_ and (cases.id_adviser= id_adviser_ OR advisers.adviser_role='admin' );
      
       
        delete c_d_s from c_d_s inner join cases ON cases.id_case=c_d_s.id_case
        inner join advisers ON advisers.id_adviser=cases.id_adviser
        where c_d_s.id_sector= id_sector_ and cases.id_case=id_case_ and (cases.id_adviser=id_adviser_ OR advisers.adviser_role='admin' );

        

       SELECT 'OK';
        COMMIT;
        END ;;
DELIMITER ;


drop procedure if EXISTS `delDamage`;
DELIMITER ;;
CREATE DEFINER=`asesoresprime_asesoresprimeCub`@`203.30.15.56` PROCEDURE `delDamage`(
        IN id_adviser_ INT,
        IN id_c_d_s_ INT)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    SHOW ERRORS; 
    SELECT 'ERROR';
    ROLLBACK;
  END;
  START TRANSACTION;
        SET AUTOCOMMIT=0;

        delete di from c_d_s cd
        inner join d_c_d_s dc
        on dc.id_c_d_s=cd.id_c_d_s
        inner join damage_images di
        on di.id_d_c_d_s=dc.id_d_c_d_s
        inner join cases 
        on cases.id_case= cd.id_case
        inner join advisers ON advisers.id_adviser=cases.id_adviser
        where  cd.id_c_d_s=id_c_d_s_ and (cases.id_adviser=id_adviser_ OR advisers.adviser_role='admin');


        delete c_d_s from c_d_s 
        inner join cases 
        ON cases.id_case=c_d_s.id_case
        inner join advisers 
        ON advisers.id_adviser=cases.id_adviser
        where  c_d_s.id_c_d_s=id_c_d_s_ and (cases.id_adviser=id_adviser_ OR advisers.adviser_role='admin' );
        

       SELECT 'OK';
        COMMIT;
        END ;;
DELIMITER ;

drop procedure if EXISTS `updateDamage`;
DELIMITER ;;
CREATE DEFINER=`asesoresprime_asesoresprimeCub`@`203.30.15.56` PROCEDURE `updateDamage`(
        IN id_adviser_ INT,
        IN id_c_d_s_ INT)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    SHOW ERRORS; 
    SELECT 'ERROR';
    ROLLBACK;
  END;
  START TRANSACTION;
        SET AUTOCOMMIT=0;

        delete di from c_d_s cd
        inner join d_c_d_s dc
        on dc.id_c_d_s=cd.id_c_d_s
        inner join damage_images di
        on di.id_d_c_d_s=dc.id_d_c_d_s
        inner join cases 
        on cases.id_case= cd.id_case
        inner join advisers 
        ON advisers.id_adviser=cases.id_adviser
        where  cd.id_c_d_s=id_c_d_s_ and (cases.id_adviser=id_adviser_ OR advisers.adviser_role='admin');


        update c_d_s 
        inner join cases 
        on cases.id_case= c_d_s.id_case
        inner join advisers 
        ON advisers.id_adviser=cases.id_adviser        
        
        SET c_d_s.id_damage=null 

        where  c_d_s.id_c_d_s=id_c_d_s_ and (cases.id_adviser=id_adviser_ OR advisers.adviser_role='admin' );

        

       SELECT 'OK';
        COMMIT;
        END ;;
DELIMITER ;


        