-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 16, 2024 at 10:14 PM
-- Server version: 5.7.28-cll-lve
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asesoresprime_cub`
--

DELIMITER $$
--
-- Procedures
--
$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `advisers`
--

CREATE TABLE `advisers` (
  `id_adviser` int(11) NOT NULL,
  `adviser_username` varchar(16) NOT NULL,
  `adviser_password` varchar(60) NOT NULL,
  `adviser_role` varchar(100) NOT NULL,
  `adviser_name` varchar(100) NOT NULL,
  `adviser_lastname` varchar(100) NOT NULL,
  `adviser_rut` varchar(100) NOT NULL,
  `adviser_email` varchar(100) NOT NULL,
  `adviser_phone` varchar(30) NOT NULL,
  `registeredAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `adviser_birthday` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `advisers`
--

INSERT INTO `advisers` (`id_adviser`, `adviser_username`, `adviser_password`, `adviser_role`, `adviser_name`, `adviser_lastname`, `adviser_rut`, `adviser_email`, `adviser_phone`, `registeredAt`, `adviser_birthday`) VALUES
(1, 'adv1', '$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG', 'admin', 'hector', 'monsalves', '123456789', 'galli.no@example.com', '7792014', '2024-05-08 00:46:21', '1980-05-15'),
(2, 'adv2', '$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG', 'worker', 'juan', 'perez', '987654321', 'juan.perez@example.com', '7722014', '2024-05-08 00:46:21', '1985-08-20'),
(3, 'adv3', '$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG', 'admin', 'pedro', 'gonzalez', '123456789', 'pgenzalez@example.com', '7792014', '2024-05-08 00:46:21', '1980-05-15'),
(4, 'adv4', '$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG', 'worker', 'cristian', 'moscoso', '987654321', 'cm@example.com', '7722014', '2024-05-08 00:46:21', '1985-08-20');

-- --------------------------------------------------------

--
-- Table structure for table `asesoresprime_web.6Scr5XN_clientes`
--

