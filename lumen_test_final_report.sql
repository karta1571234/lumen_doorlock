-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1:3306
-- 產生時間： 2022-06-19 22:08:37
-- 伺服器版本： 5.7.36
-- PHP 版本： 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `lumen_test_final_report`
--

-- --------------------------------------------------------

--
-- 資料表結構 `areas`
--

DROP TABLE IF EXISTS `areas`;
CREATE TABLE IF NOT EXISTS `areas` (
  `area_id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) NOT NULL,
  PRIMARY KEY (`area_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `areas`
--

INSERT INTO `areas` (`area_id`, `name`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D');

-- --------------------------------------------------------

--
-- 資料表結構 `area_floor`
--

DROP TABLE IF EXISTS `area_floor`;
CREATE TABLE IF NOT EXISTS `area_floor` (
  `area_floor_id` int(5) NOT NULL AUTO_INCREMENT,
  `area_id` int(3) NOT NULL,
  `floor_id` int(3) NOT NULL,
  PRIMARY KEY (`area_floor_id`),
  KEY `area_id` (`area_id`),
  KEY `floor_id` (`floor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `area_floor`
--

INSERT INTO `area_floor` (`area_floor_id`, `area_id`, `floor_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 1),
(6, 2, 2),
(7, 2, 3),
(8, 3, 1),
(9, 3, 2),
(10, 3, 3),
(11, 3, 4),
(12, 4, 1),
(13, 4, 2),
(14, 4, 3),
(15, 4, 4),
(16, 4, 5),
(17, 4, 6);

-- --------------------------------------------------------

--
-- 資料表結構 `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `booking_id` int(20) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(20) NOT NULL,
  `space_id` int(10) NOT NULL,
  `purpose` varchar(20) NOT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `over_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `booking`
--

INSERT INTO `booking` (`booking_id`, `emp_id`, `space_id`, `purpose`, `start_datetime`, `over_datetime`) VALUES
(18, '3212313', 1, '討論', '2022-06-17 05:22:23', '2022-06-18 05:22:28'),
(19, '3212313', 1, '討論', '2022-06-01 05:22:31', '2022-06-30 05:22:34');

-- --------------------------------------------------------

--
-- 資料表結構 `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `class_id` int(1) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `person_number` int(3) NOT NULL,
  PRIMARY KEY (`class_id`),
  UNIQUE KEY `class_name` (`class_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `classes`
--

INSERT INTO `classes` (`class_id`, `class_name`, `person_number`) VALUES
(1, '小型會議室', 20),
(2, '中型會議室', 60),
(3, '大型會議室', 120);

-- --------------------------------------------------------

--
-- 資料表結構 `dept`
--

DROP TABLE IF EXISTS `dept`;
CREATE TABLE IF NOT EXISTS `dept` (
  `dept_id` varchar(20) NOT NULL,
  `dept_name` varchar(20) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `dept`
--

INSERT INTO `dept` (`dept_id`, `dept_name`) VALUES
('A01', '秘書部'),
('A02', '人事部');

-- --------------------------------------------------------

--
-- 資料表結構 `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `emp_id` int(20) NOT NULL,
  `dept_id` varchar(20) NOT NULL,
  `emp_name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `employee`
--

INSERT INTO `employee` (`emp_id`, `dept_id`, `emp_name`, `email`) VALUES
(1, 'A02', '涼太', 'kkk@yahoo.com'),
(2, 'A01', '涼涼涼', '6541516@gmail.com'),
(3, 'A01', '徐榮蔚', '654156@gmail.com');

-- --------------------------------------------------------

--
-- 資料表結構 `employee_role`
--

DROP TABLE IF EXISTS `employee_role`;
CREATE TABLE IF NOT EXISTS `employee_role` (
  `employee_role_id` int(20) NOT NULL AUTO_INCREMENT,
  `employee_id` int(20) NOT NULL,
  `role_id` int(10) NOT NULL,
  PRIMARY KEY (`employee_role_id`),
  KEY `employee_id` (`employee_id`),
  KEY `role_id` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `employee_role`
--

INSERT INTO `employee_role` (`employee_role_id`, `employee_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2);

-- --------------------------------------------------------

--
-- 資料表結構 `enter`
--

DROP TABLE IF EXISTS `enter`;
CREATE TABLE IF NOT EXISTS `enter` (
  `enter_id` int(20) NOT NULL AUTO_INCREMENT,
  `space_id` int(10) NOT NULL,
  `enter_person` varchar(20) NOT NULL,
  `enter_time` datetime NOT NULL,
  PRIMARY KEY (`enter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `enter`
--

INSERT INTO `enter` (`enter_id`, `space_id`, `enter_person`, `enter_time`) VALUES
(1, 1, '徐榮蔚', '2022-05-19 13:46:34');

-- --------------------------------------------------------

--
-- 資料表結構 `floors`
--

DROP TABLE IF EXISTS `floors`;
CREATE TABLE IF NOT EXISTS `floors` (
  `floor_id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) NOT NULL,
  PRIMARY KEY (`floor_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `floors`
--

INSERT INTO `floors` (`floor_id`, `name`) VALUES
(1, '1F'),
(2, '2F'),
(3, '3F'),
(4, '4F'),
(5, '5F'),
(6, '6F'),
(7, '7F'),
(8, '8F'),
(9, '9F'),
(10, '10F'),
(11, '11F'),
(12, '12F');

-- --------------------------------------------------------

--
-- 資料表結構 `report`
--

DROP TABLE IF EXISTS `report`;
CREATE TABLE IF NOT EXISTS `report` (
  `report_id` int(10) NOT NULL AUTO_INCREMENT,
  `emp_id` int(10) NOT NULL,
  `space_id` int(10) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 NOT NULL,
  `report_time` datetime DEFAULT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `report`
--

INSERT INTO `report` (`report_id`, `emp_id`, `space_id`, `content`, `report_time`) VALUES
(2, 3212313, 1, '害\n', NULL),
(3, 3, 10, 'chinese', '2022-06-20 05:04:02'),
(4, 3, 10, 'chinese', '2022-06-20 05:06:29'),
(5, 3, 10, 'chinese', '2022-06-20 05:07:08'),
(6, 3, 10, 'chinese', '2022-06-20 05:07:47'),
(7, 3, 10, 'chinese', '2022-06-20 05:07:50');

-- --------------------------------------------------------

--
-- 資料表結構 `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `role`
--

INSERT INTO `role` (`role_id`, `name`) VALUES
(1, 'admin'),
(2, 'user'),
(3, 'visitor');

-- --------------------------------------------------------

--
-- 資料表結構 `spaces`
--

DROP TABLE IF EXISTS `spaces`;
CREATE TABLE IF NOT EXISTS `spaces` (
  `space_id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) CHARACTER SET utf8mb4 NOT NULL,
  `content` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `doorlock_name` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `mac` varchar(17) CHARACTER SET utf8mb4 NOT NULL,
  `doorlock_password` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `class_id` int(1) NOT NULL,
  `area_floor_id` int(5) NOT NULL,
  PRIMARY KEY (`space_id`),
  KEY `class_id` (`class_id`),
  KEY `area_floor_id` (`area_floor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `spaces`
--

INSERT INTO `spaces` (`space_id`, `name`, `content`, `doorlock_name`, `mac`, `doorlock_password`, `class_id`, `area_floor_id`) VALUES
(1, 'A1', '內有投影機、投影幕與白板', '小米智慧門鎖', '00:00:00:00:00:00', '123456', 1, 1),
(2, 'A2', '內有投影機、投影幕與白板', '小米智慧門鎖', '00:00:00:00:00:00', '123456', 1, 1),
(3, 'A3', '內有投影機、投影幕與白板', '小米智慧門鎖', '00:00:00:00:00:00', '123456', 1, 1),
(4, 'A4', '內有投影機、投影幕與白板', '小米智慧門鎖', '00:00:00:00:00:00', '123456', 1, 2),
(5, 'A5', '內有投影機、投影幕與白板', '小米智慧門鎖', '00:00:00:00:00:00', '123456', 1, 2),
(6, 'A6', '內有投影機、投影幕與白板', '小米智慧門鎖', '00:00:00:00:00:00', '123456', 1, 3),
(7, 'A7', '內有投影機、投影幕與白板', '小米智慧門鎖', '00:00:00:00:00:00', '123456', 1, 3),
(8, 'A8', '內有投影機、投影幕與白板', '小米智慧門鎖', '00:00:00:00:00:00', '123456', 1, 3),
(9, 'A9', '內有投影機、投影幕與白板', '小米智慧門鎖', '00:00:00:00:00:00', '123456', 2, 3),
(10, 'A10', '內有投影機、投影幕與白板', '小米智慧門鎖', '00:00:00:00:00:00', '123456', 2, 3),
(11, 'A11', 'PostMan TEST', '小米', '00:00:00:00:00:00', '2', 1, 5),
(12, 'A12', '測試', '小米智慧門鎖', '00:00:00:00:00:00', '1234', 2, 4),
(13, 'A13', '測試', '小米智慧門鎖', '00:00:00:00:00:00', '1234', 2, 1),
(14, 'A14', '測試', '小米智慧門鎖', '00:00:00:00:00:00', '1234', 2, 17),
(15, 'A15', 'postmantest', '小米', '00:00:00:00:00:00', '1324', 2, 17),
(16, 'A16', 'postmantest', '小米', '00:00:00:00:00:01', '1324', 2, 16),
(17, 'A16', 'postmantest', '小米', '00:00:00:00:00:01', '1324', 2, 16),
(18, 'A16', 'postmantest', '小米', '00:00:00:00:00:01', '1324', 2, 16),
(19, 'A17', 'action', '小米', '00:00:00:00:00:01', '1324', 2, 16),
(20, 'A17', 'action', '小米', '00:00:00:00:00:01', '1324', 2, 16),
(21, 'A17', 'action3', '小米', '00:00:00:00:00:01', '1324', 2, 16),
(22, 'A17', 'action3', '小米', '00:00:00:00:00:01', '1324', 2, 16),
(23, 'A17', 'action3', '小米', '00:00:00:00:00:01', '1324', 2, 16),
(24, 'A17', 'action3', '小米', '00:00:00:00:00:01', '1324', 2, 16),
(25, 'A18', 'action3', '小米', '00:00:00:00:00:01', '1324', 2, 16),
(26, 'A18', 'action3', '小米', '00:00:00:00:00:01', '1324', 2, 16);

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `account` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `user`
--

INSERT INTO `user` (`account`, `password`) VALUES
('6541516@gmail.com', '1234'),
('654156@gmail.com', '1234'),
('kkk@yahoo.com', '321');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
