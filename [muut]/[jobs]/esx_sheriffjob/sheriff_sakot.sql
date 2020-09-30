-- --------------------------------------------------------
-- Verkkotietokone:              127.0.0.1
-- Palvelinversio:               10.3.16-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Versio:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for essentialmode
CREATE DATABASE IF NOT EXISTS `essentialmode` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `essentialmode`;

-- Dumping structure for taulu essentialmode.sheriffi_sakko
CREATE TABLE IF NOT EXISTS `sheriffi_sakko` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.sheriffi_sakko: ~47 rows (suunnilleen)
/*!40000 ALTER TABLE `sheriffi_sakko` DISABLE KEYS */;
INSERT INTO `sheriffi_sakko` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Äänimerkin väärinkäyttö', 500, 0),
	(3, 'Ajaminen tien väärällä puolella', 750, 0),
	(4, 'Laiton U-käännös', 750, 0),
	(5, 'Laiton maastossa ajaminen', 1700, 0),
	(6, 'Virkavallan käskyn laiminlyönti', 3000, 0),
	(7, 'Laiton pysähtyminen', 1500, 0),
	(8, 'Laiton parkkeeraus', 1000, 0),
	(9, 'Väistöolovelvollisuuden laiminlyönti', 700, 0),
	(10, 'Väärän ajoneuvontiedon antaminen', 1000, 0),
	(11, 'Stop merkin laiminlyönti', 1200, 0),
	(12, 'Punaisten valojen laiminlyönti', 1300, 0),
	(13, 'Laiton ohitus', 1000, 0),
	(14, 'Laittomalla ajoneuvolla ajaminen', 1000, 0),
	(15, 'Ajokortitta ajo', 4000, 0),
	(16, 'Yliajo', 5000, 0),
	(17, 'Ylinopeus < 5 kmh', 3000, 0),
	(18, 'Ylinopeus 5-15 kmh', 6000, 0),
	(19, 'Ylinopeus 15-30 kmh', 8000, 0),
	(20, 'Ylinopeus > 30 kmh', 10000, 0),
	(21, 'Liikennekulun esto', 1000, 0),
	(22, 'Julkinen päihtyminen', 900, 3),
	(23, 'Sopimaton käytös', 900, 3),
	(24, 'Oikeusjärjestelmän estäminen', 1300, 4),
	(25, 'Siviilin loukkaaminen', 750, 3),
	(26, 'Virkavallan halventaminen', 1100, 3),
	(27, 'Sanallainen uhkaus siviiliä kohtaan', 900, 3),
	(28, 'Sanallinen uhkaus virkavaltaa kohtaan', 1500, 3),
	(29, 'Virheellisen tiedon antaminen', 2500, 4),
	(30, 'Korruptioyritys', 5000, 4),
	(31, 'Aseella heiluminen asutusalueella', 6000, 2),
	(32, 'Tappavalla aseella heiluminen', 7000, 2),
	(33, 'Ei aselupaa', 5000, 2),
	(34, 'Laittoman aseen hallusapito', 7000, 2),
	(36, 'Autovarkaus', 1800, 0),
	(37, 'Tarkoitus myydä/levittää laitonta ainetta', 1500, 1),
	(38, 'Laittoman aineen valmistus', 1500, 1),
	(39, 'Laittoman aineen hallusapito ', 650, 1),
	(40, 'Siviilin kidnappaus', 1500, 3),
	(41, 'Virkavallan kidnappaus', 2000, 3),
	(42, 'Ryöstö', 6500, 4),
	(43, 'Aseellinen ryöstö', 15000, 4),
	(44, 'Henkilöön kohdistunut hyökkäys', 2500, 3),
	(45, 'Murhanyirtys', 15000, 3),
	(46, 'Murha', 30000, 3),
	(47, 'Tappo', 30000, 3),
	(48, 'Petos', 10000, 4),
	(49, 'Tappoyritys', 15000, 3);
/*!40000 ALTER TABLE `sheriffi_sakko` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
