-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2022 at 05:43 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uniproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `Bus_no` int NOT NULL AUTO_INCREMENT,
  `Bus_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Bus_category` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `bfrom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `To` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Seat_status` int(2) NOT NULL,
  PRIMARY KEY (Bus_no)
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bus`
--


INSERT INTO `bus` ( `Bus_name`, `Bus_category`, `bfrom`, `To`, `Seat_status`) VALUES
( 'Green Line Paribahan', 'Business', 'Dhaka', 'Cox\'s Bazar', 42),
( 'Green Line Paribahan', 'Business', 'Dhaka', 'Sylhet', 44),
( 'Green Line Paribahan', 'Business', 'Dhaka', 'Bandarban', 46),
( 'Green Line Paribahan', 'Economy', 'Dhaka', 'Cox\'s Bazar', 42),
( 'Green Line Paribahan', 'Economy', 'Dhaka', 'Sylhet', 44),
( 'Green Line Paribahan', 'Economy', 'Dhaka', 'Bandarban', 46),
( 'Green Line Paribahan', 'Business', 'Cox\'s Bazar', 'Sylhet', 42),
( 'Green Line Paribahan', 'Business', 'Cox\'s Bazar', 'Dhaka', 44),
( 'Green Line Paribahan', 'Business', 'Cox\'s Bazar', 'Bandarban', 46),
( 'Green Line Paribahan', 'Economy', 'Cox\'s Bazar', 'Sylhet', 42),
( 'Green Line Paribahan', 'Economy', 'Cox\'s Bazar', 'Dhaka', 44),
( 'Green Line Paribahan', 'Economy', 'Cox\'s Bazar', 'Bandarban', 46),
( 'Green Line Paribahan', 'Business', 'Sylhet', 'Cox\'s Bazar', 42),
( 'Green Line Paribahan', 'Business', 'Sylhet', 'Dhaka', 44),
( 'Green Line Paribahan', 'Business', 'Sylhet', 'Bandarban', 46),
( 'Green Line Paribahan', 'Economy', 'Sylhet', 'Cox\'s Bazar', 42),
( 'Green Line Paribahan', 'Economy', 'Sylhet', 'Dhaka', 44),
( 'Green Line Paribahan', 'Economy', 'Sylhet', 'Bandarban', 46),
( 'Green Line Paribahan', 'Business', 'Bandarban', 'Cox\'s Bazar', 42),
( 'Green Line Paribahan', 'Business', 'Bandarban', 'Dhaka', 44),
( 'Green Line Paribahan', 'Business', 'Bandarban', 'Sylhet', 46),
( 'Green Line Paribahan', 'Economy', 'Bandarban', 'Cox\'s Bazar', 42),
( 'Green Line Paribahan', 'Economy', 'Bandarban', 'Dhaka', 44),
( 'Green Line Paribahan', 'Economy', 'Bandarban', 'Sylhet', 46),
( 'TR Travels', 'Business', 'Dhaka', 'Cox\'s Bazar', 42),
( 'TR Travels', 'Business', 'Dhaka', 'Sylhet', 44),
( 'TR Travels', 'Business', 'Dhaka', 'Bandarban', 46),
( 'TR Travels', 'Economy', 'Dhaka', 'Cox\'s Bazar', 42),
( 'TR Travels', 'Economy', 'Dhaka', 'Sylhet', 44),
( 'TR Travels', 'Economy', 'Dhaka', 'Bandarban', 46),
( 'TR Travels', 'Business', 'Cox\'s Bazar', 'Sylhet', 42),
( 'TR Travels', 'Business', 'Cox\'s Bazar', 'Dhaka', 44),
( 'TR Travels', 'Business', 'Cox\'s Bazar', 'Bandarban', 46),
( 'TR Travels', 'Economy', 'Cox\'s Bazar', 'Sylhet', 42),
( 'TR Travels', 'Economy', 'Cox\'s Bazar', 'Dhaka', 44),
( 'TR Travels', 'Economy', 'Cox\'s Bazar', 'Bandarban', 46),
( 'TR Travels', 'Business', 'Sylhet', 'Cox\'s Bazar', 42),
( 'TR Travels', 'Business', 'Sylhet', 'Dhaka', 44),
( 'TR Travels', 'Business', 'Sylhet', 'Bandarban', 46),
( 'TR Travels', 'Economy', 'Sylhet', 'Cox\'s Bazar', 42),
( 'TR Travels', 'Economy', 'Sylhet', 'Dhaka', 44),
( 'TR Travels', 'Economy', 'Sylhet', 'Bandarban', 46),
( 'TR Travels', 'Business', 'Bandarban', 'Cox\'s Bazar', 42),
( 'TR Travels', 'Business', 'Bandarban', 'Dhaka', 44),
( 'TR Travels', 'Business', 'Bandarban', 'Sylhet', 46),
( 'TR Travels', 'Economy', 'Bandarban', 'Cox\'s Bazar', 42),
( 'TR Travels', 'Economy', 'Bandarban', 'Dhaka', 44),
( 'TR Travels', 'Economy', 'Bandarban', 'Sylhet', 46);




-- --------------------------------------------------------

--
-- Table structure for table `payment_history`
--

CREATE TABLE `payment_history` (
  `serial` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `vehicle_name` varchar(50) NOT NULL,
  `vehicle_type` varchar(50) NOT NULL,
  `vfrom` varchar(50) NOT NULL,
  `vto` varchar(50) NOT NULL,
  `total_ticket` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_history`
