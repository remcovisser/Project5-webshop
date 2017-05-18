# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 95.85.32.165 (MySQL 5.7.16-0ubuntu0.16.04.1)
# Database: project5
# Generation Time: 2017-02-02 10:42:23 +0000
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

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;

INSERT INTO `Address` (`address_id`, `street_id`, `city_id`, `country_id`, `postal_code`, `housenumber`, `boolean_deleted`)
VALUES
	(1,1,1,1,'2931 TN','2',0),
	(2,2,2,2,'asdasd','2',0),
	(3,3,3,3,'adad','2',0),
	(4,4,4,1,'2931 HH','2',0);

/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;

INSERT INTO `Category` (`category_id`, `c_name`, `c_description`, `c_slug`, `parent_c_id`, `boolean_deleted`)
VALUES
	(1,'Category name changed','This is the description changed','category-name-changed',2,1),
	(2,'Category name','This is the description','category-name',1,0),
	(3,'Category name','This is the description','category-name',1,0),
	(4,'Category name changed','This is the description changed','category-name-changed',2,1),
	(5,'Category name','This is the description','category-name',1,0);

/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table City
# ------------------------------------------------------------

DROP TABLE IF EXISTS `City`;

CREATE TABLE `City` (
  `city_id` int(255) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `boolean_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `City` WRITE;
/*!40000 ALTER TABLE `City` DISABLE KEYS */;

INSERT INTO `City` (`city_id`, `city`, `boolean_deleted`)
VALUES
	(1,'Krimpen aan de Lek',0),
	(2,'adad',0),
	(3,'asdad',0),
	(4,'Krimpen',0);

/*!40000 ALTER TABLE `City` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Country
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Country`;

CREATE TABLE `Country` (
  `country_id` int(255) NOT NULL AUTO_INCREMENT,
  `country` varchar(255) DEFAULT NULL,
  `boolean_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Country` WRITE;
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;

INSERT INTO `Country` (`country_id`, `country`, `boolean_deleted`)
VALUES
	(1,'Nederland',0),
	(2,'asdad',0),
	(3,'adad',0);

/*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;


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
	(6,70);

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
	(2,1,10,'123456',0),
	(3,1,5,'654321',0),
	(2,2,1,'123456',0),
	(3,3,3,'654321',0),
	(6,4,30,'238289',0),
	(2,5,1,'123456',0),
	(3,5,10,'654321',0);

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
	(1,83,'2017-01-30 13:29:06','Remco','Visser',1,'06 81820218',NULL,0),
	(2,70,'2017-01-10 14:17:19','dsads','asdasd',2,'asdad',NULL,0),
	(3,70,'2017-02-01 21:23:02','asdsad','asdadsd',3,'1231313',NULL,0),
	(4,70,'2017-02-01 21:42:16','Remco','Visser',1,'06 81820218',NULL,0),
	(5,70,'2017-02-02 08:47:34','Peter','de Groot',4,'06 81820218',NULL,0);

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
	(1,'Lamborghini Aventador','Brutally powerful and obscenely flamboyant, the Aventador is unburdened by reality. Crazy expensive and crazy fast, its capable of amazing performance without feeling like its going to snap-spin into a ditch, which is refreshing in a supercar. ','5','Lamborghini','Aventador','AB','Black',2016,'https://openclipart.org/image/2400px/svg_to_png/222252/feels.png',1),
	(2,'Toyota Corolaa','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat l','123456','Toyota','Corola','CD','Red',2014,'http://i.imgur.com/yneAVIJ.jpg',0),
	(3,'Mazda MX-5','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u ja','654321','Mazda','MX-5','E','Red',2015,'http://i.imgur.com/x750OYH.jpg',0),
	(4,'Mini123','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','239281','Ferrari','A23','F','Black',2015,'http://i.imgur.com/x3L606I.jpg',0),
	(5,'Chevrolet N16','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','1234567','Chevrolet','N16','G','White',2016,'http://i.imgur.com/vkwCwza.jpg',0),
	(6,'Acura NSMercedes AMG CLS63','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','238289','Volkswagen','A18','H','White',2015,'http://i.imgur.com/WY1PMc8.jpg',0),
	(7,'BMW i8','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','142393','BMW','IO1','J','Black',2012,'http://i.imgur.com/xI0F1fZ.jpg',0),
	(8,'Acura NSX','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','293293','Acura','E42','I','Red',2017,'http://i.imgur.com/rrgZTRS.jpg',0),
	(9,'Dikke BMW','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','123098','Nissan','A12','K','Blue',2010,'http://i.imgur.com/iPDRUgF.jpg',0),
	(10,'BMW E30','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','286930','BMW','M13','L','Black',2011,'http://i.imgur.com/vh0QflA.jpg',0),
	(53,'Mercedes CLS63 AMG','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','129389','Mercedes','CLS63','AMG','Green',2014,'http://i.imgur.com/mDDB6iU.jpg',0),
	(54,'BMW M5','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','142393','BMW','M5','A','Black',2000,'http://i.imgur.com/ajHE70W.jpg',0),
	(55,'Ferrari','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','129389','Rover','N13','S','Brown',2010,'http://i.imgur.com/UAxdaHV.jpg',0),
	(56,'Bugatti Veyron','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','232151','Bugatti','Veyron','AWE','Blue',2012,'http://i.imgur.com/bQa5KoW.jpg',0),
	(57,'McLaren MP4-12C','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','251321','McLaren','MP4','12C','White',2014,'http://i.imgur.com/XqNYjrw.jpg',0),
	(58,'Toyota Supra','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','152232','Toyota','Supra','A','White',1995,'http://i.imgur.com/dTTzdnQ.jpg',0),
	(59,'Corvette Z06','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','232042','Corvette','Z06','SADA','Blue',2015,'http://i.imgur.com/6HNPKwo.jpg',0),
	(60,'Jaguar F-Type Prix','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','525252','Jaguar','F-type','Prix','White',2012,'http://i.imgur.com/rr3xRke.jpg',0),
	(61,'Dodge Viper ACR','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','123200','Dodge','Viper','Acr','Blue',2016,'http://i.imgur.com/g15No2H.jpg',0),
	(62,'Ferarri 458','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','231000','Ferrari','458','XC','Red',2016,'http://i.imgur.com/kCYTCHh.png',0),
	(63,'Lancea','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','132131','Seat','AZN','WE','Red',2002,'http://i.imgur.com/IWutXAA.jpg',0),
	(64,'Lamborghini Huracan','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','216300','Lamborghini','Huracan','A','Silver',2015,'http://i.imgur.com/HdGAl1k.jpg',0),
	(65,'Ford Mustang','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','115023','Ford','Mustang','DWE','Red',2016,'http://i.imgur.com/99A9zRp.jpg',0),
	(66,'Ferarri Enzo','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','123123','Ferarri','Enzo','AS','Red',2015,'http://i.imgur.com/cHEXGJP.jpg',0),
	(67,'Mercedes AMG-GT','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','230523','Mercedes','E45','AMG','Black',2015,'http://i.imgur.com/q2hmSbU.jpg',0),
	(68,'Mercedes E45 AMG','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','435353','Mercedes','AMG','','Yellow',2007,'http://i.imgur.com/F9KvkCl.jpg',0),
	(69,'Hennessey Venom GT','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','354543','Henessey','Venom','GT','White',2015,'http://i.imgur.com/tufZbOe.jpg',0),
	(70,'Mercedes Maybach S600','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','151023','Mercedes Maybach S600','S600','T','White',2017,'http://i.imgur.com/xwxCDrZ.jpg',0),
	(71,'Tesla Model S','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','234242','Tesla','Model','S','Black',2015,'http://i.imgur.com/8KcfxVO.jpg',0),
	(72,'Koda','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','234234','Lala','GRA','ARE','Pink',2009,'http://i.imgur.com/pQgvupq.jpg',0),
	(73,'Maserati Granturismo MC','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','123213','Maserati','Granturismo','MC','Black',2011,'http://i.imgur.com/ncHYd50.jpg',0),
	(74,'Mercedes AMG C63','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','123213','Mercedes','C63','AMG','White',2016,'http://i.imgur.com/UigKQmR.jpg',0),
	(75,'Nissan Skyline GT-R','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','421132','Nissan','Skyline GTR','R34','Blue',1999,'http://i.imgur.com/ZlxCMnD.jpg',0),
	(76,'Porsche 911','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','230152','Porsche','911','A','Silver',2010,'http://i.imgur.com/Ns66v5K.jpg',0),
	(77,'Nissan 350Z','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','953012','Nissan','350Z','ASDAD','Orange',2012,'http://i.imgur.com/zF8iPY2.jpg',0),
	(78,'Nissan GT-R','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','141242','Nissan','GT-R','A','White',2010,'http://i.imgur.com/19jb9pM.jpg',0),
	(79,'Koenigsegg CCXR','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','321020','Koenigsegg','CCXR','DS','White',2016,'http://i.imgur.com/rkphrlG.jpg',0),
	(80,'Rolls-Royce Phantom','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','131231','Rolls-Royce','Phantom','D','Black',2011,'http://i.imgur.com/72yIgQB.jpg',0),
	(81,'Alpha Romeo','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u','132131','Alpha','Romeo','ACV','Blue',2000,'http://i.imgur.com/xdZ3DeG.jpg',0),
	(82,'haHAA','4Head','5000000','EleGiggle','FeelsBadMan','HWPO','Orange',1950,'https://pbs.twimg.com/media/CoQqeFqVIAAQGUh.png',1),
	(83,'Testdata','testdata','50','testdata','testdata','testdata','Green',2040,'https://pbs.twimg.com/media/CoQqeFqVIAAQGUh.png',1),
	(85,'dads','ijasodjo','200000','oiiasoasodio','iioasdiojaiojoi','ijsadaosdj','oijosi',200,'een asd',1),
	(86,'asdasd','asdad','2000','asdad','asdad','asdad','asdad',2000,'asdads',1);

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

LOCK TABLES `Product_has_category` WRITE;
/*!40000 ALTER TABLE `Product_has_category` DISABLE KEYS */;

INSERT INTO `Product_has_category` (`product_id`, `category_id`, `boolean_deleted`)
VALUES
	(1,2,1),
	(1,2,1),
	(1,2,1),
	(1,2,1),
	(1,2,1),
	(1,2,1),
	(1,2,1);

/*!40000 ALTER TABLE `Product_has_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Street
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Street`;

CREATE TABLE `Street` (
  `street_id` int(255) NOT NULL AUTO_INCREMENT,
  `street` varchar(255) DEFAULT NULL,
  `boolean_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`street_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Street` WRITE;
/*!40000 ALTER TABLE `Street` DISABLE KEYS */;

INSERT INTO `Street` (`street_id`, `street`, `boolean_deleted`)
VALUES
	(1,'Leliestraat',0),
	(2,'asdad',0),
	(3,'adadad',0),
	(4,'Schoolstraat',0);

/*!40000 ALTER TABLE `Street` ENABLE KEYS */;
UNLOCK TABLES;


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
	(28,'rick1','068855b32feaf5f2ed7e4df62a421fd7','asdad@hotmail.nl',1,'1994-12-07','2016-11-01 00:00:00',0,0,NULL),
	(29,'remco','5a105e8b9d40e1329780d62ea2265d8a','remco@remco.nl',0,'1994-10-11','2016-11-01 00:00:00',0,0,NULL),
	(30,'mijnwachtwoordisgeheim','e8636ea013e682faf61f56ce1cb1ab5c','geheimpie@geheim.nl',0,'2016-10-12','2016-11-01 00:00:00',1,0,NULL),
	(49,'a','0cc175b9c0f1b6a831c399e269772661','a',0,'2016-02-02','2016-11-03 12:09:14',1,0,NULL),
	(50,'test','5a105e8b9d40e1329780d62ea2265d8a','test@test.nl',0,'1212-12-12','2016-11-03 12:16:51',1,0,NULL),
	(54,'testt','147538da338b770b61e592afc92b1ee6','test@test.nl',0,'1212-12-12','2016-11-03 12:23:32',1,0,NULL),
	(55,'remcooasd','2b877b4b825b48a9a0950dd5bd1f264d','remco@vinra.nll1',0,'1212-12-12','2016-11-03 12:38:56',0,0,NULL),
	(56,'rickie','068855b32feaf5f2ed7e4df62a421fd7','rickie@rickie.nl',0,'1212-12-14','2016-11-03 12:57:18',0,1,NULL),
	(57,'Endie','ec1b5f4e35c6f887d9b70434826cb068','andy@bhadai.nl',0,'1994-01-01','2016-11-03 13:59:35',1,0,NULL),
	(58,'bunyamin','ffab59afcf85a5b0063bedcb4f71e729','buny@a.nl',1,'1010-10-10','2016-11-04 12:14:01',1,0,NULL),
	(59,'testa','7a68f09bd992671bb3b19a5e70b7827e','a',1,NULL,'2016-11-04 13:08:48',0,0,NULL),
	(60,'a','594f803b380a41396ed63dca39503542','a',0,'1994-10-10','2016-11-07 09:46:42',1,0,NULL),
	(61,'b','a21075a36eeddd084e17611a238c7101','b',0,'1994-12-12','2016-11-07 09:50:48',1,0,NULL),
	(62,'remco1','59652cbebfe96abd47e9518fc6691de8','kdkasdad@sdadad.cpm',0,'1994-10-10','2016-11-07 09:52:22',1,0,NULL),
	(63,'adsdads','6253bd2620d23d193c8b1719d4a0a23e','sdfsfsdsf',0,'1994-10-10','2016-11-07 09:55:53',1,0,NULL),
	(64,'asdasda','b12d28c1f0bbf0db079a60019fe42fab','rvremco@co.com',0,'2000-10-20','2016-11-07 10:16:35',1,0,NULL),
	(65,'asdadada','cef7fb375af8bfc4a782ac9bcc10baf2','adasdas@hotmail.co',0,'2000-10-30','2016-11-07 10:18:09',1,0,NULL),
	(66,'sdsdfsdfs','3c130ea5d8d2d3daca7f6808cdf0f148','rvremco@hotmail.com',0,'2000-10-20','2016-11-07 10:25:44',1,0,NULL),
	(67,'sdasdassad','a3dcb4d229de6fde0db5686dee47145d','rvremco@hotmail.com',0,'2000-10-20','2016-11-07 11:00:03',1,0,NULL),
	(68,'remco12','59652cbebfe96abd47e9518fc6691de8','remco@hotmail.com',0,'2000-10-10','2016-11-07 11:25:13',1,0,NULL),
	(69,'rick12','598d4c200461b81522a3328565c25f7c','rvremco@fg.com',0,'2000-10-10','2016-11-07 13:17:40',1,0,NULL),
	(70,'admin','e8636ea013e682faf61f56ce1cb1ab5c','admin@geheim.nl',1,'1995-12-06','2016-11-08 09:55:53',0,0,NULL),
	(71,'gebruiker','827ccb0eea8a706c4c34a16891f84e7b','sick@sick.nl',0,'2012-12-12','2016-11-09 10:34:17',1,1,NULL),
	(73,'gebruikers','e80b5017098950fc58aad83c8c14978e','asji@gmail.com',0,'1212-12-12','2016-11-09 11:05:37',0,0,NULL),
	(74,'jantje123','2da066c9204572f9a8c2d139991ede34','test@test.net',0,'1992-10-12','2016-11-10 14:20:56',0,0,NULL),
	(75,'asdasds','827ccb0eea8a706c4c34a16891f84e7b','rvremco@hotmail.com',0,'2000-10-10','2016-11-13 14:01:22',0,0,NULL),
	(76,'ffffff','827ccb0eea8a706c4c34a16891f84e7b','rvremco@hotmail.com',0,'2000-10-10','2016-11-13 14:01:58',0,0,NULL),
	(77,'asdasdasd','29d7bca10457e3b5f2b1e5d7ec350371','r@f.com',0,'2000-10-10','2016-11-13 16:13:06',0,0,NULL),
	(78,'testtest','60474c9c10d7142b7508ce7a50acf414','test@test.nl',0,'2000-10-10','2016-11-14 16:29:02',0,0,NULL),
	(79,'test','827ccb0eea8a706c4c34a16891f84e7b','test@test.nl',0,'1994-12-07','2017-01-18 09:22:47',0,0,NULL),
	(80,'remcosdad','b173bc8223f3b8a819599449aa1fd53e','rvremco@hotmail.com',0,'2000-10-10','2017-01-23 14:12:55',0,0,NULL),
	(81,'remcoadadads','154f01f61a54227a13f25aa29dfb61e0','rvremco@hotmail.com',0,'2000-10-10','2017-01-23 14:31:32',0,0,NULL),
	(82,'Henk','743227cc77a0e9ab38061c651eb06eeb','henk@piet.com',0,'2017-10-09','2017-01-30 13:15:25',0,0,NULL),
	(83,'henk12','743227cc77a0e9ab38061c651eb06eeb','henk@henk.nl',0,'2000-10-10','2017-01-30 13:27:02',0,0,NULL),
	(84,'henk123','743227cc77a0e9ab38061c651eb06eeb','henk@henk.nl',0,'2000-10-10','2017-02-01 21:29:22',0,0,NULL),
	(85,'janjansen','ee246ca45356df7f00a49d738a958775','jan@jan.nl',0,'2000-10-10','2017-02-02 08:45:29',0,0,NULL),
	(86,'qwerty','d8578edf8458ce06fbc5bb76a58c5ca4','qw@qw.nl',0,'2000-10-10','2017-02-02 11:21:33',0,0,NULL),
	(87,'qwerty1','6dbd0fe19c9a301c4708287780df41a2','qw@qw.nl',0,'2001-10-10','2017-02-02 11:23:16',0,0,NULL);

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
	(70,2,'2017-01-17',0,1),
	(70,53,'2017-01-17',0,1),
	(79,7,'2017-01-18',0,1),
	(79,7,'2017-01-18',0,0),
	(70,2,'2017-01-18',0,1),
	(83,2,'2017-01-30',1,1),
	(83,2,'2017-01-30',1,1),
	(83,2,'2017-01-30',1,1),
	(83,2,'2017-01-30',1,1),
	(83,2,'2017-01-30',1,1),
	(83,2,'2017-01-30',1,1),
	(70,2,'2017-02-01',0,0),
	(70,4,'2017-02-02',0,0),
	(70,3,'2017-02-02',0,1);

/*!40000 ALTER TABLE `Wishlist` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
