/*
SQLyog Ultimate v11.01 (64 bit)
MySQL - 5.5.5-10.4.11-MariaDB : Database - cs4125db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cs4125db` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `ID` int(3) NOT NULL AUTO_INCREMENT,
  `Name` varchar(10) DEFAULT NULL,
  `Pass` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

LOCK TABLES `admin` WRITE;

insert  into `admin`(`ID`,`Name`,`Pass`) values (99,'Admin','abchij');

UNLOCK TABLES;

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `FName` varchar(10) DEFAULT NULL,
  `LName` varchar(10) DEFAULT NULL,
  `Email` varchar(20) DEFAULT NULL,
  `Pass` varchar(60) DEFAULT NULL,
  `City` varchar(10) DEFAULT NULL,
  `address_line_1` varchar(10) DEFAULT NULL,
  `address_line_2` varchar(10) DEFAULT NULL,
  `address_line_3` varchar(10) DEFAULT NULL,
  `zipcode` varchar(8) DEFAULT NULL,
  `PhoneNumber` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

/*Data for the table `customers` */

LOCK TABLES `customers` WRITE;

insert  into `customers`(`ID`,`FName`,`LName`,`Email`,`Pass`,`City`,`address_line_1`,`address_line_2`,`address_line_3`,`zipcode`,`PhoneNumber`) values (1,'John','Smith','johnsmith@gmail.com','pass123','Limerick','address 1','address 2','address 3','X95 HNP4','0949022845');
insert  into `customers`(`ID`,`FName`,`LName`,`Email`,`Pass`,`City`,`address_line_1`,`address_line_2`,`address_line_3`,`zipcode`,`PhoneNumber`) values (17,'Brian','Brianson','brian@gmail.com','shanahan',NULL,NULL,NULL,NULL,NULL,'0871111111');
insert  into `customers`(`ID`,`FName`,`LName`,`Email`,`Pass`,`City`,`address_line_1`,`address_line_2`,`address_line_3`,`zipcode`,`PhoneNumber`) values (24,'Daniel','Danielson','danielpclarke@hotmai','pass123',NULL,NULL,NULL,NULL,NULL,'0876543123');
insert  into `customers`(`ID`,`FName`,`LName`,`Email`,`Pass`,`City`,`address_line_1`,`address_line_2`,`address_line_3`,`zipcode`,`PhoneNumber`) values (26,'John','Doe','johndoe@gmail.com','johndoe123',NULL,NULL,NULL,NULL,NULL,'1234567890');
insert  into `customers`(`ID`,`FName`,`LName`,`Email`,`Pass`,`City`,`address_line_1`,`address_line_2`,`address_line_3`,`zipcode`,`PhoneNumber`) values (27,'Joe ','Bloggs','linus@gmail.com','techtips123',NULL,NULL,NULL,NULL,NULL,'0871234567');

UNLOCK TABLES;

/*Table structure for table `drivers` */

DROP TABLE IF EXISTS `drivers`;

CREATE TABLE `drivers` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `FName` varchar(10) DEFAULT NULL,
  `LName` varchar(10) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Number` varchar(10) DEFAULT NULL,
  `Pass` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;

/*Data for the table `drivers` */

LOCK TABLES `drivers` WRITE;

insert  into `drivers`(`ID`,`FName`,`LName`,`Address`,`Number`,`Pass`) values (123,'Mary','Manson',NULL,NULL,'');
insert  into `drivers`(`ID`,`FName`,`LName`,`Address`,`Number`,`Pass`) values (124,'James','Bond',NULL,NULL,'');
insert  into `drivers`(`ID`,`FName`,`LName`,`Address`,`Number`,`Pass`) values (125,'Barry','Benson',NULL,NULL,'');
insert  into `drivers`(`ID`,`FName`,`LName`,`Address`,`Number`,`Pass`) values (126,'Daniel','Clarke',NULL,'+353877846','1111111111');

UNLOCK TABLES;

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `r_id` int(4) DEFAULT NULL,
  `Date_created` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `r_id` (`r_id`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `restaurants` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `menu` */

LOCK TABLES `menu` WRITE;

insert  into `menu`(`ID`,`r_id`,`Date_created`) values (1,1,'2021-11-23');
insert  into `menu`(`ID`,`r_id`,`Date_created`) values (2,2,'2021-11-23');
insert  into `menu`(`ID`,`r_id`,`Date_created`) values (3,3,'2021-11-23');

UNLOCK TABLES;

/*Table structure for table `menu_category` */

DROP TABLE IF EXISTS `menu_category`;

CREATE TABLE `menu_category` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `menu_id` int(4) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `menu_category_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `menu_category` */

