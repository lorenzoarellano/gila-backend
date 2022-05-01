-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.20-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for inventory
DROP DATABASE IF EXISTS `inventory`;
CREATE DATABASE IF NOT EXISTS `inventory` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `inventory`;

-- Dumping structure for table inventory.category
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(30) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT unix_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table inventory.category: ~2 rows (approximately)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `category`, `createdAt`) VALUES
	(1, 'Televisor', 1651381559),
	(2, 'Laptops', 1651381579),
	(3, 'Zapatos', 1651381587);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table inventory.product
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` varchar(50) NOT NULL,
  `sku` varchar(12) NOT NULL,
  `brand` varchar(30) NOT NULL,
  `cost` float NOT NULL,
  `category` int(11) NOT NULL DEFAULT 0,
  `subcategory` int(11) NOT NULL DEFAULT 0,
  `createdAt` float NOT NULL DEFAULT unix_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table inventory.product: ~17 rows (approximately)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table inventory.subcategory
DROP TABLE IF EXISTS `subcategory`;
CREATE TABLE IF NOT EXISTS `subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` int(11) DEFAULT NULL,
  `attr1` varchar(30) DEFAULT NULL,
  `attr2` varchar(30) DEFAULT NULL,
  `createdAt` int(11) DEFAULT unix_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table inventory.subcategory: ~14 rows (approximately)
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` (`id`, `categoryId`, `attr1`, `attr2`, `createdAt`) VALUES
	(1, 1, 'LED', '28"', 1651381612),
	(2, 1, 'LCD', '28"', 1651381634),
	(3, 1, 'OLED', '29"', 1651381648),
	(4, 1, 'LED', '34"', 1651381658),
	(5, 1, 'LCD', '34"', 1651381672),
	(6, 1, 'OLED', '34"', 1651381685),
	(7, 2, 'Intel', '4 GB', 1651381727),
	(8, 2, 'AMD', '4 GB', 1651381745),
	(9, 2, 'Intel', '8 GB', 1651381757),
	(10, 2, 'AMD', '8 GB', 1651381773),
	(11, 3, 'Piel', '25', 1651381816),
	(12, 3, 'Plástico', '25', 1651381852),
	(13, 3, 'Piel', '28.5', 1651381876),
	(14, 3, 'Plástico', '28.5', 1651381886),
	(15, 3, 'Piel', '30', 1651381907);
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
