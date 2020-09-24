-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 27, 2019 at 03:30 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mybdaayy_cafe_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `name`) VALUES
(1, 'patrickgithinji5@gmail.com', 'admin', 'Cafe Booking');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `cafe_name` varchar(30) NOT NULL,
  `date` varchar(15) NOT NULL,
  `pay_mode` varchar(10) NOT NULL,
  `complementary` enum('1','2') DEFAULT NULL,
  `cancelled` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cafe`
--

DROP TABLE IF EXISTS `cafe`;
CREATE TABLE IF NOT EXISTS `cafe` (
  `cafe_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_name` varchar(255) DEFAULT NULL,
  `owner_mob` varchar(30) DEFAULT NULL,
  `owner_email` varchar(255) DEFAULT NULL,
  `owner_pass` varchar(255) DEFAULT NULL,
  `cafe_name` varchar(255) DEFAULT NULL,
  `owner_upi` varchar(255) DEFAULT NULL,
  `location` varchar(255),
  `cafe_cost` int(11) DEFAULT NULL,
  `description` varchar(255),
  `service_area` int(11) DEFAULT NULL,
  `facilities` varchar(255),
  `primary_image` varchar(255),
  `secondary` varchar(255),
  `status` int(11) NOT NULL,
  PRIMARY KEY (`cafe_id`),
  UNIQUE KEY `owner_name` (`owner_name`,`owner_mob`,`owner_email`,`owner_upi`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cafe`
--


-- INSERT INTO `cafe` (`cafe_id`, `owner_name`, `owner_mob`, `owner_email`, `owner_pass`, `cafe_name`, `owner_upi`, `location`, `cafe_cost`, `description`, `service_area`, `facilities`, `primary_image`, `secondary`, `status`) VALUES
-- (1, 'kdjfsdjf', '9999999999', 'test@test.com', 'ehdksjhkfjdshfkh', 'NG,XNV', 'CKVN,CVN', ',VN,', 1, 'NV,', 1, 'Bike Parking,Car Parking,WIFI permises,Screen Projector,', '6882image-lorem-ipsum.png', '8419images.png', 0),
-- (2, 'mbgfsdb', '9999999999', 'test@test.com', 'djfsdjfbdb', 'jfgsdjg', 'jgnsdkj', 'kghsdkjhgkj', 1, 'fjsdfjb', 5, 'Bike Parking,Clean Wash rooms,Snooker,', '1723image-lorem-ipsum.png', '3444images.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `image_list`
--

DROP TABLE IF EXISTS `image_list`;
CREATE TABLE IF NOT EXISTS `image_list` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `cafe_owner` varchar(30) NOT NULL,
  `image_1` varchar(255) NOT NULL,
  `image_2` varchar(255) NOT NULL,
  `image_3` varchar(255),
  `image_4` varchar(255),
  `image_5` varchar(255),
  `image_6` varchar(255),
  `image_7` varchar(255),
  `image_8` varchar(255),
  `image_9` varchar(255),
  `image_10` varchar(255),
  `image_11` varchar(255),
  `image_12` varchar(255),
  `image_13` varchar(255),
  `image_14` varchar(255),
  `image_15` varchar(255),
  PRIMARY KEY (`image_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `image_list`
--

INSERT INTO `image_list` (`image_id`, `cafe_owner`, `image_1`, `image_2`, `image_3`, `image_4`, `image_5`, `image_6`, `image_7`, `image_8`, `image_9`, `image_10`, `image_11`, `image_12`, `image_13`, `image_14`, `image_15`) VALUES
(1, 'Test Owner', '9607image-lorem-ipsum.png', '1484images.png', 'NULL', 'NULL', 'NULL', 'coffee_table.JPG', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL'),
(3, 'Sample', '7653Kanakadurga_Temple_gopuram - Copy.jpg', '4987lorem_ipsum - Copy.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Test Owner', '7171images.png', '8712lorem_ipsum - Copy.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'kdjfsdjf', '6882image-lorem-ipsum.png', '8419images.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'mbgfsdb', '1723image-lorem-ipsum.png', '3444images.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `cafe_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` varchar(30) NOT NULL,
  `product_quant` int(11) NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `set_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `cafe_id`, `product_name`, `product_price`, `product_quant`, `product_image`, `set_active`) VALUES
(1, 1, 'Test', '1000', 20, '1087image-lorem-ipsum.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `cafe_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `submitted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_area`
--

DROP TABLE IF EXISTS `service_area`;
CREATE TABLE IF NOT EXISTS `service_area` (
  `id` int(11) NOT NULL,
  `area` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_area`
--

INSERT INTO `service_area` (`id`, `area`, `status`) VALUES
(1, 'North Delhi', '1'),
(2, 'South Delhi', '2'),
(3, 'Central Delhi', '1'),
(4, 'East Delhi', '1'),
(5, 'West Delhi', '2');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `transaction_id` varchar(15) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `cafe_id` varchar(30) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` varchar(30) NOT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(500) DEFAULT NULL,
  `user_mobile` varchar(150) DEFAULT NULL,
  `user_email` varchar(150) DEFAULT NULL,
  `user_img` varchar(300) DEFAULT NULL,
  `user_address` varchar(1000) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_status` enum('0','1') DEFAULT NULL,
  `user_addon` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