LOCK TABLES `menu_category` WRITE;

insert  into `menu_category`(`ID`,`menu_id`,`name`) values (1,1,'Starters');
insert  into `menu_category`(`ID`,`menu_id`,`name`) values (2,1,'Mains');
insert  into `menu_category`(`ID`,`menu_id`,`name`) values (3,1,'Sides');
insert  into `menu_category`(`ID`,`menu_id`,`name`) values (4,2,'Starters');
insert  into `menu_category`(`ID`,`menu_id`,`name`) values (5,2,'Mains');
insert  into `menu_category`(`ID`,`menu_id`,`name`) values (6,2,'Sides');

UNLOCK TABLES;

/*Table structure for table `menu_line` */

DROP TABLE IF EXISTS `menu_line`;

CREATE TABLE `menu_line` (
  `line_id` int(4) NOT NULL AUTO_INCREMENT,
  `menu_id` int(4) NOT NULL,
  `line_no` int(4) NOT NULL,
  `foodName` varchar(20) DEFAULT NULL,
  `foodDesc` varchar(110) DEFAULT NULL,
  `cat_id` int(4) DEFAULT NULL,
  `price` decimal(3,2) DEFAULT NULL,
  `picture` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`menu_id`,`line_no`,`line_id`),
  KEY `cat_id` (`cat_id`),
  KEY `line_id` (`line_id`),
  CONSTRAINT `menu_line_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `menu_category` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `menu_line` */

LOCK TABLES `menu_line` WRITE;

insert  into `menu_line`(`line_id`,`menu_id`,`line_no`,`foodName`,`foodDesc`,`cat_id`,`price`,`picture`) values (1,1,1,'Chips','Lorem, ipsum dolor sit amet consectetur adipisicing elit. Odit corrupti, tempore quidem quos nesciunt molestia',1,2.50,NULL);
insert  into `menu_line`(`line_id`,`menu_id`,`line_no`,`foodName`,`foodDesc`,`cat_id`,`price`,`picture`) values (2,1,2,'Chicken Satay',NULL,1,6.00,NULL);
insert  into `menu_line`(`line_id`,`menu_id`,`line_no`,`foodName`,`foodDesc`,`cat_id`,`price`,`picture`) values (3,1,3,'Won Tons',NULL,1,6.00,NULL);
insert  into `menu_line`(`line_id`,`menu_id`,`line_no`,`foodName`,`foodDesc`,`cat_id`,`price`,`picture`) values (4,1,4,'Thai Red Curry',NULL,2,9.20,NULL);
insert  into `menu_line`(`line_id`,`menu_id`,`line_no`,`foodName`,`foodDesc`,`cat_id`,`price`,`picture`) values (5,1,5,'Crispy Chili Chicken',NULL,2,9.20,NULL);
insert  into `menu_line`(`line_id`,`menu_id`,`line_no`,`foodName`,`foodDesc`,`cat_id`,`price`,`picture`) values (6,1,6,'Beef Chow Mein',NULL,2,9.00,NULL);
insert  into `menu_line`(`line_id`,`menu_id`,`line_no`,`foodName`,`foodDesc`,`cat_id`,`price`,`picture`) values (7,1,7,'Spice Bag',NULL,3,7.00,NULL);
insert  into `menu_line`(`line_id`,`menu_id`,`line_no`,`foodName`,`foodDesc`,`cat_id`,`price`,`picture`) values (8,1,8,'3-in-1',NULL,3,5.00,NULL);
insert  into `menu_line`(`line_id`,`menu_id`,`line_no`,`foodName`,`foodDesc`,`cat_id`,`price`,`picture`) values (9,1,9,'Chips',NULL,3,2.50,NULL);
insert  into `menu_line`(`line_id`,`menu_id`,`line_no`,`foodName`,`foodDesc`,`cat_id`,`price`,`picture`) values (10,2,1,'Cheese Burger',NULL,1,4.99,NULL);

UNLOCK TABLES;

/*Table structure for table `order_line` */

DROP TABLE IF EXISTS `order_line`;

CREATE TABLE `order_line` (
  `order_line_id` int(4) NOT NULL AUTO_INCREMENT,
  `order_id` int(4) NOT NULL,
  `line_no` int(4) NOT NULL,
  `line_id` int(4) DEFAULT NULL,
  `price` decimal(3,2) DEFAULT NULL,
  `quantity` int(4) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`line_no`),
  KEY `order_line_id` (`order_line_id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=latin1;

