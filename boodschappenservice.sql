-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2023 at 06:40 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `boodschappenservice`
--

-- --------------------------------------------------------

--
-- Table structure for table `artikelen`
--

CREATE TABLE `artikelen` (
  `artId` int(11) NOT NULL,
  `artOmschrijving` varchar(30) NOT NULL,
  `artInkoop` decimal(3,0) NOT NULL,
  `artMinVoorraad` int(11) NOT NULL,
  `artVerkoop` decimal(3,0) NOT NULL,
  `artVoorraad` int(11) NOT NULL,
  `artMaxVoorraad` int(11) NOT NULL,
  `artLocatie` varchar(30) NOT NULL,
  `levId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `artikelen`
--

INSERT INTO `artikelen` (`artId`, `artOmschrijving`, `artInkoop`, `artMinVoorraad`, `artVerkoop`, `artVoorraad`, `artMaxVoorraad`, `artLocatie`, `levId`) VALUES
(1, 'JBL Live 660', '85', 200, '115', 650, 999, 'Rotterdam', 1),
(2, 'Samsung Galaxy Watch 5', '200', 10, '250', 70, 100, 'Breda', 2),
(3, 'Apple AirPods Pro 2 ', '350', 100, '390', 555, 800, 'Utrecht', 3),
(4, 'Lenovo Legion T5 26IOB6 90RT00', '999', 10, '999', 50, 100, 'schiedam', 2),
(5, 'Excellent Electrics - Staande ', '40', 5, '60', 50, 60, 'dordrecht', 3);

-- --------------------------------------------------------

--
-- Table structure for table `gebruikers`
--

CREATE TABLE `gebruikers` (
  `gebruikerid` int(11) NOT NULL,
  `gebruikernaam` varchar(30) NOT NULL,
  `gebruikerleeftijd` varchar(30) NOT NULL,
  `gebruikeremail` varchar(100) NOT NULL,
  `gebruikerwachtwoord` varchar(75) NOT NULL,
  `gebruikerrol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gebruikers`
--

INSERT INTO `gebruikers` (`gebruikerid`, `gebruikernaam`, `gebruikerleeftijd`, `gebruikeremail`, `gebruikerwachtwoord`, `gebruikerrol`) VALUES
(1, 'Bezorger', '1999-02-28', 'Bezorger@gmail.com', '1234', 'Bezorger'),
(2, 'Ceo', '1997-12-25', 'ceo@gmail.com', '1234', 'Ceo'),
(3, 'Gani', '2000-12-25', 'magazijnmeester@gmail.com', '1234', 'Magazijnmeester'),
(4, 'inkoper', '1992-05-04', 'inkoper@gmail.com', '1234', 'Inkoper'),
(5, 'Firaw', '1989-12-15', 'magazijnmedewerker@gmail.com', '1234', 'Magazijnmedewerker');

-- --------------------------------------------------------

--
-- Table structure for table `inkooporders`
--

CREATE TABLE `inkooporders` (
  `inkOrdId` int(11) NOT NULL,
  `levId` int(11) NOT NULL,
  `artId` int(11) NOT NULL,
  `inkOrdDatum` varchar(30) NOT NULL,
  `inkOrdBestAantal` int(11) NOT NULL,
  `inkOrdStatus` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inkooporders`
--

INSERT INTO `inkooporders` (`inkOrdId`, `levId`, `artId`, `inkOrdDatum`, `inkOrdBestAantal`, `inkOrdStatus`) VALUES
(1, 2, 4, '02-03-2023', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `klanten`
--

CREATE TABLE `klanten` (
  `klantid` int(10) NOT NULL,
  `klantnaam` varchar(20) NOT NULL,
  `klantemail` varchar(30) NOT NULL,
  `klantadres` varchar(30) NOT NULL,
  `klantpostcode` varchar(6) NOT NULL,
  `klantwoonplaats` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `klanten`
--

INSERT INTO `klanten` (`klantid`, `klantnaam`, `klantemail`, `klantadres`, `klantpostcode`, `klantwoonplaats`) VALUES
(1, 'Firas', 'firas@gmail.com', 'testweg', '1234DD', 'Rotterdam'),
(2, 'Gani', 'Gani@gmail.com', 'testweg', '1234DD', 'Rotterdam'),
(3, 'Zakaria', 'zaka@gmail.com', 'testweg', '1234DD', 'Rotterdam'),
(4, 'osama', 'osama@gmail.com', 'testweg', '1234DD', 'Rotterdam');

-- --------------------------------------------------------

--
-- Table structure for table `leveranciers`
--

CREATE TABLE `leveranciers` (
  `levid` int(11) NOT NULL,
  `levnaam` varchar(15) NOT NULL,
  `levcontact` varchar(20) NOT NULL,
  `levEmail` varchar(30) NOT NULL,
  `levAdres` varchar(30) NOT NULL,
  `levPostcode` varchar(6) NOT NULL,
  `levWoonplaats` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leveranciers`
--

INSERT INTO `leveranciers` (`levid`, `levnaam`, `levcontact`, `levEmail`, `levAdres`, `levPostcode`, `levWoonplaats`) VALUES
(1, 'PostNl', 'Beter', 'info@postnl.nl', 'Rotterdamsweg', '1234DD', 'Rotterdam'),
(2, 'DHL', 'Simon', 'info@dhl.nl', 'Rotterdamsweg', '1234DD', 'Rotterdam'),
(3, 'dynalogic', 'sami', 'info@dynalogic.nl', 'Rotterdamsweg', '1234DD', 'Rotterdam');

-- --------------------------------------------------------

--
-- Table structure for table `verkooporders`
--

CREATE TABLE `verkooporders` (
  `verkOrdId` int(11) NOT NULL,
  `klantid` int(10) NOT NULL,
  `artId` int(11) NOT NULL,
  `verkOrdDatum` varchar(30) NOT NULL,
  `verkOrdBestAantal` int(11) NOT NULL,
  `verkOrdStatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikelen`
--
ALTER TABLE `artikelen`
  ADD PRIMARY KEY (`artId`),
  ADD KEY `fk_artikelen_leveranciers1_idx` (`levId`);

--
-- Indexes for table `gebruikers`
--
ALTER TABLE `gebruikers`
  ADD PRIMARY KEY (`gebruikerid`);

--
-- Indexes for table `inkooporders`
--
ALTER TABLE `inkooporders`
  ADD PRIMARY KEY (`inkOrdId`),
  ADD UNIQUE KEY `levId_UNIQUE` (`levId`),
  ADD UNIQUE KEY `artId_UNIQUE` (`artId`),
  ADD KEY `inkOrdId_2` (`inkOrdId`),
  ADD KEY `fk_inkooporders_leveranciers_idx` (`levId`),
  ADD KEY `fk_inkooporders_artikelen1_idx` (`artId`);

--
-- Indexes for table `klanten`
--
ALTER TABLE `klanten`
  ADD PRIMARY KEY (`klantid`);

--
-- Indexes for table `leveranciers`
--
ALTER TABLE `leveranciers`
  ADD PRIMARY KEY (`levid`);

--
-- Indexes for table `verkooporders`
--
ALTER TABLE `verkooporders`
  ADD PRIMARY KEY (`verkOrdId`),
  ADD KEY `fk_verkooporders_klanten1_idx` (`klantid`),
  ADD KEY `fk_verkooporders_artikelen1_idx` (`artId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artikelen`
--
ALTER TABLE `artikelen`
  MODIFY `artId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gebruikers`
--
ALTER TABLE `gebruikers`
  MODIFY `gebruikerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `inkooporders`
--
ALTER TABLE `inkooporders`
  MODIFY `inkOrdId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `klanten`
--
ALTER TABLE `klanten`
  MODIFY `klantid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leveranciers`
--
ALTER TABLE `leveranciers`
  MODIFY `levid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `verkooporders`
--
ALTER TABLE `verkooporders`
  MODIFY `verkOrdId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artikelen`
--
ALTER TABLE `artikelen`
  ADD CONSTRAINT `fk_artikelen_leveranciers1` FOREIGN KEY (`levId`) REFERENCES `leveranciers` (`levid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `inkooporders`
--
ALTER TABLE `inkooporders`
  ADD CONSTRAINT `fk_inkooporders_artikelen1` FOREIGN KEY (`artId`) REFERENCES `artikelen` (`artId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inkooporders_leveranciers` FOREIGN KEY (`levId`) REFERENCES `leveranciers` (`levid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `verkooporders`
--
ALTER TABLE `verkooporders`
  ADD CONSTRAINT `fk_verkooporders_artikelen1` FOREIGN KEY (`artId`) REFERENCES `artikelen` (`artId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_verkooporders_klanten1` FOREIGN KEY (`klantid`) REFERENCES `klanten` (`klantid`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
