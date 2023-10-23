-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 23 okt 2023 om 19:32
-- Serverversie: 8.0.31
-- PHP-versie: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `be-j2-opdracht2`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `examen`
--

DROP TABLE IF EXISTS `examen`;
CREATE TABLE IF NOT EXISTS `examen` (
  `Id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `StudentId` int UNSIGNED NOT NULL,
  `Rijschool` varchar(30) NOT NULL,
  `Stad` varchar(25) NOT NULL,
  `RijbewijsCategorie` varchar(5) NOT NULL,
  `Datum` date NOT NULL,
  `Uitslag` varchar(10) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `examen`
--

INSERT INTO `examen` (`Id`, `StudentId`, `Rijschool`, `Stad`, `RijbewijsCategorie`, `Datum`, `Uitslag`) VALUES
(1, 100234, 'VolGasVooruit', 'Rotterdam', 'B', '2023-04-03', 'Geslaagd'),
(2, 123432, 'InZijnVierDoorDeBocht', 'Sliedrecht', 'C', '2023-03-01', 'Geslaagd'),
(3, 103234, 'LinksomRechtsom', 'Dordrecht', 'D', '2023-05-15', 'Geslaagd'),
(4, 106452, 'OpDeVluchtStrook', 'Zwijndrecht', 'AM', '2023-05-08', 'Gezakt'),
(5, 104546, 'RechtDoorEnGaan', 'Rotterdam', 'B', '2023-04-17', 'Gezakt'),
(6, 100333, 'AltijdGeslaagd', 'Dordrecht', 'B', '2023-05-12', 'Geslaagd'),
(7, 124444, 'RijlesVoorJou', 'Rotterdam', 'B', '2023-04-12', 'Geslaagd');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `examenperexaminator`
--

DROP TABLE IF EXISTS `examenperexaminator`;
CREATE TABLE IF NOT EXISTS `examenperexaminator` (
  `Id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ExamenId` tinyint UNSIGNED NOT NULL,
  `ExaminatorId` tinyint UNSIGNED NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ExamenId` (`ExamenId`),
  KEY `FK_ExaminatorId` (`ExaminatorId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `examenperexaminator`
--

INSERT INTO `examenperexaminator` (`Id`, `ExamenId`, `ExaminatorId`) VALUES
(1, 1, 3),
(2, 3, 3),
(3, 2, 2),
(4, 4, 1),
(5, 7, 3),
(6, 6, 2),
(7, 5, 4);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `examinator`
--

DROP TABLE IF EXISTS `examinator`;
CREATE TABLE IF NOT EXISTS `examinator` (
  `Id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(30) NOT NULL,
  `Tussenvoegsel` varchar(10) NOT NULL,
  `Achternaam` varchar(30) NOT NULL,
  `Mobiel` varchar(15) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `examinator`
--

INSERT INTO `examinator` (`Id`, `Voornaam`, `Tussenvoegsel`, `Achternaam`, `Mobiel`) VALUES
(1, 'Manuel', 'van', 'Meekeren', '06-28493823'),
(2, 'Lissette', 'den', 'Dongen', '06-24383299'),
(3, 'Jurswailly', '', 'Luciano', '06-48293846'),
(4, 'Nashwa', '', 'Salawi', '06-34291219');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `instructeur`
--

DROP TABLE IF EXISTS `instructeur`;
CREATE TABLE IF NOT EXISTS `instructeur` (
  `Id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(50) NOT NULL,
  `Tussenvoegsel` varchar(10) NOT NULL,
  `Achternaam` varchar(50) NOT NULL,
  `Mobiel` varchar(12) NOT NULL,
  `DatumInDienst` date NOT NULL,
  `AantalSterren` varchar(6) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `instructeur`
--

INSERT INTO `instructeur` (`Id`, `Voornaam`, `Tussenvoegsel`, `Achternaam`, `Mobiel`, `DatumInDienst`, `AantalSterren`, `IsActief`, `Opmerkingen`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 'Li', '', 'Zhan', '06-28493827', '2015-04-17', '***', b'1', NULL, '2023-10-23 21:21:55.454370', '2023-10-23 21:21:55.454373'),
(2, 'Leroy', '', 'Boerhaven', '06-39398734', '2018-06-25', '*', b'1', NULL, '2023-10-23 21:21:55.454429', '2023-10-23 21:21:55.454430'),
(3, 'Yoeri', 'van', 'Veen', '06-24383291', '2010-05-12', '***', b'1', NULL, '2023-10-23 21:21:55.454455', '2023-10-23 21:21:55.454455'),
(4, 'Bert', 'van', 'Sali', '06-48293823', '2023-01-10', '****', b'1', NULL, '2023-10-23 21:21:55.454467', '2023-10-23 21:21:55.454468'),
(5, 'Mohammed', 'El', 'Yassidi', '06-34291234', '2010-06-14', '*****', b'1', NULL, '2023-10-23 21:21:55.454479', '2023-10-23 21:21:55.454479');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `typevoertuig`
--

DROP TABLE IF EXISTS `typevoertuig`;
CREATE TABLE IF NOT EXISTS `typevoertuig` (
  `Id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `TypeVoertuig` varchar(20) NOT NULL,
  `Rijbewijscategorie` varchar(5) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `typevoertuig`
--

INSERT INTO `typevoertuig` (`Id`, `TypeVoertuig`, `Rijbewijscategorie`, `IsActief`, `Opmerkingen`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 'Personenauto', 'B', b'1', NULL, '2023-10-23 21:21:55.515520', '2023-10-23 21:21:55.515523'),
(2, 'Vrachtwagen', 'C', b'1', NULL, '2023-10-23 21:21:55.515565', '2023-10-23 21:21:55.515566'),
(3, 'Bus', 'D', b'1', NULL, '2023-10-23 21:21:55.515578', '2023-10-23 21:21:55.515578'),
(4, 'Bromfiets', 'AM', b'1', NULL, '2023-10-23 21:21:55.515583', '2023-10-23 21:21:55.515583');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `voertuig`
--

DROP TABLE IF EXISTS `voertuig`;
CREATE TABLE IF NOT EXISTS `voertuig` (
  `Id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `Kenteken` varchar(12) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Bouwjaar` date NOT NULL,
  `Brandstof` varchar(20) NOT NULL,
  `TypeVoertuigId` tinyint UNSIGNED NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Voertuig_TypeVoertuigId_TypeVoertuig_Id` (`TypeVoertuigId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `voertuig`
--

INSERT INTO `voertuig` (`Id`, `Kenteken`, `Type`, `Bouwjaar`, `Brandstof`, `TypeVoertuigId`, `IsActief`, `Opmerkingen`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 'AU-67-IO', 'Golf', '2017-06-12', 'Diesel', 1, b'1', NULL, '2023-10-23 21:21:55.621804', '2023-10-23 21:21:55.621806'),
(2, 'TR-24-OP', 'DAF', '2019-05-23', 'Diesel', 2, b'1', NULL, '2023-10-23 21:21:55.621847', '2023-10-23 21:21:55.621847'),
(3, 'TH-78-KL', 'Mercedes', '2023-01-01', 'Benzine', 1, b'1', NULL, '2023-10-23 21:21:55.621864', '2023-10-23 21:21:55.621864'),
(4, '90-KL-TR', 'Fiat 500', '2021-09-12', 'Benzine', 1, b'1', NULL, '2023-10-23 21:21:55.621873', '2023-10-23 21:21:55.621873'),
(5, '34-TK-LP', 'Scania', '2015-03-13', 'Diesel', 2, b'1', NULL, '2023-10-23 21:21:55.621881', '2023-10-23 21:21:55.621881'),
(6, 'YY-OP-78', 'BMW M5', '2022-05-13', 'Diesel', 1, b'1', NULL, '2023-10-23 21:21:55.621889', '2023-10-23 21:21:55.621889'),
(7, 'UU-HH-JK', 'M.A.N', '2017-12-03', 'Diesel', 2, b'1', NULL, '2023-10-23 21:21:55.621897', '2023-10-23 21:21:55.621897'),
(8, 'ST-FZ-28', 'Citroën', '2018-01-20', 'Elektrisch', 1, b'1', NULL, '2023-10-23 21:21:55.621905', '2023-10-23 21:21:55.621905'),
(9, '123-FR-T', 'Piaggio ZIP', '2021-02-01', 'Benzine', 4, b'1', NULL, '2023-10-23 21:21:55.621913', '2023-10-23 21:21:55.621913'),
(10, 'DRS-52-P', 'Vespa', '2022-03-21', 'Benzine', 4, b'1', NULL, '2023-10-23 21:21:55.621921', '2023-10-23 21:21:55.621921'),
(11, 'STP-12-U', 'Vespa', '2022-07-02', 'Benzine', 4, b'1', NULL, '2023-10-23 21:21:55.621929', '2023-10-23 21:21:55.621929'),
(12, '45-SD-23', 'Renault', '2023-01-01', 'Diesel', 3, b'1', NULL, '2023-10-23 21:21:55.621938', '2023-10-23 21:21:55.621938');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `voertuiginstructeur`
--

DROP TABLE IF EXISTS `voertuiginstructeur`;
CREATE TABLE IF NOT EXISTS `voertuiginstructeur` (
  `Id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `VoertuigId` tinyint UNSIGNED NOT NULL,
  `InstructeurId` tinyint UNSIGNED NOT NULL,
  `DatumToekenning` date NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_VoertuigInstructeur_VoertuigId_Voertuig_Id` (`VoertuigId`),
  KEY `FK_VoertuigInstructeur_InstructeurId_Instructeur_Id` (`InstructeurId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `voertuiginstructeur`
--

INSERT INTO `voertuiginstructeur` (`Id`, `VoertuigId`, `InstructeurId`, `DatumToekenning`, `IsActief`, `Opmerkingen`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 1, 5, '2017-06-18', b'1', NULL, '2023-10-23 21:21:55.814958', '2023-10-23 21:21:55.814961'),
(2, 3, 1, '2021-09-26', b'1', NULL, '2023-10-23 21:21:55.815008', '2023-10-23 21:21:55.815009'),
(3, 9, 1, '2021-09-27', b'1', NULL, '2023-10-23 21:21:55.815029', '2023-10-23 21:21:55.815030'),
(4, 3, 4, '2022-08-01', b'1', NULL, '2023-10-23 21:21:55.815041', '2023-10-23 21:21:55.815041'),
(5, 5, 1, '2019-08-30', b'1', NULL, '2023-10-23 21:21:55.815052', '2023-10-23 21:21:55.815052'),
(6, 10, 5, '2020-02-02', b'1', NULL, '2023-10-23 21:21:55.815063', '2023-10-23 21:21:55.815063');

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `examenperexaminator`
--
ALTER TABLE `examenperexaminator`
  ADD CONSTRAINT `FK_ExamenId` FOREIGN KEY (`ExamenId`) REFERENCES `examen` (`Id`),
  ADD CONSTRAINT `FK_ExaminatorId` FOREIGN KEY (`ExaminatorId`) REFERENCES `examinator` (`Id`);

--
-- Beperkingen voor tabel `voertuig`
--
ALTER TABLE `voertuig`
  ADD CONSTRAINT `FK_Voertuig_TypeVoertuigId_TypeVoertuig_Id` FOREIGN KEY (`TypeVoertuigId`) REFERENCES `typevoertuig` (`Id`);

--
-- Beperkingen voor tabel `voertuiginstructeur`
--
ALTER TABLE `voertuiginstructeur`
  ADD CONSTRAINT `FK_VoertuigInstructeur_InstructeurId_Instructeur_Id` FOREIGN KEY (`InstructeurId`) REFERENCES `instructeur` (`Id`),
  ADD CONSTRAINT `FK_VoertuigInstructeur_VoertuigId_Voertuig_Id` FOREIGN KEY (`VoertuigId`) REFERENCES `voertuig` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
