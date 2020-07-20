-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 20, 2020 at 09:57 PM
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
-- Table structure for table `membres_tb`
--

CREATE TABLE `membres_tb` (
  `id_mb` int(11) NOT NULL,
  `name_mb` varchar(30) NOT NULL,
  `first_name_mb` varchar(25) NOT NULL,
  `image_mb` varchar(140) NOT NULL,
  `country_mb` char(3) NOT NULL,
  `privilege_mb` tinyint(1) NOT NULL,
  `gender_mb` varchar(11) NOT NULL,
  `subscription_date_mb` date NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp(),
  `alignment_mb` varchar(20) NOT NULL,
  `class_mb` varchar(30) NOT NULL,
  `location_mb` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `membres_tb`
--

INSERT INTO `membres_tb` (`id_mb`, `name_mb`, `first_name_mb`, `image_mb`, `country_mb`, `privilege_mb`, `gender_mb`, `subscription_date_mb`, `date_updated`, `alignment_mb`, `class_mb`, `location_mb`) VALUES
(1, '', 'Imoen', 'https://vignette.wikia.nocookie.net/baldursgategame/images/6/64/Imoen_IMOEN_Portrait_BG1.png', 'FR', 0, 'f', '2019-10-22', '2019-10-24 17:48:48', 'neutre-bon', 'voleur', 'côte de Château-Suif'),
(2, '', 'Montaron', 'https://vignette.wikia.nocookie.net/baldursgategame/images/7/75/Montaron_MONTAR_Portrait_BG1.png', 'FR', 0, 'm', '2019-10-22', '2019-10-24 17:48:48', 'neutre-mauvais', 'guerrier-voleur', 'côte de Château-Suif'),
(3, '', 'Jaheira', 'https://vignette.wikia.nocookie.net/baldursgategame/images/7/7e/Jaheira_JAHEIRA_Portrait_BG1.png', 'FR', 0, 'f', '2019-10-22', '2019-10-24 17:48:48', 'neutre absolu', 'guerrier-druide', 'The Friendly Arm'),
(4, '', 'Khalid', 'https://vignette.wikia.nocookie.net/baldursgategame/images/9/90/Khalid_KHALID_Portrait_BG1.png', 'FR', 0, 'm', '2019-10-22', '2019-10-24 17:48:48', 'neutre-bon', 'guerrier', 'The Friendly Arm'),
(5, 'DeVir', 'Viconia', 'https://vignette.wikia.nocookie.net/baldursgategame/images/d/d5/Viconia_DeVir_VICONIA_Portrait_BG1.png', 'FR', 0, 'f', '2019-10-24', '2019-10-24 17:48:48', 'neutre-mauvais', 'clerc', 'Peldvale'),
(6, 'Ilvastarr', 'Ajantis', 'https://vignette.wikia.nocookie.net/baldursgategame/images/7/7c/Ajantis_Ilvastarr_AJANTIS_Portrait_BG1.png', 'FR', 0, 'm', '2019-10-24', '2019-10-24 17:48:48', 'loyal-bon', 'paladin', 'Area North of the Friendly Arm Inn'),
(7, '', 'Coran', 'https://vignette.wikia.nocookie.net/baldursgategame/images/6/62/Coran_CORAN_Portrait_BG1.png', 'FR', 0, 'm', '2019-10-24', '2019-10-24 17:48:48', 'chaotique-bon', 'guerrier-voleur', 'Bois-Manteau'),
(8, '', 'Safana', 'https://vignette.wikia.nocookie.net/baldursgategame/images/0/04/Safana_SAFANA_Portrait_BG1.png', 'FR', 0, 'f', '2019-10-24', '2019-10-24 17:48:48', 'chaotique-bon', 'voleur', 'phare');

-- --------------------------------------------------------

--
-- Table structure for table `pays_tb`
--

CREATE TABLE `pays_tb` (
  `CODE_pays` char(3) NOT NULL DEFAULT '',
  `nom_pays` varchar(100) NOT NULL DEFAULT '',
  `langues_pays` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pays_tb`
--

INSERT INTO `pays_tb` (`CODE_pays`, `nom_pays`, `langues_pays`) VALUES
('CAN', 'Canada', 'French, English'),
('CHN', 'China', 'Chinese'),
('ESP', 'Spain', 'Spanish'),
('FR', 'Forgotten Realms', 'Common'),
('POL', 'Poland', 'Polish'),
('RUS', 'Russia', 'Russian'),
('USA', 'United States', 'English');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `membres_tb`
--
ALTER TABLE `membres_tb`
  ADD UNIQUE KEY `ID_membre` (`id_mb`);

--
-- Indexes for table `pays_tb`
--
ALTER TABLE `pays_tb`
  ADD PRIMARY KEY (`CODE_pays`),
  ADD UNIQUE KEY `CODE_pays` (`CODE_pays`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `membres_tb`
--
ALTER TABLE `membres_tb`
  MODIFY `id_mb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
