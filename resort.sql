-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 18, 2017 at 04:59 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resort`
--

-- --------------------------------------------------------

--
-- Table structure for table `assigned_rooms`
--

DROP TABLE IF EXISTS `assigned_rooms`;
CREATE TABLE IF NOT EXISTS `assigned_rooms` (
  `customer_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assigned_rooms`
--


-- --------------------------------------------------------

--
-- Stand-in structure for view `bestrating`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `bestrating`;
CREATE TABLE IF NOT EXISTS `bestrating` (
`id` int(11)
,`star` int(5)
,`comnt` varchar(225)
);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
CREATE TABLE IF NOT EXISTS `manager` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(225) NOT NULL,
  `first_name` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `coid` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `message` varchar(225) NOT NULL,
  PRIMARY KEY (`coid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;


--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `star` int(5) NOT NULL,
  `comnt` varchar(225) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Table structure for table `request_room`
--

DROP TABLE IF EXISTS `request_room`;
CREATE TABLE IF NOT EXISTS `request_room` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `phone` varchar(225) NOT NULL,
  `a_date` date NOT NULL,
  `d_date` date NOT NULL,
  `people` int(10) NOT NULL,
  `room_type` varchar(225) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_room`
--
--
-- Triggers `request_room`
--
DROP TRIGGER IF EXISTS `request_delete`;
DELIMITER $$
CREATE TRIGGER `request_delete` BEFORE DELETE ON `request_room` FOR EACH ROW BEGIN
INSERT INTO request_room_delete 
VALUES (old.id,old.name,old.email,old.phone,old.a_date,old.d_date,old.people,old.room_type);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `request_insert`;
DELIMITER $$
CREATE TRIGGER `request_insert` AFTER INSERT ON `request_room` FOR EACH ROW BEGIN
INSERT INTO request_room_backup VALUES (NEW.id,NEW.name,NEW.email,NEW.phone,NEW.a_date,NEW.d_date,NEW.people,NEW.room_type);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `request_room_backup`
--

--
-- Dumping data for table `request_room_backup`
--
--

DROP TABLE IF EXISTS `request_room_delete`;
CREATE TABLE IF NOT EXISTS `request_room_delete` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `phone` varchar(225) NOT NULL,
  `a_date` date NOT NULL,
  `d_date` date NOT NULL,
  `people` int(10) NOT NULL,
  `room_type` varchar(225) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `resort_rooms`
--

DROP TABLE IF EXISTS `resort_rooms`;
CREATE TABLE IF NOT EXISTS `resort_rooms` (
  `Room_id` int(11) NOT NULL,
  `Type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Room_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resort_rooms`
--

INSERT INTO `resort_rooms` (`Room_id`, `Type`) VALUES
(101, 'Single'),
(102, 'Single'),
(103, 'Single'),
(104, 'Single'),
(105, 'Single'),
(106, 'Single'),
(107, 'Single'),
(108, 'Single'),
(109, 'Single'),
(110, 'Single'),

(201, 'Double'),
(202, 'Double'),
(203, 'Double'),
(204, 'Double'),
(205, 'Double'),
(206, 'Double'),
(207, 'Double'),
(208, 'Double'),
(209, 'Double'),
(210, 'Double'),


(301, 'Deluxe'),
(302, 'Deluxe'),
(303, 'Deluxe'),
(304, 'Deluxe'),
(305, 'Deluxe'),

(401, 'Presidential'),
(402, 'Presidential'),
(403, 'Presidential'),

(501, 'Bungalow'),
(502, 'Bungalow');

-- --------------------------------------------------------

--
-- Structure for view `bestrating`
--
DROP TABLE IF EXISTS `bestrating`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bestrating`  AS  select `rating`.`id` AS `id`,`rating`.`star` AS `star`,`rating`.`comnt` AS `comnt` from `rating` where `rating`.`star` limit 0,5 ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
