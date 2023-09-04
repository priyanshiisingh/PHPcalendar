-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2023 at 09:18 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `calendar_eg`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `category_color` varchar(20) DEFAULT NULL,
  `category_bg` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_color`, `category_bg`) VALUES
(1, 'Festive Holidays', 'white', '#D62246'),
(2, 'Working Saturdays', '#000000', '#FFFC41'),
(3, 'IT Department', 'white', '#F03716'),
(4, 'VAT Department', 'white', '#A730F1'),
(5, 'Year End Department', 'white', '#46CC4B'),
(6, 'Payroll Department', 'white', '#30CFF2'),
(7, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `evt_id` bigint(20) NOT NULL,
  `evt_start` date NOT NULL,
  `evt_end` date NOT NULL,
  `evt_text` text NOT NULL,
  `evt_color` varchar(7) NOT NULL,
  `evt_bg` varchar(7) NOT NULL,
  `evt_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`evt_id`, `evt_start`, `evt_end`, `evt_text`, `evt_color`, `evt_bg`, `evt_category`) VALUES
(1, '2024-03-10', '2024-03-10', 'Holi', 'white', '#D62246', 2),
(2, '2024-08-15', '2024-08-15', 'Independence Day', 'white', '#D62246', 2),
(3, '2024-08-29', '2024-08-29', 'Raksha Bandhan', 'white', '#D62246', 2),
(4, '2024-09-20', '2024-09-20', 'Ganesh Chaturthi', 'white', '#D62246', 2),
(5, '2024-10-25', '2024-10-25', 'Dusherra', 'white', '#D62246', 2),
(6, '2024-11-14', '2024-11-14', 'Diwali', 'white', '#D62246', 2),
(7, '2023-01-07', '2023-01-07', 'Working Saturday', '#000000', '#FFFC41', 3),
(8, '2023-01-21', '2023-01-21', 'Working Saturday', '#000000', '#FFFC41', 3),
(9, '2023-02-04', '2023-02-04', 'Working Saturday', '#000000', '#FFFC41', 3),
(10, '2023-02-18', '2023-02-18', 'Working Saturday', '#000000', '#FFFC41', 3),
(11, '2023-03-04', '2023-03-04', 'Working Saturday', '#000000', '#FFFC41', 3),
(12, '2023-03-18', '2023-03-18', 'Working Saturday', '#000000', '#FFFC41', 3),
(13, '2023-04-01', '2023-04-01', 'Working Saturday', '#000000', '#FFFC41', 3),
(14, '2023-04-15', '2023-04-15', 'Working Saturday', '#000000', '#FFFC41', 3),
(15, '2023-04-29', '2023-04-29', 'Working Saturday', '#000000', '#FFFC41', 3),
(16, '2023-05-13', '2023-05-13', 'Working Saturday', '#000000', '#FFFC41', 3),
(17, '2023-05-27', '2023-05-27', 'Working Saturday', '#000000', '#FFFC41', 3),
(18, '2023-06-10', '2023-06-10', 'Working Saturday', '#000000', '#FFFC41', 3),
(19, '2023-06-24', '2023-06-24', 'Working Saturday', '#000000', '#FFFC41', 3),
(20, '2023-07-08', '2023-07-08', 'Working Saturday', '#000000', '#FFFC41', 3),
(21, '2023-07-22', '2023-07-22', 'Working Saturday', '#000000', '#FFFC41', 3),
(23, '2023-08-19', '2023-08-19', 'Working Saturday', '#000000', '#FFFC41', 3),
(24, '2023-09-02', '2023-09-02', 'Working Saturday', '#000000', '#FFFC41', 3),
(25, '2023-09-16', '2023-09-16', 'Working Saturday', '#000000', '#FFFC41', 3),
(26, '2023-09-30', '2023-09-30', 'Working Saturday', '#000000', '#FFFC41', 3),
(27, '2023-10-14', '2023-10-14', 'Working Saturday', '#000000', '#FFFC41', 3),
(28, '2023-10-28', '2023-10-28', 'Working Saturday', '#000000', '#FFFC41', 3),
(29, '2023-11-11', '2023-11-11', 'Working Saturday', '#000000', '#FFFC41', 3),
(30, '2023-11-25', '2023-11-25', 'Working Saturday', '#000000', '#FFFC41', 3),
(31, '2023-12-09', '2023-12-09', 'Working Saturday', '#000000', '#FFFC41', 3),
(32, '2023-12-23', '2023-12-23', 'Working Saturday', '#000000', '#FFFC41', 3),
(33, '2023-08-26', '2023-08-26', 'Working saturday', '#000000', '#FFFC41', 2),
(34, '2023-08-29', '2023-08-31', 'priyanshi on leave', 'white', '#F03716', 3),
(37, '2023-08-29', '2023-08-31', 'thtyjtyjrth', 'white', '#46CC4B', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`evt_id`),
  ADD KEY `evt_start` (`evt_start`),
  ADD KEY `evt_end` (`evt_end`),
  ADD KEY `evt_category` (`evt_category`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `evt_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`evt_category`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