--

INSERT INTO `payment_history` (`serial`, `username`, `vehicle_name`, `vehicle_type`, `vfrom`, `vto`, `total_ticket`) VALUES
(4, 'Rock', 'Green Line Paribahan', 'Business', 'Dhaka', 'Cox\'s Bazar', 2),
(5, 'Fahim Ahmed', 'TR Travels', 'Economy', 'Dhaka', 'Cox\'s Bazar', 2),
(7, 'Fahim Ahmed', 'TR Travels', 'Business', 'Dhaka', 'Cox\'s Bazar', 3),
(8, 'Rock', 'TR Travels', 'Economy', 'Dhaka', 'Cox\'s Bazar', 3),
(9, 'Rock', 'Subarna Express', 'First Class', 'Dhaka', 'Cox\'s Bazar', 10);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_info`
--

CREATE TABLE `ticket_info` (
  `Type` varchar(50) NOT NULL,
  `Price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket_info`
--

INSERT INTO `ticket_info` (`Type`, `Price`) VALUES
('Business', 1200),
('Economy', 900),
('First Class', 1100),
('Second Class', 460);

-- --------------------------------------------------------

--
-- Table structure for table `train`
--

CREATE TABLE `train` (
  `Train_no` int NOT NULL AUTO_INCREMENT,
  `Train_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Train_class` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tfrom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `To` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Seat_status` int(10) NOT NULL,
  PRIMARY KEY (Train_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `train`
--

INSERT INTO `train` (`Train_name`, `Train_class`, `tfrom`, `To`, `Seat_status`) VALUES
( 'Karnafuli Express', 'First class', 'Dhaka', 'Cox\'s Bazar', 42),
( 'Karnafuli Express', 'First class', 'Dhaka', 'Sylhet', 44),
( 'Karnafuli Express', 'First class', 'Dhaka', 'Bandarban', 46),
( 'Karnafuli Express', 'Second class', 'Dhaka', 'Cox\'s Bazar', 42),
( 'Karnafuli Express', 'Second class', 'Dhaka', 'Sylhet', 44),
( 'Karnafuli Express', 'Second class', 'Dhaka', 'Bandarban', 46),
( 'Karnafuli Express', 'First class', 'Cox\'s Bazar', 'Sylhet', 42),
( 'Karnafuli Express', 'First class', 'Cox\'s Bazar', 'Dhaka', 44),
( 'Karnafuli Express', 'First class', 'Cox\'s Bazar', 'Bandarban', 46),
( 'Karnafuli Express', 'Second class', 'Cox\'s Bazar', 'Sylhet', 42),
( 'Karnafuli Express', 'Second class', 'Cox\'s Bazar', 'Dhaka', 44),
( 'Karnafuli Express', 'Second class', 'Cox\'s Bazar', 'Bandarban', 46),
( 'Karnafuli Express', 'First class', 'Sylhet', 'Cox\'s Bazar', 42),
( 'Karnafuli Express', 'First class', 'Sylhet', 'Dhaka', 44),
( 'Karnafuli Express', 'First class', 'Sylhet', 'Bandarban', 46),
( 'Karnafuli Express', 'Second class', 'Sylhet', 'Cox\'s Bazar', 42),
( 'Karnafuli Express', 'Second class', 'Sylhet', 'Dhaka', 44),
( 'Karnafuli Express', 'Second class', 'Sylhet', 'Bandarban', 46),
( 'Karnafuli Express', 'First class', 'Bandarban', 'Cox\'s Bazar', 42),
( 'Karnafuli Express', 'First class', 'Bandarban', 'Dhaka', 44),
( 'Karnafuli Express', 'First class', 'Bandarban', 'Sylhet', 46),
( 'Karnafuli Express', 'Second class', 'Bandarban', 'Cox\'s Bazar', 42),
( 'Karnafuli Express', 'Second class', 'Bandarban', 'Dhaka', 44),
( 'Karnafuli Express', 'Second class', 'Bandarban', 'Sylhet', 46),
( 'Subarna Express', 'First class', 'Dhaka', 'Cox\'s Bazar', 42),
( 'Subarna Express', 'First class', 'Dhaka', 'Sylhet', 44),
( 'Subarna Express', 'First class', 'Dhaka', 'Bandarban', 46),
( 'Subarna Express', 'Second class', 'Dhaka', 'Cox\'s Bazar', 42),
( 'Subarna Express', 'Second class', 'Dhaka', 'Sylhet', 44),
( 'Subarna Express', 'Second class', 'Dhaka', 'Bandarban', 46),
( 'Subarna Express', 'First class', 'Cox\'s Bazar', 'Sylhet', 42),
( 'Subarna Express', 'First class', 'Cox\'s Bazar', 'Dhaka', 44),
( 'Subarna Express', 'First class', 'Cox\'s Bazar', 'Bandarban', 46),
( 'Subarna Express', 'Second class', 'Cox\'s Bazar', 'Sylhet', 42),
( 'Subarna Express', 'Second class', 'Cox\'s Bazar', 'Dhaka', 44),
( 'Subarna Express', 'Second class', 'Cox\'s Bazar', 'Bandarban', 46),
( 'Subarna Express', 'First class', 'Sylhet', 'Cox\'s Bazar', 42),
( 'Subarna Express', 'First class', 'Sylhet', 'Dhaka', 44),
( 'Subarna Express', 'First class', 'Sylhet', 'Bandarban', 46),
( 'Subarna Express', 'Second class', 'Sylhet', 'Cox\'s Bazar', 42),
( 'Subarna Express', 'Second class', 'Sylhet', 'Dhaka', 44),
( 'Subarna Express', 'Second class', 'Sylhet', 'Bandarban', 46),
( 'Subarna Express', 'First class', 'Bandarban', 'Cox\'s Bazar', 42),
( 'Subarna Express', 'First class', 'Bandarban', 'Dhaka', 44),
( 'Subarna Express', 'First class', 'Bandarban', 'Sylhet', 46),
( 'Subarna Express', 'Second class', 'Bandarban', 'Cox\'s Bazar', 42),
( 'Subarna Express', 'Second class', 'Bandarban', 'Dhaka', 44),
( 'Subarna Express', 'Second class', 'Bandarban', 'Sylhet', 46);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(2) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `confirm_password` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `phone_number`, `age`, `email`, `password`, `confirm_password`) VALUES
('ahad', '01221551656', 33, 'ahad@gmail.com', 'ahad123', 'ahad123'),
('Fahim Ahmed', '01724718500', 24, 'kuddusisman10@gmail.com', '121212', '121212'),
('farin', '01745033559', 22, 'farin@gmail.com', 'farin123', 'farin123'),
('fahad', '01771551656', 22, 'fahadislam887@gmail.com', 'fahad123', 'fahad123'),
('dip', '01771661656', 24, 'dip@gmail.com', 'dip123', 'dip123'),
('Rock', '01794047277', 12, 'khandakar1+h13@yandex.com', '123456', '123456');

