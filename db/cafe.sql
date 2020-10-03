-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 03, 2020 at 11:54 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cafe`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `name` varchar(100) NOT NULL
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

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `cafe_name` varchar(30) NOT NULL,
  `date` varchar(15) NOT NULL,
  `pay_mode` varchar(10) NOT NULL,
  `complementary` enum('1','2') DEFAULT NULL,
  `cancelled` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
(1, 'Farm House', 'Farm House.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam massa arcu, ornare quis efficitur nec, eleifend in velit. Pellentesque eu odio viverra, cursus nunc et, bibendum dui. Morbi feugiat in neque id maximus. Praesent quis metus sed ante dignissim hendrerit fringilla tincidunt diam. Nullam convallis gravida faucibus. Suspendisse potenti. Praesent ultricies congue arcu, eu fermentum lorem malesuada in. Vestibulum molestie cursus tellus in condimentum.'),
(2, 'Villa', 'Villa.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam massa arcu, ornare quis efficitur nec, eleifend in velit. Pellentesque eu odio viverra, cursus nunc et, bibendum dui. Morbi feugiat in neque id maximus. Praesent quis metus sed ante dignissim hendrerit fringilla tincidunt diam. Nullam convallis gravida faucibus. Suspendisse potenti. Praesent ultricies congue arcu, eu fermentum lorem malesuada in. Vestibulum molestie cursus tellus in condimentum.'),
(3, 'Apartment', 'Apartment.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam massa arcu, ornare quis efficitur nec, eleifend in velit. Pellentesque eu odio viverra, cursus nunc et, bibendum dui. Morbi feugiat in neque id maximus. Praesent quis metus sed ante dignissim hendrerit fringilla tincidunt diam. Nullam convallis gravida faucibus. Suspendisse potenti. Praesent ultricies congue arcu, eu fermentum lorem malesuada in. Vestibulum molestie cursus tellus in condimentum.'),
(4, 'lounge', 'lounge.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam massa arcu, ornare quis efficitur nec, eleifend in velit. Pellentesque eu odio viverra, cursus nunc et, bibendum dui. Morbi feugiat in neque id maximus. Praesent quis metus sed ante dignissim hendrerit fringilla tincidunt diam. Nullam convallis gravida faucibus. Suspendisse potenti. Praesent ultricies congue arcu, eu fermentum lorem malesuada in. Vestibulum molestie cursus tellus in condimentum.'),
(5, 'cafe', 'cafe.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam massa arcu, ornare quis efficitur nec, eleifend in velit. Pellentesque eu odio viverra, cursus nunc et, bibendum dui. Morbi feugiat in neque id maximus. Praesent quis metus sed ante dignissim hendrerit fringilla tincidunt diam. Nullam convallis gravida faucibus. Suspendisse potenti. Praesent ultricies congue arcu, eu fermentum lorem malesuada in. Vestibulum molestie cursus tellus in condimentum.');

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
(1, 'mexican', 'this is just mexican meal', 'Owner One name', ''),
(2, 'indian', 'this is indian food', 'Owner Two cafe, Owner One name, mbui', ''),
(3, 'traditional', 'traditional', 'shirikisho, mbui, Owner One name', ''),
(4, 'ethiopian', 'ethiopian', 'mbui, shirikisho', ''),
(5, 'chineese', 'chineese', 'mbui, shirikisho', ''),
(6, 'spanish', 'spanish', 'shirikisho, Owner Two cafe', '');

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
(1, 'swimming', ''),
(2, 'Car Parking', ''),
(3, 'WIFI permises', ''),
(4, 'Snooker', ''),
(5, 'Bike Parking', ''),
(6, 'Screen Projector', '');

-- --------------------------------------------------------

--
-- Table structure for table `image_list`
--

CREATE TABLE `image_list` (
  `image_id` int(11) NOT NULL,
  `cafe_owner` varchar(255) NOT NULL,
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

INSERT INTO `image_list` (`image_id`, `cafe_owner`, `image_1`, `image_2`, `image_3`, `image_4`, `image_5`, `image_6`, `image_7`, `image_8`, `image_9`, `image_10`, `image_11`, `image_12`, `image_13`, `image_14`, `image_15`) VALUES
(1, 'patrick', '9607image-lorem-ipsum.png', '1484images.png', '', '', '', 'coffee_table.JPG', '', '', '', '', '', '', '', '', ''),
(3, 'Owner one', '7653Kanakadurga_Temple_gopuram - Copy.jpg', '4987lorem_ipsum - Copy.jpg', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(4, 'Owner two', '7171images.png', '8712lorem_ipsum - Copy.jpg', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(5, 'peter', '6882image-lorem-ipsum.png', '8419images.png', '', '', '', '', '', '', '', '', '', '', '', '', '');

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
(1, 'Western Delhi'),
(2, 'Central Delhi'),
(3, 'North Delhi'),
(4, 'South Delhi');

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
  `cafe_cost` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `service_area` int(11) DEFAULT NULL,
  `facilities` varchar(255) DEFAULT NULL,
  `primary_image` varchar(255) DEFAULT NULL,
  `secondary` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `cuisine` varchar(255) NOT NULL,
  `longitude` varchar(1000) NOT NULL,
  `latitude` varchar(1000) NOT NULL,
  `category` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `placeDetails`
--

INSERT INTO `placeDetails` (`cafe_id`, `owner_name`, `owner_mob`, `owner_email`, `owner_pass`, `cafe_name`, `owner_upi`, `location`, `cafe_cost`, `description`, `service_area`, `facilities`, `primary_image`, `secondary`, `status`, `cuisine`, `longitude`, `latitude`, `category`) VALUES
(1, 'Owner one', '9999999999', 'test@test.com', '111111', 'Owner One name', 'CKVN,CVN', 'Western Delhi', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac condimentum dolor, ac faucibus est. Curabitur dictum pulvinar mi, ut fermentum sapien aliquet at. Nullam lacinia nulla vel mollis vehicula. Mauris ac dui quam. Phasellus risus ex, luctus id tortor sit amet, pharetra ultricies nibh. Phasellus vitae ante bibendum, luctus erat nec, semper sapien. Phasellus vulputate est sed mauris euismod, at finibus dolor faucibus. Aenean at mauris sit amet mi interdum rhoncus. Nunc sit amet tincidunt arcu. ', 1, 'Bike Parking, Car Parking, WIFI permises, Screen Projector', 'res5.jpg', 'res5.jpg', 0, 'ethiopian, chineese', ' 36.891416', '-1.206585', 'Farm House'),
(2, 'Owner two', '9999999999', 'test@test.com', '111111', 'Owner Two cafe', 'jgnsdkj', 'Central Delhi', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac condimentum dolor, ac faucibus est. Curabitur dictum pulvinar mi, ut fermentum sapien aliquet at. Nullam lacinia nulla vel mollis vehicula. Mauris ac dui quam. Phasellus risus ex, luctus id tortor sit amet, pharetra ultricies nibh. Phasellus vitae ante bibendum, luctus erat nec, semper sapien. Phasellus vulputate est sed mauris euismod, at finibus dolor faucibus. Aenean at mauris sit amet mi interdum rhoncus. Nunc sit amet tincidunt arcu. ', 5, 'Bike Parking, Clean Wash rooms, Snooker', 'res4.jpg', 'res4.jpg', 0, 'mexican, indian', ' 36.936050', '-0.421931', 'Villa'),
(3, 'patrick', '0723942008', 'patrickgithinji5@gmail.com', 'admin', 'Mbui', '125478', 'North Delhi', 12, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac condimentum dolor, ac faucibus est. Curabitur dictum pulvinar mi, ut fermentum sapien aliquet at. Nullam lacinia nulla vel mollis vehicula. Mauris ac dui quam. Phasellus risus ex, luctus id tortor sit amet, pharetra ultricies nibh. Phasellus vitae ante bibendum, luctus erat nec, semper sapien. Phasellus vulputate est sed mauris euismod, at finibus dolor faucibus. Aenean at mauris sit amet mi interdum rhoncus. Nunc sit amet tincidunt arcu. ', 2, 'Bike Parking, WIFI permises, Screen Projector, Clean Wash rooms, Snooker', '9810res2.jpg', '3053res5.jpg', 0, 'indian, chineese', '36.965232', ' -0.393554', 'Apartment'),
(4, 'peter', '0723942008', 'patiyang6@gmail.com', '111111', 'Shirikisho', '425', 'South Delhi', 400, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac condimentum dolor, ac faucibus est. Curabitur dictum pulvinar mi, ut fermentum sapien aliquet at. Nullam lacinia nulla vel mollis vehicula. Mauris ac dui quam. Phasellus risus ex, luctus id tortor sit amet, pharetra ultricies nibh. Phasellus vitae ante bibendum, luctus erat nec, semper sapien. Phasellus vulputate est sed mauris euismod, at finibus dolor faucibus. Aenean at mauris sit amet mi interdum rhoncus. Nunc sit amet tincidunt arcu. ', 3, 'swimming, cafe, massage, sauna', '9810res2.jpg', '9810res2.jpg', 1, 'indian, chineese, traditional, ethiopian, generic', '36.955411', '-0.413851', 'lounge');

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

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `cafe_id`, `product_name`, `product_price`, `product_quant`, `product_image`, `set_active`) VALUES
(1, 1, 'Test', '1000', 20, '1087image-lorem-ipsum.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cafe_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `submitted` datetime NOT NULL DEFAULT current_timestamp()
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
  `user_addon` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_mobile`, `user_email`, `user_img`, `user_address`, `password`, `user_status`, `user_addon`) VALUES
(4, 'Peter Mwangi', '0723942008', 'patiyang6@gmail.com', 'profile.jpg', '', '$2y$10$dOLo/wmDA8MHu2duWLE.cOEVBhlFqrancWEi4CNgrTHs5Ibk8g.1a', '0', '2020-10-02 09:12:07'),
(5, 'patrick githinji', '0789816445', 'testUser@gmail.com', 'testUser.jpg', '', '$2y$10$0gyT34.SPnF60DcLM6uhbOyoz9uD0Eq4/cnf.8zO9XRvouO/gcC7S', '0', '2020-10-02 16:14:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`email`);

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
-- Indexes for table `image_list`
--
ALTER TABLE `image_list`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `placeDetails`
--
ALTER TABLE `placeDetails`
  ADD PRIMARY KEY (`cafe_id`),
  ADD UNIQUE KEY `owner_name` (`owner_name`,`owner_mob`,`owner_email`,`owner_upi`);

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
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cuisine`
--
ALTER TABLE `cuisine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `image_list`
--
ALTER TABLE `image_list`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `placeDetails`
--
ALTER TABLE `placeDetails`
  MODIFY `cafe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