CREATE TABLE `asesoresprime_web.6Scr5XN_clientes` (
  `id_client` int(11) NOT NULL,
  `client_name` varchar(100) NOT NULL,
  `client_lastname` varchar(100) NOT NULL,
  `client_rut` varchar(100) NOT NULL,
  `client_birthday` date NOT NULL,
  `client_address` varchar(100) NOT NULL,
  `client_phone` varchar(100) NOT NULL,
  `client_email` varchar(100) NOT NULL,
  `registeredAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `asesoresprime_web.6Scr5XN_clientes`
--

INSERT INTO `asesoresprime_web.6Scr5XN_clientes` (`id_client`, `client_name`, `client_lastname`, `client_rut`, `client_birthday`, `client_address`, `client_phone`, `client_email`, `registeredAt`) VALUES
(1, 'Ana', 'Ramos S', '15.152.156-5', '1982-02-20', 'OUTER HEBRIDES', '(306) 906-7975', 'parkes@hotmail.com', '2024-05-08 00:46:21'),
(2, 'Alfredo', 'Perez Reina', '15.192.156-2', '1991-02-19', '82 Windsor Road', '(452) 597-0784', 'sjava@yahoo.ca', '2024-05-08 00:46:21'),
(3, 'Moncho', 'Pereira Reinaldo', '15.142.156-2', '1992-02-19', '14-16 Oconnor ', '(452) 037-0784', 'sjeewqava@yahoo.ca', '2024-05-08 00:46:21'),
(4, 'Sergio', 'Garrido Arrizabalaga', '15.192.156-3', '1981-02-20', 'PH82 4OY', '(363) 441-6561', 'jipsen@outlook.com', '2024-05-08 00:46:21');

-- --------------------------------------------------------

--
-- Table structure for table `budgets`
--

CREATE TABLE `budgets` (
  `cases_id_case` int(11) NOT NULL,
  `budget` varchar(300) DEFAULT NULL,
  `id_case` int(11) NOT NULL,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `id_case` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `id_incident` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `case_date` date NOT NULL,
  `case_img1` varchar(200) DEFAULT NULL,
  `case_img2` varchar(200) DEFAULT NULL,
  `num_case` int(11) DEFAULT NULL,
  `id_adviser` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cases`
--

INSERT INTO `cases` (`id_case`, `id_status`, `id_incident`, `createdAt`, `case_date`, `case_img1`, `case_img2`, `num_case`, `id_adviser`) VALUES
(5, 1, 1, '2024-05-08 00:46:49', '2015-05-22', NULL, NULL, NULL, NULL),
(6, 1, 2, '2024-05-08 00:46:49', '2015-05-23', NULL, NULL, NULL, NULL),
(7, 2, 2, '2024-05-08 00:46:49', '2015-05-24', NULL, NULL, NULL, NULL),
(8, 2, 3, '2024-05-08 00:46:49', '2015-05-25', NULL, NULL, NULL, NULL),
(19, 1, 1, '2024-05-15 04:58:47', '2024-04-10', NULL, NULL, NULL, 2),
(20, 1, 3, '2024-05-15 05:09:56', '0000-00-00', '8e8caf81-e4b5-46e0-b8eb-3dea29e8b9bd.png', '02b4809d-37d9-43ef-b4af-ba16f4e1c3a8.png', NULL, 1),
(21, 1, 3, '2024-05-15 05:10:19', '2024-01-20', 'c0ef9898-7bce-46c3-9f3b-bd76cfe1b46e.png', 'c9acf119-d4f5-43fc-8b63-250e7dfbb85b.png', NULL, 1),
(22, 1, 3, '2024-05-15 05:15:16', '0000-00-00', NULL, NULL, NULL, NULL),
(23, 1, 3, '2024-05-15 14:10:15', '0000-00-00', NULL, NULL, NULL, NULL),
(24, 1, 3, '2024-05-15 14:12:16', '2024-12-10', NULL, NULL, NULL, NULL),
(25, 1, 3, '2024-05-15 15:45:00', '2024-12-10', NULL, NULL, NULL, NULL),
(26, 1, 3, '2024-05-16 14:30:36', '0000-00-00', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cases_clients`
--

CREATE TABLE `cases_clients` (
  `id_case_clients` int(11) NOT NULL,
  `id_case` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cases_clients`
--

INSERT INTO `cases_clients` (`id_case_clients`, `id_case`, `id_client`, `createdAt`) VALUES
(57, 18, 49, '2024-05-15 04:43:58'),
(58, 19, 49, '2024-05-15 04:58:47'),
(59, 20, 7, '2024-05-15 05:09:56'),
(60, 21, 4, '2024-05-15 05:10:19'),
(61, 22, 12, '2024-05-15 05:15:16'),
(62, 23, 6, '2024-05-15 14:10:15'),
(63, 24, 3, '2024-05-15 14:12:16'),
(64, 25, 3, '2024-05-15 15:45:00'),
(65, 26, 5, '2024-05-16 14:30:36');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
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
  `comuna` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id_client`, `client_name`, `client_lastname`, `client_rut`, `client_birthday`, `client_address`, `client_phone`, `client_email`, `registeredAt`, `region`, `direccion`, `ciudad`, `comuna`) VALUES
(1, 'Ana', 'Ramos S', '15.152.156-5', '1982-02-20', 'OUTER HEBRIDES', '(306) 906-7975', 'parkes@hotmail.com', '2024-05-08 00:46:21', 'maule', 'OUTER HEBRIDES', 'talca', 'curico'),
(2, 'Alfredo', 'Perez Reina', '15.192.156-2', '1991-02-19', '82 Windsor Road', '(452) 597-0784', 'sjava@yahoo.ca', '2024-05-08 00:46:21', 'maule', '82 Windsor Road', 'talca', 'curico'),
(3, 'Moncho', 'Pereira Reinaldo', '15.142.156-2', '1992-02-19', '14-16 Oconnor ', '(452) 037-0784', 'sjeewqava@yahoo.ca', '2024-05-08 00:46:21', 'maule', '14-16 Oconnor ', 'talca', 'talca'),
(4, 'Sergio', 'Garrido Arrizabalaga', '15.192.156-3', '1981-02-20', 'PH82 4OY', '(363) 441-6561', 'jipsen@outlook.com', '2024-05-08 00:46:21', 'maule', 'PH82 4OY', 'talca', 'talca');

-- --------------------------------------------------------

--
-- Table structure for table `c_d_s`
--

CREATE TABLE `c_d_s` (
  `id_c_d_s` int(11) NOT NULL,
  `id_damage` int(11) DEFAULT NULL,
  `id_sector` int(11) NOT NULL,
  `id_case` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c_d_s`
--

INSERT INTO `c_d_s` (`id_c_d_s`, `id_damage`, `id_sector`, `id_case`) VALUES
(1, 6, 15, 1),
(2, 4, 15, 1),
(3, 18, 15, 1),
(4, NULL, 15, 2),
(5, NULL, 15, 20),
(6, 18, 15, 20),
(7, 9, 5, 21),
(8, 18, 5, 21),
(9, 10, 2, 20),
(10, 5, 15, 20);

-- --------------------------------------------------------

--
-- Table structure for table `damages`
--

CREATE TABLE `damages` (
  `id_damage` int(11) NOT NULL,
  `damage_name` varchar(150) NOT NULL,
  `damage_description` text,
  `damage_unit` varchar(40) NOT NULL,
  `createdby` varchar(40) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_incident` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `damages`
--

INSERT INTO `damages` (`id_damage`, `damage_name`, `damage_description`, `damage_unit`, `createdby`, `createdAt`, `id_incident`) VALUES
(1, 'fisura en muro', 'desc 1', 'mm', NULL, '2024-05-08 00:46:21', 1),
(2, 'fisura en sello de marco de puerta', 'desc 2', 'mm', NULL, '2024-05-08 00:46:21', 1),
(3, 'fisura en sello de marco de ventana', 'desc 3', 'mm', NULL, '2024-05-08 00:46:21', 1),
(4, 'fisura en cielo', 'desc 4', 'mm', NULL, '2024-05-08 00:46:21', 1),
(5, 'fisura dintel', 'desc 5', 'mm', NULL, '2024-05-08 00:46:21', 1),
(6, 'fisura antepecho', 'desc 6', 'mm', NULL, '2024-05-08 00:46:21', 1),
(7, 'fisura encuentro de muros', 'desc 7', 'mm', NULL, '2024-05-08 00:46:21', 1),
(8, 'fisura encuentro tabique y cielo', 'desc 8', 'mm', NULL, '2024-05-08 00:46:21', 1),
(9, 'fisura sello cornisa', 'desc 10', 'mm', NULL, '2024-05-08 00:46:21', 1),
(10, 'fijaciones a la vista en tabiques', 'desc 11', 'cm', NULL, '2024-05-08 00:46:21', 1),
(11, 'fijaciones a la vista en cielo', 'desc 12', 'cm', NULL, '2024-05-08 00:46:21', 1),
(12, 'cer', 'desc 13', 'cm', NULL, '2024-05-08 00:46:21', 1),
(13, 'cer', 'desc 14', 'cm', NULL, '2024-05-08 00:46:21', 2),
(14, 'fisura de emboquillado', 'desc 15', 'mm', NULL, '2024-05-08 00:46:21', 1),
(15, 'placas fisuradas', 'desc 16', 'uni', NULL, '2024-05-08 00:46:21', 1),
(16, 'pilares fisurados', 'desc 17', 'uni', NULL, '2024-05-08 00:46:21', 1),
(17, 'bardas fisurados', 'desc 18', 'mm', NULL, '2024-05-08 00:46:21', 1),
(18, 'pintura muro', 'desc 19', 'm', NULL, '2024-05-08 00:46:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `damages_repairs`
--

CREATE TABLE `damages_repairs` (
  `id_damage_repair` int(11) NOT NULL,
  `id_damage` int(11) NOT NULL,
  `id_repair` int(11) NOT NULL,
  `createdby` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `damages_repairs`
--

INSERT INTO `damages_repairs` (`id_damage_repair`, `id_damage`, `id_repair`, `createdby`) VALUES
(1, 1, 1, NULL),
(2, 1, 2, NULL),
(3, 2, 6, NULL),
(4, 3, 6, NULL),
(5, 4, 8, NULL),
(6, 4, 9, NULL),
(7, 4, 10, NULL),
(8, 4, 11, NULL),
(9, 4, 12, NULL),
(10, 5, 1, NULL),
(11, 5, 2, NULL),
(12, 5, 3, NULL),
(13, 5, 4, NULL),
(14, 5, 5, NULL),
(15, 6, 1, NULL),
(16, 6, 2, NULL),
(17, 6, 3, NULL),
(18, 6, 4, NULL),
(19, 6, 5, NULL),
(20, 7, 1, NULL),
(21, 7, 2, NULL),
(22, 7, 3, NULL),
(23, 7, 4, NULL),
(24, 7, 5, NULL),
(25, 8, 1, NULL),
(26, 8, 2, NULL),
(27, 8, 3, NULL),
(28, 8, 4, NULL),
(29, 8, 5, NULL),
(30, 8, 8, NULL),
(31, 8, 9, NULL),
(32, 8, 10, NULL),
(33, 8, 11, NULL),
(34, 8, 12, NULL),
(35, 9, 15, NULL),
(36, 10, 2, NULL),
(37, 10, 3, NULL),
(38, 10, 4, NULL),
(39, 10, 5, NULL),
(40, 11, 9, NULL),
(41, 11, 10, NULL),
(42, 11, 11, NULL),
(43, 11, 12, NULL),
(44, 12, 18, NULL),
(45, 12, 19, NULL),
(46, 12, 20, NULL),
(47, 12, 21, NULL),
(48, 12, 22, NULL),
(49, 14, 23, NULL),
(50, 15, 24, NULL),
(51, 15, 25, NULL),
(52, 16, 26, NULL),
(53, 16, 27, NULL),
(54, 17, 28, NULL),
(55, 17, 29, NULL),
(56, 18, 30, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `damage_images`
--

CREATE TABLE `damage_images` (
  `id_damage_images` int(11) NOT NULL,
  `image1` varchar(200) NOT NULL,
  `image2` varchar(200) DEFAULT NULL,
  `image3` varchar(200) DEFAULT NULL,
  `id_d_c_d_s` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `damage_images`
--

INSERT INTO `damage_images` (`id_damage_images`, `image1`, `image2`, `image3`, `id_d_c_d_s`) VALUES
(1, 'acd067db-dd1d-4989-8a1d-384756b530ac.png', '5d54246a-4929-41c0-b545-7700634d9507.png', 'e713b6bb-9d3b-4315-8725-a9ff9f4655c9.png', 1),
(2, '3de4fa59-62d3-4898-9aaa-ea962a6277b0.png', 'ebc137c4-fb27-4b6e-b658-1900c3ac2871.png', 'a5fd70f1-4416-4ef8-988e-36fab583a437.png', 2),
(3, 'f95ed6ca-e94f-4d14-9cf7-84fe252f52f5.png', '7f4bc1fa-c53c-44d9-a4b6-42299a23f9b9.png', '751bef88-becc-4e4a-b563-b817a93c95fc.png', 3),
(4, '389bbfb2-11d4-4287-b512-95ded52f4c83.png', '4bed3538-990d-47fb-aad5-f4a5b9df249c.png', '668984ce-b205-46fd-8623-f31270acfce5.png', 4),
(5, 'c3c29a8a-9a23-4a99-834f-ed9b06c9ccdd.png', 'a388487c-3c7d-4d2a-aa68-93448878c839.png', '088dec46-d11d-46eb-892d-a1248ae21895.png', 5),
(6, 'd8437796-3253-49fd-a799-5186d52d9857.png', '1e63d72c-b9e1-4496-86e5-558facd9ead3.png', 'a1c15df5-9b7e-44a7-95c6-a7b395a69f79.png', 6),
(7, 'd1dbfb1a-aabd-42bf-b38b-1b72114fc333.png', '568e910e-e9fe-4349-9eb0-b4d6318ad9e7.png', '1e176bc6-4a86-4400-bf4f-a27989a2b821.png', 7),
(8, '211a6ca0-19bd-45f8-8b7b-cdb85ff35180.png', '1810fcee-0e20-4bab-8803-838e283dcc76.png', 'f1decdcb-5dad-4bca-9611-9228505fda31.png', 8),
(9, '76c34da4-0ecc-4c14-9b95-fe44ece1789c.png', '19e27e43-d0ef-4c47-a526-058e66d2d8c5.png', 'c2440cad-ce98-4acd-b006-3911a3f14b7d.png', 9),
(10, '5d8a33da-68b6-4588-bdbf-5d35440f3c8f.png', '85dc3656-ff9a-4aee-8482-e0b39f22d7d4.png', '8947a8de-5450-48ca-864a-881f04c1f6a8.png', 10),
(11, '3ac8e82d-7a20-426b-b606-a9706025bed9.png', '868d97fe-6979-44a0-a95f-ffb48f359e43.png', '3d36c880-2f71-4cfc-afd5-b7dc23a5cab1.png', 11),
(12, '2fcfd812-dc7b-46e6-97d5-ba55f6a81060.png', 'fa282b32-d4b4-40cd-8411-c37a6ed874de.png', '0daa331d-f56c-4788-b485-6f89d242cc43.png', 12);

-- --------------------------------------------------------

--
-- Table structure for table `dimentions`
--

CREATE TABLE `dimentions` (
  `id_dimention` int(11) NOT NULL,
  `sector_w_size` decimal(19,2) NOT NULL,
  `sector_l_size` decimal(19,2) NOT NULL,
  `sector_h_size` decimal(19,2) NOT NULL,
  `img1` varchar(200) NOT NULL,
  `img2` varchar(200) NOT NULL,
  `id_sector` int(11) NOT NULL,
  `id_case` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dimentions`
--

INSERT INTO `dimentions` (`id_dimention`, `sector_w_size`, `sector_l_size`, `sector_h_size`, `img1`, `img2`, `id_sector`, `id_case`) VALUES
(1, 10.00, 20.00, 1.00, '1979e937-15f4-4051-8e47-61aee7a3a786.png', '295d42a1-b57f-446e-b400-21ec9c455581.png', 15, 1),
(2, 87678.00, 8776.00, 87987.00, '8c904ffd-72ce-4240-a32d-ee375e39e759.png', '0678d1b8-44a5-486f-8c15-22d2a3439963.png', 15, 2),
(3, 23.00, 334.00, 12.00, 'ff0b91dd-bbd7-498c-883c-289eb5784f2a.png', 'a8e27388-e1a0-4d41-b55a-ca5206ad692b.png', 15, 20),
(4, 22.00, 34.00, 12.00, '3347049d-956b-425f-80a1-c29a33788028.png', 'b0fce8b9-be1e-4bf6-a471-f8bab33043ab.png', 5, 21),
(5, 12.00, 29.00, 22.00, '6293d68f-a6ab-43cc-8442-cda11aa48ccc.png', 'cb66ce25-78d8-42e6-9bd8-683ec122a424.png', 2, 20);

-- --------------------------------------------------------

--
-- Table structure for table `d_c_d_s`
--

CREATE TABLE `d_c_d_s` (
  `id_d_c_d_s` int(11) NOT NULL,
  `id_c_d_s` int(11) NOT NULL,
  `size` decimal(10,0) NOT NULL,
  `customized` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `d_c_d_s`
--

INSERT INTO `d_c_d_s` (`id_d_c_d_s`, `id_c_d_s`, `size`, `customized`) VALUES
(1, 1, 10, 0),
(2, 2, 1, 0),
(3, 3, 20, 0),
(4, 5, 23, 0),
(5, 5, 11, 0),
(6, 5, 11, 0),
(7, 5, 11, 0),
(8, 6, 34, 0),
(9, 7, 34, 0),
(10, 8, 78, 0),
(11, 9, 32, 0),
(12, 10, 34, 0);

-- --------------------------------------------------------

--
-- Table structure for table `incidents`
--

CREATE TABLE `incidents` (
  `id_incident` int(11) NOT NULL,
  `incident_code` varchar(120) NOT NULL,
  `incident_date` date NOT NULL,
  `incident_description` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `incident_type` varchar(120) NOT NULL,
  `incident_scale` varchar(120) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incidents`
--

INSERT INTO `incidents` (`id_incident`, `incident_code`, `incident_date`, `incident_description`, `createdAt`, `incident_type`, `incident_scale`) VALUES
(1, 'Sismo', '2022-01-15', 'Terremoto en la regi', '2024-05-08 04:46:21', 'Sismo', 'R'),
(2, 'Incendio', '2022-01-20', 'Alerta de tsunami a lo largo de las ', '2024-05-08 04:46:21', 'Incendio', 'R'),
(3, 'Rotura de ca?erias', '2022-02-05', 'Inundaciones en la ciudad X debido a lluvias intensas', '2024-05-08 04:46:21', 'Rotura de ca?erias', 'M'),
(4, 'Fen??menos de la naturaleza', '2022-02-12', 'Brote de incendios forestales en el bosque B', '2024-05-08 04:46:21', 'Fen??menos de la naturaleza', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `repairs`
--

CREATE TABLE `repairs` (
  `id_repair` int(11) NOT NULL,
  `repair_name` varchar(150) NOT NULL,
  `repair_unit` varchar(150) NOT NULL,
  `repair_price` decimal(19,2) NOT NULL,
  `repair_description` text,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `repairs`
--

INSERT INTO `repairs` (`id_repair`, `repair_name`, `repair_unit`, `repair_price`, `repair_description`, `createdAt`) VALUES
(1, 'Reparaci', 'ML', 20500.00, 'desc_1', '2024-05-08 00:46:21'),
(2, 'Empaste y lijado de muro ', 'M2', 4750.00, 'desc_2', '2024-05-08 00:46:21'),
(3, 'Preparaci', 'M2', 2100.00, 'desc_3', '2024-05-08 00:46:21'),
(4, 'Aplicaci', 'M2', 7600.00, 'desc_4', '2024-05-08 00:46:21'),
(5, 'Aplicaci', 'M2', 7300.00, 'desc_5', '2024-05-08 00:46:21'),
(6, 'Sellado y pintura de marco de puerta', 'ML', 3500.00, 'desc_6', '2024-05-08 00:46:21'),
(7, 'Sellado y pintura de marco de ventana', 'ML', 3500.00, 'desc_7', '2024-05-08 00:46:21'),
(8, 'Reparaci', 'ML', 20500.00, 'desc_8', '2024-05-08 00:46:21'),
(9, 'Empaste y lijado de cielo', 'M2', 4750.00, 'desc_9', '2024-05-08 00:46:21'),
(10, 'Preparaci', 'M2', 2100.00, 'desc_10', '2024-05-08 00:46:21'),
(11, 'Aplicaci', 'M2', 7600.00, 'desc_11', '2024-05-08 00:46:21'),
(12, 'Aplicaci', 'M2', 7300.00, 'desc_12', '2024-05-08 00:46:21'),
(13, 'Reparaci', 'ML', 20500.00, 'desc_13', '2024-05-08 00:46:21'),
(14, 'Aplicaci', 'M2', 7600.00, 'desc_14', '2024-05-08 00:46:21'),
(15, 'Sellado y pintura de cornisas', 'ML', 3500.00, 'desc_15', '2024-05-08 00:46:21'),
(16, 'Preparaci', 'M2', 2100.00, 'desc_16', '2024-05-08 00:46:21'),
(17, 'Aplicaci', 'M2', 7300.00, 'desc_17', '2024-05-08 00:46:21'),
(18, 'Retiro de ceramica de muro ', 'M2', 7300.00, 'desc_18', '2024-05-08 00:46:21'),
(19, 'Preparacion de superficie ', 'M2', 3100.00, 'desc_19', '2024-05-08 00:46:21'),
(20, 'Provision e instalacion de ceramica de muro ', 'M2', 18500.00, 'desc_20', '2024-05-08 00:46:21'),
(21, 'Fraguado de ceramica de muro ', 'M2', 4100.00, 'desc_21', '2024-05-08 00:46:21'),
(22, 'Retiro e instalacion de artefacto', 'UN', 32000.00, 'desc_22', '2024-05-08 00:46:21'),
(23, 'Revoque muro', 'ML', 3500.00, 'desc_23', '2024-05-08 00:46:21'),
(24, 'Retiro de placas fisuradas', 'UN', 4900.00, 'desc_24', '2024-05-08 00:46:21'),
(25, 'Instalaci', 'UN', 11500.00, 'desc_25', '2024-05-08 00:46:21'),
(26, 'Retiro de pilares fisurados', 'UN', 9500.00, 'desc_26', '2024-05-08 00:46:21'),
(27, 'Instalaci', 'UN', 16500.00, 'desc_27', '2024-05-08 00:46:21'),
(28, 'Retiro de bardas fisuradas', 'UN', 3500.00, 'desc_28', '2024-05-08 00:46:21'),
(29, 'Instalaci', 'UN', 8100.00, 'desc_29', '2024-05-08 00:46:21'),
(30, 'Aplicaci', 'M2', 8200.00, 'desc_30', '2024-05-08 00:46:21'),
(31, 'Flete de materiales', 'UN', 30000.00, 'desc_31', '2024-05-08 00:46:21'),
(32, 'Protecci', 'GL', 35000.00, 'desc_32', '2024-05-08 00:46:21'),
(33, 'Acomodo de mobiliario', 'GL', 50000.00, 'desc_33', '2024-05-08 00:46:21'),
(34, 'Retiro de escombros', 'M3', 50000.00, 'desc_34', '2024-05-08 00:46:21'),
(35, 'Aseo y entrega ', 'GL', 75000.00, 'desc_35', '2024-05-08 00:46:21');

-- --------------------------------------------------------

--
-- Table structure for table `sectors`
--

CREATE TABLE `sectors` (
  `id_sector` int(11) NOT NULL,
  `sector_name` varchar(150) NOT NULL,
  `sector_description` text,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sectors`
--

INSERT INTO `sectors` (`id_sector`, `sector_name`, `sector_description`, `createdAt`) VALUES
(1, 'fachada frontal ', 'desc_repair_1', '2024-05-08 00:46:21'),
(2, 'living comedor', 'desc_repair_2', '2024-05-08 00:46:21'),
(3, 'dormitorio 1 (principal)', 'desc_repair_3', '2024-05-08 00:46:21'),
(4, 'ba?o (1er nive)', 'desc_repair_4', '2024-05-08 00:46:21'),
(5, 'ba?o (2do nivel)', 'desc_repair_5', '2024-05-08 00:46:21'),
(6, 'cocina', 'desc_repair_6', '2024-05-08 00:46:21'),
(7, 'caja escala / sala de estar', 'desc_repair_7', '2024-05-08 00:46:21'),
(8, 'dormitorio 2', 'desc_repair_8', '2024-05-08 00:46:21'),
(9, 'cierre perimetral', 'desc_repair_9', '2024-05-08 00:46:21'),
(10, 'logia', 'desc_repair_10', '2024-05-08 00:46:21'),
(11, 'bodega', 'desc_repair_11', '2024-05-08 00:46:21'),
(12, 'sala de estar primer piso', 'desc_repair_12', '2024-05-08 00:46:21'),
(13, 'sala de estar segundo piso', 'desc_repair_13', '2024-05-08 00:46:21'),
(14, 'hall de acceso', 'desc_repair_14', '2024-05-08 00:46:21'),
(15, 'pasillo', 'desc_repair_15', '2024-05-08 00:46:21');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(10) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('d0QNHop-LBm21trGK8hxIR0UbU0Lu0Jr', 1715965636, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('B8PuF7HBXZu43g0VX4qqnSjSYujesC3R', 1715965636, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('AZPR8dPHSf7Wch_i5NfjpTd7kjKSf2jw', 1715996329, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":1},\"flash\":{}}'),
('grISLBXiLjdRb3JU8DLVVcCeDP3lUxhl', 1715965636, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id_status` int(11) NOT NULL,
  `status_name` varchar(40) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id_status`, `status_name`, `createdAt`) VALUES
(1, 'No iniciado', '2024-05-08 00:46:21'),
(2, 'En proceso', '2024-05-08 00:46:21'),
(3, 'completado', '2024-05-08 00:46:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advisers`
--
ALTER TABLE `advisers`
  ADD PRIMARY KEY (`id_adviser`);

--
-- Indexes for table `asesoresprime_web.6Scr5XN_clientes`
--
ALTER TABLE `asesoresprime_web.6Scr5XN_clientes`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `budgets`
--
ALTER TABLE `budgets`
  ADD KEY `fk_table1_cases1_idx` (`cases_id_case`);

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`id_case`),
  ADD KEY `fk_cases_status1` (`id_status`),
  ADD KEY `fk_cases_incidents1` (`id_incident`),
  ADD KEY `id_case` (`id_case`),
  ADD KEY `id_case_2` (`id_case`);

--
-- Indexes for table `cases_clients`
--
ALTER TABLE `cases_clients`
  ADD PRIMARY KEY (`id_case_clients`),
  ADD KEY `fk_cases_has_cases_clients1` (`id_case`),
  ADD KEY `fk_cases_has_clients_clients1` (`id_client`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `c_d_s`
--
ALTER TABLE `c_d_s`
  ADD PRIMARY KEY (`id_c_d_s`),
  ADD KEY `fk_cases_has_damages_damages1` (`id_damage`),
  ADD KEY `fk_c_d_sectors1` (`id_sector`),
  ADD KEY `fk_c_d_cases1` (`id_case`);

--
-- Indexes for table `damages`
--
ALTER TABLE `damages`
  ADD PRIMARY KEY (`id_damage`),
  ADD KEY `fk_c_d_cases1` (`id_incident`);

--
-- Indexes for table `damages_repairs`
--
ALTER TABLE `damages_repairs`
  ADD PRIMARY KEY (`id_damage_repair`),
  ADD KEY `fk_damages_has_repairs_damages1` (`id_damage`),
  ADD KEY `fk_damages_has_repairs_repairs1` (`id_repair`);

--
-- Indexes for table `damage_images`
--
ALTER TABLE `damage_images`
  ADD PRIMARY KEY (`id_damage_images`),
  ADD KEY `fk_damage_images_d_c_d_s1` (`id_d_c_d_s`);

--
-- Indexes for table `dimentions`
--
ALTER TABLE `dimentions`
  ADD PRIMARY KEY (`id_dimention`),
  ADD KEY `fk_dimentions_sectors1` (`id_sector`),
  ADD KEY `fk_dimentions_cases1` (`id_case`);

--
-- Indexes for table `d_c_d_s`
--
ALTER TABLE `d_c_d_s`
  ADD PRIMARY KEY (`id_d_c_d_s`),
  ADD KEY `fk_d_c_d_s_c_d_s1` (`id_c_d_s`);

--
-- Indexes for table `incidents`
--
ALTER TABLE `incidents`
  ADD PRIMARY KEY (`id_incident`);

--
-- Indexes for table `repairs`
--
ALTER TABLE `repairs`
  ADD PRIMARY KEY (`id_repair`);

--
-- Indexes for table `sectors`
--
ALTER TABLE `sectors`
  ADD PRIMARY KEY (`id_sector`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advisers`
--
ALTER TABLE `advisers`
  MODIFY `id_adviser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `asesoresprime_web.6Scr5XN_clientes`
--
ALTER TABLE `asesoresprime_web.6Scr5XN_clientes`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `budgets`
--
ALTER TABLE `budgets`
  MODIFY `cases_id_case` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cases`
--
ALTER TABLE `cases`
  MODIFY `id_case` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `cases_clients`
--
ALTER TABLE `cases_clients`
  MODIFY `id_case_clients` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `c_d_s`
--
ALTER TABLE `c_d_s`
  MODIFY `id_c_d_s` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `damages`
--
ALTER TABLE `damages`
  MODIFY `id_damage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `damages_repairs`
--
ALTER TABLE `damages_repairs`
  MODIFY `id_damage_repair` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `damage_images`
--
ALTER TABLE `damage_images`
  MODIFY `id_damage_images` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `dimentions`
--
ALTER TABLE `dimentions`
  MODIFY `id_dimention` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `d_c_d_s`
--
ALTER TABLE `d_c_d_s`
  MODIFY `id_d_c_d_s` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `incidents`
--
ALTER TABLE `incidents`
  MODIFY `id_incident` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `repairs`
--
ALTER TABLE `repairs`
  MODIFY `id_repair` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `sectors`
--
ALTER TABLE `sectors`
  MODIFY `id_sector` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
