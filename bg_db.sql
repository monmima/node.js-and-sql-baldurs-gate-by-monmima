-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 21, 2020 at 09:59 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bg_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `areas_tb`
--

CREATE TABLE `areas_tb` (
  `id_area` char(10) NOT NULL DEFAULT '',
  `name_area` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `areas_tb`
--

INSERT INTO `areas_tb` (`id_area`, `name_area`) VALUES
('AR1200', 'First Cloakwood'),
('AR1400', 'Fishing Village'),
('AR2301', 'Friendly Arm Inn'),
('AR2400', 'Peldvale'),
('AR2700', 'Candlekeep Coastway'),
('AR3600', 'Lighthouse'),
('USA', 'Friendly Arm Inn');

-- --------------------------------------------------------

--
-- Table structure for table `characters_tb`
--

CREATE TABLE `characters_tb` (
  `id_ch` int(11) NOT NULL,
  `family_name_ch` varchar(30) NOT NULL,
  `first_name_ch` varchar(25) NOT NULL,
  `image_ch` varchar(140) NOT NULL,
  `privilege_ch` tinyint(1) NOT NULL,
  `subscription_date_ch` date NOT NULL,
  `date_updated_ch` timestamp NOT NULL DEFAULT current_timestamp(),
  `alignment_ch` varchar(20) NOT NULL,
  `class_ch` varchar(30) NOT NULL,
  `area_ch` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `characters_tb`
--

INSERT INTO `characters_tb` (`id_ch`, `family_name_ch`, `first_name_ch`, `image_ch`, `privilege_ch`, `subscription_date_ch`, `date_updated_ch`, `alignment_ch`, `class_ch`, `area_ch`) VALUES
(1, '', 'Imoen', 'https://vignette.wikia.nocookie.net/baldursgategame/images/6/64/Imoen_IMOEN_Portrait_BG1.png', 0, '2019-10-22', '2019-10-24 17:48:48', 'neutral good', 'thief', 'AR2700'),
(2, '', 'Montaron', 'https://vignette.wikia.nocookie.net/baldursgategame/images/7/75/Montaron_MONTAR_Portrait_BG1.png', 0, '2019-10-22', '2019-10-24 17:48:48', 'neutral evil', 'fighter / thief', 'AR2700'),
(3, '', 'Jaheira', 'https://vignette.wikia.nocookie.net/baldursgategame/images/7/7e/Jaheira_JAHEIRA_Portrait_BG1.png', 0, '2019-10-22', '2019-10-24 17:48:48', 'true neutral', 'fighter / druid', 'AR2301'),
(4, '', 'Khalid', 'https://vignette.wikia.nocookie.net/baldursgategame/images/9/90/Khalid_KHALID_Portrait_BG1.png', 0, '2019-10-22', '2019-10-24 17:48:48', 'neutral good', 'fighter', 'AR2301'),
(5, 'DeVir', 'Viconia', 'https://vignette.wikia.nocookie.net/baldursgategame/images/d/d5/Viconia_DeVir_VICONIA_Portrait_BG1.png', 0, '2019-10-24', '2019-10-24 17:48:48', 'neutral evil', 'cleric', 'AR2400'),
(6, 'Ilvastarr', 'Ajantis', 'https://vignette.wikia.nocookie.net/baldursgategame/images/7/7c/Ajantis_Ilvastarr_AJANTIS_Portrait_BG1.png', 0, '2019-10-24', '2019-10-24 17:48:48', 'loyal good', 'paladin', 'AR1400'),
(7, '', 'Coran', 'https://vignette.wikia.nocookie.net/baldursgategame/images/6/62/Coran_CORAN_Portrait_BG1.png', 0, '2019-10-24', '2019-10-24 17:48:48', 'chaotic good', 'fighter / thief', 'AR1200'),
(8, '', 'Safana', 'https://vignette.wikia.nocookie.net/baldursgategame/images/0/04/Safana_SAFANA_Portrait_BG1.png', 0, '2019-10-24', '2019-10-24 17:48:48', 'chaotic good', 'thief', 'AR3600');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areas_tb`
--
ALTER TABLE `areas_tb`
  ADD PRIMARY KEY (`id_area`),
  ADD UNIQUE KEY `id_area` (`id_area`) USING BTREE;

--
-- Indexes for table `characters_tb`
--
ALTER TABLE `characters_tb`
  ADD UNIQUE KEY `id_mb` (`id_ch`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `characters_tb`
--
ALTER TABLE `characters_tb`
  MODIFY `id_ch` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