/*Data for the table `order_line` */

LOCK TABLES `order_line` WRITE;

insert  into `order_line`(`order_line_id`,`order_id`,`line_no`,`line_id`,`price`,`quantity`) values (24,0,0,1,4.99,1);
insert  into `order_line`(`order_line_id`,`order_id`,`line_no`,`line_id`,`price`,`quantity`) values (113,1,1,2,6.00,1);
insert  into `order_line`(`order_line_id`,`order_id`,`line_no`,`line_id`,`price`,`quantity`) values (116,2,1,2,6.00,2);
insert  into `order_line`(`order_line_id`,`order_id`,`line_no`,`line_id`,`price`,`quantity`) values (120,3,1,2,6.00,2);
insert  into `order_line`(`order_line_id`,`order_id`,`line_no`,`line_id`,`price`,`quantity`) values (124,4,1,2,6.00,2);
insert  into `order_line`(`order_line_id`,`order_id`,`line_no`,`line_id`,`price`,`quantity`) values (128,5,1,2,6.00,2);
insert  into `order_line`(`order_line_id`,`order_id`,`line_no`,`line_id`,`price`,`quantity`) values (133,5,2,3,6.00,1);
insert  into `order_line`(`order_line_id`,`order_id`,`line_no`,`line_id`,`price`,`quantity`) values (134,6,1,2,6.00,2);
insert  into `order_line`(`order_line_id`,`order_id`,`line_no`,`line_id`,`price`,`quantity`) values (135,6,2,3,6.00,1);
insert  into `order_line`(`order_line_id`,`order_id`,`line_no`,`line_id`,`price`,`quantity`) values (136,6,3,5,9.20,2);
insert  into `order_line`(`order_line_id`,`order_id`,`line_no`,`line_id`,`price`,`quantity`) values (137,6,4,1,2.50,1);
insert  into `order_line`(`order_line_id`,`order_id`,`line_no`,`line_id`,`price`,`quantity`) values (138,7,1,2,6.00,2);
insert  into `order_line`(`order_line_id`,`order_id`,`line_no`,`line_id`,`price`,`quantity`) values (139,7,2,3,6.00,1);
insert  into `order_line`(`order_line_id`,`order_id`,`line_no`,`line_id`,`price`,`quantity`) values (140,7,3,5,9.20,2);
insert  into `order_line`(`order_line_id`,`order_id`,`line_no`,`line_id`,`price`,`quantity`) values (141,7,4,1,2.50,1);
insert  into `order_line`(`order_line_id`,`order_id`,`line_no`,`line_id`,`price`,`quantity`) values (142,8,1,1,2.50,2);
insert  into `order_line`(`order_line_id`,`order_id`,`line_no`,`line_id`,`price`,`quantity`) values (143,9,1,1,2.50,2);
insert  into `order_line`(`order_line_id`,`order_id`,`line_no`,`line_id`,`price`,`quantity`) values (144,9,2,2,6.00,1);
insert  into `order_line`(`order_line_id`,`order_id`,`line_no`,`line_id`,`price`,`quantity`) values (145,9,3,3,6.00,1);
insert  into `order_line`(`order_line_id`,`order_id`,`line_no`,`line_id`,`price`,`quantity`) values (146,10,1,1,2.50,1);
insert  into `order_line`(`order_line_id`,`order_id`,`line_no`,`line_id`,`price`,`quantity`) values (147,10,2,2,6.00,1);
insert  into `order_line`(`order_line_id`,`order_id`,`line_no`,`line_id`,`price`,`quantity`) values (148,10,3,3,6.00,1);