-- Table structure for resorts

CREATE TABLE `resorts` (
  `resort_no` int NOT NULL AUTO_INCREMENT,
  `resort_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `resort_location` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `total_rooms` int(4) NOT NULL,
  `rooms_empty` int(4) NOT NULL,
   PRIMARY KEY (resort_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


 -- dumping data into resorts

INSERT INTO `resorts` ( `resort_name`, `resort_location`, `total_rooms`, `rooms_empty`) VALUES
('Sayeman Beach Resort', 'Cox\'s Bazar', 33, 33),
('Mermaid Beach Resort', 'Cox\'s Bazar', 20, 20),
('Palm Riviera', 'Cox\'s Bazar', 18, 18),
('Doreen Hotels & Resorts', 'Dhaka', 33, 33),
('La Riveria Resort & Park', 'Dhaka', 20, 20),
('Dhaka Regency Hotel & Resort', 'Dhaka', 18, 18),
('Nazimgarh Garden Resort', 'Sylhet', 33, 33),
('Balishira Resort', 'Sylhet', 20, 20),
('Shuktara Nature Retreat', 'Sylhet', 18, 18),
('Sairu Hill Resort', 'Bandarban', 33, 33),
('Nilachol Nilambori Resort', 'Bandarban', 20, 20),
('Labah Tong Hill Resort Ltd.', 'Bandarban', 18, 18);


CREATE TABLE `resort_payment_history` (
  `serial` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `payment` varchar(50) NOT NULL,
  `resort_name` varchar(50) NOT NULL,
  `package` varchar(50) NOT NULL,
  `vfrom` varchar(50) NOT NULL,
  `vto` varchar(50) NOT NULL,
PRIMARY KEY (serial)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus`
--
-- ALTER TABLE `bus`
--   ADD PRIMARY KEY (`Bus_no`);

--
-- Indexes for table `payment_history`
--
ALTER TABLE `payment_history`
  ADD PRIMARY KEY (`serial`);

--
-- Indexes for table `ticket_info`
--
ALTER TABLE `ticket_info`
  ADD PRIMARY KEY (`Type`);

--
-- Indexes for table `train`
--
-- ALTER TABLE `train`
--   ADD PRIMARY KEY (`Train_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`phone_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `payment_history`
--
ALTER TABLE `payment_history`
  MODIFY `serial` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
