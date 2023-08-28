-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2023 at 06:48 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

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
(1, 'Festivals', '#000000', '#FFDBDB'),
(2, 'Festive Holidays', 'white', '#D62246'),
(3, 'Working Saturdays', '#000000', '#FFFC41'),
(4, 'IT Department', '#000000', '#F03716'),
(5, 'VAT Department', '#000000', '#A730F1'),
(6, 'Year End Department', '#000000', '#46CC4B'),
(7, 'Payroll Department', '#000000', '#30CFF2');

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
(1, '2022-04-14', '2022-04-14', 'Ambedkar Jayanti', '#000000', '#FFDBDB', 1),
(2, '2022-08-19', '2022-08-19', 'Janmashtami', '#000000', '#FFDBDB', 1),
(3, '2022-03-18', '2022-03-18', 'Holi', '#000000', '#FFDBDB', 1),
(4, '2022-03-01', '2022-03-01', 'Maha Shivaratri/Shivaratri', '#000000', '#FFDBDB', 1),
(5, '2022-03-18', '2022-03-18', 'Dolyatra', '#000000', '#FFDBDB', 1),
(6, '2022-01-09', '2022-01-09', 'Guru Govind Singh Jayanti', '#000000', '#FFDBDB', 1),
(7, '2022-05-16', '2022-05-16', 'Buddha Purnima/Vesak', '#000000', '#FFDBDB', 1),
(8, '2022-01-26', '2022-01-26', 'Republic Day', '#000000', '#FFDBDB', 1),
(9, '2022-01-13', '2022-01-13', 'Lohri', '#000000', '#FFDBDB', 1),
(10, '2022-04-14', '2022-04-14', 'Mahavir Jayanti', '#000000', '#FFDBDB', 1),
(11, '2022-04-15', '2022-04-15', 'Good Friday', '#000000', '#FFDBDB', 1),
(12, '2022-05-03', '2022-05-03', 'Ramzan Id/Eid-ul-Fitar', '#000000', '#FFDBDB', 1),
(13, '2022-08-15', '2022-08-15', 'Independence Day', '#000000', '#FFDBDB', 1),
(14, '2022-09-26', '2022-09-26', 'First Day of Sharad Navratri', '#000000', '#FFDBDB', 1),
(15, '2022-01-01', '2022-01-01', 'New Year\'s Day', '#000000', '#FFDBDB', 1),
(16, '2022-02-19', '2022-02-19', 'Shivaji Jayanti', '#000000', '#FFDBDB', 1),
(17, '2022-07-01', '2022-07-01', 'Rath Yatra', '#000000', '#FFDBDB', 1),
(18, '2022-08-31', '2022-08-31', 'Ganesh Chaturthi/Vinayaka Chaturthi', '#000000', '#FFDBDB', 1),
(19, '2022-01-14', '2022-01-14', 'Makar Sankranti', '#000000', '#FFDBDB', 1),
(20, '2022-02-15', '2022-02-15', 'Hazarat Ali\'s Birthday', '#000000', '#FFDBDB', 1),
(21, '2022-04-10', '2022-04-10', 'Rama Navami', '#000000', '#FFDBDB', 1),
(22, '2022-08-11', '2022-08-11', 'Raksha Bandhan (Rakhi)', '#000000', '#FFDBDB', 1),
(23, '2022-02-05', '2022-02-05', 'Vasant Panchami', '#000000', '#FFDBDB', 1),
(24, '2022-04-02', '2022-04-02', 'Chaitra Sukhladi', '#000000', '#FFDBDB', 1),
(25, '2022-04-02', '2022-04-02', 'Gudi Padwa', '#000000', '#FFDBDB', 1),
(26, '2022-04-17', '2022-04-17', 'Easter Day', '#000000', '#FFDBDB', 1),
(27, '2022-09-08', '2022-09-08', 'Onam', '#000000', '#FFDBDB', 1),
(28, '2022-04-02', '2022-04-02', 'Ugadi', '#000000', '#FFDBDB', 1),
(29, '2022-08-16', '2022-08-16', 'Parsi New Year', '#000000', '#FFDBDB', 1),
(30, '2022-04-14', '2022-04-14', 'Vaisakhi', '#000000', '#FFDBDB', 1),
(31, '2022-04-14', '2022-04-14', 'Mesadi / Vaisakhadi', '#000000', '#FFDBDB', 1),
(32, '2022-04-29', '2022-04-29', 'Jamat Ul-Vida', '#000000', '#FFDBDB', 1),
(33, '2022-08-18', '2022-08-18', 'Janmashtami (Smarta)', '#000000', '#FFDBDB', 1),
(34, '2022-02-16', '2022-02-16', 'Guru Ravidas Jayanti', '#000000', '#FFDBDB', 1),
(35, '2022-02-26', '2022-02-26', 'Maharishi Dayanand Saraswati Jayanti', '#000000', '#FFDBDB', 1),
(36, '2022-03-17', '2022-03-17', 'Holika Dahana', '#000000', '#FFDBDB', 1),
(37, '2022-01-14', '2022-01-14', 'Pongal', '#000000', '#FFDBDB', 1),
(38, '2022-08-09', '2022-08-09', 'Muharram/Ashura', '#000000', '#FFDBDB', 1),
(39, '2022-05-09', '2022-05-09', 'Birthday of Rabindranath', '#000000', '#FFDBDB', 1),
(40, '2022-07-10', '2022-07-10', 'Bakrid/Eid ul-Adha', '#000000', '#FFDBDB', 1),
(41, '2022-10-01', '2022-10-01', 'First Day of Durga Puja Festivities', '#000000', '#FFDBDB', 1),
(42, '2022-10-02', '2022-10-02', 'Mahatma Gandhi Jayanti', '#000000', '#FFDBDB', 1),
(43, '2022-10-02', '2022-10-02', 'Maha Saptami', '#000000', '#FFDBDB', 1),
(44, '2022-10-03', '2022-10-03', 'Maha Ashtami', '#000000', '#FFDBDB', 1),
(45, '2022-10-04', '2022-10-04', 'Maha Navami', '#000000', '#FFDBDB', 1),
(46, '2022-10-05', '2022-10-05', 'Dussehra', '#000000', '#FFDBDB', 1),
(47, '2022-10-09', '2022-10-09', 'Milad un-Nabi/Id-e-Milad', '#000000', '#FFDBDB', 1),
(48, '2022-10-09', '2022-10-09', 'Maharishi Valmiki Jayanti', '#000000', '#FFDBDB', 1),
(49, '2022-10-13', '2022-10-13', 'Karaka Chaturthi (Karva Chauth)', '#000000', '#FFDBDB', 1),
(50, '2022-10-24', '2022-10-24', 'Diwali/Deepavali', '#000000', '#FFDBDB', 1),
(51, '2022-10-24', '2022-10-24', 'Naraka Chaturdasi', '#000000', '#FFDBDB', 1),
(52, '2022-10-25', '2022-10-25', 'Govardhan Puja', '#000000', '#FFDBDB', 1),
(53, '2022-10-26', '2022-10-26', 'Bhai Duj', '#000000', '#FFDBDB', 1),
(54, '2022-10-30', '2022-10-30', 'Chhat Puja (Pratihar Sashthi/Surya Sashthi)', '#000000', '#FFDBDB', 1),
(55, '2022-11-08', '2022-11-08', 'Guru Nanak Jayanti', '#000000', '#FFDBDB', 1),
(56, '2022-11-24', '2022-11-24', 'Guru Tegh Bahadur\'s Martyrdom Day', '#000000', '#FFDBDB', 1),
(57, '2022-12-24', '2022-12-24', 'Christmas Eve', '#000000', '#FFDBDB', 1),
(58, '2022-12-25', '2022-12-25', 'Christmas', '#000000', '#FFDBDB', 1),
(59, '2022-12-29', '2022-12-29', 'Guru Govind Singh Jayanti', '#000000', '#FFDBDB', 1),
(60, '2023-01-01', '2023-01-01', 'New Year\'s Day', '#000000', '#FFDBDB', 1),
(61, '2023-01-14', '2023-01-14', 'Makar Sankranti', '#000000', '#FFDBDB', 1),
(62, '2023-01-15', '2023-01-15', 'Pongal', '#000000', '#FFDBDB', 1),
(63, '2023-01-26', '2023-01-26', 'Republic Day', 'white', '#D62246', 2),
(64, '2023-01-26', '2023-01-26', 'Vasant Panchami', 'white', '#D62246', 2),
(65, '2023-02-05', '2023-02-05', 'Hazarat Ali\'s Birthday', '#000000', '#FFDBDB', 1),
(66, '2023-02-05', '2023-02-05', 'Guru Ravidas Jayanti', '#000000', '#FFDBDB', 1),
(67, '2023-02-15', '2023-02-15', 'Maharishi Dayanand Saraswati Jayanti', '#000000', '#FFDBDB', 1),
(68, '2023-02-18', '2023-02-18', 'Maha Shivaratri/Shivaratri', '#000000', '#FFDBDB', 1),
(69, '2023-02-19', '2023-02-19', 'Shivaji Jayanti', '#000000', '#FFDBDB', 1),
(70, '2023-03-07', '2023-03-07', 'Dolyatra', '#000000', '#FFDBDB', 1),
(71, '2023-03-07', '2023-03-07', 'Holika Dahana', '#000000', '#FFDBDB', 1),
(72, '2023-03-08', '2023-03-08', 'Holi', 'white', '#D62246', 2),
(73, '2023-03-22', '2023-03-22', 'Chaitra Sukhladi', '#000000', '#FFDBDB', 1),
(74, '2023-03-22', '2023-03-22', 'Gudi Padwa', '#000000', '#FFDBDB', 1),
(75, '2023-03-22', '2023-03-22', 'Ugadi', '#000000', '#FFDBDB', 1),
(76, '2023-03-30', '2023-03-30', 'Rama Navami', '#000000', '#FFDBDB', 1),
(77, '2023-04-04', '2023-04-04', 'Mahavir Jayanti', '#000000', '#FFDBDB', 1),
(78, '2023-04-07', '2023-04-07', 'Good Friday', '#000000', '#FFDBDB', 1),
(79, '2023-04-09', '2023-04-09', 'Easter Day', '#000000', '#FFDBDB', 1),
(80, '2023-04-14', '2023-04-14', 'Vaisakhi', '#000000', '#FFDBDB', 1),
(81, '2023-04-15', '2023-04-15', 'Mesadi / Vaisakhadi', '#000000', '#FFDBDB', 1),
(82, '2023-04-21', '2023-04-21', 'Jamat Ul-Vida', '#000000', '#FFDBDB', 1),
(83, '2023-04-22', '2023-04-22', 'Ramzan Id/Eid-ul-Fitar', '#000000', '#FFDBDB', 1),
(84, '2023-05-05', '2023-05-05', 'Buddha Purnima/Vesak', '#000000', '#FFDBDB', 1),
(85, '2023-05-09', '2023-05-09', 'Birthday of Rabindranath', '#000000', '#FFDBDB', 1),
(86, '2023-06-20', '2023-06-20', 'Rath Yatra', '#000000', '#FFDBDB', 1),
(87, '2023-06-29', '2023-06-29', 'Bakrid/Eid ul-Adha', '#000000', '#FFDBDB', 1),
(88, '2023-07-29', '2023-07-29', 'Muharram/Ashura', '#000000', '#FFDBDB', 1),
(89, '2023-08-15', '2023-08-15', 'Independence Day', 'white', '#D62246', 2),
(90, '2023-08-16', '2023-08-16', 'Parsi New Year', '#000000', '#FFDBDB', 1),
(91, '2023-08-20', '2023-08-20', 'Vinayaka Chathurthi', '#000000', '#FFDBDB', 1),
(92, '2023-08-29', '2023-08-29', 'Onam', '#000000', '#FFDBDB', 1),
(93, '2023-08-30', '2023-08-30', 'Raksha Bandhan (Rakhi)', 'white', '#D62246', 2),
(94, '2023-09-06', '2023-09-06', 'Janmashtami (Smarta)', '#000000', '#FFDBDB', 1),
(95, '2023-09-07', '2023-09-07', 'Janmashtami', '#000000', '#FFDBDB', 1),
(96, '2023-09-19', '2023-09-19', 'Ganesh Chaturthi/Vinayaka Chaturthi', 'white', '#D62246', 2),
(97, '2023-09-28', '2023-09-28', 'Milad un-Nabi/Id-e-Milad', '#000000', '#FFDBDB', 1),
(98, '2023-10-02', '2023-10-02', 'Mahatma Gandhi Jayanti', '#000000', '#FFDBDB', 1),
(99, '2023-10-15', '2023-10-15', 'First Day of Sharad Navratri', '#000000', '#FFDBDB', 1),
(100, '2023-10-20', '2023-10-20', 'First Day of Durga Puja Festivities', '#000000', '#FFDBDB', 1),
(101, '2023-10-21', '2023-10-21', 'Maha Saptami', '#000000', '#FFDBDB', 1),
(102, '2023-10-22', '2023-10-22', 'Maha Ashtami', '#000000', '#FFDBDB', 1),
(103, '2023-10-23', '2023-10-23', 'Maha Navami', '#000000', '#FFDBDB', 1),
(104, '2023-10-24', '2023-10-24', 'Dussehra', 'white', '#D62246', 2),
(105, '2023-10-28', '2023-10-28', 'Maharishi Valmiki Jayanti', '#000000', '#FFDBDB', 1),
(106, '2023-11-01', '2023-11-01', 'Karaka Chaturthi (Karva Chauth)', '#000000', '#FFDBDB', 1),
(107, '2023-11-12', '2023-11-12', 'Diwali/Deepavali', '#000000', '#FFDBDB', 1),
(108, '2023-11-12', '2023-11-12', 'Naraka Chaturdasi', '#000000', '#FFDBDB', 1),
(109, '2023-11-13', '2023-11-13', 'Govardhan Puja', 'white', '#D62246', 2),
(110, '2023-11-15', '2023-11-15', 'Bhai Duj', '#000000', '#FFDBDB', 1),
(111, '2023-11-19', '2023-11-19', 'Chhat Puja (Pratihar Sashthi/Surya Sashthi)', '#000000', '#FFDBDB', 1),
(112, '2023-11-24', '2023-11-24', 'Guru Tegh Bahadur\'s Martyrdom Day', '#000000', '#FFDBDB', 1),
(113, '2023-11-27', '2023-11-27', 'Guru Nanak Jayanti', '#000000', '#FFDBDB', 1),
(114, '2023-12-24', '2023-12-24', 'Christmas Eve', '#000000', '#FFDBDB', 1),
(115, '2023-12-25', '2023-12-25', 'Christmas', '#000000', '#FFDBDB', 1),
(116, '2024-01-01', '2024-01-01', 'New Year\'s Day', '#000000', '#FFDBDB', 1),
(117, '2024-01-15', '2024-01-15', 'Pongal', '#000000', '#FFDBDB', 1),
(118, '2024-01-17', '2024-01-17', 'Guru Govind Singh Jayanti', '#000000', '#FFDBDB', 1),
(119, '2024-01-25', '2024-01-25', 'Hazarat Ali\'s Birthday', '#000000', '#FFDBDB', 1),
(120, '2024-01-26', '2024-01-26', 'Republic Day', '#000000', '#FFDBDB', 1),
(121, '2024-02-14', '2024-02-14', 'Vasant Panchami', '#000000', '#FFDBDB', 1),
(122, '2024-02-19', '2024-02-19', 'Shivaji Jayanti', '#000000', '#FFDBDB', 1),
(123, '2024-02-24', '2024-02-24', 'Guru Ravidas Jayanti', '#000000', '#FFDBDB', 1),
(124, '2024-03-24', '2024-03-24', 'Holika Dahana', '#000000', '#FFDBDB', 1),
(125, '2024-03-25', '2024-03-25', 'Dolyatra', '#000000', '#FFDBDB', 1),
(126, '2024-03-25', '2024-03-25', 'Holi', '#000000', '#FFDBDB', 1),
(127, '2024-03-29', '2024-03-29', 'Good Friday', '#000000', '#FFDBDB', 1),
(128, '2024-03-31', '2024-03-31', 'Easter Day', '#000000', '#FFDBDB', 1),
(129, '2024-04-05', '2024-04-05', 'Jamat Ul-Vida', '#000000', '#FFDBDB', 1),
(130, '2024-04-09', '2024-04-09', 'Ugadi', '#000000', '#FFDBDB', 1),
(131, '2024-04-09', '2024-04-09', 'Chaitra Sukhladi', '#000000', '#FFDBDB', 1),
(132, '2024-04-09', '2024-04-09', 'Gudi Padwa', '#000000', '#FFDBDB', 1),
(133, '2024-04-11', '2024-04-11', 'Ramzan Id/Eid-ul-Fitar', '#000000', '#FFDBDB', 1),
(134, '2024-04-13', '2024-04-13', 'Vaisakhi', '#000000', '#FFDBDB', 1),
(135, '2024-04-14', '2024-04-14', 'Ambedkar Jayanti', '#000000', '#FFDBDB', 1),
(136, '2024-04-17', '2024-04-17', 'Rama Navami', '#000000', '#FFDBDB', 1),
(137, '2024-04-21', '2024-04-21', 'Mahavir Jayanti', '#000000', '#FFDBDB', 1),
(138, '2024-05-08', '2024-05-08', 'Birthday of Rabindranath', '#000000', '#FFDBDB', 1),
(139, '2024-05-23', '2024-05-23', 'Buddha Purnima/Vesak', '#000000', '#FFDBDB', 1),
(140, '2024-06-17', '2024-06-17', 'Bakrid/Eid ul-Adha', '#000000', '#FFDBDB', 1),
(141, '2024-07-07', '2024-07-07', 'Rath Yatra', '#000000', '#FFDBDB', 1),
(142, '2024-07-17', '2024-07-17', 'Muharram/Ashura', '#000000', '#FFDBDB', 1),
(143, '2024-08-15', '2024-08-15', 'Parsi New Year', '#000000', '#FFDBDB', 1),
(144, '2024-08-15', '2024-08-15', 'Independence Day', '#000000', '#FFDBDB', 1),
(145, '2024-08-19', '2024-08-19', 'Raksha Bandhan (Rakhi)', '#000000', '#FFDBDB', 1),
(146, '2024-08-26', '2024-08-26', 'Janmashtami (Smarta)', '#000000', '#FFDBDB', 1),
(147, '2024-08-26', '2024-08-26', 'Janmashtami', '#000000', '#FFDBDB', 1),
(148, '2024-09-07', '2024-09-07', 'Ganesh Chaturthi/Vinayaka Chaturthi', '#000000', '#FFDBDB', 1),
(149, '2024-09-15', '2024-09-15', 'Onam', '#000000', '#FFDBDB', 1),
(150, '2024-09-16', '2024-09-16', 'Milad un-Nabi/Id-e-Milad', '#000000', '#FFDBDB', 1),
(151, '2024-10-02', '2024-10-02', 'Mahatma Gandhi Jayanti', '#000000', '#FFDBDB', 1),
(152, '2024-10-03', '2024-10-03', 'First Day of Sharad Navratri', '#000000', '#FFDBDB', 1),
(153, '2024-10-09', '2024-10-09', 'First Day of Durga Puja Festivities', '#000000', '#FFDBDB', 1),
(154, '2024-10-10', '2024-10-10', 'Maha Saptami', '#000000', '#FFDBDB', 1),
(155, '2024-10-11', '2024-10-11', 'Maha Ashtami', '#000000', '#FFDBDB', 1),
(156, '2024-10-12', '2024-10-12', 'Dussehra', '#000000', '#FFDBDB', 1),
(157, '2024-10-17', '2024-10-17', 'Maharishi Valmiki Jayanti', '#000000', '#FFDBDB', 1),
(158, '2024-10-20', '2024-10-20', 'Karaka Chaturthi (Karva Chauth)', '#000000', '#FFDBDB', 1),
(159, '2024-10-31', '2024-10-31', 'Naraka Chaturdasi', '#000000', '#FFDBDB', 1),
(160, '2024-11-02', '2024-11-02', 'Govardhan Puja', '#000000', '#FFDBDB', 1),
(161, '2024-11-03', '2024-11-03', 'Bhai Duj', '#000000', '#FFDBDB', 1),
(162, '2024-11-07', '2024-11-07', 'Chhat Puja (Pratihar Sashthi/Surya Sashthi)', '#000000', '#FFDBDB', 1),
(163, '2024-11-15', '2024-11-15', 'Guru Nanak Jayanti', '#000000', '#FFDBDB', 1),
(164, '2024-11-24', '2024-11-24', 'Guru Tegh Bahadur\'s Martyrdom Day', '#000000', '#FFDBDB', 1),
(165, '2024-12-24', '2024-12-24', 'Christmas Eve', '#000000', '#FFDBDB', 1),
(166, '2024-12-25', '2024-12-25', 'Christmas', '#000000', '#FFDBDB', 1),
(167, '2023-03-24', '2023-03-24', 'Ramadan Start', '#000000', '#FFDBDB', 1),
(168, '2024-03-12', '2024-03-12', 'Ramadan Start', '#000000', '#FFDBDB', 1),
(169, '2023-04-14', '2023-04-14', 'Ambedkar Jayanti', '#000000', '#FFDBDB', 1),
(170, '2024-01-13', '2024-01-13', 'Lohri', '#000000', '#FFDBDB', 1),
(171, '2024-01-14', '2024-01-14', 'Makar Sankranti', '#000000', '#FFDBDB', 1),
(172, '2024-03-06', '2024-03-06', 'Maharishi Dayanand Saraswati Jayanti', '#000000', '#FFDBDB', 1),
(173, '2024-03-08', '2024-03-08', 'Maha Shivaratri/Shivaratri', '#000000', '#FFDBDB', 1),
(174, '2024-04-14', '2024-04-14', 'Mesadi / Vaisakhadi', '#000000', '#FFDBDB', 1),
(175, '2024-10-11', '2024-10-11', 'Maha Navami', '#000000', '#FFDBDB', 1),
(176, '2024-10-31', '2024-10-31', 'Diwali/Deepavali', '#000000', '#FFDBDB', 1),
(177, '2023-01-07', '2023-01-07', 'Working saturday', '#000000', '#FFFC41', 3),
(178, '2023-01-21', '2023-01-21', 'Working saturday', '#000000', '#FFFC41', 3),
(179, '2023-02-04', '2023-02-04', 'Working saturday', '#000000', '#FFFC41', 3),
(180, '2023-02-18', '2023-02-18', 'Working saturday', '#000000', '#FFFC41', 3),
(181, '2023-03-04', '2023-03-04', 'Working saturday', '#000000', '#FFFC41', 3),
(182, '2023-03-18', '2023-03-18', 'Working saturday', '#000000', '#FFFC41', 3),
(183, '2023-04-01', '2023-04-01', 'Working saturday', '#000000', '#FFFC41', 3),
(184, '2023-04-15', '2023-04-15', 'Working saturday', '#000000', '#FFFC41', 3),
(185, '2023-04-29', '2023-04-29', 'Working saturday', '#000000', '#FFFC41', 3),
(186, '2023-05-13', '2023-05-13', 'Working saturday', '#000000', '#FFFC41', 3),
(187, '2023-05-27', '2023-05-27', 'Working saturday', '#000000', '#FFFC41', 3),
(188, '2023-06-10', '2023-06-10', 'Working saturday', '#000000', '#FFFC41', 3),
(189, '2023-06-24', '2023-06-24', 'Working saturday', '#000000', '#FFFC41', 3),
(190, '2023-07-08', '2023-07-08', 'Working saturday', '#000000', '#FFFC41', 3),
(191, '2023-07-22', '2023-07-22', 'Working saturday', '#000000', '#FFFC41', 3),
(192, '2023-08-05', '2023-08-05', 'Working saturday', '#000000', '#FFFC41', 3),
(193, '2023-08-19', '2023-08-19', 'Working saturday', '#000000', '#FFFC41', 3),
(194, '2023-09-02', '2023-09-02', 'Working saturday', '#000000', '#FFFC41', 3),
(195, '2023-09-16', '2023-09-16', 'Working saturday', '#000000', '#FFFC41', 3),
(196, '2023-09-30', '2023-09-30', 'Working saturday', '#000000', '#FFFC41', 3),
(197, '2023-10-14', '2023-10-14', 'Working saturday', '#000000', '#FFFC41', 3),
(198, '2023-10-28', '2023-10-28', 'Working saturday', '#000000', '#FFFC41', 3),
(199, '2023-11-11', '2023-11-11', 'Working saturday', '#000000', '#FFFC41', 3),
(200, '2023-11-25', '2023-11-25', 'Working saturday', '#000000', '#FFFC41', 3),
(201, '2023-12-09', '2023-12-09', 'Working saturday', '#000000', '#FFFC41', 3),
(202, '2023-12-23', '2023-12-23', 'Working saturday', '#000000', '#FFFC41', 3);

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
  MODIFY `evt_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

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
