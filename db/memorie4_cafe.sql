-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 29, 2020 at 01:16 AM
-- Server version: 10.3.23-MariaDB-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `memorie4_cafe`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `userName` varchar(1000) NOT NULL,
  `email` varchar(1000) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `terms` varchar(1000) NOT NULL,
  `privacyPolicy` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `userName`, `email`, `password`, `terms`, `privacyPolicy`) VALUES
(2, 'cdcdc', 'dcdcd', 'cdccd', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `user_mobile` varchar(300) NOT NULL,
  `place_name` varchar(30) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `pay_mode` varchar(1000) NOT NULL,
  `complementary` enum('1','2') DEFAULT NULL,
  `cancelled` enum('0','1') NOT NULL,
  `status` enum('0','1') NOT NULL,
  `reservations` varchar(255) NOT NULL,
  `cost` varchar(1000) NOT NULL,
  `image` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `user_mobile`, `place_name`, `date`, `pay_mode`, `complementary`, `cancelled`, `status`, `reservations`, `cost`, `image`) VALUES
(106, '8375898789', 'Green Hills', '2020-10-27 14:13:54', 'PayUmoney', '1', '0', '0', '2', '700', 'res2.jpg'),
(105, '0837589879', 'Mbui Cafe', '2020-10-27 03:29:28', 'PayUmoney', '1', '0', '0', '3', '1500.0', 'res1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(10000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `description`) VALUES
(1, 'Farm House', 'Farm House.jpg', 'these laces give you the ultimate farm house experience'),
(2, 'Villa', 'Villa.jpg', 'this is what you\'ve been missing out on'),
(3, 'Apartment', 'Apartment.jpg', 'these are the best apartment buildings you can get in the area'),
(4, 'lounge', 'lounge.jpg', 'check out some of our best registered lounges in the region'),
(5, 'cafe', 'cafe.jpg', 'check out some of the best cafes in our assortment of places');

-- --------------------------------------------------------

--
-- Table structure for table `completedFoods`
--

CREATE TABLE `completedFoods` (
  `food_id` int(11) NOT NULL,
  `placeName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foodName` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reservations` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userMobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foodDescription` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `completedFoods`
--

INSERT INTO `completedFoods` (`food_id`, `placeName`, `cost`, `foodName`, `reservations`, `image`, `userMobile`, `foodDescription`, `id`) VALUES
(30, 'Green Hills', '20.0', 'Healthy mexican', '1', 'res1.jpg', '0723942008', 'gwhy not give this bowl of tasty mexican cuisine a shot? it\'s got just the right amount of sugars, minerals, proteins &amp;amp; anti-oxidan', '10'),
(31, 'Green Hills', '20.0', 'Healthy mexican', '1', 'res1.jpg', '0723942008', 'gwhy not give this bowl of tasty mexican cuisine a shot? it\'s got just the right amount of sugars, minerals, proteins &amp;amp; anti-oxidan', '11'),
(32, 'Green Hills', '8.35', 'Low Sugar spanish', '1', 'res2.jpg', '0723942008', 'it is not in vain that this is deemed as one of the tastiest and healthiest. In just a single plate, you\'ll be able to get an unimaginable amount of nutritional value and to add icing on the cake, the taste is not overlooked whatsoever which is even more the reason you should give this a shot', '11'),
(33, 'Green Hills', '20.0', 'Healthy mexican', '1', 'res1.jpg', '0723942008', 'gwhy not give this bowl of tasty mexican cuisine a shot? it\'s got just the right amount of sugars, minerals, proteins &amp;amp; anti-oxidan', '12'),
(34, 'Green Hills', '60.0', 'Healthy mexican', '4', 'res1.jpg', '0723942008', 'gwhy not give this bowl of tasty mexican cuisine a shot? it\'s got just the right amount of sugars, minerals, proteins &amp;amp; anti-oxidan', ''),
(35, 'Green Hills', '17.08', 'badass', '2', 'res1.jpg', '0723942008', 'if there was one word to descrive this, it\'s simply amazing.  this plate of a blend of delicacies will definitely be worth your reservation. give it a try', '13'),
(36, 'Green Hills', '17.08', 'badass', '2', 'res1.jpg', '0723942008', 'if there was one word to descrive this, it\'s simply amazing.  this plate of a blend of delicacies will definitely be worth your reservation. give it a try', '12'),
(37, 'Green Hills', '20.0', 'Healthy mexican', '1', 'res1.jpg', '0723942008', 'gwhy not give this bowl of tasty mexican cuisine a shot? it\'s got just the right amount of sugars, minerals, proteins &amp;amp; anti-oxidan', '12'),
(38, 'Green Hills', '80.4', 'badass', '4', 'res1.jpg', '0723942008', 'this is a blend of different cuisines from our best chefs', '15'),
(39, 'Mbui Cafe', '30.46', 'best mexican cuisine', '4', 'res4.jpg', '0837589879', 'this is mexican', '16'),
(40, 'Green Hills', '80.4', 'badass', '4', 'res1.jpg', '0723942008', 'this is a blend of different cuisines from our best chefs', '17'),
(41, 'Green Hills', '80.4', 'badass', '4', 'res1.jpg', '0723942008', 'this is a blend of different cuisines from our best chefs', '18'),
(42, 'Green Hills', '20.0', 'Healthy mexican', '2', 'res1.jpg', '0723942008', 'gwhy not give this bowl of tasty mexican cuisine a shot? it\'s got just the right amount of sugars, minerals, proteins &amp;amp; anti-oxidan', '18'),
(43, 'Mbui Cafe', '60.92', 'best mexican cuisine', '2', 'res4.jpg', '0723942008', 'this is mexican', '19'),
(44, 'Green Hills', '20.0', 'Healthy mexican', '1', 'res1.jpg', '0723942008', 'gwhy not give this bowl of tasty mexican cuisine a shot? it\'s got just the right amount of sugars, minerals, proteins &amp;amp; anti-oxidan', '20');

-- --------------------------------------------------------

--
-- Table structure for table `cuisine`
--

CREATE TABLE `cuisine` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurants` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cuisine`
--

INSERT INTO `cuisine` (`id`, `name`, `description`, `restaurants`, `image`) VALUES
(1, 'chineese', 'these are the best chineese cuisines', '', ''),
(2, 'mexican', 'check out amazing mexican cuisines', '', ''),
(3, 'spanish', '', '', ''),
(4, 'generic', '', '', ''),
(5, 'vegan', '', '', ''),
(6, 'non-vegan', '', '', ''),
(8, 'indian', '', '', ''),
(9, 'african', '', '', ''),
(10, 'carribean', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `image` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `name`, `image`) VALUES
(1, 'sauna', 'sauna.png'),
(2, 'swimming', 'swimming.png'),
(3, 'Snooker', 'Snooker.png'),
(4, 'Screen Projector', 'Screen Projector.png'),
(5, 'WIFI premises', 'WIFI premises.png'),
(6, 'Car Parking', 'Car Parking.png'),
(7, 'Bike Parking', 'Bike Parking.png'),
(8, 'massage', 'massage.png');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `favorite` varchar(1000) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `user_mobile` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `image`, `favorite`, `name`, `description`, `user_mobile`) VALUES
(1, 'res1.jpg', '1', 'Mbui Cafe', 'this is brief information about my cafe', '0723942008'),
(2, 'res2.jpg', '2', 'Green Hills', 'this is brief information about my cafe', '0837589879');

-- --------------------------------------------------------

--
-- Table structure for table `foodBooking`
--

CREATE TABLE `foodBooking` (
  `id` int(11) NOT NULL,
  `placeName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foodName` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reservations` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userMobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foodDescription` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `foodBooking`
--

INSERT INTO `foodBooking` (`id`, `placeName`, `cost`, `foodName`, `reservations`, `image`, `userMobile`, `foodDescription`) VALUES
(42, 'Mbui Cafe', '60.92', 'best mexican cuisine', '2', 'res4.jpg', '0837589879', 'this is mexican'),
(44, 'Green Hills', '20.0', 'Healthy mexican', '1', 'res1.jpg', '8375898789', 'gwhy not give this bowl of tasty mexican cuisine a shot? it\'s got just the right amount of sugars, minerals, proteins &amp; anti-oxidan'),
(45, 'Green Hills', '8.35', 'Low Sugar spanish', '1', 'res2.jpg', '8375898789', 'it is not in vain that this is deemed as one of the tastiest and healthiest. In just a single plate, you\'ll be able to get an unimaginable amount of nutritional value and to add icing on the cake, the taste is not overlooked whatsoever which is even more the reason you should give this a shot'),
(46, 'Green Hills', '8.54', 'badass', '1', 'res1.jpg', '8375898789', 'if there was one word to descrive this, it\'s simply amazing.  this plate of a blend of delicacies will definitely be worth your reservation. give it a try'),
(47, 'Green Hills', '8.54', 'badass', '1', 'res1.jpg', '8375898789', 'if there was one word to descrive this, it\'s simply amazing.  this plate of a blend of delicacies will definitely be worth your reservation. give it a try');

-- --------------------------------------------------------

--
-- Table structure for table `foodCategories`
--

CREATE TABLE `foodCategories` (
  `category_id` int(11) NOT NULL,
  `type` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `foodCategories`
--

INSERT INTO `foodCategories` (`category_id`, `type`, `category_image`) VALUES
(1, 'Vegetables', 'Vegetables.png'),
(2, 'Grains', 'Grains.png'),
(3, 'Sandwitches', 'Sandwitches.png'),
(4, 'Fruits', 'Fruits.png'),
(5, 'Proteins', 'Proteins.png');

-- --------------------------------------------------------

--
-- Table structure for table `foodReviews`
--

CREATE TABLE `foodReviews` (
  `id` int(11) NOT NULL,
  `user_name` varchar(1000) NOT NULL,
  `user_mobile` varchar(1000) NOT NULL,
  `review` varchar(1000) DEFAULT NULL,
  `rating` varchar(1000) NOT NULL,
  `user_img` varchar(1000) NOT NULL,
  `food_name` varchar(1000) NOT NULL,
  `user_about` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foodReviews`
--

INSERT INTO `foodReviews` (`id`, `user_name`, `user_mobile`, `review`, `rating`, `user_img`, `food_name`, `user_about`) VALUES
(2, 'Patrick Mwangi', '0723942008', 'this is one of the best meals ever', '4', 'profile.jpg', 'Healthy mexican', 'I love trying out new things, visiting new places and having the best time of my life'),
(4, 'Patrick Mwangi', '0723942008', 'this is one of the best meals ever', '4', 'profile.jpg', 'Healthy mexican', 'I love trying out new things, visiting new places and having the best time of my life'),
(5, 'Patrick Mwangi', '0723942008', 'amazing meal man', '3', 'profile.jpg', 'Healthy mexican', 'I love trying out new things, visiting new places and having the best time of my life'),
(6, 'Patrick Mwangi', '0723942008', 'yet again the healthy mexican cuisine stands out.', '3', 'profile.jpg', 'Healthy mexican', 'I love trying out new things, visiting new places and having the best time of my life'),
(7, 'Patrick Mwangi', '0723942008', 'Truth be told, every single cuisine at this place is worth having but for me personally, the mexican cuisines just stand out...give one of these a shot and you won\'t regret it', '4', 'profile.jpg', 'Healthy mexican', 'I love trying out new things, visiting new places and having the best time of my life'),
(8, 'Patrick Mwangi', '0723942008', 'I love it simply because it is out of the box, it\'s delicious, satisfying and most importantly healthy', '1', 'profile.jpg', 'badass', 'I love trying out new things, visiting new places and having the best time of my life'),
(9, 'Patrick Mwangi', '0723942008', 'Truth be told, every single cuisine at this place is worth having but for me personally, the mexican cuisines just stand out...give one of these a shot and you won\'t regret it', '3', 'profile.jpg', 'Healthy mexican', 'I love trying out new things, visiting new places and having the best time of my life'),
(10, 'Patrick Mwangi', '0723942008', 'Just like the services, this is a cuisine to die for...and definitely worth every penny', '4', 'profile.jpg', 'Healthy mexican', 'I love trying out new things, visiting new places and having the best time of my life');

-- --------------------------------------------------------

--
-- Table structure for table `image_list`
--

CREATE TABLE `image_list` (
  `image_id` int(11) NOT NULL,
  `cafe_name` varchar(255) NOT NULL,
  `image_1` varchar(255) NOT NULL,
  `image_2` varchar(255) NOT NULL,
  `image_3` varchar(255) NOT NULL,
  `image_4` varchar(255) NOT NULL,
  `image_5` varchar(255) NOT NULL,
  `image_6` varchar(255) NOT NULL,
  `image_7` varchar(255) NOT NULL,
  `image_8` varchar(255) NOT NULL,
  `image_9` varchar(255) NOT NULL,
  `image_10` varchar(255) NOT NULL,
  `image_11` varchar(255) NOT NULL,
  `image_12` varchar(255) NOT NULL,
  `image_13` varchar(255) NOT NULL,
  `image_14` varchar(255) NOT NULL,
  `image_15` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `image_list`
--

INSERT INTO `image_list` (`image_id`, `cafe_name`, `image_1`, `image_2`, `image_3`, `image_4`, `image_5`, `image_6`, `image_7`, `image_8`, `image_9`, `image_10`, `image_11`, `image_12`, `image_13`, `image_14`, `image_15`) VALUES
(1, 'Mbui Cafe', 'res1.jpg', 'res1.jpg', '', 'res1.jpg', '', '', 'res1.jpg', '', 'res2.jpg', '', '', '', '', '', ''),
(2, 'Green Hills', 'res2.jpg', 'res2.jpg', '', 'res2.jpg', '', '', '', '', '', '', '', '', '', '', ''),
(3, 'Sarova Hotel', 'res3.jpg', 'res3.jpg', '', 'res3.jpg', 'res2.jpg', '', 'res3.jpg', '', 'res3.jpg', '', '', '', '', '', ''),
(4, 'Inter-Continetal', 'res4.jpg', 'res4.jpg', '', 'res4.jpg', '', '', '', 'res5.jpg', '', '', '', '', '', '', ''),
(5, 'Green Stadium', 'res5.jpg', 'res5.jpg', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `name`) VALUES
(1, 'west_delhi'),
(2, 'east_delhi'),
(3, 'north_delhi'),
(4, 'south_delhi'),
(5, 'north_delhi');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(255) NOT NULL,
  `notification` varchar(1000) NOT NULL,
  `dateCreated` datetime NOT NULL DEFAULT current_timestamp(),
  `user_mobile` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `notification`, `dateCreated`, `user_mobile`) VALUES
(2, 'Order status changed', '2020-10-25 22:00:12', '0723942008'),
(3, 'Order status changed', '2020-10-25 22:00:15', '0723942008'),
(4, 'Order status changed', '2020-10-25 22:09:43', '0723942008'),
(5, 'Order status changed', '2020-10-25 15:16:31', '0723942008'),
(6, 'Order status changed', '2020-10-25 15:16:38', '0723942008'),
(9, 'Order status changed', '2020-10-25 17:39:26', '0723942008'),
(10, 'Order status changed', '2020-10-25 17:39:26', '0723942008'),
(11, 'Order status changed', '2020-10-26 00:26:19', '0723942008'),
(12, 'Order status changed', '2020-10-26 01:55:29', '0837589879'),
(13, 'Order status changed', '2020-10-26 01:55:31', '0837589879'),
(14, 'Order status changed', '2020-10-26 01:55:32', '0837589879'),
(15, 'Order status changed', '2020-10-26 01:55:32', '0837589879'),
(16, 'Order status changed', '2020-10-26 01:55:39', '0837589879'),
(17, 'Order status changed', '2020-10-26 01:55:41', '0837589879'),
(18, 'Order status changed', '2020-10-26 11:14:58', '0723942008'),
(19, 'Order status changed', '2020-10-26 11:14:59', '0723942008');

-- --------------------------------------------------------

--
-- Table structure for table `nutrition`
--

CREATE TABLE `nutrition` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `food` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nutrition`
--

INSERT INTO `nutrition` (`id`, `name`, `quantity`, `food`, `restaurant`) VALUES
(1, 'Sugar', '100', 'Healthy mexican', 'Green Hills'),
(2, 'Protein', '20', 'Healthy mexican', 'Green Hills'),
(3, 'Fat', '10', 'Low Sugar spanish', 'Green Hills');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `total` varchar(1000) NOT NULL,
  `status` enum('completed','canceled','order received') NOT NULL,
  `foodTotal` varchar(255) NOT NULL,
  `reservationCost` varchar(1000) NOT NULL,
  `dateCreated` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `reservations` varchar(1000) NOT NULL,
  `payMode` varchar(1000) NOT NULL,
  `user_mobile` varchar(1000) NOT NULL,
  `placeName` varchar(1000) NOT NULL,
  `placeImage` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `total`, `status`, `foodTotal`, `reservationCost`, `dateCreated`, `reservations`, `payMode`, `user_mobile`, `placeName`, `placeImage`) VALUES
(10, '720.0', 'canceled', '20.0', '1', '2020-10-25 06:54:34.574212', '700.0', 'Cash', '0723942008', 'Green Hills', 'res2.jpg'),
(11, '728.35', 'canceled', '28.35', '1', '2020-10-25 06:56:39.240866', '700.0', 'Cash', '0723942008', 'Green Hills', 'res2.jpg'),
(12, '720.0', 'canceled', '20.0', '1', '2020-10-25 07:02:30.408276', '700.0', 'Cash', '0723942008', 'Green Hills', 'res2.jpg'),
(13, '2834.16', 'order received', '34.16', '2', '2020-10-25 17:44:34.495579', '2800.0', 'Cash', '0723942008', 'Green Hills', 'res2.jpg'),
(15, '1021.6', 'canceled', '321.6', '1', '2020-10-26 00:25:41.262239', '700.0', 'Cash', '0723942008', 'Green Hills', 'res2.jpg'),
(16, '8121.84', 'canceled', '121.84', '4', '2020-10-26 01:54:42.376327', '8000.0', 'Cash', '0723942008', 'Green Hills', 'res2.jpg'),
(17, '1021.6', 'order received', '321.6', '1', '2020-10-27 03:00:39.763865', '700.0', 'Cash', '0723942008', 'Green Hills', 'res2.jpg'),
(18, '1061.6', 'order received', '361.6', '1', '2020-10-27 04:12:49.470546', '700.0', 'Cash', '0723942008', 'Green Hills', 'res2.jpg'),
(19, '621.84', 'order received', '121.84', '1', '2020-10-28 04:13:00.485547', '500.0', 'Cash', '0723942008', 'Mbui Cafe', 'res1.jpg'),
(20, '720.0', 'order received', '20.0', '1', '2020-10-28 20:13:36.577717', '700.0', 'PayUMoney', '0723942008', 'Green Hills', 'res2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `placeDetails`
--

CREATE TABLE `placeDetails` (
  `cafe_id` int(11) NOT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `owner_mob` varchar(30) DEFAULT NULL,
  `owner_email` varchar(255) DEFAULT NULL,
  `owner_pass` varchar(255) DEFAULT NULL,
  `cafe_name` varchar(255) DEFAULT NULL,
  `owner_upi` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `service_area` int(11) DEFAULT NULL,
  `facilities` varchar(255) DEFAULT NULL,
  `primary_image` varchar(255) DEFAULT NULL,
  `secondary` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `cuisine` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `category` varchar(1000) NOT NULL,
  `information` varchar(1000) NOT NULL,
  `full_reservation` varchar(1000) NOT NULL,
  `individual_reservation` varchar(1000) NOT NULL,
  `capacity` varchar(1000) NOT NULL,
  `trending` varchar(1000) NOT NULL,
  `popular` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `placeDetails`
--

INSERT INTO `placeDetails` (`cafe_id`, `owner_name`, `owner_mob`, `owner_email`, `owner_pass`, `cafe_name`, `owner_upi`, `location`, `cost`, `description`, `service_area`, `facilities`, `primary_image`, `secondary`, `status`, `cuisine`, `longitude`, `latitude`, `category`, `information`, `full_reservation`, `individual_reservation`, `capacity`, `trending`, `popular`) VALUES
(1, 'patshangala', '0746329405', 'patrickgithinji5@gmail.com', '$2y$10$gywmvaRnMc2z3hlhQiU1VOmz/XbwZ4VFW2wGURcdY82Ad7AdQKVqO', 'Mbui Cafe', 'payments', 'west_delhi', 250, '9.00 AM-09.00 PM Monday-Friday, 9.00 AM-5.00 PM Saturday, Closed on Sundays', 0, 'sauna, swimming, WIFI permises', 'res1.jpg', 'secondary.jpg', 1, 'vegan, indian, mexican, carribean', '36.948107', '-0.440255', 'Farm House', 'We\'re open 24/7 Monday-friday &amp; till noon on weekends &amp; holidays', '8000', '500', '40', 'true', 'true'),
(2, 'Sir Moh', '0723942008', 'patiyang6@gmail@gmail.com', '$2y$10$TVyBgamFnQHODfjo/3C91.I6Xqgwokd6DpJLlfGd08SBfi.qJuc5W', 'Green Hills', 'PayUmoney1', 'east_delhi', 800, '9.00 AM-06.00 PM Monday-Friday, 8.00 AM-6.00 PM Saturday, 9.00 AM-5.00 PM Sundays', 0, 'Snooker, Screen Projector, WIFI permises, Car Parking', 'res2.jpg', 'secondary.jpg', 0, 'generic, spanish, chineese, african', '36.822670', '-1.279865', 'cafe', 'We\'re open 24/7 Monday-friday &amp; till noon on weekends &amp; holidays', '6000', '700', '80', 'false', 'true'),
(3, 'Peter Mwangi', '0723942009', 'test@gmail.com', '$2y$10$6ZnC1.AEDe6qxlBkXOuv6utf61WMF8gNTiMhLnO9vqq8rMu1FLAme', 'Sarova Hotel', 'PayUmoney2', 'north_delhi', 600, '6.00 AM-10.00 PM Monday-Friday, 10.00 AM-5.00 PM Saturday, Closed on Sundays', 0, 'sauna, Screen Projector, WIFI permises, swimming, massage', 'res3.jpg', 'secondary.jpg', 1, 'spanish, mexican, vegan, carribean', '36.071477', '-0.287059', 'villa', 'We\'re open 24/7 Monday-friday &amp; till noon on weekends &amp; holidays', '6700', '350', '70', 'true', 'true'),
(4, 'James Mwirigi', '0723942089', 'test1@gmail.com', '$2y$10$HK9UUuZsMObyazox5PH2..hT4UhSC1CKXV3BGqIcSXFjlKRR1FXXm', 'Inter-Continetal', 'PayUmoney3', 'south_delhi', 450, '9.00 AM-09.00 PM Monday-Friday, 9.00 AM-5.00 PM Saturday & Sunday,', 0, 'sauna, Screen Projector, WIFI permises, Car Parking, Bike Parking, gym', 'res4.jpg', 'secondary.jpg', 0, 'indian, mexican, generic, vegan', '35.267238', '0.518279', 'lounge', 'We\'re open 24/7 Monday-friday', '4000', '200', '60', 'false', 'true'),
(5, 'Deborah Cherop', '0723942079', 'test2@gmail.com', '$2y$10$Kl4Nc9KSVfeiqND44MExVOA8.yxLPxuK.ICG6Vqo2kWO0JwTOq46u', 'Green Stadium', 'PayUmoney4', 'north_delhi', 3400, '9.00 AM-09.00 PM Monday-Friday, 9.00 AM-5.00 PM Saturday, Closed on Sundays', 0, 'sauna, massage, WIFI permises, Car Parking, Bike Parking', 'res5.jpg', 'secondary.jpg', 0, 'spanish, mexican, vegan, non-vegan, african', '35.282775', '-0.362868', 'Apartment', 'We\'re open 24/7 Monday-friday &amp; in the weekends as well', '2000', '80', '500', 'true', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `placeMenu`
--

CREATE TABLE `placeMenu` (
  `menu_id` int(11) NOT NULL,
  `owner_mob` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cuisine` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `food_Image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `food_description` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` enum('true','false') COLLATE utf8mb4_unicode_ci NOT NULL,
  `food_name` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredients` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantityAvailable` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `placeMenu`
--

INSERT INTO `placeMenu` (`menu_id`, `owner_mob`, `cuisine`, `food_Image`, `food_description`, `featured`, `food_name`, `type`, `price`, `ingredients`, `quantityAvailable`) VALUES
(1, '0723942008', 'mexican', 'res1.jpg', 'gwhy not give this bowl of tasty mexican cuisine a shot? it\'s got just the right amount of sugars, minerals, proteins & anti-oxidan', 'true', 'Healthy mexican', 'Grains', '20.00', 'beans, wheat,vegetable oil', '100'),
(2, '0723942008', 'spanish', 'res2.jpg', 'it is not in vain that this is deemed as one of the tastiest and healthiest. In just a single plate, you\'ll be able to get an unimaginable amount of nutritional value and to add icing on the cake, the taste is not overlooked whatsoever which is even more the reason you should give this a shot', 'false', 'Low Sugar spanish', 'Grains', '8.35', 'black barley, red pepper, paprika', '80'),
(3, '0746329405', 'mexican', 'res4.jpg', 'this is mexican', 'true', 'best mexican cuisine', 'Vegetables', '30.46', 'brocolli, cabbages, spinach', '40'),
(4, '0746329405', 'vegan', 'res5.jpg', 'get the best nutritional value from this vegan cuisine while at the same time enjoy excuisite taste', 'true', 'Sugarless for vegans', 'Grains', '45.5', 'millet, buckwheat, barley', '300'),
(5, '0723942009', 'non-vegan', 'res5.jpg', 'it\'s meaty, it\'s tasty and definitely nutritious. enjoy one of our best recipies from the top chefs in the country', 'false', 'Amazing non-vegan cuisine', 'Vegetables', '20.99', 'tomatoes, coriander leaves, lentils', '60'),
(6, '0723942008', 'generic', 'res1.jpg', 'this is a blend of different cuisines from our best chefs', 'true', 'badass', 'Grains', '20.10', 'beans, wheat,vegetable oil', '45'),
(7, '0723942008', 'spanish', 'res1.jpg', 'if there was one word to descrive this, it\'s simply amazing.  this plate of a blend of delicacies will definitely be worth your reservation. give it a try', 'false', 'badass', 'Vegetables', '8.54', 'paprika, guacamole', '50');

-- --------------------------------------------------------

--
-- Table structure for table `placeReviews`
--

CREATE TABLE `placeReviews` (
  `id` int(11) NOT NULL,
  `user_name` varchar(1000) NOT NULL,
  `user_mobile` varchar(1000) NOT NULL,
  `review` varchar(1000) DEFAULT NULL,
  `rating` varchar(1000) NOT NULL,
  `user_img` varchar(1000) NOT NULL,
  `place_name` varchar(1000) NOT NULL,
  `user_about` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `placeReviews`
--

INSERT INTO `placeReviews` (`id`, `user_name`, `user_mobile`, `review`, `rating`, `user_img`, `place_name`, `user_about`) VALUES
(1, 'Patrick Mwangi', '0723942008', 'this is one of the best meals ever', '4', 'profile.jpg', 'Green Hills', 'I love trying out new things, visiting new places and having the best time of my life'),
(2, 'Patrick Mwangi', '0723942008', 'this is one of the best meals ever', '4', 'profile.jpg', 'Green Hills', 'I love trying out new things, visiting new places and having the best time of my life'),
(3, 'Patrick Mwangi', '0723942008', 'this is one of the best meals ever', '4', 'profile.jpg', 'Green Hills', 'I love trying out new things, visiting new places and having the best time of my life'),
(7, 'Patrick Mwangi', '0723942008', 'amazing place to eat', '3', 'profile.jpg', 'Green Hills', 'I love trying out new things, visiting new places and having the best time of my life'),
(8, 'Patrick Mwangi', '0723942008', '', '1', 'profile.jpg', 'Green Hills', 'I love trying out new things, visiting new places and having the best time of my life'),
(9, 'Patrick Mwangi', '0723942008', '', '1', 'profile.jpg', 'Green Hills', 'I love trying out new things, visiting new places and having the best time of my life'),
(10, 'Patrick Mwangi', '0723942008', 'I have been to a lot of restaurants but Green Hills is by far the very best. Not only is the food amazing but the customer service makes every penny worth it', '1', 'profile.jpg', 'Green Hills', 'I love trying out new things, visiting new places and having the best time of my life'),
(11, 'Patrick Mwangi', '0723942008', 'My time in Green Hills was so amazing. the facilities there are great, the customer service amazing and they actually had all my reservations ready when i got there. If you want to get a bang for your buck, this is the place to be', '3', 'profile.jpg', 'Green Hills', 'I love trying out new things, visiting new places and having the best time of my life'),
(12, 'Patrick Mwangi', '0723942008', 'Amazing services, I am definitelyd going to pay a visit to Mbui cafe again. I\'d also recommend that you do try out the different cuisines while enjoying their affordable services', '4', 'profile.jpg', 'Mbui Cafe', 'I love trying out new things, visiting new places and having the best time of my life');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `cafe_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` varchar(30) NOT NULL,
  `product_quant` int(11) NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `set_active` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `user_mobile` int(11) NOT NULL,
  `cafe_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `submitted` datetime NOT NULL DEFAULT current_timestamp(),
  `user_image` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `review` varchar(1000) COLLATE utf32_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_area`
--

CREATE TABLE `service_area` (
  `id` int(11) NOT NULL,
  `area` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` varchar(15) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `cafe_id` varchar(30) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(500) DEFAULT NULL,
  `user_mobile` varchar(150) DEFAULT NULL,
  `user_email` varchar(150) DEFAULT NULL,
  `user_img` varchar(300) DEFAULT NULL,
  `user_address` varchar(1000) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `user_status` enum('0','1') DEFAULT NULL,
  `user_addon` datetime DEFAULT current_timestamp(),
  `user_about` varchar(1000) DEFAULT NULL,
  `card_number` varchar(1000) NOT NULL,
  `card_expiry` varchar(1000) NOT NULL,
  `cvc` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_mobile`, `user_email`, `user_img`, `user_address`, `password`, `user_status`, `user_addon`, `user_about`, `card_number`, `card_expiry`, `cvc`) VALUES
(1, 'Peter Mwangi', '0723942008', 'patiang6@gmail.com', 'jnjn', 'P.O Box 104, Nakuru', '$2y$10$.l3GLwmrqsg49qo5N1Hp8ulvLhqx6UrMKYYKOq2oD449KpPp2IOQm', '0', '2020-10-11 17:37:15', 'test', '1554', '03/21', '511');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `completedFoods`
--
ALTER TABLE `completedFoods`
  ADD PRIMARY KEY (`food_id`);

--
-- Indexes for table `cuisine`
--
ALTER TABLE `cuisine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foodBooking`
--
ALTER TABLE `foodBooking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foodCategories`
--
ALTER TABLE `foodCategories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `foodReviews`
--
ALTER TABLE `foodReviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image_list`
--
ALTER TABLE `image_list`
  ADD PRIMARY KEY (`image_id`),
  ADD UNIQUE KEY `cafe_owner` (`cafe_name`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nutrition`
--
ALTER TABLE `nutrition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `placeDetails`
--
ALTER TABLE `placeDetails`
  ADD PRIMARY KEY (`cafe_id`),
  ADD UNIQUE KEY `owner_name` (`owner_name`,`owner_mob`,`owner_email`,`owner_upi`),
  ADD UNIQUE KEY `cafe_name` (`cafe_name`);

--
-- Indexes for table `placeMenu`
--
ALTER TABLE `placeMenu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `placeReviews`
--
ALTER TABLE `placeReviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_area`
--
ALTER TABLE `service_area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD UNIQUE KEY `user_mobile` (`user_mobile`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `completedFoods`
--
ALTER TABLE `completedFoods`
  MODIFY `food_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `cuisine`
--
ALTER TABLE `cuisine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `foodBooking`
--
ALTER TABLE `foodBooking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `foodCategories`
--
ALTER TABLE `foodCategories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `foodReviews`
--
ALTER TABLE `foodReviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `image_list`
--
ALTER TABLE `image_list`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `nutrition`
--
ALTER TABLE `nutrition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `placeDetails`
--
ALTER TABLE `placeDetails`
  MODIFY `cafe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `placeMenu`
--
ALTER TABLE `placeMenu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `placeReviews`
--
ALTER TABLE `placeReviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