UNLOCK TABLES;

/*Table structure for table `order_options` */

DROP TABLE IF EXISTS `order_options`;

CREATE TABLE `order_options` (
  `ID` int(6) NOT NULL AUTO_INCREMENT,
  `menu_id` int(6) DEFAULT NULL,
  `line_no` int(6) DEFAULT NULL,
  `value` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `order_options_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `order_options` */

LOCK TABLES `order_options` WRITE;

UNLOCK TABLES;

/*Table structure for table `ordert` */

DROP TABLE IF EXISTS `ordert`;

CREATE TABLE `ordert` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `r_id` int(4) DEFAULT NULL,
  `c_id` int(4) DEFAULT NULL,
  `d_id` int(4) DEFAULT NULL,
  `ord_stat` varchar(10) DEFAULT NULL,
  `total` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `r_id` (`r_id`),
  KEY `c_id` (`c_id`),
  KEY `d_id` (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `ordert` */

LOCK TABLES `ordert` WRITE;

insert  into `ordert`(`ID`,`r_id`,`c_id`,`d_id`,`ord_stat`,`total`) values (1,1,1,NULL,'Pending',22.99);
insert  into `ordert`(`ID`,`r_id`,`c_id`,`d_id`,`ord_stat`,`total`) values (2,1,1,NULL,'Pending',38.90);
insert  into `ordert`(`ID`,`r_id`,`c_id`,`d_id`,`ord_stat`,`total`) values (3,1,1,NULL,'Pending',38.90);
insert  into `ordert`(`ID`,`r_id`,`c_id`,`d_id`,`ord_stat`,`total`) values (4,1,1,NULL,'Pending',38.90);
insert  into `ordert`(`ID`,`r_id`,`c_id`,`d_id`,`ord_stat`,`total`) values (5,1,1,NULL,'Pending',38.90);
insert  into `ordert`(`ID`,`r_id`,`c_id`,`d_id`,`ord_stat`,`total`) values (6,1,1,NULL,'Pending',38.90);
insert  into `ordert`(`ID`,`r_id`,`c_id`,`d_id`,`ord_stat`,`total`) values (7,1,1,NULL,'Pending',38.90);
insert  into `ordert`(`ID`,`r_id`,`c_id`,`d_id`,`ord_stat`,`total`) values (8,1,1,NULL,'Pending',5.00);
insert  into `ordert`(`ID`,`r_id`,`c_id`,`d_id`,`ord_stat`,`total`) values (9,1,1,NULL,'Pending',17.00);
insert  into `ordert`(`ID`,`r_id`,`c_id`,`d_id`,`ord_stat`,`total`) values (10,1,1,NULL,'Pending',14.50);

UNLOCK TABLES;

/*Table structure for table `restaurants` */

DROP TABLE IF EXISTS `restaurants`;

CREATE TABLE `restaurants` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `RName` varchar(20) DEFAULT NULL,
  `Pass` varchar(20) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `address_line_1` varchar(20) DEFAULT NULL,
  `address_line_2` varchar(20) DEFAULT NULL,
  `address_line_3` varchar(20) DEFAULT NULL,
  `zipcode` varchar(8) DEFAULT NULL,
  `PhoneNumber` varchar(10) DEFAULT NULL,
  `menu_id` int(4) DEFAULT NULL,
  `img_path` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `menu_id` (`address_line_2`),
  KEY `menu_id_2` (`menu_id`),
  CONSTRAINT `restaurants_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `restaurants` */

LOCK TABLES `restaurants` WRITE;

insert  into `restaurants`(`ID`,`RName`,`Pass`,`city`,`address_line_1`,`address_line_2`,`address_line_3`,`zipcode`,`PhoneNumber`,`menu_id`,`img_path`) values (1,'Golden Dragon','1234567','Limerick','Golden Road','Castletroy','Co.Limerick','X94 GHP6','0946483608',1,'pics/chinese1.jpg');
insert  into `restaurants`(`ID`,`RName`,`Pass`,`city`,`address_line_1`,`address_line_2`,`address_line_3`,`zipcode`,`PhoneNumber`,`menu_id`,`img_path`) values (2,'Chicken Hut','chicken','Limerick','Silver Road','Castletroy','Co.Limerick','X94 XRT4','0948782838',2,'pics/burger1.jpg');
insert  into `restaurants`(`ID`,`RName`,`Pass`,`city`,`address_line_1`,`address_line_2`,`address_line_3`,`zipcode`,`PhoneNumber`,`menu_id`,`img_path`) values (3,'Poppin Burger','1234567','Limerick','Burger Road','Castletroy','Co.Limerick','X94 GHP6','0946483608',3,'pics/pizza1.jpg');
insert  into `restaurants`(`ID`,`RName`,`Pass`,`city`,`address_line_1`,`address_line_2`,`address_line_3`,`zipcode`,`PhoneNumber`,`menu_id`,`img_path`) values (14,'Pizza Shed','pizza123','','Pizza Road','Castletroy','Co.Limerick','V65 QQ98','0874567891',NULL,NULL);
insert  into `restaurants`(`ID`,`RName`,`Pass`,`city`,`address_line_1`,`address_line_2`,`address_line_3`,`zipcode`,`PhoneNumber`,`menu_id`,`img_path`) values (15,'','',NULL,'','','','','',NULL,NULL);
insert  into `restaurants`(`ID`,`RName`,`Pass`,`city`,`address_line_1`,`address_line_2`,`address_line_3`,`zipcode`,`PhoneNumber`,`menu_id`,`img_path`) values (16,'','',NULL,'','','','','',NULL,NULL);
insert  into `restaurants`(`ID`,`RName`,`Pass`,`city`,`address_line_1`,`address_line_2`,`address_line_3`,`zipcode`,`PhoneNumber`,`menu_id`,`img_path`) values (17,'','',NULL,'','','','','',NULL,NULL);
insert  into `restaurants`(`ID`,`RName`,`Pass`,`city`,`address_line_1`,`address_line_2`,`address_line_3`,`zipcode`,`PhoneNumber`,`menu_id`,`img_path`) values (18,'','',NULL,'','','','','',NULL,NULL);
insert  into `restaurants`(`ID`,`RName`,`Pass`,`city`,`address_line_1`,`address_line_2`,`address_line_3`,`zipcode`,`PhoneNumber`,`menu_id`,`img_path`) values (19,'','',NULL,'','','','','',NULL,NULL);
insert  into `restaurants`(`ID`,`RName`,`Pass`,`city`,`address_line_1`,`address_line_2`,`address_line_3`,`zipcode`,`PhoneNumber`,`menu_id`,`img_path`) values (20,'','',NULL,'','','','','',NULL,NULL);
insert  into `restaurants`(`ID`,`RName`,`Pass`,`city`,`address_line_1`,`address_line_2`,`address_line_3`,`zipcode`,`PhoneNumber`,`menu_id`,`img_path`) values (21,'','',NULL,'','','','','',NULL,NULL);
insert  into `restaurants`(`ID`,`RName`,`Pass`,`city`,`address_line_1`,`address_line_2`,`address_line_3`,`zipcode`,`PhoneNumber`,`menu_id`,`img_path`) values (22,'','',NULL,'','','','','',NULL,NULL);
insert  into `restaurants`(`ID`,`RName`,`Pass`,`city`,`address_line_1`,`address_line_2`,`address_line_3`,`zipcode`,`PhoneNumber`,`menu_id`,`img_path`) values (23,'','',NULL,'','','','','',NULL,NULL);
insert  into `restaurants`(`ID`,`RName`,`Pass`,`city`,`address_line_1`,`address_line_2`,`address_line_3`,`zipcode`,`PhoneNumber`,`menu_id`,`img_path`) values (24,'','',NULL,'','','','','',NULL,NULL);
insert  into `restaurants`(`ID`,`RName`,`Pass`,`city`,`address_line_1`,`address_line_2`,`address_line_3`,`zipcode`,`PhoneNumber`,`menu_id`,`img_path`) values (25,'','',NULL,'','','','','',NULL,NULL);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
