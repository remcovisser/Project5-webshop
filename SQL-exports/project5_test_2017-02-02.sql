# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 95.85.32.165 (MySQL 5.7.16-0ubuntu0.16.04.1)
# Database: project5_test
# Generation Time: 2017-02-02 10:43:30 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Address`;

CREATE TABLE `Address` (
  `address_id` int(255) NOT NULL AUTO_INCREMENT,
  `street_id` int(255) DEFAULT NULL,
  `city_id` int(255) DEFAULT NULL,
  `country_id` int(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `housenumber` varchar(255) DEFAULT NULL,
  `boolean_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Category`;

CREATE TABLE `Category` (
  `category_id` int(255) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(255) DEFAULT NULL,
  `c_description` varchar(255) DEFAULT NULL,
  `c_slug` char(255) DEFAULT NULL,
  `parent_c_id` int(255) DEFAULT NULL,
  `boolean_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table City
# ------------------------------------------------------------

DROP TABLE IF EXISTS `City`;

CREATE TABLE `City` (
  `city_id` int(255) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `boolean_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Country
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Country`;

CREATE TABLE `Country` (
  `country_id` int(255) NOT NULL AUTO_INCREMENT,
  `country` varchar(255) DEFAULT NULL,
  `boolean_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Favourites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Favourites`;

CREATE TABLE `Favourites` (
  `product_id` int(255) DEFAULT NULL,
  `user_id` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Favourites` WRITE;
/*!40000 ALTER TABLE `Favourites` DISABLE KEYS */;

INSERT INTO `Favourites` (`product_id`, `user_id`)
VALUES
	(1,1);

/*!40000 ALTER TABLE `Favourites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Order_lines
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Order_lines`;

CREATE TABLE `Order_lines` (
  `product_id` int(255) DEFAULT NULL,
  `order_id` int(255) DEFAULT NULL,
  `quantity` int(255) DEFAULT NULL,
  `product_price` varchar(255) DEFAULT NULL,
  `boolean_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Order_lines` WRITE;
/*!40000 ALTER TABLE `Order_lines` DISABLE KEYS */;

INSERT INTO `Order_lines` (`product_id`, `order_id`, `quantity`, `product_price`, `boolean_deleted`)
VALUES
	(1,1,10,'100',0),
	(2,2,100,'500',1),
	(2,2,100,'500',1),
	(2,2,100,'500',1),
	(2,2,100,'500',1),
	(2,2,100,'500',1),
	(2,2,100,'500',1),
	(2,2,100,'500',1),
	(2,2,100,'500',1),
	(2,2,100,'500',1),
	(2,2,100,'500',1),
	(2,2,100,'500',1),
	(2,2,100,'500',1);

/*!40000 ALTER TABLE `Order_lines` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Orders`;

CREATE TABLE `Orders` (
  `order_id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `address_id` int(255) DEFAULT NULL,
  `phonenumber` varchar(50) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `boolean_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;

INSERT INTO `Orders` (`order_id`, `user_id`, `order_date`, `firstname`, `lastname`, `address_id`, `phonenumber`, `order_status`, `boolean_deleted`)
VALUES
	(1,1,'2017-01-28 13:24:05','firstname','lastname',1,'123456',NULL,0),
	(20,2,'2017-01-30 10:33:06','firstname','lastname',2,'1234567',NULL,1),
	(21,2,'2017-01-30 10:36:08','firstname','lastname',2,'1234567',NULL,0),
	(22,2,'2017-01-30 10:37:28','firstname','lastname',2,'1234567','Updated',0),
	(23,2,'2017-01-30 11:22:04','firstname','lastname',2,'1234567',NULL,0),
	(24,2,'2017-01-30 11:22:36','firstname','lastname',2,'1234567','Updated',0),
	(33,2,'2017-01-30 13:46:21','firstname','lastname',2,'1234567',NULL,0),
	(35,2,'2017-02-02 09:53:54','firstname','lastname',2,'1234567',NULL,0);

/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Product`;

CREATE TABLE `Product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(255) DEFAULT NULL,
  `p_description` text,
  `p_price` varchar(255) DEFAULT NULL,
  `p_brand` varchar(255) DEFAULT NULL,
  `p_model` varchar(255) DEFAULT NULL,
  `p_submodel` varchar(255) DEFAULT NULL,
  `p_color` varchar(255) DEFAULT NULL,
  `p_construction_year` int(11) DEFAULT NULL,
  `p_image` varchar(255) DEFAULT NULL,
  `boolean_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`product_id`),
  FULLTEXT KEY `productindex` (`p_name`,`p_description`,`p_brand`,`p_model`,`p_submodel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;

INSERT INTO `Product` (`product_id`, `p_name`, `p_description`, `p_price`, `p_brand`, `p_model`, `p_submodel`, `p_color`, `p_construction_year`, `p_image`, `boolean_deleted`)
VALUES
	(1,'test_product','This is a test product','100','brand','model','sub_model','color',2000,'https://openclipart.org/image/2400px/svg_to_png/222252/feels.png',0),
	(2,'test_product_deleted','This is a test product and it is deleted','200','brand2','model2','sub_model2','color2',4000,'http://i.imgur.com/yneAVIJ.jpg',0),
	(3,'test_product_hidden','wow so mysterious\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(4,'Test car','Test car description','1','Test','Car','AB','Black',2016,'https://openclipart.org/image/2400px/svg_to_png/222252/feels.png',1),
	(5,'Another integration test result','Test car description','1','Test','Car','AB','Black',2016,'https://openclipart.org/image/2400px/svg_to_png/222252/feels.png',0),
	(6,'test_product_deleted_again',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(26,'Another integration test result','Test car description','1','Test','Car','AB','Black',2016,'https://openclipart.org/image/2400px/svg_to_png/222252/feels.png',0),
	(27,'Another integration test result','Test car description','1','Test','Car','AB','Black',2016,'https://openclipart.org/image/2400px/svg_to_png/222252/feels.png',0);

/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Product_has_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Product_has_category`;

CREATE TABLE `Product_has_category` (
  `product_id` int(255) DEFAULT NULL,
  `category_id` int(255) DEFAULT NULL,
  `boolean_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Street
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Street`;

CREATE TABLE `Street` (
  `street_id` int(255) NOT NULL AUTO_INCREMENT,
  `street` varchar(255) DEFAULT NULL,
  `boolean_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`street_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table User
# ------------------------------------------------------------

DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
  `user_id` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `date_of_birth` date DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `boolean_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `boolean_banned` tinyint(1) NOT NULL DEFAULT '0',
  `token` text,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;

INSERT INTO `User` (`user_id`, `username`, `password`, `email`, `admin`, `date_of_birth`, `create_date`, `boolean_deleted`, `boolean_banned`, `token`)
VALUES
	(1,'test_user','123','test@tset.nl',0,'2000-10-10','2017-01-27 00:00:00',0,0,NULL),
	(2,'deleted_user','111','test@deleted.nl',0,'2017-01-29','2017-01-29 11:27:19',1,0,NULL),
	(4,'wished_user','112','',0,NULL,'2017-01-29 13:06:08',0,0,NULL),
	(5,'new_user',NULL,NULL,0,NULL,'2017-01-30 10:56:29',0,0,''),
	(6,'hi_i_got_updated','321','new@updated.nl',0,NULL,'2017-01-30 10:57:46',0,0,NULL),
	(26,'kms','123',NULL,0,NULL,'2017-01-30 13:51:57',0,0,NULL);

/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Wishlist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Wishlist`;

CREATE TABLE `Wishlist` (
  `user_id` int(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `addition_date` date DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `boolean_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Wishlist` WRITE;
/*!40000 ALTER TABLE `Wishlist` DISABLE KEYS */;

INSERT INTO `Wishlist` (`user_id`, `product_id`, `addition_date`, `hidden`, `boolean_deleted`)
VALUES
	(1,2,'2017-01-29',0,0),
	(2,1,'2017-01-29',0,0),
	(4,9,'2017-01-28',0,1),
	(1,3,'1212-12-12',0,0),
	(26,1,'2017-01-30',0,0),
	(4,6,'2017-01-28',0,0);

/*!40000 ALTER TABLE `Wishlist` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
