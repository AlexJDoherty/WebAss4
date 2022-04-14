-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 12, 2022 at 01:10 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `Customer_ID` int,
  `FirstName` VARCHAR(20) NOT NULL,
  `LastName` VARCHAR(20) NOT NULL,
  `Street` VARCHAR(40) NOT NULL,
  `City` VARCHAR(40) NOT NULL,
  `Postcode` VARCHAR(20) UNIQUE,
  `Phone` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO customer VALUES (1, "Alex", "Doherty", "25 Richmond Crescent", "Derry", "BT78 T", "07730498876"), 
(2, "Cormac", "Duffy", "15 Everglade Rode", "Derry", "BT78 V", "07734459851"), 
(3, "Owen", "Kelly", "1 Medow Bank", "Derry", "BT78 R", "07713436334"), 
(4, "Ross", "Connolly", "19 Crescent Road", "Derry", "BT78 C", "07707362116"), 
(5, "Ryan", "Featherstone", "67 Creggan Road", "Derry", "BT78 D", "07730498874");

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order_c`;
CREATE TABLE IF NOT EXISTS `order_c` (
  `Order_Number` int,
  `Customer_ID` int NOT NULL,
  `Customer_Name` int(11) NOT NULL,
  `To_street` VARCHAR(40) NOT NULL,
  `To_city` VARCHAR(20) NOT NULL,
  `To_Postcode` int(11) NOT NULL,
  `To_Phone` int(11) NOT NULL,
  `Ship_date` int(11) NOT NULL,
  `Category` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Order_Number`),
  KEY `Customer_ID` (`Customer_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO order_c VALUES (001, 1, "Alex", "25 Richmond Crescent", "Derry", "BT78 T", "07730498874", "14/04/2022", "horror"),
(002, 2, "Cormac", "15 Everglade Rode", "Derry", "BT78 V", "07734459851", "18/04/2022", "comedy"),
(003, 3, "wen", "1 Medow Bank", "Derry", "BT78 R", "07713436334", "18/04/2022", "sify"),
(004, 4, "Ross", "19 Crescent Road", "Derry", "BT78 C", "07707362116", "16/04/2022", "horror"),
(005, 5, "Ryan", "67 Creggan Road", "Derry", "BT78 D", "07730498874", "15/04/2022", "action");


-- --------------------------------------------------------

--
-- Table structure for table `ordering system`
--

DROP TABLE IF EXISTS `ordering_system`;
CREATE TABLE IF NOT EXISTS `ordering_system` (
  `Customer_ID` int,
  `Product_ID` VARCHAR(11) NOT NULL,
  `City` VARCHAR(20) NOT NULL,
  `Postcode` VARCHAR(11) NOT NULL,
  `Ship_date` VARCHAR(11) NOT NULL,
  `Quantity` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO ordering_system VALUES (1, 3001, "Derry", "BT78 T", "14/04/2022", 100),
(2, 3002, "Derry", "BT78 V", "18/04/2022", 7),
(3, 3003, "Derry", "BT78 R", "18/04/2022", 2),
(4, 3004, "Derry", "BT78 C", "16/04/2022", 1),
(5, 3005, "Derry", "BT78 D", "15/04/2022", 5);


-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `Customer_ID` int,
  `Product_ID` VARCHAR(11) NOT NULL,
  `Payment_Type` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

SELECT * FROM `payment`

INSERT INTO payment VALUES (1, 3001, "Book"), (2, 3002, "Book"), (3, 3003, "Book"), (4, 3004, "Book"), (5, 3005, "Book");

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `Product_ID` int,
  `Quantity` VARCHAR(11) NOT NULL,
  `Author_ID` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`Product_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

SELECT INTO product VALUES (3001, 100, 3363),
(3002, 7, 3363),
(3003, 2, 3363),
(3004, 1, 3363),
(3004, 5, 3363);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
CREATE TABLE IF NOT EXISTS `product_category` (
  `Product_ID` int,
  `Category` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Product_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO product_category VALUES (3001, "horror"),
product_category VALUES (3002, "comedy");

-- --------------------------------------------------------

--
-- Table structure for table `reviews of books`
--

DROP TABLE IF EXISTS `reviews_of_books`;
CREATE TABLE IF NOT EXISTS `reviews_of_books` (
  `Customer_ID` int,
  `Product_ID` VARCHAR(11) NOT NULL,
  `Rating` VARCHAR(11) NOT NULL,
  `Field` VARCHAR(11) NOT NULL,
  `Review` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`Customer_ID`),
  KEY `Customer_ID` (`Customer_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO reviews_of_books VALUES (1, 3001, 5/5, "horror", "something about how good the book is"),
(2, 3002, 5/5, "comedy", "something about how funny the book is"),
(3, 3003, 2/5, "sify", "something about how medeoicer the book is"),
(4, 3004, 5/5, "horror", "something about how good the book is"),
(5, 3005, 1/5, "action", "something about how bad the book is");

-- --------------------------------------------------------

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
CREATE TABLE IF NOT EXISTS `shipment` (
  `Shipment_ID` int,
  `Product_ID` VARCHAR(11) NOT NULL,
  `Shipment_date` VARCHAR(11) NOT NULL,
  `Shipment_tracking_number` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Shipment_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO shipment VALUES (6013, 3001, "14/04/2022", 222),
(6014, 3002, "18/04/2022", 223),
(6015, 3003, "18/04/2022", 224),
(6016, 3004, "16/04/2022", 225),
(6017, 3005, "15/04/2022", 226);

-- --------------------------------------------------------

--
-- Table structure for table `shipment_items`
--

DROP TABLE IF EXISTS `shipment_items`;
CREATE TABLE IF NOT EXISTS `shipment_items` (
  `Shipment_ID` int,
  `Product_ID` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`Shipment_ID`),
    KEY `Product_ID` (`Product_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO shipment_items VALUES (6013, 3001),
(6014, 3002),
(6015, 3003),
(6016, 3004),
(6017, 3005);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `Quantity` VARCHAR(11) NOT NULL,
  `Product_ID` int,
  PRIMARY KEY (`Product_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

INSERT INTO stock VALUES (100, 3001),
(7, 3002),
(2, 3003),
(1, 3004),
(5, 3005);

-- --------------------------------------------------------

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
