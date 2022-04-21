-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 21, 2022 at 03:50 PM
-- Server version: 10.5.15-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `benfed_paddy`
--

-- --------------------------------------------------------

--
-- Table structure for table `md_account_heads`
--

CREATE TABLE `md_account_heads` (
  `sch_code` int(11) NOT NULL,
  `acc_code` int(11) NOT NULL,
  `acc_head` varchar(100) NOT NULL,
  `acc_flag` char(1) NOT NULL,
  `auto_flag` char(1) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` date DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `md_account_heads`
--
DELIMITER $$
CREATE TRIGGER `ai_md_account_heads` AFTER INSERT ON `md_account_heads` FOR EACH ROW BEGIN
insert into tm_account_balance
select DISTINCT balance_dt,
       new.acc_code,
       new.acc_flag,
       0
from  tm_account_balance;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `md_bank`
--

CREATE TABLE `md_bank` (
  `sl_no` int(11) NOT NULL,
  `acc_code` varchar(10) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `ac_type` varchar(5) NOT NULL,
  `ac_no` varchar(50) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_bank`
--

INSERT INTO `md_bank` (`sl_no`, `acc_code`, `bank_name`, `branch_name`, `ac_type`, `ac_no`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, '10185', 'Axis Bank  -  1726', '', 'S', '915010065341726', 'Synergic Softek', '2018-10-10 01:25:09', NULL, NULL),
(2, '10188', 'Axis Bank  G.  C.  Ave.  A/c.  -  1146', 'G.C Avenue', 'C', '910020036541146', 'Synergic Softek', '2018-10-22 08:40:33', NULL, NULL),
(3, '10184', 'Allahabad  Bank  Int.  A/c.  No.  1404', '', 'C', '50057591404', 'Synergic Softek', '2018-10-22 08:42:23', NULL, NULL),
(4, '10207', 'S.B.I.  Park  St. CD I  A/c.  No.  0851', 'Park Street', 'C', '30147550851', 'Synergic Softek', '2018-10-22 08:43:39', NULL, NULL),
(5, '10208', 'SBI  Park  St CD II  A/c.  No.  2309', 'Park Street', 'C', '30379602309', 'Synergic Softek', '2018-10-22 08:44:17', NULL, NULL),
(6, '10210', 'S.B.I-Suravi  A/c.Sys.(Todiman).', '', 'C', '31426358521', 'Synergic Softek', '2018-10-22 08:45:15', NULL, NULL),
(7, '10010', 'S.B.L-TodiM..Empl.G.Grattiity  Fund', '', 'C', '31895922163', 'Synergic Softek', '2018-10-22 08:45:42', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_bank_dtls`
--

CREATE TABLE `md_bank_dtls` (
  `sl_no` int(11) NOT NULL,
  `bank_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_bank_dtls`
--

INSERT INTO `md_bank_dtls` (`sl_no`, `bank_name`) VALUES
(1, 'Bank of Baroda'),
(2, 'Bank of India'),
(3, 'Bank of Maharashtra'),
(4, 'Canara Bank'),
(5, 'Central Bank of India'),
(6, 'Indian Bank'),
(7, 'Indian Overseas Bank'),
(8, 'Punjab and Sind Bank'),
(9, 'Punjab National Bank'),
(10, 'State Bank of India'),
(11, 'UCO Bank'),
(12, 'Union Bank of India'),
(13, 'Axis Bank'),
(14, 'Bandhan Bank'),
(15, 'HDFC Bank'),
(16, 'ICICI Bank'),
(17, 'Yes Bank'),
(18, 'West Bengal State Co-operative Bank'),
(19, 'IDBI Bank');

-- --------------------------------------------------------

--
-- Table structure for table `md_block`
--

CREATE TABLE `md_block` (
  `sl_no` varchar(10) NOT NULL,
  `dist` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL COMMENT 'Here Branch id is Dist Code ',
  `blockcode` varchar(8) NOT NULL,
  `block_name` varchar(50) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_block`
--

INSERT INTO `md_block` (`sl_no`, `dist`, `branch_id`, `blockcode`, `block_name`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
('02154', 327, 327, '02154', 'Darjeeling Pulbazar', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02155', 327, 327, '02155', 'Rangli Rangliot', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02156', 327, 327, '02156', 'Kalimpong -I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02157', 327, 327, '02157', 'Kalimpong - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02158', 327, 327, '02158', 'Gorubathan', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02159', 327, 327, '02159', 'Jorebunglow Sukiapokhri', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02160', 327, 327, '02160', 'Mirik', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02161', 327, 327, '02161', 'Kurseong', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02162', 327, 327, '02162', 'Matigara', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02163', 327, 327, '02163', 'Naxalbari', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02164', 327, 327, '02164', 'Phansidewa', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02165', 327, 327, '02165', 'Kharibari', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02166', 328, 328, '02166', 'Rajganj', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02167', 328, 328, '02167', 'Mal', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02168', 328, 328, '02168', 'Matiali', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02169', 328, 328, '02169', 'Nagrakata', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02170', 346, 346, '02170', 'Madarihat', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02171', 346, 346, '02171', 'Kalchini', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02172', 346, 346, '02172', 'Kumargram', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02173', 346, 346, '02173', 'Alipurduar - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02174', 346, 346, '02174', 'Alipurduar - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02175', 346, 346, '02175', 'Falakata', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02176', 328, 328, '02176', 'Dhupguri', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02177', 328, 328, '02177', 'Maynaguri', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02178', 328, 328, '02178', 'Jalpaiguri', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02179', 329, 329, '02179', 'Haldibari', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02180', 329, 329, '02180', 'Mekliganj', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02181', 329, 329, '02181', 'Mathabhanga - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02182', 329, 329, '02182', 'Mathabhanga - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02183', 329, 329, '02183', 'Cooch Behar - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02184', 329, 329, '02184', 'Cooch Behar - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02185', 329, 329, '02185', 'Tufanganj - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02186', 329, 329, '02186', 'Tufanganj - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02187', 329, 329, '02187', 'Dinhata - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02188', 329, 329, '02188', 'Dinhata - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02189', 329, 329, '02189', 'Sitai', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02190', 329, 329, '02190', 'Sitalkuchi', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02191', 330, 330, '02191', 'Chopra', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02192', 330, 330, '02192', 'Islampur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02193', 330, 330, '02193', 'Goalpokhar - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02194', 330, 330, '02194', 'Goalpokhar - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02195', 330, 330, '02195', 'Karandighi', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02196', 330, 330, '02196', 'Raiganj', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02197', 330, 330, '02197', 'Hemtabad', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02198', 330, 330, '02198', 'Kaliaganj', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02199', 330, 330, '02199', 'Itahar', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02200', 331, 331, '02200', 'Kushmundi', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02201', 331, 331, '02201', 'Gangarampur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02202', 331, 331, '02202', 'Kumarganj', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02203', 331, 331, '02203', 'Hilli', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02204', 331, 331, '02204', 'Balurghat', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02205', 331, 331, '02205', 'Tapan', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02206', 331, 331, '02206', 'Bansihari', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02207', 331, 331, '02207', 'Harirampur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02208', 332, 332, '02208', 'Harischandrapur - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02209', 332, 332, '02209', 'Harischandrapur - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02210', 332, 332, '02210', 'Chanchal - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02211', 332, 332, '02211', 'Chanchal - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02212', 332, 332, '02212', 'Ratua - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02213', 332, 332, '02213', 'Ratua - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02214', 332, 332, '02214', 'Gazole', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02215', 332, 332, '02215', 'Bamangola', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02216', 332, 332, '02216', 'Habibpur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02217', 332, 332, '02217', 'Maldah (Old)', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02218', 332, 332, '02218', 'English Bazar', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02219', 332, 332, '02219', 'Manikchak', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02220', 332, 332, '02220', 'Kaliachak - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02221', 332, 332, '02221', 'Kaliachak - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02222', 332, 332, '02222', 'Kaliachak - III', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02223', 333, 333, '02223', 'Farakka', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02224', 333, 333, '02224', 'Samserganj', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02225', 333, 333, '02225', 'Suti - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02226', 333, 333, '02226', 'Suti - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02227', 333, 333, '02227', 'Raghunathganj - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02228', 333, 333, '02228', 'Raghunathganj - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02229', 333, 333, '02229', 'Lalgola', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02230', 333, 333, '02230', 'Sagardighi', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02231', 333, 333, '02231', 'Bhagawangola - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02232', 333, 333, '02232', 'Bhagawangola - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02233', 333, 333, '02233', 'Raninagar - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02234', 333, 333, '02234', 'Jalangi', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02235', 333, 333, '02235', 'Domkal', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02236', 333, 333, '02236', 'Raninagar - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02237', 333, 333, '02237', 'Murshidabad Jiaganj', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02238', 333, 333, '02238', 'Nabagram', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02239', 333, 333, '02239', 'Khargram', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02240', 333, 333, '02240', 'Kandi', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02241', 333, 333, '02241', 'Berhampore', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02242', 333, 333, '02242', 'Hariharpara', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02243', 333, 333, '02243', 'Nawda', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02244', 333, 333, '02244', 'Beldanga - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02245', 333, 333, '02245', 'Beldanga - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02246', 333, 333, '02246', 'Bharatpur - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02247', 333, 333, '02247', 'Bharatpur - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02248', 333, 333, '02248', 'Burwan', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02249', 334, 334, '02249', 'Murarai - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02250', 334, 334, '02250', 'Murarai - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02251', 334, 334, '02251', 'Nalhati - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02252', 334, 334, '02252', 'Nalhati - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02253', 334, 334, '02253', 'Rampurhat - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02254', 334, 334, '02254', 'Rampurhat - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02255', 334, 334, '02255', 'Mayureswar - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02256', 334, 334, '02256', 'Mayureswar - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02257', 334, 334, '02257', 'Mohammad Bazar', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02258', 334, 334, '02258', 'Rajnagar', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02259', 334, 334, '02259', 'Suri - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02260', 334, 334, '02260', 'Suri - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02261', 334, 334, '02261', 'Sainthia', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02262', 334, 334, '02262', 'Labpur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02263', 334, 334, '02263', 'Nanoor', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02264', 334, 334, '02264', 'Bolpur Sriniketan', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02265', 334, 334, '02265', 'Illambazar', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02266', 334, 334, '02266', 'Dubrajpur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02267', 334, 334, '02267', 'Khoyrasol', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02268', 347, 347, '02268', 'Salanpur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02269', 347, 347, '02269', 'Barabani', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02270', 347, 347, '02270', 'Jamuria', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02271', 347, 347, '02271', 'Raniganj', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02272', 347, 347, '02272', 'Ondal', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02273', 347, 347, '02273', 'Pandabeswar', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02274', 347, 347, '02274', 'Faridpur Durgapur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02275', 347, 347, '02275', 'Kanksa', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02276', 335, 335, '02276', 'Ausgram - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02277', 335, 335, '02277', 'Ausgram - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02278', 335, 335, '02278', 'Mangolkote', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02279', 335, 335, '02279', 'Ketugram - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02280', 335, 335, '02280', 'Ketugram - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02281', 335, 335, '02281', 'Katwa - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02282', 335, 335, '02282', 'Katwa - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02283', 335, 335, '02283', 'Purbasthali - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02284', 335, 335, '02284', 'Purbasthali - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02285', 335, 335, '02285', 'Manteswar', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02286', 335, 335, '02286', 'Bhatar', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02287', 335, 335, '02287', 'Galsi - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02288', 335, 335, '02288', 'Galsi - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02289', 335, 335, '02289', 'Burdwan - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02290', 335, 335, '02290', 'Burdwan - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02291', 335, 335, '02291', 'Memari - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02292', 335, 335, '02292', 'Memari - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02293', 335, 335, '02293', 'Kalna - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02294', 335, 335, '02294', 'Kalna - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02295', 335, 335, '02295', 'Jamalpur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02296', 335, 335, '02296', 'Raina - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02297', 335, 335, '02297', 'Khandaghosh', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02298', 335, 335, '02298', 'Raina - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02299', 336, 336, '02299', 'Karimpur - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02300', 336, 336, '02300', 'Karimpur - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02301', 336, 336, '02301', 'Tehatta - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02302', 336, 336, '02302', 'Tehatta - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02303', 336, 336, '02303', 'Kaliganj', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02304', 336, 336, '02304', 'Nakashipara', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02305', 336, 336, '02305', 'Chapra', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02306', 336, 336, '02306', 'Krishnagar - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02307', 336, 336, '02307', 'Nabadwip', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02308', 336, 336, '02308', 'Krishnagar - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02309', 336, 336, '02309', 'Krishnaganj', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02310', 336, 336, '02310', 'Hanskhali', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02311', 336, 336, '02311', 'Santipur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02312', 336, 336, '02312', 'Ranaghat - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02313', 336, 336, '02313', 'Ranaghat - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02314', 336, 336, '02314', 'Chakdah', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02315', 336, 336, '02315', 'Haringhata', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02316', 337, 337, '02316', 'Bagda', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02317', 337, 337, '02317', 'Bongaon', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02318', 337, 337, '02318', 'Gaighata', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02319', 337, 337, '02319', 'Swarupnagar', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02320', 337, 337, '02320', 'Habra - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02321', 337, 337, '02321', 'Habra - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02322', 337, 337, '02322', 'Amdanga', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02323', 337, 337, '02323', 'Barrackpur - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02324', 337, 337, '02324', 'Barrackpur - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02325', 337, 337, '02325', 'Barasat - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02326', 337, 337, '02326', 'Barasat - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02327', 337, 337, '02327', 'Deganga', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02328', 337, 337, '02328', 'Baduria', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02329', 337, 337, '02329', 'Basirhat - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02330', 337, 337, '02330', 'Basirhat - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02331', 337, 337, '02331', 'Haroa', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02332', 337, 337, '02332', 'Rajarhat', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02333', 337, 337, '02333', 'Minakhan', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02334', 337, 337, '02334', 'Sandeshkhali - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02335', 337, 337, '02335', 'Sandeshkhali - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02336', 337, 337, '02336', 'Hasnabad', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02337', 337, 337, '02337', 'Hingalganj', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02338', 338, 338, '02338', 'Goghat - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02339', 338, 338, '02339', 'Goghat - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02340', 338, 338, '02340', 'Arambag', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02341', 338, 338, '02341', 'Pursura', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02342', 338, 338, '02342', 'Tarakeswar', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02343', 338, 338, '02343', 'Dhaniakhali', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02344', 338, 338, '02344', 'Pandua', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02345', 338, 338, '02345', 'Balagarh', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02346', 338, 338, '02346', 'Chinsurah - Magra', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02347', 338, 338, '02347', 'Polba - Dadpur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02348', 338, 338, '02348', 'Haripal', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02349', 338, 338, '02349', 'Singur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02350', 338, 338, '02350', 'Serampur Uttarpara', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02351', 338, 338, '02351', 'Chanditala - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02352', 338, 338, '02352', 'Chanditala - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02353', 338, 338, '02353', 'Jangipara', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02354', 338, 338, '02354', 'Khanakul - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02355', 338, 338, '02355', 'Khanakul - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02356', 339, 339, '02356', 'Saltora', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02357', 339, 339, '02357', 'Mejhia', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02358', 339, 339, '02358', 'Gangajalghati', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02359', 339, 339, '02359', 'Chhatna', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02360', 339, 339, '02360', 'Indpur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02361', 339, 339, '02361', 'Bankura - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02362', 339, 339, '02362', 'Bankura - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02363', 339, 339, '02363', 'Barjora', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02364', 339, 339, '02364', 'Sonamukhi', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02365', 339, 339, '02365', 'Patrasayer', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02366', 339, 339, '02366', 'Indus', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02367', 339, 339, '02367', 'Kotulpur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02368', 339, 339, '02368', 'Jaypur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02369', 339, 339, '02369', 'Vishnupur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02370', 339, 339, '02370', 'Onda', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02371', 339, 339, '02371', 'Taldangra', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02372', 339, 339, '02372', 'Simlapal', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02373', 339, 339, '02373', 'Khatra', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02374', 339, 339, '02374', 'Hirbandh', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02375', 339, 339, '02375', 'Ranibundh', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02376', 339, 339, '02376', 'Raipur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02377', 339, 339, '02377', 'Sarenga', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02378', 340, 340, '02378', 'Jaipur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02379', 340, 340, '02379', 'Purulia - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02380', 340, 340, '02380', 'Para', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02381', 340, 340, '02381', 'Raghunathpur - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02382', 340, 340, '02382', 'Raghunathpur - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02383', 340, 340, '02383', 'Neturia', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02384', 340, 340, '02384', 'Santuri', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02385', 340, 340, '02385', 'Kashipur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02386', 340, 340, '02386', 'Hura', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02387', 340, 340, '02387', 'Purulia - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02388', 340, 340, '02388', 'Puncha', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02389', 340, 340, '02389', 'Arsha', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02390', 340, 340, '02390', 'Jhalda - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02391', 340, 340, '02391', 'Jhalda - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02392', 340, 340, '02392', 'Bagmundi', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02393', 340, 340, '02393', 'Balarampur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02394', 340, 340, '02394', 'Barabazar', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02395', 340, 340, '02395', 'Manbazar - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02396', 340, 340, '02396', 'Manbazar - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02397', 340, 340, '02397', 'Bundwan', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02398', 341, 341, '02398', 'Udaynarayanpur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02399', 341, 341, '02399', 'Amta - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02400', 341, 341, '02400', 'Amta - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02401', 341, 341, '02401', 'Jagatballavpur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02402', 341, 341, '02402', 'Domjur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02403', 341, 341, '02403', 'Bally Jagachha', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02404', 341, 341, '02404', 'Sankrail', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02405', 341, 341, '02405', 'Panchla', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02406', 341, 341, '02406', 'Uluberia - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02407', 341, 341, '02407', 'Uluberia - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02408', 341, 341, '02408', 'Bagnan - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02409', 341, 341, '02409', 'Bagnan - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02410', 341, 341, '02410', 'Shyampur - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02411', 341, 341, '02411', 'Shyampur - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02412', 343, 343, '02412', 'Thakurpukur Mahestola', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02413', 343, 343, '02413', 'Budge Budge - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02414', 343, 343, '02414', 'Budge Budge - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02415', 343, 343, '02415', 'Bishnupur - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02416', 343, 343, '02416', 'Bishnupur - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02417', 343, 343, '02417', 'Sonarpur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02418', 343, 343, '02418', 'Bhangar - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02419', 343, 343, '02419', 'Bhangar - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02420', 343, 343, '02420', 'Canning - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02421', 343, 343, '02421', 'Canning - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02422', 343, 343, '02422', 'Baruipur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02423', 343, 343, '02423', 'Magrahat - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02424', 343, 343, '02424', 'Magrahat - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02425', 343, 343, '02425', 'Falta', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02426', 343, 343, '02426', 'Diamond Harbour - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02427', 343, 343, '02427', 'Diamond Harbour - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02428', 343, 343, '02428', 'Kulpi', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02429', 343, 343, '02429', 'Mandirbazar', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02430', 343, 343, '02430', 'Mathurapur - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02431', 343, 343, '02431', 'Jaynagar - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02432', 343, 343, '02432', 'Jaynagar - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02433', 343, 343, '02433', 'Kultali', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02434', 343, 343, '02434', 'Basanti', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02435', 343, 343, '02435', 'Gosaba', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02436', 343, 343, '02436', 'Mathurapur - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02437', 343, 343, '02437', 'Kakdwip', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02438', 343, 343, '02438', 'Sagar', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02439', 343, 343, '02439', 'Namkhana', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02440', 343, 343, '02440', 'Patharpratima', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02441', 348, 348, '02441', 'Binpur - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02442', 348, 348, '02442', 'Binpur - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02443', 344, 344, '02443', 'Garbeta - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02444', 344, 344, '02444', 'Garbeta - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02445', 344, 344, '02445', 'Garbeta - III', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02446', 344, 344, '02446', 'Chandrakona - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02447', 344, 344, '02447', 'Chandrakona - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02448', 344, 344, '02448', 'Ghatal', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02449', 344, 344, '02449', 'Daspur - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02450', 344, 344, '02450', 'Daspur - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02451', 344, 344, '02451', 'Keshpur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02452', 344, 344, '02452', 'Salbani', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02453', 344, 344, '02453', 'Midnapore', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02454', 348, 348, '02454', 'Jhargram', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02455', 348, 348, '02455', 'Jamboni', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02456', 348, 348, '02456', 'Gopiballavpur - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02457', 348, 348, '02457', 'Gopiballavpur - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02458', 348, 348, '02458', 'Nayagram', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02459', 348, 348, '02459', 'Sankrail', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02460', 344, 344, '02460', 'Kharagpur - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02461', 344, 344, '02461', 'Kharagpur - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02462', 344, 344, '02462', 'Debra', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02463', 344, 344, '02463', 'Pingla', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02464', 344, 344, '02464', 'Sabang', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02465', 344, 344, '02465', 'Narayangarh', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02466', 344, 344, '02466', 'Keshiary', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02467', 344, 344, '02467', 'Dantan - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02468', 344, 344, '02468', 'Dantan - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02469', 344, 344, '02469', 'Mohanpur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02470', 345, 345, '02470', 'Panskura', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02471', 345, 345, '02471', 'KOLAGHAT', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02472', 345, 345, '02472', 'Tamluk', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02473', 345, 345, '02473', 'Sahid Matangini', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02474', 345, 345, '02474', 'Nanda Kumar', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02475', 345, 345, '02475', 'Mahisadal', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02476', 345, 345, '02476', 'Moyna', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02477', 345, 345, '02477', 'Potashpur - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02478', 345, 345, '02478', 'Potashpur - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02479', 345, 345, '02479', 'Bhagawanpur - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02480', 345, 345, '02480', 'Bhagawanpur - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02481', 345, 345, '02481', 'Chandipur', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02482', 345, 345, '02482', 'Sutahata', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02483', 345, 345, '02483', 'Haldia', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02484', 345, 345, '02484', 'Nandigram - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02485', 345, 345, '02485', 'Nandigram - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02486', 345, 345, '02486', 'Khejuri - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02487', 345, 345, '02487', 'Khejuri - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02488', 345, 345, '02488', 'Contai - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02489', 345, 345, '02489', 'Deshopran', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02490', 345, 345, '02490', 'Contai - III', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02491', 345, 345, '02491', 'Egra - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02492', 345, 345, '02492', 'Egra - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02493', 345, 345, '02493', 'Ramnagar - I', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('02494', 345, 345, '02494', 'Ramnagar - II', 'synergic', '2019-12-09 00:00:00', NULL, NULL),
('0801734', 339, 339, '0801734', 'Bankura Municipality', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_branch`
--

CREATE TABLE `md_branch` (
  `id` int(11) NOT NULL COMMENT 'Here id is Disctrict Code',
  `branch_name` varchar(100) NOT NULL,
  `districts_catered` varchar(255) NOT NULL,
  `ho_flag` enum('N','Y') NOT NULL,
  `br_manager` varchar(50) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_dt` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` varchar(50) NOT NULL,
  `modified_dt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_branch`
--

INSERT INTO `md_branch` (`id`, `branch_name`, `districts_catered`, `ho_flag`, `br_manager`, `contact_no`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(327, 'Siliguri', '327', 'N', 'MRIDUL MONDAL', '9674746945', '', '2019-10-24 11:00:40', '', '2019-10-24 11:00:40'),
(328, 'Jalpaiguri', '328', 'N', 'MRIDUL MONDAL', '9674746945', '', '2019-10-21 14:24:24', '', '2019-10-21 14:24:24'),
(329, 'Cooch Behar', '329', 'N', 'KOUSHIK CHAKRABORTY', '9674746942', '', '2019-10-21 14:24:24', '', '2019-10-21 14:24:24'),
(330, 'Uttar Dinajpur', '330', 'N', 'PRASAD MONDAL	', '9674746941', '', '2019-10-24 11:00:40', '', '2019-10-24 11:00:40'),
(331, 'Dakhin Dinajpur', '331', 'N', 'MARSHAL SENGEL BASKEY	', '9674746940', '', '2019-10-24 11:00:40', '', '2019-10-24 11:00:40'),
(332, 'Maldah', '332', 'N', 'ISHAN BANIK	', '9674746939', '', '2019-10-24 11:00:40', '', '2019-10-24 11:00:40'),
(333, 'Murshidabad', '333', 'N', 'SUBHRA DAS	', '9674746936', '', '2019-10-24 11:00:40', '', '2019-10-24 11:00:40'),
(334, 'Birbhum', '334', 'N', 'MONTU KUMAR MAJI', '9674746932', '', '2019-10-24 11:00:40', '', '2019-10-24 11:00:40'),
(335, 'Purba Burdwan', '335', 'N', 'SUBRATA SEN	', '9674746928', '', '2019-10-24 11:00:40', '', '2019-10-24 11:00:40'),
(336, 'Nadia', '336', 'N', 'SUBHASISH BISWAS', '9674746934', '', '2019-10-24 11:00:40', '', '2019-10-24 11:00:40'),
(337, 'North 24 paragnas', '337', 'N', 'SABITA BISWAS', '9674746929', '', '2019-10-24 11:00:40', '', '2019-10-24 11:00:40'),
(338, 'Hooghly', '338', 'N', 'SOMNATH KOTAL', '9674746931', '', '2019-10-24 11:00:40', '', '2019-10-24 11:00:40'),
(339, 'Bankura', '339', 'N', 'KALYAN BISWAS', '9674746933', '', '2019-10-24 11:00:40', '', '2019-10-24 11:00:40'),
(340, 'Purulia', '340', 'N', 'SUMAN CHAKRABORTY', '9674746938', '', '2019-10-24 11:00:40', '', '2019-10-24 11:00:40'),
(341, 'Howrah', '341', 'N', 'SUBRATA CHATTOPADHYAY', '9674746944', '', '2019-10-24 11:00:40', '', '2019-10-24 11:00:40'),
(342, 'Head Office', '342', 'Y', '', '', '', '2019-10-24 11:02:00', '', '2019-10-24 11:02:00'),
(343, 'South 24 Parganas', '343', 'N', 'SUSMITA NATH', '9674746930', '', '2019-10-24 11:00:40', '', '2019-10-24 11:00:40'),
(344, 'Paschim Medinipur', '344', 'N', 'DEBANIK HORE', '9674746937', '', '2019-10-24 11:00:40', '', '2019-10-24 11:00:40'),
(345, 'Purba Medinipur', '345', 'N', 'SUBHANU GHOSH', '9674749635', '', '2019-10-24 11:00:40', '', '2019-10-24 11:00:40'),
(346, 'Alipurduar', '346', 'N', 'KOUSHIK CHAKRABORTY', '9674746942', '', '2019-10-21 14:24:24', '', '2019-10-21 14:24:24'),
(347, 'Paschim Burdwan', '347', 'N', '', '', '', '2019-10-24 11:00:40', '', '2019-10-24 11:00:40'),
(348, 'Jhargram', '348', 'N', 'DEBANIK HORE', '9674746937', '', '2019-10-24 11:00:40', '', '2019-10-24 11:00:40');

-- --------------------------------------------------------

--
-- Table structure for table `md_comm_params`
--

CREATE TABLE `md_comm_params` (
  `sl_no` int(11) NOT NULL,
  `cat` enum('M','S','H') NOT NULL,
  `param_name` varchar(100) NOT NULL,
  `boiled_val` decimal(10,2) NOT NULL DEFAULT 0.00,
  `raw_val` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tds` decimal(4,2) NOT NULL,
  `cgst` decimal(4,2) NOT NULL,
  `sgst` decimal(4,2) NOT NULL,
  `action` char(1) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_comm_params`
--

INSERT INTO `md_comm_params` (`sl_no`, `cat`, `param_name`, `boiled_val`, `raw_val`, `tds`, `cgst`, `sgst`, `action`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 'S', 'Statutory Charges[Market fee]', '9.08', '9.08', '0.00', '0.00', '0.00', 'P', 'Synergic Softek', '2018-11-01 12:57:05', NULL, NULL),
(2, 'M', 'Mandi Labour Charge', '10.33', '10.33', '1.50', '0.00', '0.00', 'P', 'Synergic Softek', '2018-11-01 12:57:52', NULL, NULL),
(3, 'M', 'Transportation Charges of paddy(1-25 KM)', '18.38', '18.38', '1.50', '0.00', '0.00', 'P', 'Synergic Softek', '2018-11-01 12:59:17', NULL, NULL),
(4, 'M', 'Transportation Charges of paddy(26-50 KM)', '0.50', '0.50', '1.50', '0.00', '0.00', 'P', 'Synergic Softek', '2018-11-01 12:59:54', NULL, NULL),
(5, 'M', 'Transportation Charges of paddy(51-100 KM)', '0.20', '0.20', '1.50', '0.00', '0.00', 'P', 'Synergic Softek', '2018-11-01 01:00:18', NULL, NULL),
(6, 'M', 'Inter District Transportation Charges', '0.00', '0.00', '1.50', '0.00', '0.00', 'P', 'Synergic Softek', '2019-07-03 12:46:47', NULL, NULL),
(7, 'M', 'Driage[@1% of MSP]', '0.00', '17.50', '0.00', '0.00', '0.00', 'P', 'Synergic Softek', '2018-11-01 01:01:26', NULL, NULL),
(8, 'S', 'Commission to Society', '31.25', '31.25', '3.75', '0.00', '0.00', 'P', 'Synergic Softek', '2018-11-01 01:01:58', NULL, NULL),
(9, 'M', 'Milling Charges', '30.00', '20.00', '2.00', '2.50', '2.50', 'P', 'Synergic Softek', '2018-11-01 01:02:52', NULL, NULL),
(10, 'H', 'Administrative Charges', '18.15', '18.15', '0.00', '0.00', '0.00', 'P', 'Synergic Softek', '2018-11-01 01:09:16', NULL, NULL),
(11, 'M', 'Transportation Charges of CMR', '18.38', '18.38', '1.50', '0.00', '0.00', 'C', 'Synergic Softek', '2018-11-01 01:13:37', NULL, NULL),
(12, 'M', 'Gunny Charge for Paddy', '28.10', '28.98', '0.00', '2.50', '2.50', 'C', 'Synergic Softek', '2018-11-01 01:17:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_district`
--

CREATE TABLE `md_district` (
  `district_code` int(11) NOT NULL,
  `district_name` varchar(50) NOT NULL,
  `dist_sort_code` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_district`
--

INSERT INTO `md_district` (`district_code`, `district_name`, `dist_sort_code`) VALUES
(327, 'DARJEELING', 'DAR'),
(328, 'JALPAIGURI', 'JPG'),
(329, 'COOCH BEHAR', 'COOH'),
(330, 'UTTAR DINAJPUR', 'NDNJ'),
(331, 'DAKSHIN DINAJPUR', 'SDNJ'),
(332, 'MALDAH', 'MLD'),
(333, 'MURSHIDABAD', 'MUR'),
(334, 'BIRBHUM', 'BRH'),
(335, 'PURBA BARDHAMAN', 'EBDN'),
(336, 'NADIA', 'NDA'),
(337, 'NORTH TWENTY FOUR PARGANAS', 'N24'),
(338, 'HOOGHLY', 'HOG'),
(339, 'BANKURA', 'BNK'),
(340, 'PURULIA', 'PUR'),
(341, 'HOWRAH', 'HWH'),
(342, 'KOLKATA', 'KOL'),
(343, 'SOUTH TWENTY FOUR PARGANAS', 'S24'),
(344, 'PASCHIM MIDNAPORE', 'WMDN'),
(345, 'PURBA MIDNAPORE', 'EMDN'),
(346, 'ALIPURDUAR', 'ALPD'),
(347, 'PASCHIM BARDHAMAN', 'WBDN'),
(348, 'JHARGRAM', 'JHG');

-- --------------------------------------------------------

--
-- Table structure for table `md_documents`
--

CREATE TABLE `md_documents` (
  `sl_no` varchar(10) NOT NULL,
  `documents` varchar(100) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_dt` datetime NOT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `md_fin_year`
--

CREATE TABLE `md_fin_year` (
  `sl_no` int(11) NOT NULL,
  `fin_yr` varchar(30) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` varchar(50) DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `md_fs_guide_lines`
--

CREATE TABLE `md_fs_guide_lines` (
  `sl_no` int(11) NOT NULL,
  `guide_lines` varchar(200) DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` varchar(50) NOT NULL,
  `modified_dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `md_kms_year`
--

CREATE TABLE `md_kms_year` (
  `sl_no` int(11) NOT NULL,
  `kms_yr` varchar(30) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` varchar(50) DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_kms_year`
--

INSERT INTO `md_kms_year` (`sl_no`, `kms_yr`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(4, '2021-22', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_mandilabour_charge`
--

CREATE TABLE `md_mandilabour_charge` (
  `sl_no` int(11) NOT NULL,
  `kms_id` int(11) NOT NULL,
  `particulars` varchar(55) NOT NULL,
  `rate` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_mandilabour_charge`
--

INSERT INTO `md_mandilabour_charge` (`sl_no`, `kms_id`, `particulars`, `rate`) VALUES
(1, 2, 'Filling & Placing the unit of Platform/Balance', '1.00'),
(2, 2, 'Weightment', '0.50'),
(3, 2, 'Unloading bags from Balance', '1.50'),
(4, 2, 'Manual/Machine stiching charges', '1.50'),
(5, 2, 'Mandi Market(labelling) Charges', '0.50'),
(6, 2, 'Temporary stackling at Mandi', '2.20'),
(7, 2, 'Weightment for Storage/Loading', '1.00'),
(8, 2, 'Loading of Stocks From Mandi ', '2.13');

-- --------------------------------------------------------

--
-- Table structure for table `md_mill`
--

CREATE TABLE `md_mill` (
  `sl_no` int(11) NOT NULL,
  `dist` int(11) NOT NULL,
  `block` varchar(8) NOT NULL,
  `mill_code` varchar(55) NOT NULL,
  `mill_name` varchar(100) NOT NULL,
  `reg_no` varchar(50) NOT NULL,
  `reg_date` date NOT NULL,
  `boiler_reg_no` varchar(30) NOT NULL,
  `tan` varchar(30) NOT NULL,
  `police_station` varchar(50) NOT NULL,
  `post_office` varchar(50) NOT NULL,
  `pin` int(11) NOT NULL,
  `mill_addr` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  `ph_no` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `branch_name` varchar(25) DEFAULT NULL,
  `acc_type` varchar(25) DEFAULT NULL,
  `acc_no` varchar(30) DEFAULT NULL,
  `ifsc_code` varchar(50) DEFAULT NULL,
  `pan_no` varchar(50) DEFAULT NULL,
  `gst_no` varchar(50) DEFAULT NULL,
  `guide_lines_id` varchar(5) NOT NULL DEFAULT 'O',
  `created_by` varchar(50) NOT NULL,
  `created_dt` date NOT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_mill`
--

INSERT INTO `md_mill` (`sl_no`, `dist`, `block`, `mill_code`, `mill_name`, `reg_no`, `reg_date`, `boiler_reg_no`, `tan`, `police_station`, `post_office`, `pin`, `mill_addr`, `branch_id`, `ph_no`, `email`, `bank_name`, `branch_name`, `acc_type`, `acc_no`, `ifsc_code`, `pan_no`, `gst_no`, `guide_lines_id`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 346, '02174', '27', 'DOOARS RICE MILL(27)', '', '0000-00-00', '', '', '', '', 0, '', 346, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(2, 346, '02175', '1190', 'FALAKATA AGRO FOOD PRODUCTS PVT. LTD.(1190)', '', '0000-00-00', '', '', '', '', 0, '', 346, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(3, 346, '02175', '1264', 'J AND G FOOD PRODUCTS(1264)', '', '0000-00-00', '', '', '', '', 0, '', 346, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(4, 346, '02170', '2211', 'JALDAPARA AGRO FOOD PRODUCTS (RAW)(2211)', '', '0000-00-00', '', '', '', '', 0, '', 346, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(5, 346, '02171', '1281', 'JPC RICE MILL(1281)', '', '0000-00-00', '', '', '', '', 0, '', 346, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(6, 346, '02170', '1247', 'MAA AMBEY INDUSTRIES(1247)', '', '0000-00-00', '', '', '', '', 0, '', 346, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(7, 346, '02174', '2213', 'MAA KALI RICE MILL(2213)', '', '0000-00-00', '', '', '', '', 0, '', 346, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(8, 346, '02174', '39', 'MANJUSHREE TEA INDIA PVT. LTD. UNIT DOOARS RICE MILL II(39)', '', '0000-00-00', '', '', '', '', 0, '', 346, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(9, 346, '02170', '1279', 'MARUTI FOOD PRODUCTS(1279)', '', '0000-00-00', '', '', '', '', 0, '', 346, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(10, 346, '02174', '1280', 'NARAYAN AGRITECH(1280)', '', '0000-00-00', '', '', '', '', 0, '', 346, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(11, 346, '02173', '1270', 'SARVASHIVA RICE MILL PVT. LTD.(1270)', '', '0000-00-00', '', '', '', '', 0, '', 346, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(12, 346, '02173', '2037', 'VINAYAK AGRO FOOD PRODUCTS(2037)', '', '0000-00-00', '', '', '', '', 0, '', 346, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(13, 339, '02364', '863', 'ABINASH RICE MILL(863)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(14, 339, '02365', '865', 'ANJAN MODERN RICE MILL(865)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(15, 339, '02364', '868', 'BABA BAGHRYARAI RICE MILL(868)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(16, 339, '02361', '1158', 'BHOLANATH BHATACHI RICE MILL(1158)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(17, 339, '02367', '880', 'DURGAMATA FOOD PRODUCTS P LTD.(880)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(18, 339, '02366', '881', 'GARIB NAWAJ AGRO PRODUCT(881)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(19, 339, '02369', '2009', 'JOY BABA BHOLANATH AGRITECH PVT. LTD.(2009)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(20, 339, '02369', '889', 'JUGAL KISHORE RICE MILL PRIVATE LIMITED(889)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(21, 339, '02367', '891', 'KAMALA RICE MILL KOTULPUR(891)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(22, 339, '02361', '895', 'KETHARDANGA RICE MILL(895)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(23, 339, '02367', '898', 'LEELABATI DEBI PROJECTS ENTERPRISE PRIVATE LTD.(898)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(24, 339, '02370', '2008', 'M/S SHIBA DURGA RICE MILL(2008)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(25, 339, '02371', '903', 'MA SANKARI MINI RICE MILL(903)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(26, 339, '02377', '1160', 'MAA ANNAPURNA RICE MILL(1160)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(27, 339, '02366', '902', 'MAA MAHAMAYA AGRO PRODUCTS(902)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(28, 339, '02364', '2007', 'MAITO KALI AGRO PRODUCT PVT. LTD.(2007)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(29, 339, '02364', '1161', 'MILLENIUM AGRO PRODUCT(1161)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(30, 339, '02377', '867', 'MS ANNAPURNA RICE MILL(867)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(31, 339, '02369', '872', 'MS BISHNUPUR RICE MILL(872)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(32, 339, '02370', '873', 'MS BISWAKARMA RICE MILL MINI(873)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(33, 339, '02371', '875', 'MS BISWANATH RICE MILL(875)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(34, 339, '02364', '1164', 'MS DAMODAR RICE MILL(1164)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(35, 339, '02371', '885', 'MS HARAGOURI RICE MILL(885)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(36, 339, '02371', '890', 'MS KALI MATA RICE MILL(890)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(37, 339, '02377', '1142', 'MS KAMALA MINI RICE MILL(1142)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(38, 339, '02364', '899', 'MS LAKSHMI NARAYAN AGRO PRODUCT(899)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(39, 339, '02370', '897', 'MS LAKSHMI NARAYAN RICE MILL ONDA(897)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(40, 339, '02376', '905', 'MS MAA TARA RICE MILL(905)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(41, 339, '02368', '910', 'MS NANDI RICE MILL(910)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(42, 339, '02365', '1156', 'MS SHREE SARADA AGRO INDUSTRIES(1156)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(43, 339, '02369', '926', 'MS SIBANI RICE MILL(926)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(44, 339, '02361', '883', 'MS SREE GOURANGA RICE MILL(883)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(45, 339, '02369', '930', 'MS SRIBASH RICE FLOUR AND OIL MILLS(930)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(46, 339, '02361', '2098', 'NAYANMONI AGRO PRODUCTS(2098)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(47, 339, '02370', '1334', 'NEW ANNAPURNA RICE MILL(1334)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(48, 339, '02365', '2118', 'NEW SHREE DURGA AGRO PRODUCT(2118)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(49, 339, '02372', '911', 'NIYATI RICE MILLS PVT. LTD.(911)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(50, 339, '02370', '1257', 'RAJLAKSHMI RICE MILL(1257)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(51, 339, '02367', '1263', 'RAMBHANU RICE MILL PVT. LTD.(1263)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(52, 339, '02367', '917', 'SANKAR PRASAD RICE MILL(917)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(53, 339, '02366', '921', 'SATHI AGRO PRODUCTS(921)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(54, 339, '02359', '929', 'SIVA DURGA MINI RICE MILL(929)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(55, 339, '02362', '1141', 'SRI HARI RICE MILL(1141)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(56, 339, '02373', '933', 'SRIPATILAL HALDER RICE MILL PVT. LTD.(933)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(57, 339, '02367', '1147', 'SURENDRANATH RICE MILL P LTD.(1147)', '', '0000-00-00', '', '', '', '', 0, '', 339, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(58, 334, '02259', '190', 'AMARDUTY AGRO TECH. PVT. LTD(190)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(59, 334, '02264', '191', 'AMARNATH RICE MILL(191)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(60, 334, '02257', '192', 'ARIHANT AGRICALTURE PRODUCTS (P) LTD(192)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(61, 334, '02262', '193', 'BABA JAMPESWAR RICE MILL(193)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(62, 334, '02261', '194', 'BASANTI MATA (MINI) RICE MILL(194)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(63, 334, '02264', '196', 'BHAGABATI CERELS PVT. LTD.(196)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(64, 334, '02266', '1267', 'BHARAT MATA AGRO INDUSTRIES(1267)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(65, 334, '02257', '198', 'BHARAT TIRTHA RICE MILL(198)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(66, 334, '02264', '199', 'BHOLEBOM RICE MILL(199)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(67, 334, '02261', '201', 'BIRBHUM AGRO PRODUCT PVT. LTD(201)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(68, 334, '02266', '202', 'BIRBHUM RICE &amp; GENERAL MILLS(202)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(69, 334, '02261', '204', 'CHANDRA RICE MILL(204)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(70, 334, '02261', '1313', 'DHARMARAJ MINI RICE MILL(1313)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(71, 334, '02263', '206', 'DHARMARAJ RICE MILL(206)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(72, 334, '02262', '208', 'FULLARA RICE MILL (P) LTD(208)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(73, 334, '02261', '210', 'GOPAL MINI RICE MILL(210)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(74, 334, '02265', '211', 'H.R. RICE MILL (P) LTD(211)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(75, 334, '02264', '213', 'INDRAJYOTI RICE MILL (P) LTD(213)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(76, 334, '02262', '215', 'JAMPESWAR AGRO UDYOG PRIVATE LIMITED(215)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(77, 334, '02255', '1122', 'JOY BABA JAMPESWAR RICE MILL(1122)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(78, 334, '02264', '216', 'JOY BHARAT RICE MILL(216)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(79, 334, '02261', '1150', 'JOY MAA BHAGABATI RICE MILL(1150)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(80, 334, '02261', '231', 'JOY MAA DURGA RICE MILL(231)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(81, 334, '02261', '1323', 'JOY MAA MAHAMAYA RICE MILL(1323)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(82, 334, '02255', '1151', 'JOY MAA TARA RICE MILL(1151)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(83, 334, '02249', '220', 'KRISHNA INDUSTRIES(220)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(84, 334, '02261', '221', 'KUSHAL AGRO PROCESSING PVT. LTD(221)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(85, 334, '02262', '2297', 'LABPUR RICE MILL LLP(2297)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(86, 334, '02264', '222', 'LAXMI SREE RICE MILL(222)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(87, 334, '02261', '223', 'M/S DAS RICE MILL(223)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(88, 334, '02261', '229', 'MA SANTI MOYEE RICE MILL(P)LTD(229)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(89, 334, '02255', '2305', 'MALLARPUR AGRO PRODUCTS (P) LTD.(2305)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(90, 334, '02251', '235', 'MARUTI RICE MILL(235)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(91, 334, '02264', '233', 'MOHONANANDA RICE MILL PVT LTD(233)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(92, 334, '02253', '237', 'N.D.P.P RICE MILL(237)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(93, 334, '02261', '238', 'NANDI KESWARI RICE MILL(238)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(94, 334, '02261', '240', 'P.K. CEREALS (P) LTD.(240)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(95, 334, '02264', '241', 'RAMA KRISHNA RICE MILL (P) LTD.(241)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(96, 334, '02263', '242', 'RAMI CHANDIDAS RICE MILL(242)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(97, 334, '02261', '1153', 'SAINTHIA RICE &amp; OIL MILL(1153)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(98, 334, '02261', '1322', 'SANGRA RICE MILL PRIVATE LIMITED(1322)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(99, 334, '02261', '245', 'SARADA RICE &amp; OIL MILLS(245)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(100, 334, '02261', '246', 'SARVOTTAM RICE MILL (P) LTD(246)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(101, 334, '02264', '249', 'SHIV SHAMBHU RICE MILL(249)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(102, 334, '02261', '250', 'SHREE AMBICA CEREALS (P) LTD(250)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(103, 334, '02266', '252', 'SREE BALAJI RICE UDYOG(252)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(104, 334, '02264', '253', 'SREE GOPAL RICE MILL(253)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(105, 334, '02261', '254', 'SREE JATADHARI RICE MILL (P) LTD.(254)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(106, 334, '02261', '256', 'SREE KRISHNA RICE MILL(256)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(107, 334, '02264', '258', 'SREE MAHABIR RICE MILL(258)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(108, 334, '02251', '261', 'SRI HOROGOURI RICE MILL (P) LTD(261)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(109, 334, '02263', '262', 'SRIMATI RICE MILL PVT LTD(262)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(110, 334, '02257', '264', 'SUBHA RAKSHA KALI RICE MILLS (P) LTD(264)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(111, 334, '02259', '266', 'SURI RICE MILL(266)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(112, 334, '02253', '268', 'U.B RICE MILL(268)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(113, 334, '02266', '269', 'UMARANI AGRO-TECH PVT. LTD(269)', '', '0000-00-00', '', '', '', '', 0, '', 334, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(114, 329, '02187', '54', 'ALOKJHARI MINI RICE MILL(54)', '', '0000-00-00', '', '', '', '', 0, '', 329, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(115, 329, '02187', '1266', 'MAA MAHAMAYA AGRO FOOD PVT. LTD(1266)', '', '0000-00-00', '', '', '', '', 0, '', 329, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(116, 329, '02184', '58', 'MADAN MOHAN RICE MILL(58)', '', '0000-00-00', '', '', '', '', 0, '', 329, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(117, 329, '02184', '1060', 'MODERN AGROTECH INDUSTRIES(1060)', '', '0000-00-00', '', '', '', '', 0, '', 329, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(118, 329, '02182', '60', 'RM AGROTECH PRODUCTS PVT. LTD(60)', '', '0000-00-00', '', '', '', '', 0, '', 329, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(119, 329, '02184', '1278', 'S R AUTO RICE MILL(1278)', '', '0000-00-00', '', '', '', '', 0, '', 329, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(120, 329, '02184', '1065', 'SANJAY RICE MILL PVT. LTD.(1065)', '', '0000-00-00', '', '', '', '', 0, '', 329, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(121, 329, '02187', '1171', 'SHREE NANDAN KANAN AGRO PRODUCTS PVT.LTD.(1171)', '', '0000-00-00', '', '', '', '', 0, '', 329, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(122, 329, '02185', '1265', 'TUFANGANJ AGRO INDUSTRIES PVT. LTD(1265)', '', '0000-00-00', '', '', '', '', 0, '', 329, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(123, 331, '02201', '90', 'BINDHESWARI RICE MILL PVT. LTD.(90)', '', '0000-00-00', '', '', '', '', 0, '', 331, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(124, 331, '02207', '92', 'HARIRAMPUR MODERN RICE MILL(92)', '', '0000-00-00', '', '', '', '', 0, '', 331, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(125, 331, '02201', '93', 'JOARDER RICE MILL P LIMITED(93)', '', '0000-00-00', '', '', '', '', 0, '', 331, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(126, 331, '02201', '98', 'M/S BASANTI MINI RICE MILL(98)', '', '0000-00-00', '', '', '', '', 0, '', 331, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(127, 331, '02206', '88', 'M/S BHOLANATH MINI RICE MILL(88)', '', '0000-00-00', '', '', '', '', 0, '', 331, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(128, 331, '02201', '101', 'MAA BASANTI RICE MILL P LTD.(101)', '', '0000-00-00', '', '', '', '', 0, '', 331, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(129, 331, '02204', '89', 'MAA BIDDESWARI AGRO PRODUCTS P LTD.(89)', '', '0000-00-00', '', '', '', '', 0, '', 331, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(130, 331, '02205', '108', 'SARKAR MINI RICE MILL.(108)', '', '0000-00-00', '', '', '', '', 0, '', 331, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(131, 331, '02201', '2121', 'SHIV DURGA RICE MILL PVT LTD(2121)', '', '0000-00-00', '', '', '', '', 0, '', 331, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(132, 331, '02204', '1205', 'SHREE AVADHBIHARI AGRO PRODUCT PVT. LTD.(1205)', '', '0000-00-00', '', '', '', '', 0, '', 331, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(133, 331, '02205', '117', 'SHREE RAGHUVIR AGRO PRODUCT P LTD.(117)', '', '0000-00-00', '', '', '', '', 0, '', 331, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(134, 331, '02201', '1314', 'Swarna Biva Rice Mill(1314)', '', '0000-00-00', '', '', '', '', 0, '', 331, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(135, 331, '02200', '1125', 'UTTAR BANGA UDYOG(1125)', '', '0000-00-00', '', '', '', '', 0, '', 331, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(136, 331, '02205', '121', 'VIGHNESWAR RICE MILL P LTD(121)', '', '0000-00-00', '', '', '', '', 0, '', 331, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(137, 327, '02165', '1325', 'BARFANI AGRO PRODUCTS(P)LTD. (RAW)(1325)', '', '0000-00-00', '', '', '', '', 0, '', 327, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(138, 327, '02163', '1109', 'BIMAN EXPORTS RAW RICE MILL(1109)', '', '0000-00-00', '', '', '', '', 0, '', 327, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(139, 327, '02165', '1105', 'CHAND TARA RICE MILL(1105)', '', '0000-00-00', '', '', '', '', 0, '', 327, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(140, 327, '02163', '1258', 'DIYAA RAW RICE MILL(1258)', '', '0000-00-00', '', '', '', '', 0, '', 327, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(141, 327, '02163', '1', 'GANAPATI MINI RICE MILL(1)', '', '0000-00-00', '', '', '', '', 0, '', 327, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(142, 327, '02163', '2', 'GANGA TRADING CO.(2)', '', '0000-00-00', '', '', '', '', 0, '', 327, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(143, 327, '02162', '3', 'GOURI RICE MILL(3)', '', '0000-00-00', '', '', '', '', 0, '', 327, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(144, 327, '02162', '4', 'JORETHANG RICE MILL(4)', '', '0000-00-00', '', '', '', '', 0, '', 327, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(145, 327, '02162', '5', 'MAA DURGA RICE MILL(5)', '', '0000-00-00', '', '', '', '', 0, '', 327, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(146, 327, '02162', '1110', 'MAA MANASA MODERN RICE MILL(1110)', '', '0000-00-00', '', '', '', '', 0, '', 327, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(147, 327, '02165', '8', 'MINU ENTERPRISE(8)', '', '0000-00-00', '', '', '', '', 0, '', 327, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(148, 327, '02164', '1321', 'RAGHUNATH INDUSTRIES(1321)', '', '0000-00-00', '', '', '', '', 0, '', 327, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(149, 327, '02162', '12', 'SUCHI TRADING COMPANY PRIVATE LIMITED(12)', '', '0000-00-00', '', '', '', '', 0, '', 327, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(150, 327, '02165', '1104', 'SWASTIK AGRO INDUSTRIES(1104)', '', '0000-00-00', '', '', '', '', 0, '', 327, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(151, 327, '02163', '14', 'TARA RICE MILL(14)', '', '0000-00-00', '', '', '', '', 0, '', 327, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(152, 338, '02338', '747', 'AJIT RICE MIL PVT.LTD(747)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(153, 338, '02343', '2201', 'ASO AGRO PVT LTD(2201)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(154, 338, '02340', '773', 'ATUL MINI RICE MILL(773)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(155, 338, '02339', '1067', 'BABA BISWANATH RICE MILL(1067)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(156, 338, '02340', '749', 'BABA NARAYAN RICE MILL PVT.LTD(749)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(157, 338, '02345', '751', 'BALAGARH RICE MILL PVT.LTD(751)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(158, 338, '02343', '752', 'BASANTI DEVI RICE MILL. PVT.LTD(752)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(159, 338, '02347', '754', 'BENGAL RICE MILL PVT.LTD.(754)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(160, 338, '02338', '756', 'BISHALAXMI RICE MILL P LTD(756)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(161, 338, '02338', '779', 'CHANDIMATA RICE MILL P LTD.(779)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(162, 338, '02338', '780', 'DAMODAR RICE MILL P LTD(780)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(163, 338, '02343', '1253', 'DHANIAKHALI AGRO PRODUCT PVT. LTD.(1253)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(164, 338, '02338', '759', 'DIGAMBARI RICE MILL PVT.LTD(759)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(165, 338, '02340', '760', 'FOUR STAR RICE MILL PVT.LTD(760)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(166, 338, '02338', '761', 'GEETANJALI RICE MILL PVT LTD(761)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(167, 338, '02343', '762', 'GREENFIELD NUTRITIOUS PVT.LTD(762)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(168, 338, '02347', '763', 'HIGHRISE ROLLER FLOUR MILLS PVT. LTD. RICE UNIT(763)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(169, 338, '02348', '764', 'JASMINE RICE MILL. PVT. LTD(764)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(170, 338, '02340', '2092', 'JOSHODA OIL UDYOG PRIVATE LIMITED(2092)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(171, 338, '02343', '1195', 'JOYGURU RICE MILL(1195)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(172, 338, '02340', '765', 'JOYRAMPUR RICE MILL PVT.LTD(765)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(173, 338, '02343', '767', 'K.P.SAHA (UNIT MAA BAMESWARI RICE MILLL)(767)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(174, 338, '02340', '768', 'KAPSIT RICE MILL PVT.LTD(768)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(175, 338, '02343', '1191', 'KRISH AGRO FARMS PVT. LTD.(1191)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(176, 338, '02343', '1192', 'LAKSHMI JANARDHAN RICE MILL(1192)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(177, 338, '02343', '1260', 'LARICA AGRO(1260)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(178, 338, '02338', '771', 'M/S ADHIR RICE MILL.(771)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(179, 338, '02338', '775', 'M/S BETBANI RICE MILL(775)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(180, 338, '02340', '776', 'M/S BHARATMATA RICE MILL(776)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(181, 338, '02338', '777', 'M/S BISWAYAN RICE MILL(777)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(182, 338, '02338', '778', 'M/S CHANDIMATA RICE MILL (N)(778)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(183, 338, '02338', '785', 'M/S GOURANGA RICE MILL(785)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(184, 338, '02338', '788', 'M/S JAGADHATRI RICE MILL(788)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(185, 338, '02338', '790', 'M/S KALIMATA RICE MILL(790)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(186, 338, '02338', '792', 'M/S LAKSHMI NARAYAN RICE MILL(792)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(187, 338, '02338', '793', 'M/S LOKNATH FOOD PRODUCTS(793)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(188, 338, '02338', '795', 'M/S MA GOURI RICE MILL (K)(795)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(189, 338, '02340', '801', 'M/S MAA GOURI RICE MILL (R)(801)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(190, 338, '02347', '806', 'M/S NANDY ROYCHOWDHURY RICE MILL(806)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(191, 338, '02338', '811', 'M/S PATALESWAR MINI RICE MILL(811)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(192, 338, '02340', '812', 'M/S RADHARANI RICE MILL(812)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(193, 338, '02338', '818', 'M/S SITARAM RICE MILL(818)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(194, 338, '02340', '821', 'M/S SREE KRISHNA RICE MILL(821)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(195, 338, '02340', '822', 'M/S TARA MA RICE MILL(822)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(196, 338, '02338', '823', 'M/S TARAKNATH RICE MILL(823)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(197, 338, '02340', '1196', 'M/S. SREE RAMKRISHNA RICE MILL(1196)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(198, 338, '02340', '828', 'MA DURGA AGRO PRODUCTS(828)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(199, 338, '02338', '829', 'MA SITALA RICE MILL PVT.LTD(829)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(200, 338, '02340', '836', 'MADINA RICE MILL P LTD.(836)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(201, 338, '02348', '1255', 'MAGENTA DISTRIBUTORS PVT. LTD.(1255)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(202, 338, '02340', '832', 'MAHALAKSHMI RICE MILL PVT. LTD.(832)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(203, 338, '02343', '834', 'MATRI MANDIR RICE MILL. PVT.LTD(834)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(204, 338, '02347', '1336', 'MATRIBHUMI RICE MILLS L.L.P.(1336)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(205, 338, '02340', '835', 'MINAR AGRO PVT.LTD(835)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(206, 338, '02340', '837', 'MOTHER INDIA RICE MILL(837)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(207, 338, '02340', '1254', 'MRIGENDRA RICE MILL (P) LTD.(1254)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(208, 338, '02338', '1272', 'MS BISWALAXMI AGRO PRODUCT(1272)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(209, 338, '02340', '789', 'MS JOYGURU RICE MILL(789)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(210, 338, '02340', '791', 'MS KAMALA RICE MILL(791)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(211, 338, '02338', '840', 'MS NEW SHIVA SAMBHU RICE MILL(840)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(212, 338, '02340', '813', 'MS RAJLAKSHMI RICE MILL(813)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(213, 338, '02343', '1194', 'MS SANDDHIKSHAN RICE MILL(1194)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(214, 338, '02338', '846', 'MS SATYANARAYAN RICE MILL K(846)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(215, 338, '02338', '816', 'MS SHIB SANKAR FOOD PRODUCTS(816)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(216, 338, '02338', '815', 'MS SHIBA SAMBHU RICE MILL(815)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(217, 338, '02340', '851', 'MS SREE GANESH RICE MILL(851)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(218, 338, '02348', '1335', 'N SARKAR AGRO PRODUCTS PVT LTD(1335)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(219, 338, '02343', '1193', 'NEW PASUPATI AGRO PRODUCT(1193)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(220, 338, '02340', '1333', 'PANCHANANI RICE MILL(1333)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(221, 338, '02343', '841', 'PARANKUSH FOOD PROCESSING &amp; RICE MILL PVT.LTD(841)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(222, 338, '02338', '2111', 'PROMILA RICE MILL PVT. LTD(2111)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(223, 338, '02344', '842', 'RAJ RAJESWAR RICE MILLS PVT.LTD.(842)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(224, 338, '02340', '843', 'RAMMOHAN RICE MILL PVT. LTD(843)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(225, 338, '02338', '817', 'SHIV TARA RICE MILL P LTD.(817)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(226, 338, '02338', '847', 'SHYAMA MA RICE MILL(847)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(227, 338, '02344', '848', 'SHYAMA TARA RICE MILL PVT.LTD.(848)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(228, 338, '02338', '849', 'SITALAMATA MINI RICE MILL(849)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(229, 338, '02339', '820', 'SREE GOBINDA RICE MILL(820)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(230, 338, '02346', '852', 'SREE JAGANNATH MODERN RICE MILL(852)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(231, 338, '02346', '853', 'SREE KAMALA RICE MILL(853)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(232, 338, '02353', '2027', 'SURAPATI AGRO PRODUCTS PRIVATE LIM(2027)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(233, 338, '02338', '857', 'TARA SHAKTI RICE MINI MILL(857)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(234, 338, '02339', '856', 'TARASHAKTI RICE MILL PVT LTD(856)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(235, 338, '02347', '860', 'VAIBHAV LAXMI AGRO FOOD PVT.LTD.(860)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(236, 338, '02338', '861', 'VIVEKANANDAN RICE MILL PVT.LTD(861)', '', '0000-00-00', '', '', '', '', 0, '', 338, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(237, 341, '02406', '951', 'ANKIT INDIA LIMITED(951)', '', '0000-00-00', '', '', '', '', 0, '', 341, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(238, 341, '02409', '952', 'B.D.AGROPRODUCTS PVT.LTD(952)', '', '0000-00-00', '', '', '', '', 0, '', 341, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(239, 341, '02409', '953', 'B.D.CORPORATES PVT.LTD(953)', '', '0000-00-00', '', '', '', '', 0, '', 341, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(240, 341, '02400', '955', 'PARAGON RICE MILL(955)', '', '0000-00-00', '', '', '', '', 0, '', 341, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(241, 341, '02400', '956', 'PARAMOUNT RICE MILL(956)', '', '0000-00-00', '', '', '', '', 0, '', 341, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(242, 341, '02411', '957', 'SATYANARAYAN RICE MILL(957)', '', '0000-00-00', '', '', '', '', 0, '', 341, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(243, 328, '02166', '15', 'ANANDAMAYEE FOOD PRODUCTS(15)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(244, 328, '02177', '19', 'ARATI RICE MILL(19)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(245, 328, '02166', '20', 'ASMIT MINI RICE MILL(20)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(246, 328, '02178', '21', 'BANERJEE RICE MILL(21)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(247, 328, '02166', '23', 'BARLIA RICE MILL(23)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(248, 328, '02178', '24', 'BHAGWATI FOOD PRODUCT(24)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(249, 328, '02166', '1239', 'BHARAT INDUSTRIES(1239)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(250, 328, '02166', '25', 'BISLANIA AGRO PRODUCTS(25)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(251, 328, '02166', '1309', 'BISLANIA AGRO PRODUCTS(RAW)(1309)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL);
INSERT INTO `md_mill` (`sl_no`, `dist`, `block`, `mill_code`, `mill_name`, `reg_no`, `reg_date`, `boiler_reg_no`, `tan`, `police_station`, `post_office`, `pin`, `mill_addr`, `branch_id`, `ph_no`, `email`, `bank_name`, `branch_name`, `acc_type`, `acc_no`, `ifsc_code`, `pan_no`, `gst_no`, `guide_lines_id`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(252, 328, '02166', '1337', 'DALMIA GOLD RICE MILL(1337)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(253, 328, '02178', '1304', 'EVERGREEN RICE MILL(1304)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(254, 328, '02178', '28', 'HARI CHAND MINI RICE MILL(28)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(255, 328, '02178', '29', 'INDRAMANI MINI RICE MILL(29)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(256, 328, '02177', '2187', 'JALDAPARA INDUSTRIES PRIVATE LIMITED(2187)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(257, 328, '02177', '32', 'KAILASH RICE MILL(32)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(258, 328, '02166', '33', 'KANCHANJANGHA RICE MILL PVT. LTD(33)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(259, 328, '02166', '34', 'KRISHNA BHOG FOOD PRODUCTS(34)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(260, 328, '02177', '35', 'M. D. AGRO(35)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(261, 328, '02167', '1085', 'MAA KAMAKHYA RICE MILL(1085)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(262, 328, '02177', '37', 'MAA MAINAMATA WAREHOUSING PVT LTD.(37)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(263, 328, '02177', '36', 'MAA MAYNAMATA AGRO PVT. LTD(36)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(264, 328, '02166', '1248', 'MARUTI RICE MILL (RAW)(1248)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(265, 328, '02177', '1186', 'MAYNAGURI AGRO TEA PVT. LTD.(1186)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(266, 328, '02166', '42', 'NORTH BENGAL FOOD PRODUCTS (P) LTD.(42)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(267, 328, '02166', '2040', 'NORTH EAST AGRO PRODUCT(2040)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(268, 328, '02177', '44', 'PASUPATI RICE MILL(44)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(269, 328, '02178', '45', 'RIYA AGRO FOOD &amp; WAREHOUSING (P) LTD.(45)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(270, 328, '02166', '48', 'SHIVAM RICE MILL(48)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(271, 328, '02166', '1086', 'SIDHARTH AGRO TECH(1086)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(272, 328, '02166', '49', 'SILIGURI RICE & GENERAL MILL(49)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(273, 328, '02166', '50', 'SILIGURI RICE &amp; GENERAL MILL (RAW)(50)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(274, 328, '02166', '52', 'SREE LAKSMI RICE MILL(52)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(275, 328, '02178', '53', 'TIRUPATI RICE MILL(53)', '', '0000-00-00', '', '', '', '', 0, '', 328, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(276, 348, '02454', '977', 'BHOLAKANYA RICE MILL PVT. LTD.(977)', '', '0000-00-00', '', '', '', '', 0, '', 348, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(277, 348, '02442', '981', 'G.G. AGRO PRODUCTS PVT. LTD.(981)', '', '0000-00-00', '', '', '', '', 0, '', 348, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(278, 348, '02442', '982', 'GRAMI AGRO PVT. LTD.(982)', '', '0000-00-00', '', '', '', '', 0, '', 348, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(279, 348, '02455', '984', 'JAGATMATA RICE MILL PVT. LTD.(984)', '', '0000-00-00', '', '', '', '', 0, '', 348, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(280, 348, '02454', '985', 'JHARGRAM RICE MILL(985)', '', '0000-00-00', '', '', '', '', 0, '', 348, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(281, 348, '02454', '989', 'KANAK DURGA AGRO PRODUCTS PVT. LTD.(989)', '', '0000-00-00', '', '', '', '', 0, '', 348, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(282, 348, '02454', '2058', 'LALMATI FOOD INDUSTRIES PVT.LTD(2058)', '', '0000-00-00', '', '', '', '', 0, '', 348, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(283, 348, '02442', '997', 'M S AGRO PVT. LTD.(997)', '', '0000-00-00', '', '', '', '', 0, '', 348, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(284, 348, '02442', '1009', 'OM RICE MILLS PRIVATE LIMITED(1009)', '', '0000-00-00', '', '', '', '', 0, '', 348, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(285, 348, '02454', '1011', 'PATRA INDUSTRIES(1011)', '', '0000-00-00', '', '', '', '', 0, '', 348, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(286, 348, '02454', '1012', 'PITA MATA RICE MILLS PVT. LTD.(1012)', '', '0000-00-00', '', '', '', '', 0, '', 348, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(287, 348, '02441', '1269', 'PURNA CHANDRA RICE MILL PVT LTD(1269)', '', '0000-00-00', '', '', '', '', 0, '', 348, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(288, 348, '02454', '1289', 'R.R.AGRO(1289)', '', '0000-00-00', '', '', '', '', 0, '', 348, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(289, 348, '02404', '1305', 'SARADA AGROVET PRIVATE LIMITED(1305)', '', '0000-00-00', '', '', '', '', 0, '', 348, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(290, 348, '02454', '1020', 'SARKAR ENTERPRISE(1020)', '', '0000-00-00', '', '', '', '', 0, '', 348, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(291, 348, '02442', '1019', 'SCP FOODS PVT. LTD.(1019)', '', '0000-00-00', '', '', '', '', 0, '', 348, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(292, 348, '02456', '2123', 'Subarnarekha Rice Mill Pvt Ltd(2123)', '', '0000-00-00', '', '', '', '', 0, '', 348, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(293, 332, '02216', '124', 'ABANI RICE MILL PVT.LTD.(124)', '', '0000-00-00', '', '', '', '', 0, '', 332, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(294, 332, '02208', '126', 'AGARWALA MODERN RICE MILL(126)', '', '0000-00-00', '', '', '', '', 0, '', 332, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(295, 332, '02217', '134', 'BABA BAIDYANATH RICE MILL(134)', '', '0000-00-00', '', '', '', '', 0, '', 332, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(296, 332, '02208', '1203', 'BAKE BIHARI AGROTECH PROJECTS PVT. LTD.(1203)', '', '0000-00-00', '', '', '', '', 0, '', 332, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(297, 332, '02214', '2065', 'BIDHATA AGRO FOOD INDUSTRIES PVT LTD(2065)', '', '0000-00-00', '', '', '', '', 0, '', 332, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(298, 332, '02218', '2162', 'HABIBPUR GRAINS INDUSTRIES PVT.LTD(2162)', '', '0000-00-00', '', '', '', '', 0, '', 332, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(299, 332, '02214', '131', 'JAI MAA DURGA RICE MILL (P) LTD.(131)', '', '0000-00-00', '', '', '', '', 0, '', 332, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(300, 332, '02214', '133', 'JOY LOKNATH RICE MILLS PVT. LTD.(133)', '', '0000-00-00', '', '', '', '', 0, '', 332, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(301, 332, '02210', '135', 'M/S- MAHARAJ RICE MILL(135)', '', '0000-00-00', '', '', '', '', 0, '', 332, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(302, 332, '02217', '139', 'MAA JOY TARA RICE MILL (P) LTD.(139)', '', '0000-00-00', '', '', '', '', 0, '', 332, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(303, 332, '02208', '141', 'MAA KAMALESHWARI RICE MILL(141)', '', '0000-00-00', '', '', '', '', 0, '', 332, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(304, 332, '02208', '130', 'MS GUPTA RICE MILL(130)', '', '0000-00-00', '', '', '', '', 0, '', 332, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(305, 332, '02210', '145', 'MURARI MOHAN RICE MILLS PVT. LTD(145)', '', '0000-00-00', '', '', '', '', 0, '', 332, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(306, 332, '02214', '146', 'RIDDHI SIDDHI RICE MILLS PVT. LTD.(146)', '', '0000-00-00', '', '', '', '', 0, '', 332, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(307, 332, '02210', '147', 'SAMSI RICE MILL PVT. LTD.(147)', '', '0000-00-00', '', '', '', '', 0, '', 332, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(308, 332, '02214', '2064', 'SHAKAMBARI RICE MILL PRIVATE LIMITED(2064)', '', '0000-00-00', '', '', '', '', 0, '', 332, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(309, 332, '02214', '152', 'SHREE BAJRANGBALI AGRO INDUSTRIES P LTD.(152)', '', '0000-00-00', '', '', '', '', 0, '', 332, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(310, 332, '02208', '153', 'SHREE RAMESWARI RICE MILL(153)', '', '0000-00-00', '', '', '', '', 0, '', 332, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(311, 332, '02214', '154', 'SOUHARDYA INDUSTRIES(154)', '', '0000-00-00', '', '', '', '', 0, '', 332, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(312, 332, '02208', '155', 'SUREKA MODERN RICE MILL P LTD.(155)', '', '0000-00-00', '', '', '', '', 0, '', 332, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(313, 332, '02216', '156', 'SWATHI RICE MILL CO (P) LTD.(156)', '', '0000-00-00', '', '', '', '', 0, '', 332, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(314, 332, '02214', '157', 'TRINATH RICE MILLS PVT. LTD.(157)', '', '0000-00-00', '', '', '', '', 0, '', 332, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(315, 333, '02238', '1227', 'AGARWALLA AGRO RICE MILLS PVT LTD(1227)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(316, 333, '02240', '159', 'ANANDAMOYEE AGRO &amp; ALLIED PRODUCTS(P) LTD.(159)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(317, 333, '02230', '2003', 'ANNAPURNA RICE MILL(2003)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(318, 333, '02247', '170', 'ASHIRBAD AGRO FOOD PRODUCT(170)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(319, 333, '02240', '160', 'B.S.RICE MILL (P) LTD(160)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(320, 333, '02238', '162', 'BERHAMPORE AGRO MED AND DAIRY FARM P LTD.(162)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(321, 333, '02227', '163', 'BHAGIRATHI MODERN RICE MILL P LTD.(163)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(322, 333, '02240', '164', 'BIJOY KRISHNA MODERN RICE MILL (P) LTD(164)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(323, 333, '02238', '165', 'DHANLAXMI INDUSTRIES P LTD(165)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(324, 333, '02239', '172', 'DHARMARAJ RICE MILL P LTD.(172)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(325, 333, '02241', '167', 'GANGA RICE MILL (P) LTD(167)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(326, 333, '02247', '1276', 'HARAPARBATI AGRITECH P LTD(1276)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(327, 333, '02227', '1275', 'HARIYALI FOODS CO. P LTD.(1275)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(328, 333, '02238', '2019', 'HOQUE MERCANTILE PVT LTD(2019)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(329, 333, '02238', '1277', 'JHM RICE MILLS P LTD(1277)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(330, 333, '02239', '169', 'M/S ANANYA RICE MILL(P)LTD(169)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(331, 333, '02239', '173', 'M/S SHERPUR MODERN RICE MILL(173)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(332, 333, '02227', '174', 'M/S SHIV RICE MILL(174)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(333, 333, '02227', '175', 'MAA USHA RICE MILL(175)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(334, 333, '02247', '1113', 'MAA UTTARBAHINI AGRO INDUSTRIES P LTD(1113)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(335, 333, '02247', '176', 'MAA UTTARBAHINI RICE MILL (P) LTD.(176)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(336, 333, '02248', '1311', 'MERY RICE MILL(1311)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(337, 333, '02248', '178', 'MURSHIDABAD RICE MILL(178)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(338, 333, '02247', '1112', 'NEW INDIA RICE MILL(1112)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(339, 333, '02247', '179', 'RADHAGOBINDA RICE MILLS P LTD.(179)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(340, 333, '02247', '180', 'RAJLAXMI AGRO FOOD PRODUCT P LTD.(180)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(341, 333, '02247', '2105', 'RAJLAXMI AGRO PROCESSOR P LTD(2105)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(342, 333, '02247', '2106', 'ROYJA INDUSTRIES P LTD(2106)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(343, 333, '02247', '182', 'SARBAMANGALA AGRO PRODUCTS P LTD.(182)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(344, 333, '02235', '1273', 'SEFALI RICE MILLS P LTD.(1273)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(345, 333, '02246', '1251', 'SHIBA KALI AGRO PRODUCTS P LTD.(1251)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(346, 333, '02227', '185', 'SHIV INDUSTRIES FOOD PVT. LTD.(185)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(347, 333, '02246', '1300', 'SONARTORI RICE MILL P LTD.(1300)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(348, 333, '02241', '186', 'SUMAN MODERN RICE MILL PLTD.(186)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(349, 333, '02238', '1302', 'SUNITA AGRO RICE MILLS PVT. LTD(1302)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(350, 333, '02247', '188', 'TINA MUNI MINI RICE MILL(188)', '', '0000-00-00', '', '', '', '', 0, '', 333, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(351, 336, '02312', '1188', 'ANNADATRI RICE MILL PVT.LTD.(1188)', '', '0000-00-00', '', '', '', '', 0, '', 336, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(352, 336, '02312', '699', 'ANNAPURNA RICE MILL(699)', '', '0000-00-00', '', '', '', '', 0, '', 336, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(353, 336, '02314', '2015', 'ASHOK BISWAS RICE M(2015)', '', '0000-00-00', '', '', '', '', 0, '', 336, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(354, 336, '02314', '1084', 'CHAKDAH RICE MILL PVT LTD.(1084)', '', '0000-00-00', '', '', '', '', 0, '', 336, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(355, 336, '02315', '700', 'GIRIBALA AGRO PRODUCT(700)', '', '0000-00-00', '', '', '', '', 0, '', 336, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(356, 336, '02315', '2028', 'JOY DURGA RICE MILL(2028)', '', '0000-00-00', '', '', '', '', 0, '', 336, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(357, 336, '02314', '2110', 'M/S JYOTSHNA RICE(2110)', '', '0000-00-00', '', '', '', '', 0, '', 336, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(358, 336, '02312', '702', 'MS. MAA LAXMI MODERN RICE MILL(702)', '', '0000-00-00', '', '', '', '', 0, '', 336, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(359, 336, '02303', '1274', 'MS. NEELAM RICE MILL(1274)', '', '0000-00-00', '', '', '', '', 0, '', 336, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(360, 336, '02312', '710', 'MS. SREE KRISHNA RICE MILL(710)', '', '0000-00-00', '', '', '', '', 0, '', 336, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(361, 336, '02315', '2249', 'NADIA DISTRICT MODERN RICE MILL PRIVATE LIMITED(2249)', '', '0000-00-00', '', '', '', '', 0, '', 336, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(362, 336, '02314', '1189', 'SAHA HUSKING AND PADDY PROCESSING(1189)', '', '0000-00-00', '', '', '', '', 0, '', 336, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(363, 336, '02314', '1338', 'SUN HOT AGRO FARMING PRIVATE LIMITED(1338)', '', '0000-00-00', '', '', '', '', 0, '', 336, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(364, 337, '02318', '1089', 'AMBOULA MORDERN RICE MILL(1089)', '', '0000-00-00', '', '', '', '', 0, '', 337, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(365, 337, '02330', '713', 'ANNAPURNA RICE MILL(713)', '', '0000-00-00', '', '', '', '', 0, '', 337, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(366, 337, '02317', '716', 'CHAKRABORTY BROTHERS RICE MILL(716)', '', '0000-00-00', '', '', '', '', 0, '', 337, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(367, 337, '02329', '719', 'DOLPHIN FOOD PROCESSING PVT. LTD. (RICE MILL)(719)', '', '0000-00-00', '', '', '', '', 0, '', 337, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(368, 337, '02320', '722', 'KALIBALA MINI RICE MILL(722)', '', '0000-00-00', '', '', '', '', 0, '', 337, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(369, 337, '02320', '1087', 'M/S S.S.K. AGRO FOOD PRODUCTS(1087)', '', '0000-00-00', '', '', '', '', 0, '', 337, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(370, 337, '02320', '1214', 'MAA LAXMI MINI RICE MILL(1214)', '', '0000-00-00', '', '', '', '', 0, '', 337, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(371, 337, '02327', '731', 'N.P.G. RICE MILL PVT.LTD.(731)', '', '0000-00-00', '', '', '', '', 0, '', 337, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(372, 337, '02327', '733', 'NUTRIFRIENDS AGRO FOODS COMMODITIES(733)', '', '0000-00-00', '', '', '', '', 0, '', 337, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(373, 337, '02327', '735', 'P.G. HI-TECH RICE MILL(735)', '', '0000-00-00', '', '', '', '', 0, '', 337, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(374, 337, '02322', '2296', 'PARTHA MODERN RICE MILL(2296)', '', '0000-00-00', '', '', '', '', 0, '', 337, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(375, 337, '02317', '1102', 'RADHA KRISHNA RICE MILL(1102)', '', '0000-00-00', '', '', '', '', 0, '', 337, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(376, 337, '02329', '1213', 'SANGRAMPUR AGRO FOOD PRODUCTS PVT LTD.(1213)', '', '0000-00-00', '', '', '', '', 0, '', 337, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(377, 347, '02275', '330', 'BINODINI RICE MILL P LTD KANKSA(330)', '', '0000-00-00', '', '', '', '', 0, '', 347, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(378, 347, '02275', '386', 'JAI MAA SHARADA AGRO RICE MILLS P LTD. DOMRA(386)', '', '0000-00-00', '', '', '', '', 0, '', 347, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(379, 347, '02269', '391', 'JOSH KHEMKA CO. DOMHANI BAZAR BARABANI(391)', '', '0000-00-00', '', '', '', '', 0, '', 347, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(380, 347, '02274', '588', 'RADHA GOBINDA AGRO PRODUCTS PRIVATE. LIMITED. FARIDPUR DURGAPUR(588)', '', '0000-00-00', '', '', '', '', 0, '', 347, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(381, 347, '02275', '595', 'RAGHNATHPUR RICE MILL PVT. LTD KANKSA(595)', '', '0000-00-00', '', '', '', '', 0, '', 347, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(382, 344, '02451', '966', 'ALIA RICE MILL PVT. LTD.(966)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(383, 344, '02453', '967', 'AMBER RICE MILL PVT. LTD.(967)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(384, 344, '02444', '969', 'AMLAGORA ANNAPURNA RICE MILL PVT. LTD.(969)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(385, 344, '02467', '971', 'ARVIND KUMAR NAND KUMAR LTD. UNIT HARI RICE MILL(971)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(386, 344, '02461', '972', 'B.K. AGRO PRODUCTS PVT. LTD.(972)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(387, 344, '02461', '974', 'BALJIT AGROTECH LTD.(974)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(388, 344, '02463', '976', 'BHAGABATI MINI RICE MILL(976)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(389, 344, '02468', '979', 'CHANDAN MINI RICE MILL(979)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(390, 344, '02445', '980', 'CHANDRAKONA RICE MILL(980)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(391, 344, '02445', '1301', 'EXCELLENCE INDIA RICE MILL PVT. LTD.(1301)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(392, 344, '02469', '1062', 'GANGA PADDY & RICE PVT. LTD.(1062)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(393, 344, '02462', '983', 'HARIPADA RICE MILL(983)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(394, 344, '02453', '986', 'JOY BHAWANI RICE MILL(986)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(395, 344, '02448', '987', 'JOY MAA RAKSHAKALI RICE MILL(987)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(396, 344, '02466', '2103', 'KESHIARY RICE MILLS PVT LTD(2103)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(397, 344, '02445', '993', 'LAXMI JANARDAN RICE MILL(993)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(398, 344, '02446', '1226', 'LAXMI NARAYAN RICE MILL PVT. LTD. (SRINAGAR)(1226)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(399, 344, '02445', '994', 'LAXMINARAYAN MINI RICE MILL(994)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(400, 344, '02462', '1225', 'M/S GIRIDHARILAL ENTERPRISE(1225)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(401, 344, '02465', '998', 'MA AMBE AGRO FOOD PROCESSING PVT. LTD.(998)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(402, 344, '02461', '999', 'MADHUSUDHAN RICE MILL(999)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(403, 344, '02467', '1001', 'MAHABIR RICE MILL(DANTAN)(1001)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(404, 344, '02465', '1004', 'MAKRAMPUR RICE MILL (P) LTD.(1004)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(405, 344, '02452', '1063', 'NOVATECH AGRO PRODUCTS (I) PVT. LTD.(1063)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(406, 344, '02451', '1184', 'OMBAR AGRO INDUSTRIES PVT. LTD.(1184)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(407, 344, '02460', '1013', 'PRAGATI EDIBLE PROCESSING (P) LTD.(1013)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(408, 344, '02461', '1328', 'PRONANCE INDUSTRIES PVT. LTD.(1328)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(409, 344, '02453', '1017', 'ROHINI INDUSTRIAL SERVICES PVT. LTD.(1017)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(410, 344, '02445', '1327', 'SUDHAMOY AGRO INDUSTRY PVT. LTD.(1327)', '', '0000-00-00', '', '', '', '', 0, '', 344, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(411, 335, '02287', '286', 'A MIN RICE MILL(286)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(412, 335, '02288', '274', 'AASHIRBAD AGRO INDUSTRIES(274)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(413, 335, '02297', '2224', 'ADAM RICE PRODUCTS INDUSTRIES(2224)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(414, 335, '02289', '1316', 'AKASH GANGA RICE MILLS PVT LTD(1316)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(415, 335, '02284', '281', 'ALOKA MINI RICE MILL(281)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(416, 335, '02277', '296', 'ANNAPURNA RICE MILL &amp; CO.(296)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(417, 335, '02281', '299', 'APU RICE MILL PVT. LTD.(299)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(418, 335, '02279', '301', 'ASHA RICE MILL (P) LTD.(301)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(419, 335, '02288', '306', 'BABA MALLESWAR RICE MILL(306)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(420, 335, '02287', '1233', 'BABADHARMARAJ AGRO INDUSTRIES PVT. LTD.(1233)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(421, 335, '02289', '315', 'BASUNDHARA RICE MILL(315)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(422, 335, '02277', '325', 'BHARATMATA RICE MILL SUSILA(325)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(423, 335, '02288', '326', 'BHARATMATA RICE MILL TILDANGA(326)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(424, 335, '02288', '329', 'BIMALA INDUSTRIES(329)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(425, 335, '02289', '331', 'BISHALAKSHMI RICE MILL(331)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(426, 335, '02279', '338', 'BURORAJ RICE MILL UNIT RADHA SHYAMA AGRO INDUSTRIES(338)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(427, 335, '02287', '344', 'DAKSHINESWAR RICE MILL(344)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(428, 335, '02287', '347', 'DESH BANDHU RICE MILL(347)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(429, 335, '02297', '1329', 'DISHA FOOD INDUSTRIES(1329)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(430, 335, '02296', '355', 'DURGA MATA RICE MILL SEHARABAZAR(355)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(431, 335, '02297', '359', 'EASTERN RICE MILL(359)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(432, 335, '02288', '366', 'GOLDEN RICE MILL(366)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(433, 335, '02285', '2022', 'GOPINATH RICE MILL(2022)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(434, 335, '02281', '373', 'HEMJEE RICE MILL(373)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(435, 335, '02289', '374', 'HEMRAJ INDUSTRIES PVT.LTD(374)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(436, 335, '02281', '375', 'HEMRAJ RICE MILL(375)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(437, 335, '02281', '376', 'J. P. RICE MILL(376)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(438, 335, '02288', '377', 'J. S. RICE MILL(377)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(439, 335, '02277', '379', 'JAGADHATRI RICE MILL(379)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(440, 335, '02298', '394', 'JOY BABA TARAKNATH RICE MILL (P) LTD.(394)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(441, 335, '02287', '395', 'JOY DURGA RICE MILL KOLKOL(395)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(442, 335, '02285', '392', 'JOY DURGA RICE MILL MADHYAMGRAM(392)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(443, 335, '02292', '400', 'JOY MAA KALI MINI RICE MILL(400)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(444, 335, '02297', '1332', 'JOY MATADI RICE MILL(1332)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(445, 335, '02289', '405', 'JUPITAR RICE MILL(405)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(446, 335, '02295', '406', 'JYOTISH CHANDRA RICE MILL(406)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(447, 335, '02277', '407', 'K. M. AGRO TECH (P) LTD(407)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(448, 335, '02289', '409', 'KALIMATA AGRO PRODUCT(409)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(449, 335, '02293', '411', 'KALNA RICE MILL (P) LTD.(411)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(450, 335, '02295', '416', 'KHORDO-PALASI MA ANNAPURNA RICE PRODUCTS PVT. LTD.(416)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(451, 335, '02277', '417', 'KIRAN SANKAR RICE MILL(417)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(452, 335, '02295', '1290', 'KUNJBIHARI RICE MILL PVT LTD(1290)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(453, 335, '02291', '424', 'LAKSHMI NARAYAN RICE &amp; FOOD PRODUCTS PVT. LTD.(424)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(454, 335, '02291', '427', 'LALJEE FOOD PRODUCTS PVT. LTD.(427)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(455, 335, '02286', '1295', 'M R AGRO INDUSTRIES(1295)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(456, 335, '02287', '441', 'M/S BHADRESWAR RICE MILL(441)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(457, 335, '02288', '446', 'M/S GOPAL GOBINDA RICE MILL(446)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(458, 335, '02288', '452', 'M/S KARUNAMOYEE RICE MILL(452)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(459, 335, '02288', '456', 'M/S KOHINOOR RICE MILL(456)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(460, 335, '02286', '462', 'M/S MAA LAXMI MODERN MINI RICE MILL(462)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(461, 335, '02292', '464', 'M/S MAHA LAKSHMI AGRO INDUSTRIES(464)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(462, 335, '02297', '470', 'M/S NEW SATYANARAYAN RICE MILL(470)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(463, 335, '02297', '471', 'M/S NEW SATYANARAYAN RICE MILL(UNIT-I)(471)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(464, 335, '02293', '474', 'M/S R. K. INDUSTRIES(474)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(465, 335, '02287', '476', 'M/S SATYAM RICE MILL(476)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(466, 335, '02278', '2030', 'M/S Shanti Ram Agro Industries(2030)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(467, 335, '02292', '481', 'M/S SREE GANESH RICE MILL(481)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(468, 335, '02287', '482', 'M/S TARASAKTI RICE MILL(482)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(469, 335, '02298', '483', 'MA ABHAYA RICE MILL(483)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(470, 335, '02277', '514', 'MAA GANGA RICE MILL(514)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(471, 335, '02287', '1096', 'MAA MANGAL CHANDI AGRO PVT. LTD.(1096)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(472, 335, '02289', '520', 'MAA SARADA MINI RICE MILL(520)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(473, 335, '02291', '526', 'MAHA KALI RICE MILL PVT. LTD.(526)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(474, 335, '02287', '528', 'MAHADEB RICE MILL PVT. LTD(528)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(475, 335, '02297', '538', 'MANGALAM RICE MILL(538)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(476, 335, '02284', '541', 'MONDAL FOOD PRODUCTS(P) LTD(541)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(477, 335, '02277', '468', 'MS MUKTIPADA RICE MILL UNIT OF GUNJAN COMMOTRADE PVT. LTD.(468)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(478, 335, '02296', '408', 'MS. K.G.N. RICE MILL(408)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(479, 335, '02279', '1303', 'MUM AGRO INDUSTRIES PVT. LTD.(1303)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(480, 335, '02288', '544', 'NAKULESHWAR AGRO PRODUCT (P) LTD(544)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(481, 335, '02297', '1294', 'NARMADA GARDENS PVT LTD(1294)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(482, 335, '02296', '554', 'NEW DURGAMATA RICE MILL(554)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(483, 335, '02286', '1296', 'NEW MAA LAXMI MODERN RICE MILL(1296)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(484, 335, '02297', '558', 'NEW MANASA MATA FOODS(558)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(485, 335, '02281', '559', 'NEW MODERN RICE MILL(559)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(486, 335, '02297', '562', 'NILACHAL FOOD PRODUCT(562)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(487, 335, '02281', '567', 'NITYANANDA RICE MILL (P) LTD.(567)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(488, 335, '02287', '568', 'NIVEDITA RICE MILL(568)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(489, 335, '02294', '1234', 'P.P. RICE MILL (P) LTD.(1234)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(490, 335, '02277', '575', 'PARAJ AGRO PVT. LTD.(575)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(491, 335, '02287', '576', 'PARAJ TRADING MINI RICE MILL(576)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(492, 335, '02281', '578', 'PARAMANANDA RICE MILL (P) LTD.(578)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(493, 335, '02298', '1178', 'PARAMHANSA AGRO UDYOG PVT. LTD.(1178)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(494, 335, '02295', '581', 'PASUPATI AGRO PRODUCT(581)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(495, 335, '02288', '585', 'PRASAD RICE MILL(585)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(496, 335, '02288', '586', 'R. S. AGRO INDUSTRIES(586)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(497, 335, '02288', '589', 'RADHA KRISHNA MINI RICE MILL(589)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(498, 335, '02288', '592', 'RADHA MADHAB RICE MILL(592)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(499, 335, '02281', '593', 'RADHA RICE MILL(593)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL);
INSERT INTO `md_mill` (`sl_no`, `dist`, `block`, `mill_code`, `mill_name`, `reg_no`, `reg_date`, `boiler_reg_no`, `tan`, `police_station`, `post_office`, `pin`, `mill_addr`, `branch_id`, `ph_no`, `email`, `bank_name`, `branch_name`, `acc_type`, `acc_no`, `ifsc_code`, `pan_no`, `gst_no`, `guide_lines_id`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(500, 335, '02277', '594', 'RADHAKRISHNA AGRO PRODUCTS(594)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(501, 335, '02287', '1120', 'SANATANI FOOD INDUSTRIES PVT. LTD.(1120)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(502, 335, '02290', '1297', 'SANGRAM MINI RICE MILL(1297)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(503, 335, '02289', '610', 'SANKARI RICE MILL(610)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(504, 335, '02287', '612', 'SARADAMOYEE RICE MILL(612)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(505, 335, '02297', '1236', 'SATCHIDANANDA AGRO TECH (P) LTD.(1236)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(506, 335, '02281', '618', 'SHAB SHIB RICE MILL PVT. LTD.(618)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(507, 335, '02293', '624', 'SHREE MAHABIR MODERN AGRO MILLS (P) LTD.(624)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(508, 335, '02297', '632', 'SIBA DURGA RICE MILL(632)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(509, 335, '02288', '634', 'SITARAM FOOD PRODUCTS PVT. LTD.(634)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(510, 335, '02286', '637', 'SONALI RICE MILL(637)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(511, 335, '02287', '641', 'SREE BISHNU RICE MILL(641)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(512, 335, '02291', '643', 'SREE DURGA FARMS &amp; RICE MILL PVT. LTD.(643)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(513, 335, '02281', '653', 'SREE VENKTESH RICE MILL(653)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(514, 335, '02298', '654', 'SREEMA HUSKING MILL(654)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(515, 335, '02289', '656', 'SRI BIJOY MINI RICE MILL(656)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(516, 335, '02296', '657', 'SRI BRIJUKA AGRO PRODUCT PVT. LTD.(657)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(517, 335, '02291', '658', 'SRI DURGAMATA RICE MILL PVT LTD.(658)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(518, 335, '02289', '665', 'SRI RAM RICE MILL(665)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(519, 335, '02288', '668', 'SUBARNA RICE MILL(668)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(520, 335, '02289', '670', 'SUBHAM RICE MILL PVT. LTD.(670)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(521, 335, '02287', '671', 'SUBHANKAR RICE &amp; GENERAL MILLS (P) LTD(671)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(522, 335, '02286', '1229', 'SURYA NARAYAN AGRO PVT. LTD.(1229)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(523, 335, '02292', '685', 'TULASI RICE MILL(685)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(524, 335, '02298', '686', 'UCHALAN S.S. RICE MILL PVT. LTD.(686)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(525, 335, '02293', '688', 'UMANANDA RICE MILL LTD.(688)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(526, 335, '02292', '692', 'URMILA RICE MILL(692)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(527, 335, '02295', '1172', 'VASUPATI AGRO INDUSTRIES(1172)', '', '0000-00-00', '', '', '', '', 0, '', 335, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(528, 345, '02479', '1326', 'ANJALI RICE MILL(1326)', '', '0000-00-00', '', '', '', '', 0, '', 345, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(529, 345, '02475', '1027', 'BINDUBALA TRADING PVT LTD(1027)', '', '0000-00-00', '', '', '', '', 0, '', 345, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(530, 345, '02479', '2082', 'BIPIN BIHARI RICE MILL(2082)', '', '0000-00-00', '', '', '', '', 0, '', 345, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(531, 345, '02486', '1031', 'KALINAGAR RICE MILLS PVT LTD(1031)', '', '0000-00-00', '', '', '', '', 0, '', 345, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(532, 345, '02490', '1032', 'LAKSHMI NARAYAN RICE MILL(1032)', '', '0000-00-00', '', '', '', '', 0, '', 345, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(533, 345, '02490', '2099', 'MA ANANDAMOYEE RICE MILL(2099)', '', '0000-00-00', '', '', '', '', 0, '', 345, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(534, 345, '02490', '1039', 'MA GOURI MINI RICE MILL(1039)', '', '0000-00-00', '', '', '', '', 0, '', 345, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(535, 345, '02490', '1230', 'MAA ANNAPURNA (V) UNIT II(1230)', '', '0000-00-00', '', '', '', '', 0, '', 345, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(536, 345, '02488', '1038', 'MAA BIPATTARINI MINI RICE MILL(1038)', '', '0000-00-00', '', '', '', '', 0, '', 345, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(537, 345, '02490', '1043', 'MAA LAXMI RICE MILL (V)(1043)', '', '0000-00-00', '', '', '', '', 0, '', 345, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(538, 345, '02484', '1252', 'MAA PRABHABATI RICE MILL(1252)', '', '0000-00-00', '', '', '', '', 0, '', 345, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(539, 345, '02479', '1167', 'MAHAMAYA RICE MILL(1167)', '', '0000-00-00', '', '', '', '', 0, '', 345, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(540, 345, '02488', '1047', 'MINATI RICE MILL(1047)', '', '0000-00-00', '', '', '', '', 0, '', 345, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(541, 345, '02492', '1029', 'MS BISWAKARMA RICE MILL(1029)', '', '0000-00-00', '', '', '', '', 0, '', 345, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(542, 345, '02479', '2141', 'MS DIPTI RICE MILL(2141)', '', '0000-00-00', '', '', '', '', 0, '', 345, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(543, 345, '02492', '1042', 'Ms MAA TARA MINI RICE MILL(1042)', '', '0000-00-00', '', '', '', '', 0, '', 345, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(544, 345, '02471', '1245', 'MS SABITA RICE MILL(1245)', '', '0000-00-00', '', '', '', '', 0, '', 345, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(545, 345, '02490', '1051', 'PANDA MINI RICE MILL(1051)', '', '0000-00-00', '', '', '', '', 0, '', 345, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(546, 345, '02478', '1052', 'PATASHPUR THANA CO OPERATIVE RICE MILL SOCIETY LTD(1052)', '', '0000-00-00', '', '', '', '', 0, '', 345, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(547, 345, '02470', '1053', 'POPULAR RICE MILL(1053)', '', '0000-00-00', '', '', '', '', 0, '', 345, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(548, 345, '02490', '1056', 'SITA MAA RICE MILL(1056)', '', '0000-00-00', '', '', '', '', 0, '', 345, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(549, 345, '02492', '1312', 'TRINATHESWAR AGRO PRODUCTS PVT LTD(1312)', '', '0000-00-00', '', '', '', '', 0, '', 345, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(550, 340, '02386', '935', 'BASANTI RICE MILL(935)', '', '0000-00-00', '', '', '', '', 0, '', 340, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(551, 340, '02386', '1256', 'CHANDIMATA RICE MILL(1256)', '', '0000-00-00', '', '', '', '', 0, '', 340, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(552, 340, '02386', '937', 'M/S KAMALA RICE MILL(937)', '', '0000-00-00', '', '', '', '', 0, '', 340, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(553, 340, '02388', '939', 'M/S. SAHANA RICE MILL(939)', '', '0000-00-00', '', '', '', '', 0, '', 340, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(554, 340, '02379', '940', 'MA KAMALA FOOD PRODUCTS PVT. LTD(940)', '', '0000-00-00', '', '', '', '', 0, '', 340, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(555, 340, '02385', '941', 'MAA KALI RICE MILL(941)', '', '0000-00-00', '', '', '', '', 0, '', 340, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(556, 340, '02386', '942', 'MAHAMAYA RICE MILL(942)', '', '0000-00-00', '', '', '', '', 0, '', 340, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(557, 340, '02382', '1115', 'MANBHUM RICE MILLERS LLP(1115)', '', '0000-00-00', '', '', '', '', 0, '', 340, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(558, 340, '02379', '1324', 'OM SHANTI RICE MILL(1324)', '', '0000-00-00', '', '', '', '', 0, '', 340, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(559, 340, '02389', '944', 'PREETI RICE MILL(944)', '', '0000-00-00', '', '', '', '', 0, '', 340, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(560, 340, '02387', '945', 'PURULIA MILLERS PVT. LTD.(945)', '', '0000-00-00', '', '', '', '', 0, '', 340, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(561, 340, '02379', '2171', 'R N RICE MILL(2171)', '', '0000-00-00', '', '', '', '', 0, '', 340, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(562, 340, '02396', '946', 'SHREE GANESH RICE MILL(946)', '', '0000-00-00', '', '', '', '', 0, '', 340, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(563, 340, '02382', '947', 'SHREE RAI MATA RICE MILL PRIVATE LIMITED(947)', '', '0000-00-00', '', '', '', '', 0, '', 340, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(564, 340, '02379', '950', 'SRI SHYAM MILLERS PVT LTD(950)', '', '0000-00-00', '', '', '', '', 0, '', 340, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(565, 343, '02424', '1299', 'DAIPAYAN AGRO FOOD PRODUCT PRIVATE LIMITED(1299)', '', '0000-00-00', '', '', '', '', 0, '', 343, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(566, 343, '02418', '1282', 'GHATAKPUKUR AGRO FOOD PRODUCTS PRIVATE LIMITED(1282)', '', '0000-00-00', '', '', '', '', 0, '', 343, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(567, 343, '02415', '959', 'MAA EKADASHI MINI MODERN RICE MILL(959)', '', '0000-00-00', '', '', '', '', 0, '', 343, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(568, 343, '02436', '960', 'MAA SHITALA AGRO PVT. LTD.(960)', '', '0000-00-00', '', '', '', '', 0, '', 343, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(569, 343, '02413', '961', 'MAA TARA RICE MILL(961)', '', '0000-00-00', '', '', '', '', 0, '', 343, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(570, 343, '02418', '962', 'MODERN SMALL RICE MILL(962)', '', '0000-00-00', '', '', '', '', 0, '', 343, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(571, 343, '02418', '1206', 'PIR GORACHAND FOOD PROCESSING PVT. LTD.(1206)', '', '0000-00-00', '', '', '', '', 0, '', 343, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(572, 343, '02436', '963', 'S.S.S. RICE MILL PVT. LTD.(963)', '', '0000-00-00', '', '', '', '', 0, '', 343, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(573, 330, '02199', '64', 'BALAJI AGRO FOOD PRODUCT(64)', '', '0000-00-00', '', '', '', '', 0, '', 330, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(574, 330, '02199', '66', 'LAXMI NARAYAN RICE MILL(66)', '', '0000-00-00', '', '', '', '', 0, '', 330, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(575, 330, '02192', '70', 'MA KALI MODERN RICE MILL(70)', '', '0000-00-00', '', '', '', '', 0, '', 330, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(576, 330, '02192', '71', 'MA LAKHI MODERN RICE MILL(71)', '', '0000-00-00', '', '', '', '', 0, '', 330, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(577, 330, '02196', '1308', 'MAA MANASA MODERN RICE MILL (RAW)(1308)', '', '0000-00-00', '', '', '', '', 0, '', 330, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(578, 330, '02196', '72', 'MAA MANASA MODERN RICE MILL PVT LTD(72)', '', '0000-00-00', '', '', '', '', 0, '', 330, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(579, 330, '02195', '1339', 'MS SANTI MINI RICE MILL(1339)', '', '0000-00-00', '', '', '', '', 0, '', 330, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(580, 330, '02196', '73', 'NORTH BENGAL RICE MILL(P) LTD.(73)', '', '0000-00-00', '', '', '', '', 0, '', 330, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(581, 330, '02196', '1218', 'RAIGANJ AGRO INDUSTRIES (P) LTD.(1218)', '', '0000-00-00', '', '', '', '', 0, '', 330, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(582, 330, '02196', '1219', 'RAIGANJ AGRO TECH PVT. LTD.(1219)', '', '0000-00-00', '', '', '', '', 0, '', 330, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(583, 330, '02196', '1287', 'RAIGANJ FOOD GRAINS PRODUCT PVT. LTD.(1287)', '', '0000-00-00', '', '', '', '', 0, '', 330, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(584, 330, '02195', '77', 'RATAN MODERN RICE MILL(77)', '', '0000-00-00', '', '', '', '', 0, '', 330, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(585, 330, '02198', '1197', 'RSK RICE MILL(1197)', '', '0000-00-00', '', '', '', '', 0, '', 330, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(586, 330, '02195', '1126', 'SHYAM JOTI RICE MILL PVT. LTD.(1126)', '', '0000-00-00', '', '', '', '', 0, '', 330, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL),
(587, 330, '02196', '1217', 'SONAR BANGLA FOOD PRODUCTS(1217)', '', '0000-00-00', '', '', '', '', 0, '', 330, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'O', 'synergic', '2022-04-05', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_month`
--

CREATE TABLE `md_month` (
  `id` int(11) NOT NULL,
  `month_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_month`
--

INSERT INTO `md_month` (`id`, `month_name`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `md_paddy_bank`
--

CREATE TABLE `md_paddy_bank` (
  `sl_no` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `branch` varchar(50) NOT NULL,
  `corporate_code` varchar(55) DEFAULT NULL,
  `folder_path` varchar(255) DEFAULT NULL,
  `ifs` varchar(30) DEFAULT NULL,
  `acc_no` varchar(30) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `short_code` varchar(20) DEFAULT NULL,
  `micr_code` varchar(20) DEFAULT NULL,
  `trans_code` int(11) NOT NULL DEFAULT 0,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_paddy_bank`
--

INSERT INTO `md_paddy_bank` (`sl_no`, `bank_id`, `bank_name`, `branch`, `corporate_code`, `folder_path`, `ifs`, `acc_no`, `status`, `short_code`, `micr_code`, `trans_code`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'Yes Bank', 'Kasba', NULL, NULL, '', '0000000000', '0', '', '', 0, 'synergic', '2020-01-21 05:54:01', NULL, NULL),
(2, 2, 'Bandhan Bank', 'Kasba', NULL, NULL, '', '0000000000', '0', '', '', 0, 'synergic', '2020-01-21 05:54:12', NULL, NULL),
(3, 3, 'Icici Bank', 'Kasba', NULL, '/icici/PayUpload/', '', '098301002773', '1', '', '', 0, 'synergic', '2020-01-21 05:55:00', NULL, NULL),
(4, 4, 'Axis Bank', 'Kasba', 'TWBSCOMFL', '/AxisInvoice/h2hIn/', 'Demo123', '011010100278218', '1', '123', '456', 25, 'synergic', '2020-02-13 05:52:24', NULL, NULL),
(5, 5, 'Hdfc Bank', 'Kasba', NULL, '/hdfc/hdfcforward/src/', 'HDFC0001', '50100385096908', '1', '', '', 0, 'synergic', '2020-03-06 11:57:19', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_paddy_bank_branch`
--

CREATE TABLE `md_paddy_bank_branch` (
  `id` int(11) NOT NULL,
  `kms_id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `dist_id` int(11) DEFAULT NULL,
  `branch` varchar(50) NOT NULL,
  `acc_no` varchar(30) NOT NULL,
  `sol_id` int(11) NOT NULL,
  `ifs` varchar(30) DEFAULT NULL,
  `short_code` varchar(20) DEFAULT NULL,
  `micr_code` varchar(20) DEFAULT NULL,
  `trans_code` int(11) NOT NULL DEFAULT 0,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_paddy_bank_branch`
--

INSERT INTO `md_paddy_bank_branch` (`id`, `kms_id`, `bank_id`, `dist_id`, `branch`, `acc_no`, `sol_id`, `ifs`, `short_code`, `micr_code`, `trans_code`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 2, 4, 339, 'Bankura', '491010100017374', 491, 'UTIB0000491', NULL, NULL, 0, 'Synergic', '2020-02-07 00:00:00', NULL, NULL),
(2, 2, 4, 328, 'Jalpiaguri', '442010100029971', 442, 'UTIB0000442', NULL, NULL, 0, 'Synergic', '2020-02-07 00:00:00', NULL, NULL),
(3, 2, 4, 334, 'Birbhum', '916010017422766', 532, 'UTIB0000532', NULL, NULL, 0, 'Synergic', '2020-02-07 00:00:00', NULL, NULL),
(4, 2, 4, 229, 'Coochbihar', '396010100012333', 396, 'UTIB0000396', NULL, NULL, 0, 'Synergic', '2020-05-05 00:00:00', NULL, NULL),
(5, 2, 4, 231, 'Dakhin Dinajpur', '530010100009553', 530, 'UTIB0000530', NULL, NULL, 0, 'Synergic', '2020-05-05 00:00:00', NULL, NULL),
(6, 2, 4, 345, 'East Midnapur', '911010031962551', 154, 'UTIB0000154', NULL, NULL, 0, 'Synergic', '2020-05-05 00:00:00', NULL, NULL),
(7, 2, 4, 338, 'Hooghly', '364010100024718', 779, 'UTIB0001779', NULL, NULL, 0, 'Synergic', '2020-05-05 00:00:00', NULL, NULL),
(8, 2, 4, 341, 'Howrah', '909010044138166', 580, 'UTIB0000580', NULL, NULL, 0, 'Synergic', '2020-05-05 00:00:00', NULL, NULL),
(9, 2, 4, 332, 'Malda', '389010100051545', 389, 'UTIB0000389', NULL, NULL, 0, 'Synergic', '2020-05-05 00:00:00', NULL, NULL),
(10, 2, 4, 333, 'Murshidabad', '163010100073200', 163, 'UTIB0000163', NULL, NULL, 0, 'Synergic', '2020-05-05 00:00:00', NULL, NULL),
(11, 2, 4, 336, 'Nadia', '237010100044624', 237, 'UTIB0000237', NULL, NULL, 0, 'Synergic', '2020-05-05 00:00:00', NULL, NULL),
(12, 2, 4, 337, 'North 24 Pgs', '021010100421799', 21, 'UTIB0000021', NULL, NULL, 0, 'Synergic', '2020-05-05 00:00:00', NULL, NULL),
(13, 2, 4, 340, 'Purulia', '916010015255876', 397, 'UTIB0000397', NULL, NULL, 0, 'Synergic', '2020-05-05 00:00:00', NULL, NULL),
(14, 2, 4, 327, 'Siliguri', '035010100294508', 35, 'UTIB0000035', NULL, NULL, 0, 'Synergic', '2020-05-05 00:00:00', NULL, NULL),
(15, 2, 4, 343, 'South 24 Pgs', '259010100050078', 259, 'UTIB0000259', NULL, NULL, 0, 'Synergic', '2020-05-05 00:00:00', NULL, NULL),
(16, 2, 4, 330, 'Uttar Dinajpur', '518010100008464', 518, 'UTIB0000518', NULL, NULL, 0, 'Synergic', '2020-05-05 00:00:00', NULL, NULL),
(17, 2, 4, 344, 'West Midnapur', '915010062581716', 518, 'UTIB0000325', NULL, NULL, 0, 'Synergic', '2020-05-05 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_paddy_rate`
--

CREATE TABLE `md_paddy_rate` (
  `id` int(11) NOT NULL,
  `kms_yr` int(11) NOT NULL,
  `per_qui_rate` decimal(8,2) NOT NULL,
  `effective_dt` date NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_dt` date NOT NULL,
  `modified_by` varchar(100) NOT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_paddy_rate`
--

INSERT INTO `md_paddy_rate` (`id`, `kms_yr`, `per_qui_rate`, `effective_dt`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 2, '1815.00', '2019-10-01', 'synergic', '2019-12-09', '', NULL),
(2, 3, '1868.00', '2020-11-01', 'synergic', '2020-10-21', 'synergic', '2020-11-13 12:04:21'),
(3, 4, '1940.00', '2021-12-01', 'synergic', '2020-10-21', 'synergic', '2022-04-08 12:30:11');

-- --------------------------------------------------------

--
-- Table structure for table `md_parameters`
--

CREATE TABLE `md_parameters` (
  `sl_no` int(11) NOT NULL,
  `param_desc` varchar(100) NOT NULL,
  `param_value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_parameters`
--

INSERT INTO `md_parameters` (`sl_no`, `param_desc`, `param_value`) VALUES
(1, 'Name of Client', 'West Bengal State Consumers\' Co-operative Federation Ltd.'),
(2, 'Address', 'P-1,Hide Lane,Akbar Mansion 3rd Floor,Kolkata - 700073'),
(3, 'Previous Day Opened', '2018-08-21'),
(4, 'Current Day Opened', '2018-08-22'),
(5, 'Previous Financial Year', '2017'),
(6, 'Current Financial Year ', '2018'),
(7, 'DA Percentage', '125'),
(8, 'HRA Percentage', '15'),
(9, 'Cash Allowance', '0'),
(10, 'Medical Allowance', '300'),
(11, 'PF Percentage', '12'),
(12, 'Yearly increment ', '3'),
(13, 'Cash A/C Head Code', '10181'),
(14, 'Bonus Salary Range', '25000'),
(15, 'Bonus Salary Range for the year', '2015-16'),
(16, 'KMS Year Start Date', '2018-10-01'),
(17, 'KMS Year End Date', '2019-09-30'),
(18, 'Per boiled ', '68'),
(19, 'Raw Rice', '67');

-- --------------------------------------------------------

--
-- Table structure for table `md_rice_rate`
--

CREATE TABLE `md_rice_rate` (
  `id` int(11) NOT NULL,
  `kms_id` int(11) NOT NULL,
  `rice_type` varchar(20) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `ppe_rate` decimal(10,2) NOT NULL,
  `effective_dt` date NOT NULL,
  `created_by` varchar(55) NOT NULL,
  `created_dt` date NOT NULL,
  `modified_by` varchar(55) NOT NULL,
  `modified_dt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_rice_rate`
--

INSERT INTO `md_rice_rate` (`id`, `kms_id`, `rice_type`, `rate`, `ppe_rate`, `effective_dt`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 2, 'P', '3018.28', '2962.62', '2019-12-02', 'Manager', '2019-12-02', 'Bholanath Mondal', '2021-03-24'),
(2, 2, 'R', '3073.12', '3017.46', '2019-12-03', 'synergic', '2020-08-10', 'Bholanath Mondal', '2021-03-24'),
(3, 1, 'Boiled Rice', '3000.00', '0.00', '2020-09-10', 'synergic', '2020-09-10', 'synergic', '2020-09-10');

-- --------------------------------------------------------

--
-- Table structure for table `md_schedule_heads`
--

CREATE TABLE `md_schedule_heads` (
  `schedule_code` int(11) NOT NULL,
  `schedule_type` varchar(100) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `md_society`
--

CREATE TABLE `md_society` (
  `sl_no` varchar(25) NOT NULL,
  `dist` int(11) NOT NULL,
  `block` varchar(10) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `society_code` varchar(55) NOT NULL,
  `soc_name` varchar(200) NOT NULL,
  `inchargename` varchar(150) NOT NULL,
  `reg_no` varchar(50) NOT NULL,
  `reg_date` date NOT NULL,
  `tan` varchar(30) NOT NULL,
  `police_station` varchar(50) NOT NULL,
  `post_office` varchar(50) NOT NULL,
  `pin` int(11) NOT NULL,
  `soc_addr` text NOT NULL,
  `ph_no` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `branch_name` varchar(25) DEFAULT NULL,
  `acc_type` varchar(25) DEFAULT NULL,
  `acc_no` varchar(30) DEFAULT NULL,
  `ifsc_code` varchar(50) DEFAULT NULL,
  `pan_no` varchar(50) DEFAULT NULL,
  `gst_no` varchar(50) DEFAULT NULL,
  `guide_lines_id` varchar(55) DEFAULT NULL,
  `agreementno` varchar(150) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` date NOT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_society`
--

INSERT INTO `md_society` (`sl_no`, `dist`, `block`, `branch_id`, `society_code`, `soc_name`, `inchargename`, `reg_no`, `reg_date`, `tan`, `police_station`, `post_office`, `pin`, `soc_addr`, `ph_no`, `email`, `bank_name`, `branch_name`, `acc_type`, `acc_no`, `ifsc_code`, `pan_no`, `gst_no`, `guide_lines_id`, `agreementno`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
('192000133320008', 333, '02236', 333, '192000133320008', 'Raninagar Block I Primary Agricultural Marketing Co-op Society Ltd(192000133320008)', 'Aarbina Khatun', '', '0000-00-00', '', '', '', 0, '', '8918054675', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000133820005', 338, '02340', 338, '192000133820005', 'Shyambati Bayugram SKUS Ltd(192000133820005)', 'Kajal Kumar Alu', '', '0000-00-00', '', '', '', 0, '', '9382203502', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000133820008', 338, '02354', 338, '192000133820008', 'KISHOREPUR PASCHIMANCHAL SKUS LTD(192000133820008)', 'DILIP DOLUI', '', '0000-00-00', '', '', '', 0, '', '8343020684', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232720001', 327, '02164', 327, '192000232720001', 'TERAI FARERS SERVICE CO-OP SOCIETY LTD(192000232720001)', 'JEROME EKKA', '', '0000-00-00', '', '', '', 0, '', '9800088904', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232720002', 327, '02162', 327, '192000232720002', 'BARA MOHANSINGH SKUS LTD(192000232720002)', 'SUDAM SINGH', '', '0000-00-00', '', '', '', 0, '', '8348305649', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232720004', 327, '02163', 327, '192000232720004', 'BUDHKARANJOTE SKUS LTD(192000232720004)', 'GOLOKNATH ROY', '', '0000-00-00', '', '', '', 0, '', '9832070917', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232820001', 328, '02178', 328, '192000232820001', 'ADARSHA EKADASH PARISEVA SAMABAY SAMITY LTD(192000232820001)', 'SUDIPTA MANI', '', '0000-00-00', '', '', '', 0, '', '9932793229', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232820006', 328, '02178', 328, '192000232820006', 'BHABATARINI SAMABAY KRISHI UNNAYAN SAMITY LTD(192000232820006)', 'PARTHA ROUTH', '', '0000-00-00', '', '', '', 0, '', '8016251663', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232820008', 328, '02166', 328, '192000232820008', 'BHOLAPARA SKUS LTD(192000232820008)', 'SAHIDUL ALAM', '', '0000-00-00', '', '', '', 0, '', '8016583053', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232820009', 328, '02177', 328, '192000232820009', 'BARNISH SKBS LTD(192000232820009)', 'NEEDUM BHUTIA', '', '0000-00-00', '', '', '', 0, '', '6297364993', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232820011', 328, '02169', 328, '192000232820011', 'KHAYERBARI GP SKUS LTD(192000232820011)', 'ABDUSH SALAM', '', '0000-00-00', '', '', '', 0, '', '8637523601', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232820012', 328, '02177', 328, '192000232820012', 'CHUKANIPARA SKUS LTD(192000232820012)', 'NIDHIR CH MANDAL', '', '0000-00-00', '', '', '', 0, '', '9932595265', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232820015', 328, '02176', 328, '192000232820015', 'KAZIPARA SKUS LTD(192000232820015)', 'JIBAN CH. ROY', '', '0000-00-00', '', '', '', 0, '', '9832356548', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232820016', 328, '02178', 328, '192000232820016', 'URBAN IMAGES SERVICE CO-OPERATIVE SOCIETY LTD(192000232820016)', 'SUJIT SUTRADHAR', '', '0000-00-00', '', '', '', 0, '', '9832344012', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232820019', 328, '02166', 328, '192000232820019', 'BELAKOBA CO-OP AGRIL MKTG SOCIETY LTD(192000232820019)', 'BAPPADITYA PAUL', '', '0000-00-00', '', '', '', 0, '', '8172079922', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232920001', 329, '02187', 329, '192000232920001', 'SINGIMARI MADNAKURA SKUS LTD.(192000232920001)', 'GOUTAM BARMAN', '', '0000-00-00', '', '', '', 0, '', '9733040125', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232920002', 329, '02187', 329, '192000232920002', 'NACHINA SKUS LTD.(192000232920002)', 'AJIT BASAK', '', '0000-00-00', '', '', '', 0, '', '9932891143', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232920003', 329, '02187', 329, '192000232920003', 'GITALDAH NETAJI SKUS LTD.(192000232920003)', 'JIBAN KR GHOSH', '', '0000-00-00', '', '', '', 0, '', '9832517273', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232920004', 329, '02188', 329, '192000232920004', 'MORNEYA SKUS LTD.(192000232920004)', 'BIPUL CH. BARMAN', '', '0000-00-00', '', '', '', 0, '', '9635653912', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232920005', 329, '02185', 329, '192000232920005', 'MARUGANJ SKUS LTD.(192000232920005)', 'AMARESH CHANDRA DEB', '', '0000-00-00', '', '', '', 0, '', '7031340381', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232920006', 329, '02187', 329, '192000232920006', 'BALARAMPATH SCS Ltd.(192000232920006)', 'DENJANI BARMAN (DEBNATH)', '', '0000-00-00', '', '', '', 0, '', '9749242503', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232920007', 329, '02188', 329, '192000232920007', 'BHULKI SCS LTD(192000232920007)', 'DIP KUMAR BARMAN', '', '0000-00-00', '', '', '', 0, '', '7063407007', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232920008', 329, '02183', 329, '192000232920008', 'CHANDAMARI SKUS LTD.(192000232920008)', 'PRAFULLA KUMAR BARMAN', '', '0000-00-00', '', '', '', 0, '', '9593217454', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232920009', 329, '02183', 329, '192000232920009', 'PANIMARARKUTHI BARAPAK SKUS LTD.(192000232920009)', 'Sankar Chowdhury', '', '0000-00-00', '', '', '', 0, '', '9547992737', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232920010', 329, '02188', 329, '192000232920010', 'KISMAT DASGRAM JANAKALYAN SKUS LTD.(192000232920010)', 'NIKHIL SARKAR', '', '0000-00-00', '', '', '', 0, '', '8016726904', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232920011', 329, '02183', 329, '192000232920011', 'TALLIGURI DALUADASHGIR SKUS LTD.(192000232920011)', 'Atish Chandra Das', '', '0000-00-00', '', '', '', 0, '', '9593719308', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232920012', 329, '02183', 329, '192000232920012', 'HAWARGARI CHARAKERKUTHI SKUS LTD.(192000232920012)', 'AJGAR ALI', '', '0000-00-00', '', '', '', 0, '', '8116260202', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232920013', 329, '02185', 329, '192000232920013', 'KRISHNAPUR SKUS LIMITED(192000232920013)', 'KHITENDRA NATH BARMAN', '', '0000-00-00', '', '', '', 0, '', '9800490197', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232920015', 329, '02183', 329, '192000232920015', 'PUTIMARI FULESWARI SKUS LTD.(192000232920015)', 'NAYAN MODAK', '', '0000-00-00', '', '', '', 0, '', '9064748754', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232920017', 329, '02183', 329, '192000232920017', 'DAKSHIN COOCH BEHAR L/S CAMS LTD.(192000232920017)', 'PRAKASH CH DAS', '', '0000-00-00', '', '', '', 0, '', '9002661098', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232920018', 329, '02182', 329, '192000232920018', 'UTTARRANGAMATI SKUS LTD.(192000232920018)', 'SWAPAN BISWAS', '', '0000-00-00', '', '', '', 0, '', '9832302070', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000232920020', 329, '02183', 329, '192000232920020', 'DHALUABARI SKUS LTD.(192000232920020)', 'ABUL HOSSAIN', '', '0000-00-00', '', '', '', 0, '', '9800759428', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020001', 330, '02198', 330, '192000233020001', 'FATEPUR GRAM SEVA SAMABAY KRISHI UNNAYAN SAMITY LIMITED(192000233020001)', 'SUBODH KUMAR ROY', '', '0000-00-00', '', '', '', 0, '', '7718197753', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020002', 330, '02198', 330, '192000233020002', 'KALIYAGANJ AGRIL CO OP MARK SOC LIMITED(192000233020002)', 'SUJAN MODAK', '', '0000-00-00', '', '', '', 0, '', '9434616501', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020003', 330, '02197', 330, '192000233020003', 'NAODA GRAM PANCHAYAT SKUS LTD(192000233020003)', 'MANJUR ALI', '', '0000-00-00', '', '', '', 0, '', '8967237010', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020007', 330, '02199', 330, '192000233020007', 'BALIJOLE DAKSHINPARA SAMABAY KRISHI UNNAYAN SAMITY LTD(192000233020007)', 'ABUL KALAM', '', '0000-00-00', '', '', '', 0, '', '8637348763', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020008', 330, '02198', 330, '192000233020008', 'FULATTI SKUS LTD(192000233020008)', 'TARUN KUMAR ROY', '', '0000-00-00', '', '', '', 0, '', '9734014898', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020009', 330, '02196', 330, '192000233020009', 'KARNAJORA CO OPERATIVE AGRICULTURAL CREDIT SOCIETY LTD(192000233020009)', 'ABDUL GANI SARKAR', '', '0000-00-00', '', '', '', 0, '', '9733175067', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020010', 330, '02193', 330, '192000233020010', 'GOALPOKHER ONE BLOCK MAHILA BIPLABI SHG CO OP SOCIETY LTD(192000233020010)', 'DIPALI JHA', '', '0000-00-00', '', '', '', 0, '', '9932895339', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020011', 330, '02196', 330, '192000233020011', 'SITGRAM SKUS LTD(192000233020011)', 'KULDIP DAS', '', '0000-00-00', '', '', '', 0, '', '9932143495', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020013', 330, '02193', 330, '192000233020013', 'TILAN SKUS LTD(192000233020013)', 'MD RAISH ALAM', '', '0000-00-00', '', '', '', 0, '', '9733302098', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020014', 330, '02194', 330, '192000233020014', 'KANKI AGRICULTURAL MARKETING CO OPERATIVE SOCIETY LTD(192000233020014)', 'RAM PRASAD DAS', '', '0000-00-00', '', '', '', 0, '', '9932308960', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020015', 330, '02194', 330, '192000233020015', 'FULBHASA SKUS LTD(192000233020015)', 'ABDUL JABBAR', '', '0000-00-00', '', '', '', 0, '', '9382146061', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020016', 330, '02198', 330, '192000233020016', 'JINGAON SKUS LTD(192000233020016)', 'SATYENDRA NATH ROY', '', '0000-00-00', '', '', '', 0, '', '9647731734', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020017', 330, '02196', 330, '192000233020017', 'MAHUA SKUS LTD(192000233020017)', 'DHANANJAY MAHATO', '', '0000-00-00', '', '', '', 0, '', '8918747052', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020018', 330, '02197', 330, '192000233020018', 'TUFAN MAHILA COOPERATIVE CREDIT SOCIETY LTD(192000233020018)', 'ALEMA KHATUN', '', '0000-00-00', '', '', '', 0, '', '9382433972', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020019', 330, '02193', 330, '192000233020019', 'DOHAPARA SKUS LTD(192000233020019)', 'HASANUZZAMA', '', '0000-00-00', '', '', '', 0, '', '6295949434', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020020', 330, '02195', 330, '192000233020020', 'DIGHALGAON SKUS LTD(192000233020020)', 'MOJIBUR RAHAMAN', '', '0000-00-00', '', '', '', 0, '', '9434891912', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020021', 330, '02196', 330, '192000233020021', 'GLOBAL HELPLINE SERVICE COOPERATIVE SOCIETY LIMITED(192000233020021)', 'RABINDRA NATH ROY', '', '0000-00-00', '', '', '', 0, '', '9434232787', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020022', 330, '02197', 330, '192000233020022', 'SASHAN SERVICE CO-OPERATIVE SOCIETY LTD(192000233020022)', 'SAHIDUL RAHAMAN', '', '0000-00-00', '', '', '', 0, '', '9635248460', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020023', 330, '02196', 330, '192000233020023', 'U DINAJPUR SIDDHESWARY AGRIL AND OTHERS MULTI SERVICE CO-OP SOCIETY LTD(192000233020023)', 'SHAILEN BANERJEE', '', '0000-00-00', '', '', '', 0, '', '9475528867', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020024', 330, '02194', 330, '192000233020024', 'SAMAGRIK ANCHAL UNNAYAN KRISHAK SAMABAYA SAMITY LTD(192000233020024)', 'MD YOUNUS', '', '0000-00-00', '', '', '', 0, '', '8906056272', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020025', 330, '02196', 330, '192000233020025', 'LAHANDA GOMARDA SKUS LTD(192000233020025)', 'GOUTAM DEY SARKAR', '', '0000-00-00', '', '', '', 0, '', '7047557575', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020026', 330, '02199', 330, '192000233020026', 'NORTH BENGAL AGRICULTURE MULTIPURPOSE CO OPT SOCIETY LTD(192000233020026)', 'ARINDAM KUNDU', '', '0000-00-00', '', '', '', 0, '', '9002321414', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020028', 330, '02196', 330, '192000233020028', 'WEST BENGAL AGRIL MULTIPURPOSE CO-OPERATIVE SOCIETY LTD(192000233020028)', 'TAPAS KUMAR DAS', '', '0000-00-00', '', '', '', 0, '', '8670131079', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020029', 330, '02196', 330, '192000233020029', 'RAIGANJ CO OPERATIVE MARKETING SOCIETY LTD(192000233020029)', 'GOUTAM CHOWDHURY', '', '0000-00-00', '', '', '', 0, '', '8906356094', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020030', 330, '02192', 330, '192000233020030', 'NARAYANPUR O KHABARGAON SKUS LTD(192000233020030)', 'MD MASUD ALAM', '', '0000-00-00', '', '', '', 0, '', '9932587613', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020032', 330, '02194', 330, '192000233020032', 'KANKI AGRICULTURAL MULTIPURPOSE COOPERATIVE SOCIETY LTD(192000233020032)', 'SANKAR ROY', '', '0000-00-00', '', '', '', 0, '', '8918070164', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233020033', 330, '02196', 330, '192000233020033', 'BHOLANATH CONSUMER COOPERATIVE SOCIETY LTD(192000233020033)', 'S DAS', '', '0000-00-00', '', '', '', 0, '', '9563667075', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233120001', 331, '02202', 331, '192000233120001', 'CHURAIL KRISHNAPUR SKUS LTD(192000233120001)', 'SURAJIT BASAK', '', '0000-00-00', '', '', '', 0, '', '8967982141', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233120010', 331, '02202', 331, '192000233120010', 'PALASHI SKUS LTD(192000233120010)', 'Abu Taher Mandal', '', '0000-00-00', '', '', '', 0, '', '7550832290', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233120011', 331, '02206', 331, '192000233120011', 'BARAGRAM SKUS LTD(192000233120011)', 'GOLAM JARJIS HOSSAIN', '', '0000-00-00', '', '', '', 0, '', '9733396494', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233220001', 332, '02221', 332, '192000233220001', 'Kaliachak - II ACMS Ltd(192000233220001)', 'Sudam Chaudhuri', '', '0000-00-00', '', '', '', 0, '', '9733308454', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233220002', 332, '02217', 332, '192000233220002', 'Charlakshmipur SKUS Ltd(192000233220002)', 'Kamal Sarkar', '', '0000-00-00', '', '', '', 0, '', '9933157009', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233220003', 332, '02209', 332, '192000233220003', 'Narayan Multipurpose Co - op Society Ltd(192000233220003)', 'Hareram Mandal', '', '0000-00-00', '', '', '', 0, '', '9800464950', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233220004', 332, '02214', 332, '192000233220004', 'Salaidanga SKUS Ltd(192000233220004)', 'Rasna Khatun', '', '0000-00-00', '', '', '', 0, '', '6296272975', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233220007', 332, '02216', 332, '192000233220007', 'Nimbari SKUS Ltd(192000233220007)', 'Mantu Barman', '', '0000-00-00', '', '', '', 0, '', '9933501021', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233220008', 332, '02210', 332, '192000233220008', 'Mulaibari Bhagabatipur SKUS Ltd(192000233220008)', 'Moslimuddin Ahammed', '', '0000-00-00', '', '', '', 0, '', '9800611849', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233220010', 332, '02214', 332, '192000233220010', 'Krishnapur SKUS Ltd(192000233220010)', 'Santosh Sarkar', '', '0000-00-00', '', '', '', 0, '', '9735049414', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233220013', 332, '02208', 332, '192000233220013', 'Harishchandrapur L/S CMS Ltd(192000233220013)', 'Md Yeasin Khan', '', '0000-00-00', '', '', '', 0, '', '9933006485', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233220017', 332, '02210', 332, '192000233220017', 'Arbara SKUS Ltd(192000233220017)', 'Uday Chandra Das', '', '0000-00-00', '', '', '', 0, '', '8372885758', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233220018', 332, '02208', 332, '192000233220018', 'Khejurbari SKUS Ltd(192000233220018)', 'Mobarak Hossain', '', '0000-00-00', '', '', '', 0, '', '8101235554', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233220020', 332, '02208', 332, '192000233220020', 'Choupaldanga SKUS Ltd(192000233220020)', 'Majerul Hoque', '', '0000-00-00', '', '', '', 0, '', '9547892601', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233220024', 332, '02214', 332, '192000233220024', 'Bardanga SKUS Ltd(192000233220024)', 'Pranab Majumdar', '', '0000-00-00', '', '', '', 0, '', '7602066987', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233320008', 333, '02230', 333, '192000233320008', 'SIBAM MULTIPURPOSE CO-OPERATIVE SOCIETY LTD(192000233320008)', 'Purna Ch. Mal', '', '0000-00-00', '', '', '', 0, '', '7865085884', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233320017', 333, '02227', 333, '192000233320017', 'SIDDHI KALI SKUS LTD(192000233320017)', 'Supratik Mukherjee', '', '0000-00-00', '', '', '', 0, '', '9933937193', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233320022', 333, '02230', 333, '192000233320022', 'DASTURHAT D G SKUS LTD(192000233320022)', 'Md. Mujibur Rahaman', '', '0000-00-00', '', '', '', 0, '', '7074877977', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233320027', 333, '02238', 333, '192000233320027', 'CHANAK SKUS LTD(192000233320027)', 'Goutam Sahana', '', '0000-00-00', '', '', '', 0, '', '9732465403', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233320028', 333, '02243', 333, '192000233320028', 'KAMADPUR CHHATUMARA SKUS LTD(192000233320028)', 'Md. Anaj Ali', '', '0000-00-00', '', '', '', 0, '', '7076647790', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233320029', 333, '02230', 333, '192000233320029', 'JAGLAI SKUS LTD(192000233320029)', 'Mathuranath Mukherjee', '', '0000-00-00', '', '', '', 0, '', '9732356466', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233320030', 333, '02227', 333, '192000233320030', 'NOWDA SKUS LTD(192000233320030)', 'Syed Nure Zzaman', '', '0000-00-00', '', '', '', 0, '', '8116404286', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233320032', 333, '02230', 333, '192000233320032', 'HAZIPUR SKUS LTD(192000233320032)', 'Akhtaruzzaman', '', '0000-00-00', '', '', '', 0, '', '9002428041', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233420004', 334, '02263', 334, '192000233420004', 'Chandidas Nanoor S.K.U.SLtd.(192000233420004)', 'Gopal Mondal', '', '0000-00-00', '', '', '', 0, '', '9851611131', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233420013', 334, '02254', 334, '192000233420013', 'Baje-Bujung SKUS Ltd(192000233420013)', 'Nirmal Kr Mal', '', '0000-00-00', '', '', '', 0, '', '8967405924', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233420014', 334, '02249', 334, '192000233420014', 'Chatra SKUS Ltd(192000233420014)', 'Panchanan Upaddhya', '', '0000-00-00', '', '', '', 0, '', '7908791960', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233420015', 334, '02261', 334, '192000233420015', 'Panrui SKUS Ltd(192000233420015)', 'Enamul Haque', '', '0000-00-00', '', '', '', 0, '', '9083253792', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233420016', 334, '02257', 334, '192000233420016', 'Heruka SKUS Ltd(192000233420016)', 'Mursad Ali', '', '0000-00-00', '', '', '', 0, '', '8170845667', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233420017', 334, '02257', 334, '192000233420017', 'Sekedda SKUS Ltd(192000233420017)', 'Kazi Humaun Kabir', '', '0000-00-00', '', '', '', 0, '', '9635652277', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233420019', 334, '02266', 334, '192000233420019', 'Barul SKUS Ltd(192000233420019)', 'Saniul Haque', '', '0000-00-00', '', '', '', 0, '', '9547999888', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233420022', 334, '02263', 334, '192000233420022', 'Hatserandi SKUS Ltd(192000233420022)', 'Brindaban Mondal', '', '0000-00-00', '', '', '', 0, '', '9932266650', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233420023', 334, '02256', 334, '192000233420023', 'Uchpur SKUS Ltd(192000233420023)', 'Nabakumar Mandal', '', '0000-00-00', '', '', '', 0, '', '9002959430', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233420024', 334, '02263', 334, '192000233420024', 'Barah SKUS Ltd(192000233420024)', 'Kalisadhan Mukherjee', '', '0000-00-00', '', '', '', 0, '', '8016069063', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233420025', 334, '02261', 334, '192000233420025', 'Srinidhipur UCACS Ltd(192000233420025)', 'Sanat Kr Roy', '', '0000-00-00', '', '', '', 0, '', '9832418119', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233420027', 334, '02265', 334, '192000233420027', 'Illambazar UCACS Ltd(192000233420027)', 'Ganapati Mondal', '', '0000-00-00', '', '', '', 0, '', '9932707643', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233420031', 334, '02266', 334, '192000233420031', 'Paduma SKUS Ltd(192000233420031)', 'Madhusudan Hazra', '', '0000-00-00', '', '', '', 0, '', '7908498882', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233420042', 334, '02254', 334, '192000233420042', 'Kaluha SKUS Ltd(192000233420042)', 'Pallab Mondal', '', '0000-00-00', '', '', '', 0, '', '6295767270', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233420046', 334, '02251', 334, '192000233420046', 'Koytha SKUS Ltd(192000233420046)', 'Abdul Rahaman', '', '0000-00-00', '', '', '', 0, '', '9679351778', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233520001', 335, '02278', 335, '192000233520001', 'CHANAK UCACS LTD(192000233520001)', 'NA', 'NA', '2021-11-22', 'NA', 'NA', 'NA', 0, 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'SCMFBWN006, 22/11/2021', 'synergic', '2022-05-21', 'NA', '2022-05-21'),
('192000233520004', 335, '02292', 335, '192000233520004', 'SATGACHIA SKUS LTD(192000233520004)', 'SOMNATH DE', '', '0000-00-00', '', '', '', 0, '', '9474359591', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233520005', 335, '02294', 335, '192000233520005', 'BADLA SKUS LTD(192000233520005)', 'NA', 'NA', '2021-11-25', 'NA', 'NA', 'NA', 0, 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'SCMFBWN012, 25/11/2021', 'synergic', '2022-05-14', 'NA', '2022-05-14'),
('192000233520006', 335, '02279', 335, '192000233520006', 'KETUGRAM TCAMS LTD (192000233520006)', 'NA', 'NA', '2021-12-16', 'NA', 'NA', 'NA', 0, 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'SCMFBWN024, 16/12/2021', 'synergic', '2022-05-20', 'NA', '2022-05-20'),
('192000233520008', 335, '02276', 335, '192000233520008', 'Balarambati Genrai SKUS LTD (192000233520008)', 'NA', 'NA', '2021-12-03', 'NA', 'NA', 'NA', 0, 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'SCMFBWN019, 03/12/2021', 'synergic', '2022-04-26', 'NA', '2022-04-26'),
('192000233520012', 335, '02294', 335, '192000233520012', 'CHAGRAM NOARAH SKUS LTD (192000233520012)', 'NA', 'NA', '2021-11-25', 'NA', 'NA', 'NA', 0, 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'SCMFBWN011, 25/11/2021', 'synergic', '2022-05-13', 'NA', '2022-05-13'),
('192000233520013', 335, '02277', 335, '192000233520013', 'DHARAMPUR PUNNAGAR SKUS LTD(192000233520013)', 'NA', 'NA', '2021-11-22', 'NA', 'NA', 'NA', 0, 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'SCMFBWN005, 22/11/2021', 'synergic', '2022-04-21', 'NA', '2022-04-21'),
('192000233520016', 335, '02288', 335, '192000233520016', 'MASJIDPUR UCACS LTD(192000233520016)', 'SK ABDUL MANIK', '', '0000-00-00', '', '', '', 0, '', '9064283933', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233520017', 335, '02293', 335, '192000233520017', 'BEGPUR SKUS LTD(192000233520017)', 'NA', 'NA', '2021-11-24', 'NA', 'NA', 'NA', 0, 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'SCMFBWN009, 24/11/2021', 'synergic', '2022-05-12', 'NA', '2022-05-12'),
('192000233520019', 335, '02292', 335, '192000233520019', 'SRIDHARPUR CO OPERATIVE BANK(192000233520019)', 'GOUTAM CHATTERJEE', '', '0000-00-00', '', '', '', 0, '', '8250731801', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233520022', 335, '02285', 335, '192000233520022', 'BANNAGRA BAGTONA SKUS LTD(192000233520022)', 'NA', 'NA', '2021-11-16', 'NA', 'NA', 'NA', 0, 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'SCMFBWN001, 16/11/2021', 'synergic', '2022-05-16', 'NA', '2022-05-16'),
('192000233520024', 335, '02295', 335, '192000233520024', 'JAUGRAM GOPALPUR SKUS LTD(192000233520024)', 'KUNAL CHATTERJEE', '', '0000-00-00', '', '', '', 0, '', '9932168699', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233520027', 335, '02288', 335, '192000233520027', 'KURKUBA ASKARAN SKUS LTD(192000233520027)', 'ANITESH MONDAL', '', '0000-00-00', '', '', '', 0, '', '7001990836', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620001', 336, '02308', 336, '192000233620001', 'Subarnabihar SKUS Ltd(192000233620001)', 'Amit Modak', '', '0000-00-00', '', '', '', 0, '', '9002228836', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620004', 336, '02306', 336, '192000233620004', 'P R Chuakhali SKUS Ltd(192000233620004)', 'Naru Gopal Ghosh', '', '0000-00-00', '', '', '', 0, '', '9476398075', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620007', 336, '02310', 336, '192000233620007', 'Gazna SKUS Ltd(192000233620007)', 'DIPAK KUMAR BISWAS', '', '0000-00-00', '', '', '', 0, '', '9474676894', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620008', 336, '02314', 336, '192000233620008', 'Narapatipara SKUS Ltd(192000233620008)', 'Ramij Iman Mallick', '', '0000-00-00', '', '', '', 0, '', '8371974572', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620009', 336, '02301', 336, '192000233620009', 'Tehatta No 1 Block PMCS Ltd(192000233620009)', 'RAFIKUL MONDAL', '', '0000-00-00', '', '', '', 0, '', '8001839043', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620011', 336, '02308', 336, '192000233620011', 'Basundhara Mahila CCS Ltd(192000233620011)', 'PRATIMA GOSWAMI', '', '0000-00-00', '', '', '', 0, '', '9932362734', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620012', 336, '02308', 336, '192000233620012', 'Kojagari Mahila Rindan Samabay Samity Ltd(192000233620012)', 'Nandita Ghosh', '', '0000-00-00', '', '', '', 0, '', '7501594070', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620013', 336, '02314', 336, '192000233620013', 'Silinda FSCS Ltd(192000233620013)', 'Sukanta Mondal', '', '0000-00-00', '', '', '', 0, '', '9153697062', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620014', 336, '02313', 336, '192000233620014', 'Aishmali L/S PACS Ltd(192000233620014)', 'Sanjib Biswas', '', '0000-00-00', '', '', '', 0, '', '7001980491', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620015', 336, '02312', 336, '192000233620015', 'Berakamgachi Shim Aishtala SKUS Ltd(192000233620015)', 'Jitendranath Biswas', '', '0000-00-00', '', '', '', 0, '', '9378366173', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620016', 336, '02312', 336, '192000233620016', 'Bayaspur SKUS Ltd(192000233620016)', 'Radharaman BIswas', '', '0000-00-00', '', '', '', 0, '', '6296928283', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620017', 336, '02307', 336, '192000233620017', 'Nabadwip TACMS Ltd(192000233620017)', 'Sahidul Sk', '', '0000-00-00', '', '', '', 0, '', '9732239626', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620018', 336, '02313', 336, '192000233620018', 'Ranaghat PAMMCS Ltd(192000233620018)', 'Tapan Dutta', '', '0000-00-00', '', '', '', 0, '', '9830912915', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620019', 336, '02304', 336, '192000233620019', 'Nabina Mahila CCS Ltd(192000233620019)', 'Rokiya Sekh', '', '0000-00-00', '', '', '', 0, '', '9064287003', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620020', 336, '02305', 336, '192000233620020', 'Chapra TAMCS Ltd(192000233620020)', 'Abdul Karim Mannan', '', '0000-00-00', '', '', '', 0, '', '9474137363', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620022', 336, '02314', 336, '192000233620022', 'Gontra skus ltd(192000233620022)', 'Gopal Ghosh', '', '0000-00-00', '', '', '', 0, '', '9732526974', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620024', 336, '02308', 336, '192000233620024', 'Bisnupur Rawtara pacs Ltd(192000233620024)', 'SUBHANKAR KUNDU', '', '0000-00-00', '', '', '', 0, '', '7872138912', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620026', 336, '02313', 336, '192000233620026', 'Chapra Dhantala skus ltd(192000233620026)', 'Jaydeb Biswas', '', '0000-00-00', '', '', '', 0, '', '9732930407', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620027', 336, '02306', 336, '192000233620027', 'Singhati skus ltd(192000233620027)', 'Abbas Uddian', '', '0000-00-00', '', '', '', 0, '', '8509164691', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620028', 336, '02308', 336, '192000233620028', 'Dignagar skus ltd(192000233620028)', 'Shubhashish Roy', '', '0000-00-00', '', '', '', 0, '', '9775656353', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620030', 336, '02314', 336, '192000233620030', 'Srijani Mahila SSS Ltd(192000233620030)', 'Kajal Ghosh', '', '0000-00-00', '', '', '', 0, '', '9046159004', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620031', 336, '02303', 336, '192000233620031', 'Chhoto Chandghar SKUS Ltd(192000233620031)', 'Benjir Saboyar Parvej Naowaz', '', '0000-00-00', '', '', '', 0, '', '9091411216', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620032', 336, '02310', 336, '192000233620032', 'Bhayna SKUS Ltd(192000233620032)', 'Biswajit Dhara', '', '0000-00-00', '', '', '', 0, '', '9733576430', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620033', 336, '02310', 336, '192000233620033', 'Nabayug l/s CACS Ltd(192000233620033)', 'Krishna Gopal Biswas', '', '0000-00-00', '', '', '', 0, '', '9475236410', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620034', 336, '02314', 336, '192000233620034', 'Jatrapur SKUS Ltd CHAKDAHA(192000233620034)', 'SUDEB DAS', '', '0000-00-00', '', '', '', 0, '', '7001191232', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620035', 336, '02314', 336, '192000233620035', 'Kugachi SKUS Ltd(192000233620035)', 'Arindam Ghosh', '', '0000-00-00', '', '', '', 0, '', '8328712720', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620037', 336, '02302', 336, '192000233620037', 'Abhoynagar Charakpota SKUS Ltd(192000233620037)', 'Safikul Islam', '', '0000-00-00', '', '', '', 0, '', '9647449198', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620039', 336, '02304', 336, '192000233620039', 'Bagunda SKUS LTD(192000233620039)', 'Kanu chakrabarti', '', '0000-00-00', '', '', '', 0, '', '9932758659', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620040', 336, '02307', 336, '192000233620040', 'Nandini Co-Op Credit Society Ltd Mahila SHG(192000233620040)', 'Sutapa Goswami', '', '0000-00-00', '', '', '', 0, '', '9563576319', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620041', 336, '02311', 336, '192000233620041', 'Santipur TCAMS Ltd(192000233620041)', 'Bishnupada Sarkar', '', '0000-00-00', '', '', '', 0, '', '8617596364', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620042', 336, '02312', 336, '192000233620042', 'Radhanagar SKUS Ltd(192000233620042)', 'Rajib Biswas', '', '0000-00-00', '', '', '', 0, '', '6296177034', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233620044', 336, '02304', 336, '192000233620044', 'Bangaria skus ltd(192000233620044)', 'A HOSSEIN', '', '0000-00-00', '', '', '', 0, '', '9775711367', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233720001', 337, '02327', 337, '192000233720001', 'KHARUA CHANDPUR SKUS LTD(192000233720001)', 'MD. ABDUR RAJJAK', '', '0000-00-00', '', '', '', 0, '', '9836193262', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233720003', 337, '02317', 337, '192000233720003', 'FULBARI SKUS LTD(192000233720003)', 'KAMAL SARKAR', '', '0000-00-00', '', '', '', 0, '', '9832174560', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233720014', 337, '02320', 337, '192000233720014', 'DAKSHIN SARAI SKUS LTD(192000233720014)', 'RABIUL ISLAM', '', '0000-00-00', '', '', '', 0, '', '7003273868', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233720017', 337, '02322', 337, '192000233720017', 'AMDANGA THANA L/S PCAMS LTD(192000233720017)', 'MANOJ THAKUR', '', '0000-00-00', '', '', '', 0, '', '7908856931', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233720021', 337, '02321', 337, '192000233720021', 'BERGOOM PAYRAGACHI SKUS LTD(192000233720021)', 'SUBARAN CHATTERJEE', '', '0000-00-00', '', '', '', 0, '', '9933553840', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233720022', 337, '02318', 337, '192000233720022', 'FULSARA UTTAR SKUS LTD(192000233720022)', 'ASIT KUMAR BALA', '', '0000-00-00', '', '', '', 0, '', '9091802451', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233720026', 337, '02321', 337, '192000233720026', 'NATNI SKUS LTD(192000233720026)', 'AJIT KUMAR GHOSH', '', '0000-00-00', '', '', '', 0, '', '9382936360', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820001', 338, '02353', 338, '192000233820001', 'MORHAL SHIBCHAK SAMBAY KRISHI UNNAYAN SAMITY LTD(192000233820001)', 'SWARAJ KUMAR MAJI', '', '0000-00-00', '', '', '', 0, '', '9733091405', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820002', 338, '02342', 338, '192000233820002', 'RAMNAGAR S POLLI OK US LTD(192000233820002)', 'SANJIB SAMANTA', '', '0000-00-00', '', '', '', 0, '', '9775622949', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820003', 338, '02345', 338, '192000233820003', 'JAGULIA SAMABAY KRISHI UNNYAN SAMITY LIMITED(192000233820003)', 'SANTU NEOGI', '', '0000-00-00', '', '', '', 0, '', '7797413380', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820004', 338, '02343', 338, '192000233820004', 'DHANIAKHALI THANA CO-OP AGRICULTURE MARKETING SOCIETY LTD(192000233820004)', 'SOVAN DEV GHOSH', '', '0000-00-00', '', '', '', 0, '', '9735934060', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820005', 338, '02347', 338, '192000233820005', 'BETA KHARARI SAMABAY KRISHI UNNAYAN SAMITY LIMITED(192000233820005)', 'SK SANIAZ HOSSAIN', '', '0000-00-00', '', '', '', 0, '', '9635391776', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820006', 338, '02353', 338, '192000233820006', 'DILAKASH SAMABAY KRISHI UNNAYAN SAMITY LIMITED(192000233820006)', 'KAMALAKANTA CHATTERJEE', '', '0000-00-00', '', '', '', 0, '', '9064829734', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820007', 338, '02353', 338, '192000233820007', 'JANGIPARA LARGE SIZED PRIMARY CO OP AGRICULTURAL MARKETING SOCIETY LIMITED(192000233820007)', 'SACHINDRA NATH GHOSH', '', '0000-00-00', '', '', '', 0, '', '9474196112', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820008', 338, '02353', 338, '192000233820008', 'MUKUNDAPUR SAMABAY KRISHI UNNAYAN SAMITY LIMITED(192000233820008)', 'KUNTAL ROY', '', '0000-00-00', '', '', '', 0, '', '9382620573', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820009', 338, '02342', 338, '192000233820009', 'RAMNARAYANPUR SAMABAY KRISHI UNNAYAN SAMITY LIMITED(192000233820009)', 'ARABINDA KAR', '', '0000-00-00', '', '', '', 0, '', '9614091118', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820010', 338, '02342', 338, '192000233820010', 'KALAIKUNDU SAMABAY KRISHI UNNAYAN SAMITY LIMITED(192000233820010)', 'SANJIB MONDAL', '', '0000-00-00', '', '', '', 0, '', '7063553599', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820011', 338, '02353', 338, '192000233820011', 'KULAKASH SAMABAY KRISHI UNNAYAN SAMITY LTD(192000233820011)', 'KALIPADA MALICK', '', '0000-00-00', '', '', '', 0, '', '9800368949', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820012', 338, '02353', 338, '192000233820012', 'SOARI DOGACHIA HARIHARPUR SKUS LIMITED(192000233820012)', 'KALIPADA CHAKRABORTY', '', '0000-00-00', '', '', '', 0, '', '9732714523', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820013', 338, '02338', 338, '192000233820013', 'GOGHAT THANA LARGE SIZED PRIMARY COOPERATIVE AGRICULTURAL MARKETING(192000233820013)', 'TUHIN SUBHRA GHOSH', '', '0000-00-00', '', '', '', 0, '', '9563200492', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820014', 338, '02339', 338, '192000233820014', 'SANTIPUR SAMABAY KRISHI UNNAYAN SAMITY LIMITED(192000233820014)', 'NILMONI TURUK', '', '0000-00-00', '', '', '', 0, '', '7699338776', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820015', 338, '02344', 338, '192000233820015', 'NEAL NOWPARA SAMABAY KRISHI UNNYAN SAMITY LIMITED(192000233820015)', 'MD NURUDDIN MONDAL', '', '0000-00-00', '', '', '', 0, '', '8116618235', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820017', 338, '02344', 338, '192000233820017', 'SIKHIRA CHAMPTA SAMABAYA KRISHI UNNYAN SAMITY LIMITED(192000233820017)', 'LAXMI KANTA ROY', '', '0000-00-00', '', '', '', 0, '', '8016349496', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820018', 338, '02355', 338, '192000233820018', 'RANJITBATI KETEDAL SAMABAY KRISHI UNNAYAN SAMITY LIMITED(192000233820018)', 'SAMIR KUMAR MONDAL', '', '0000-00-00', '', '', '', 0, '', '9733693520', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820019', 338, '02340', 338, '192000233820019', 'KABLEY SAMABAY KRISHI UNNYAN SAMITY LIMITED(192000233820019)', 'BISWARUP SARKAR', '', '0000-00-00', '', '', '', 0, '', '8436258317', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820020', 338, '02341', 338, '192000233820020', 'SOALUK SAMABAYA KRISHI UNNAYAN SAMITY LIMITED(192000233820020)', 'LILUFA YEASMIN', '', '0000-00-00', '', '', '', 0, '', '8116962918', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820022', 338, '02355', 338, '192000233820022', 'BALAICHAK SAMABAY KRISHI UNNAUAN SAMITY LIMITED(192000233820022)', 'DIGANTA MONDAL', '', '0000-00-00', '', '', '', 0, '', '9002288495', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820023', 338, '02342', 338, '192000233820023', 'GOBORHANRA SAMABAY KRISHI UNNAYAN SAMITY LIMITED(192000233820023)', 'ANSHUMAN MANDAL', '', '0000-00-00', '', '', '', 0, '', '9002195090', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820024', 338, '02342', 338, '192000233820024', 'MOHESHPUR SAMABAY KRISHI UNNAYAN SAMITY LIMITED(192000233820024)', 'SANATAN MALICK', '', '0000-00-00', '', '', '', 0, '', '9732229153', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820025', 338, '02342', 338, '192000233820025', 'BHAWANIPUR SAMABAY KRISHI UNNAYAN SAMITY LTD(192000233820025)', 'RABINDRANATH KANRAR', '', '0000-00-00', '', '', '', 0, '', '9434567616', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820026', 338, '02342', 338, '192000233820026', 'BHANJIPUR GRAM P SKUS LTD(192000233820026)', 'SUDHIR GHORUI', '', '0000-00-00', '', '', '', 0, '', '9933922787', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820027', 338, '02353', 338, '192000233820027', 'BRINDABANCHAK SAMABAYA KRISHI UNNAYAN SAMITY LIMITED(192000233820027)', 'SATYASADHAN SASMAL', '', '0000-00-00', '', '', '', 0, '', '9775325949', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820029', 338, '02354', 338, '192000233820029', 'HELAN MAIKHANDA(192000233820029)', 'DEBSENA HAZRA', '', '0000-00-00', '', '', '', 0, '', '9475845867', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820030', 338, '02342', 338, '192000233820030', 'PIYASARA STATION PATI SAMABAY KRISHI UNNAYAN SAMITY LIMITED(192000233820030)', 'SEKH MANIRUL HAQUE', '', '0000-00-00', '', '', '', 0, '', '9732868101', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820031', 338, '02348', 338, '192000233820031', 'Sultanpur Olipur Nayanagar SKUS Limited', 'Kalikinkar Singharay', 'NA', '2022-04-20', 'NA', 'NA', 'NA', 0, 'NA', '8609708481', 'NA', 'NA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2022-04-20', NULL, NULL),
('192000233820032', 338, '02338', 338, '192000233820032', 'KUMURSHA SAMABAY KRISHI UNNAYAN SAMITY LIMITED(192000233820032)', 'PRONAB KUMAR DEY', '', '0000-00-00', '', '', '', 0, '', '9434404541', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820033', 338, '02340', 338, '192000233820033', 'ARANDI SAMABOY KRISHI UNNAYAN SAMITY LIMITED(192000233820033)', 'DILIP KOLEY', '', '0000-00-00', '', '', '', 0, '', '9647690655', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820034', 338, '02340', 338, '192000233820034', 'NAZRUL SAMABAY KRISHI UNNAYAN SAMITY LIMITED(192000233820034)', 'TAPAS KUMAR DEY', '', '0000-00-00', '', '', '', 0, '', '8967028612', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820035', 338, '02342', 338, '192000233820035', 'KULATEGHARI KETERA SAMABAY KRISHI UNNAYAN SAMITY LTD(192000233820035)', 'TAPAN KUMAR ROY', '', '0000-00-00', '', '', '', 0, '', '9679048660', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820036', 338, '02342', 338, '192000233820036', 'KESHABCHAK SKUS LTD(192000233820036)', 'ASOK KUMAR PAL', '', '0000-00-00', '', '', '', 0, '', '9564584317', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL);
INSERT INTO `md_society` (`sl_no`, `dist`, `block`, `branch_id`, `society_code`, `soc_name`, `inchargename`, `reg_no`, `reg_date`, `tan`, `police_station`, `post_office`, `pin`, `soc_addr`, `ph_no`, `email`, `bank_name`, `branch_name`, `acc_type`, `acc_no`, `ifsc_code`, `pan_no`, `gst_no`, `guide_lines_id`, `agreementno`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
('192000233820037', 338, '02342', 338, '192000233820037', 'VIVEKANANDA SAMABAY KRISHI UNNYAN SAMITY LIMITED', 'SAIKAT CHAKRABORTY', 'NA', '2022-04-20', 'NA', 'NA', 'NA', 0, 'NA', '9775996030', 'NA', 'NA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2022-04-20', NULL, NULL),
('192000233820038', 338, '02342', 338, '192000233820038', 'BISHNUBATI GAYESPUR BHIMPUR SKUS LTD(192000233820038)', 'MONTU SARKHEL', '', '0000-00-00', '', '', '', 0, '', '9732755938', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820040', 338, '02347', 338, '192000233820040', 'ALIPUR SAMABAY KRISHI UNNAYAN SAMITY LTD(192000233820040)', 'TANMOY KUMAR GHOSH', '', '0000-00-00', '', '', '', 0, '', '9932605942', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820041', 338, '02340', 338, '192000233820041', 'MADHABPUR SAMABAY KRISHI UNYAN SAMITI LTD(192000233820041)', 'ASISH ROY', '', '0000-00-00', '', '', '', 0, '', '9609533523', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820042', 338, '02342', 338, '192000233820042', 'MILANI SAMABAY KRISHI UNNAYAN SAMITI LIMITED(192000233820042)', 'ASIT KUMAR RAY', '', '0000-00-00', '', '', '', 0, '', '9800885309', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820044', 338, '02351', 338, '192000233820044', 'DOODKOMRA MAMUDPUR SAMABAYA KRISHI UNNAYAN SAMITY LIMITED(192000233820044)', 'RAJIB BBHATTACHARYYA', '', '0000-00-00', '', '', '', 0, '', '9732974769', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820045', 338, '02341', 338, '192000233820045', 'MASINAN SAMABAY KRISHI UNNAYAN SAMITY LIMITED(192000233820045)', 'MANAS PANJA', '', '0000-00-00', '', '', '', 0, '', '9932189902', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820046', 338, '02349', 338, '192000233820046', 'SINGHAL PATAN SAMABAY KRISHI UNNAYAN SAMITY LIMITED(192000233820046)', 'ANIMESH DAS', '', '0000-00-00', '', '', '', 0, '', '9903791141', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820048', 338, '02348', 338, '192000233820048', 'GOSA MUSHAPUR SAMABAY KRISHI UNNAYAN SAMITY LIMITED(192000233820048)', 'TAPAS HAZRA', '', '0000-00-00', '', '', '', 0, '', '7602737075', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820050', 338, '02353', 338, '192000233820050', 'RAHIMPUR SAMABAYA KRISHI UNNYAN SAMITY LIMITED(192000233820050)', 'NABA KUMAR MALICK', '', '0000-00-00', '', '', '', 0, '', '9647947557', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820051', 338, '02353', 338, '192000233820051', 'SINGTI GUTI ATRA BILASPUR SAMABAY KRISHI UNNYAN SAMITY LIMITED(192000233820051)', 'SWAPAN PATRA', '', '0000-00-00', '', '', '', 0, '', '9064667213', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820052', 338, '02353', 338, '192000233820052', 'MAHALAXMI SAMABAY KRISHI UNNAYAN SAMITY LIMITED(192000233820052)', 'RAJU BHANDARI', '', '0000-00-00', '', '', '', 0, '', '9609635549', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820053', 338, '02349', 338, '192000233820053', 'KHASERCHAK CHAKGOBINDA SAMABAY KRISHI UNNAYAN SAMITY LIMITED(192000233820053)', 'KAUSHIK ADHIKARI', '', '0000-00-00', '', '', '', 0, '', '9830562335', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820054', 338, '02340', 338, '192000233820054', 'KANPUR SAMABAY KRISHI UNNAYAN SAMITY LIMITED(192000233820054)', 'GOUTAM MANDAL', '', '0000-00-00', '', '', '', 0, '', '7797679624', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820058', 338, '02353', 338, '192000233820058', 'RADHANAGAR SKUS LIMITED(192000233820058)', 'KALYAN KONAR', '', '0000-00-00', '', '', '', 0, '', '7001747382', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820059', 338, '02344', 338, '192000233820059', 'DHAMASIN O MULTI SKUS LTD(192000233820059)', 'SK GIASUDDIN SARKAR', '', '0000-00-00', '', '', '', 0, '', '7063010590', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233820060', 338, '02344', 338, '192000233820060', 'BERUI SAMABAYA KRISHI UNNAYAN SAMITY LIMITED(192000233820060)', 'SANAT KUMAR MALIK', '', '0000-00-00', '', '', '', 0, '', '9002616246', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920004', 339, '02368', 339, '192000233920004', 'SHYAMNAGAR A SKUS LTD(192000233920004)', 'TAPAS SEN', '', '0000-00-00', '', '', '', 0, '', '9732222315', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920005', 339, '02368', 339, '192000233920005', 'KUCHIAKOL A SKUS LTD(192000233920005)', 'NEMAI SINGHA', '', '0000-00-00', '', '', '', 0, '', '9382622582', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920006', 339, '02371', 339, '192000233920006', 'TALDANGRA SKUS LTD(192000233920006)', 'KANCHAN MAJI', '', '0000-00-00', '', '', '', 0, '', '9735167693', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920007', 339, '02370', 339, '192000233920007', 'PUNCHA SKUS LTD(192000233920007)', 'SAILEN GHOSH', '', '0000-00-00', '', '', '', 0, '', '9434589722', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920008', 339, '02371', 339, '192000233920008', 'BHIMARA KESHATORA SKUS LTD(192000233920008)', 'ANIRUDDHA GHOSH', '', '0000-00-00', '', '', '', 0, '', '8670514604', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920009', 339, '02368', 339, '192000233920009', 'HETIA SKUS LTD(192000233920009)', 'NAYAN CHATTOPADHYAY', '', '0000-00-00', '', '', '', 0, '', '9434392579', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920010', 339, '02368', 339, '192000233920010', 'MOYNAPUR AN SKUS LTD(192000233920010)', 'ARUNAVA ROY', '', '0000-00-00', '', '', '', 0, '', '9732313830', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920011', 339, '02364', 339, '192000233920011', 'RADHARAMONPUR SKUS LTD(192000233920011)', 'MONIRUJJAN KHAN', '', '0000-00-00', '', '', '', 0, '', '9434590492', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920012', 339, '02368', 339, '192000233920012', 'GELIA UNION LS PACS LTD(192000233920012)', 'SEKH ALAM', '', '0000-00-00', '', '', '', 0, '', '8145590534', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920013', 339, '02368', 339, '192000233920013', 'ROUTHKHANDA A SKUS LTD(192000233920013)', 'KULDIP PAL SINGH', '', '0000-00-00', '', '', '', 0, '', '9647654724', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920016', 339, '02370', 339, '192000233920016', 'GAMIDYA D SKUS LTD(192000233920016)', 'SHYAMSUNDAR MISHRA', '', '0000-00-00', '', '', '', 0, '', '9564883549', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920018', 339, '02375', 339, '192000233920018', 'BAGSONSDA SKUS LTD(192000233920018)', 'SUBHAS CHEL', '', '0000-00-00', '', '', '', 0, '', '9800805631', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920020', 339, '02375', 339, '192000233920020', 'DHADKIDIHI SKUS LTD(192000233920020)', 'PRASANTA KR MAHATA', '', '0000-00-00', '', '', '', 0, '', '8001117850', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920021', 339, '02375', 339, '192000233920021', 'HALUD KANALI G SKUS LTD(192000233920021)', 'NIRMAL CH MANDAL', '', '0000-00-00', '', '', '', 0, '', '9932775809', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920022', 339, '02368', 339, '192000233920022', 'RAHAGRAM SKUS LTD(192000233920022)', 'SHYAMAL DAS', '', '0000-00-00', '', '', '', 0, '', '9933932969', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920024', 339, '02364', 339, '192000233920024', 'BIRSINGPUR SKUS LTD(192000233920024)', 'SHANTI NANDI', '', '0000-00-00', '', '', '', 0, '', '9434520338', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920028', 339, '02374', 339, '192000233920028', 'HATIRAMPUR SKUS LTD(192000233920028)', 'AMIT KAR', '', '0000-00-00', '', '', '', 0, '', '9933978507', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920030', 339, '02364', 339, '192000233920030', 'BHAGABANPUR SKUS LTD(192000233920030)', 'SHAYMAL BANERJEE', '', '0000-00-00', '', '', '', 0, '', '9647941192', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920032', 339, '02358', 339, '192000233920032', 'EKADASPALLY SKUS LTDQ(192000233920032)', 'PROBODH GHOSH', '', '0000-00-00', '', '', '', 0, '', '9732130578', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920033', 339, '02377', 339, '192000233920033', 'Sarenga A SKUS Ltd(192000233920033)', 'MANAS SARKAR', '', '0000-00-00', '', '', '', 0, '', '9932948325', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920036', 339, '02373', 339, '192000233920036', 'JIAKANALI SKUS LTD(192000233920036)', 'SWAPAN KR SAHA', '', '0000-00-00', '', '', '', 0, '', '8967113399', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920038', 339, '02362', 339, '192000233920038', 'SENDRA SKUS LTD(192000233920038)', 'TARUN PAL', '', '0000-00-00', '', '', '', 0, '', '8116502509', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920039', 339, '02375', 339, '192000233920039', 'LADDA SKUS LTD(192000233920039)', 'AJIT MAHATA', '', '0000-00-00', '', '', '', 0, '', '9800143403', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920042', 339, '02367', 339, '192000233920042', 'SARADAMONI SKUS LTD(192000233920042)', 'JAYDEB PAN', '', '0000-00-00', '', '', '', 0, '', '9732233218', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920043', 339, '02368', 339, '192000233920043', 'MADHURPUR SKUS LTD(192000233920043)', 'PRASHANTA SINGHA ROY', '', '0000-00-00', '', '', '', 0, '', '9064416471', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920044', 339, '02368', 339, '192000233920044', 'RAGHUNATHPUR SKUS LTD(192000233920044)', 'MAHADEB KOLEY', '', '0000-00-00', '', '', '', 0, '', '9474125387', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920046', 339, '02359', 339, '192000233920046', 'KHIRSOLE SKUS LTD(192000233920046)', 'BHADRA BARUI', '', '0000-00-00', '', '', '', 0, '', '9800260729', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920048', 339, '02366', 339, '192000233920048', 'INDAS TCAMS LTD(192000233920048)', 'RAMENDU MEDDYA', '', '0000-00-00', '', '', '', 0, '', '8900746984', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920050', 339, '02357', 339, '192000233920050', 'RANIPUR SKUS LTD(192000233920050)', 'SHANTANU DAS', '', '0000-00-00', '', '', '', 0, '', '9609168089', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920051', 339, '02361', 339, '192000233920051', 'MOLEBONA SKUS LTD(192000233920051)', 'TAPAN KR DEY', '', '0000-00-00', '', '', '', 0, '', '9434392818', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920052', 339, '02367', 339, '192000233920052', 'SARADA SKUS LTD(192000233920052)', 'PRADIP CHOWDHURY', '', '0000-00-00', '', '', '', 0, '', '9609575967', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920053', 339, '02367', 339, '192000233920053', 'DEOPARA SKUS LTD(192000233920053)', 'SRIKANTA DEY', '', '0000-00-00', '', '', '', 0, '', '9474669058', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000233920058', 339, '02368', 339, '192000233920058', 'UTTARBARH SKUS LTD(192000233920058)', 'JAMSUR ALI KHAN', '', '0000-00-00', '', '', '', 0, '', '8372056355', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020001', 340, '02391', 340, '192000234020001', 'Chekya GP SKUS Ltd(192000234020001)', 'Mahabir Kumar', '', '0000-00-00', '', '', '', 0, '', '7365011718', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020003', 340, '02386', 340, '192000234020003', 'Bishpuria SKUS Ltd(192000234020003)', 'Mrigankya Mahato', '', '0000-00-00', '', '', '', 0, '', '9800820845', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020006', 340, '02381', 340, '192000234020006', 'Chitarma SKUS Ltd(192000234020006)', 'Sasthi Banerjee', '', '0000-00-00', '', '', '', 0, '', '9933467002', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020007', 340, '02390', 340, '192000234020007', 'Hensahatu GP SKUS Ltd(192000234020007)', 'Kalipada Mahato', '', '0000-00-00', '', '', '', 0, '', '8967908843', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020008', 340, '02383', 340, '192000234020008', 'Raibandh GP SKUS Ltd(192000234020008)', 'Bhaskar Maji', '', '0000-00-00', '', '', '', 0, '', '9635288227', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020010', 340, '02383', 340, '192000234020010', 'Digha GP SKUS Ltd(192000234020010)', 'SK SAHABUDDIN', '', '0000-00-00', '', '', '', 0, '', '9609295263', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020012', 340, '02378', 340, '192000234020012', 'Ghagra GP SKUS Ltd(192000234020012)', 'Sampad Kumar Mahato', '', '0000-00-00', '', '', '', 0, '', '9647913611', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020013', 340, '02392', 340, '192000234020013', 'Suisa SKUS Ltd(192000234020013)', 'Ashwini Kumar Mahato', '', '0000-00-00', '', '', '', 0, '', '9734210636', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020015', 340, '02382', 340, '192000234020015', 'Metyal Sahar SKUS Ltd(192000234020015)', 'Bharamar Bawri', '', '0000-00-00', '', '', '', 0, '', '8972739824', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020016', 340, '02385', 340, '192000234020016', 'Barrah GP SKUS Ltd(192000234020016)', 'Ratan Banerjee', '', '0000-00-00', '', '', '', 0, '', '9732040584', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020018', 340, '02386', 340, '192000234020018', 'Fufundi SKUS Ltd(192000234020018)', 'Parimal Kisku', '', '0000-00-00', '', '', '', 0, '', '9382015250', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020019', 340, '02382', 340, '192000234020019', 'Babugram SKUS Ltd(192000234020019)', 'Manick Paramanik', '', '0000-00-00', '', '', '', 0, '', '8617539061', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020022', 340, '02380', 340, '192000234020022', 'Para GP SKUS Ltd(192000234020022)', 'Janaddan Ray', '', '0000-00-00', '', '', '', 0, '', '9932561649', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020023', 340, '02386', 340, '192000234020023', 'Amghata SKUS Ltd(192000234020023)', 'Ashimananda Mahato', '', '0000-00-00', '', '', '', 0, '', '9434346928', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020024', 340, '02395', 340, '192000234020024', 'Bamni Majhihira SKUS Ltd(192000234020024)', 'Sunil Kumar Majhi', '', '0000-00-00', '', '', '', 0, '', '8016290267', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020026', 340, '02395', 340, '192000234020026', 'Kuda GP SKUS Ltd(192000234020026)', 'Sandip kumar Mahato', '', '0000-00-00', '', '', '', 0, '', '9775727593', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020033', 340, '02378', 340, '192000234020033', 'Joypur SKUS Ltd(192000234020033)', 'Ayan Mukherjee', '', '0000-00-00', '', '', '', 0, '', '9732065432', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020035', 340, '02390', 340, '192000234020035', 'Mosina SKUS Ltd(192000234020035)', 'Dinesh Rajak', '', '0000-00-00', '', '', '', 0, '', '6294992290', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020036', 340, '02396', 340, '192000234020036', 'Ankro borokadam GP SKUS Ltd(192000234020036)', 'Tarapada Kumbhakar', '', '0000-00-00', '', '', '', 0, '', '8972134825', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020038', 340, '02381', 340, '192000234020038', 'Baba Tilka Murmu LAMS(192000234020038)', 'Popi Baske', '', '0000-00-00', '', '', '', 0, '', '6296048257', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020039', 340, '02388', 340, '192000234020039', 'Bansa GP SKUS Ltd(192000234020039)', 'Bholanath Mandi', '', '0000-00-00', '', '', '', 0, '', '9800316497', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020042', 340, '02392', 340, '192000234020042', 'Bagmundi UFSCS(192000234020042)', 'Muralidhar Kuiry', '', '0000-00-00', '', '', '', 0, '', '9641913491', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020046', 340, '02389', 340, '192000234020046', 'Hensla GP SKUS Ltd(192000234020046)', 'Vivekananda Mahato', '', '0000-00-00', '', '', '', 0, '', '8918922550', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020047', 340, '02386', 340, '192000234020047', 'Amlatora SKUS Ltd(192000234020047)', 'Basudev Mahato', '', '0000-00-00', '', '', '', 0, '', '9800474207', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234020048', 340, '02390', 340, '192000234020048', 'Illo Jargo GP SKUS Ltd(192000234020048)', 'Bibhas Nandi', '', '0000-00-00', '', '', '', 0, '', '9064221553', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234120001', 341, '02398', 341, '192000234120001', 'Udaynarayanpur Thana L S Pry Co-op Agril Marketing Society Ltd(192000234120001)', 'Mrinal Bhakta', '', '0000-00-00', '', '', '', 0, '', '9732946509', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234120002', 341, '02398', 341, '192000234120002', 'Deshbandhu SKUS Ltd(192000234120002)', 'Ashok Ghosh', '', '0000-00-00', '', '', '', 0, '', '9679839903', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234120003', 341, '02398', 341, '192000234120003', 'Dehibhursut SKUS Ltd(192000234120003)', 'Ujjal Mukherjee', '', '0000-00-00', '', '', '', 0, '', '9735575473', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234120004', 341, '02398', 341, '192000234120004', 'Pancharul SKUS Ltd(192000234120004)', 'Pratap Panja', '', '0000-00-00', '', '', '', 0, '', '9800335559', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234120005', 341, '02398', 341, '192000234120005', 'Singti Janakalyan SKUS Ltd(192000234120005)', 'Sital Mal', '', '0000-00-00', '', '', '', 0, '', '9734535013', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234120006', 341, '02401', 341, '192000234120006', 'Sabuj SKUS Ltd(192000234120006)', 'Dipak Kumar Bali', '', '0000-00-00', '', '', '', 0, '', '6291844362', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234120007', 341, '02402', 341, '192000234120007', 'Makardah Anchal SKUS Ltd(192000234120007)', 'Ramkamal Kundu', '', '0000-00-00', '', '', '', 0, '', '9239050745', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234320001', 343, '02436', 343, '192000234320001', 'HANARBATI SKUS LTD(192000234320001)', 'YUSUF BAIDYA', '', '0000-00-00', '', '', '', 0, '', '9836902713', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234320005', 343, '02435', 343, '192000234320005', 'RAMNAGAR HARISPUR KACHUKHALI SKUS LTD(192000234320005)', 'DEBABRATA RAPTAN', '', '0000-00-00', '', '', '', 0, '', '9775169755', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234320007', 343, '02418', 343, '192000234320007', 'Mousal Skus ltd', 'NA', 'Na', '2022-04-07', 'na', 'na', 'na', 1000, 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', NULL, NULL, NULL, NULL, '', '2022-04-07', NULL, NULL),
('192000234320009', 343, '02439', 343, '192000234320009', 'NAMKHANA L S PACS LTD(192000234320009)', 'TAPAN KUMAR DAS', '', '0000-00-00', '', '', '', 0, '', '7407325088', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234320010', 343, '02439', 343, '192000234320010', 'SHIBRAMPUR SKUS LTD(192000234320010)', 'BARID BARAN DAS', '', '0000-00-00', '', '', '', 0, '', '9800226787', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234320011', 343, '02439', 343, '192000234320011', 'BUDHAKHALI SKUS LTD(192000234320011)', 'ANATH DAS', '', '0000-00-00', '', '', '', 0, '', '9232891255', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234320012', 343, '02439', 343, '192000234320012', 'RAJNAGAR SKUS LTD(192000234320012)', 'TARAPADA MAITY', '', '0000-00-00', '', '', '', 0, '', '7908888754', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234320013', 343, '02439', 343, '192000234320013', 'GANESHNAGAR SRIDURGA SKUS LTD(192000234320013)', 'SUMAN JANA', '', '0000-00-00', '', '', '', 0, '', '9564093937', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234320014', 343, '02439', 343, '192000234320014', 'HARIPUR LAYALGANG SKUS LTD(192000234320014)', 'DEBDULAL PAKHIRA', '', '0000-00-00', '', '', '', 0, '', '9734838279', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234320015', 343, '02439', 343, '192000234320015', 'PATIBUNIA SKUS LTD(192000234320015)', 'NAKULESWAR JANA', '', '0000-00-00', '', '', '', 0, '', '9831148471', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234320018', 343, '02438', 343, '192000234320018', 'KRISHNA NAGAR SKUS LTD(192000234320018)', 'BHABESH CHANDRA MAITY', '', '0000-00-00', '', '', '', 0, '', '9883145844', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234320019', 343, '02440', 343, '192000234320019', 'L PLOT UPENDRANAGAR SKUS LTD(192000234320019)', 'PRABASH SASMAL', '', '0000-00-00', '', '', '', 0, '', '9064500424', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234320020', 343, '02439', 343, '192000234320020', 'NAMKHANA L/S PAMS ltd(192000234320020)', 'SUSHANTA MAITY', '', '0000-00-00', '', '', '', 0, '', '9836217080', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234320023', 343, '02440', 343, '192000234320023', 'DK GANGADHARPUR SKUS LTD(192000234320023)', 'BISWAJIT HALDER', '', '0000-00-00', '', '', '', 0, '', '8001013701', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234320025', 343, '02429', 343, '192000234320025', 'CHOUGHARI SKUS LTD(192000234320025)', 'DEB KUMAR MONDAL', '', '0000-00-00', '', '', '', 0, '', '9874031327', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234320026', 343, '02440', 343, '192000234320026', 'INDRAPUR SKUS LTD(192000234320026)', 'ASIS PRADHAN', '', '0000-00-00', '', '', '', 0, '', '9593893593', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234320027', 343, '02440', 343, '192000234320027', 'LAKSHMI JANARDANPUR ANCHALIK SKUS LTD(192000234320027)', 'BAPAN SASMAL', '', '0000-00-00', '', '', '', 0, '', '8348418325', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234320028', 343, '02429', 343, '192000234320028', 'SANGRAMI MOHILA CONSUMERS COOPERATIVE STORES LTD(192000234320028)', 'KALPANA PAIK', '', '0000-00-00', '', '', '', 0, '', '9836902713', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234320029', 343, '02424', 343, '192000234320029', 'PRAGATI SAMABAY KRISHI UNNAYAN SAMITY LIMITED(192000234320029)', 'BILASH KANJI', '', '0000-00-00', '', '', '', 0, '', '8420412322', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234320030', 343, '02439', 343, '192000234320030', 'DK CHANDRANAGAR SKUS LTD(192000234320030)', 'PARIMAL MAITY', '', '0000-00-00', '', '', '', 0, '', '8373070363', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234320032', 343, '02440', 343, '192000234320032', 'BARADAPUR SKUS LTD(192000234320032)', 'SOUVIK MAITY', '', '0000-00-00', '', '', '', 0, '', '9830991176', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420001', 344, '02450', 344, '192000234420001', 'KHUKURDAHA JAGANNATHPUR SKUS LTD(192000234420001)', 'PURANJAN KR RANA', '', '0000-00-00', '', '', '', 0, '', '8116465378', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420002', 344, '02460', 344, '192000234420002', 'MURKUNIA SKUS LTD(192000234420002)', 'PROSENJIT GHOSH', '', '0000-00-00', '', '', '', 0, '', '8918685234', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420004', 344, '02461', 344, '192000234420004', 'CHAKKESI SKUS LTD(192000234420004)', 'NITAI GHOSH', '', '0000-00-00', '', '', '', 0, '', '9735787658', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420006', 344, '02451', 344, '192000234420006', 'GHOSHPUR SKUS LTD(192000234420006)', 'Chittaranjan Karak', '', '0000-00-00', '', '', '', 0, '', '6294834419', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420010', 344, '02446', 344, '192000234420010', 'HAIMANTAPUR BARA SKUS LTD(192000234420010)', 'Barun Roy', '', '0000-00-00', '', '', '', 0, '', '9647088829', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420011', 344, '02468', 344, '192000234420011', 'RAMESHWAR SKUS LTD(192000234420011)', 'Samir Ghorai', '', '0000-00-00', '', '', '', 0, '', '8145465346', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420012', 344, '02468', 344, '192000234420012', 'TURKA SKUS LTD(192000234420012)', 'Sujit Singha', '', '0000-00-00', '', '', '', 0, '', '9800365129', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420013', 344, '02460', 344, '192000234420013', 'JETHIA SKUS LTD(192000234420013)', 'Sanjoy Paul', '', '0000-00-00', '', '', '', 0, '', '9679615127', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420014', 344, '02465', 344, '192000234420014', 'NARMA SKUS LTD(192000234420014)', 'Asish hazra', '', '0000-00-00', '', '', '', 0, '', '6294354776', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420016', 344, '02453', 344, '192000234420016', 'AJODHYANAGAR BANPURA SKUS LTD(192000234420016)', 'Susovan Pal', '', '0000-00-00', '', '', '', 0, '', '9064383384', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420017', 344, '02450', 344, '192000234420017', 'PALASHPAI JOTEKESHAB SKUS LTD(192000234420017)', 'Saroj Sengupta', '', '0000-00-00', '', '', '', 0, '', '8967786811', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420018', 344, '02447', 344, '192000234420018', 'KRISHNAPUR DUBRAJGANJ SKUS LTD(192000234420018)', 'Asif Iqbal Sarkar', '', '0000-00-00', '', '', '', 0, '', '9932636112', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420021', 344, '02445', 344, '192000234420021', 'KADAMBANDI SKUS LTD(192000234420021)', 'Asish Sarker', '', '0000-00-00', '', '', '', 0, '', '9775176868', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420022', 344, '02444', 344, '192000234420022', 'RAJBALLAVPUR SKUS LTD(192000234420022)', 'Hari Sadhan Pal', '', '0000-00-00', '', '', '', 0, '', '9732827483', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420023', 344, '02444', 344, '192000234420023', 'AGRA SKUS LTD(192000234420023)', 'Partha Bhattacharya', '', '0000-00-00', '', '', '', 0, '', '8617837296', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420024', 344, '02468', 344, '192000234420024', 'EKARUKHI SKUS LTD(192000234420024)', 'Kanai Lal Das', '', '0000-00-00', '', '', '', 0, '', '9679876490', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420027', 344, '02467', 344, '192000234420027', 'VIVEKANANDA SKUS LTD(192000234420027)', 'Jhantu Nayek', '', '0000-00-00', '', '', '', 0, '', '9932279332', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420028', 344, '02468', 344, '192000234420028', 'NANDAKURIA SKUS LTD(192000234420028)', 'fFALGUNI ADAK', '', '0000-00-00', '', '', '', 0, '', '8167630146', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420030', 344, '02464', 344, '192000234420030', 'BARCHARA SKUS LTD(192000234420030)', 'Ashok Majhi', '', '0000-00-00', '', '', '', 0, '', '9635213167', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420031', 344, '02451', 344, '192000234420031', 'PURUNBERIA SKUS LTD(192000234420031)', 'Gobinda Charan Sau', '', '0000-00-00', '', '', '', 0, '', '8637542488', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420034', 344, '02446', 344, '192000234420034', 'VIDYASAGAR SKUS LTD(192000234420034)', 'Amit Chakraborty', '', '0000-00-00', '', '', '', 0, '', '9647926272', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420035', 344, '02469', 344, '192000234420035', 'GBS SKUS LTD(192000234420035)', 'Prakash Maiti', '', '0000-00-00', '', '', '', 0, '', '9933690076', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420036', 344, '02449', 344, '192000234420036', 'MEHENATI KISSAN SKUS LTD(192000234420036)', 'Abhiram Jana', '', '0000-00-00', '', '', '', 0, '', '8670900889', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420037', 344, '02467', 344, '192000234420037', 'DAKSHIN PATNA SKUS LTD(192000234420037)', 'SUBRATA JANA', '', '0000-00-00', '', '', '', 0, '', '9775219130', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420038', 344, '02443', 344, '192000234420038', 'SIRISBONI SKUS LTD(192000234420038)', 'Kanchanmay Ghosh', '', '0000-00-00', '', '', '', 0, '', '8116861365', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420039', 344, '02448', 344, '192000234420039', 'DOTIKRI RAGHUNATHPUR SKUS LTD(192000234420039)', 'Lutfar Rahaman Molla', '', '0000-00-00', '', '', '', 0, '', '9932636112', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234420041', 344, '02449', 344, '192000234420041', 'NIJAMPUR SAIYEDKARIM SKUS LTD(192000234420041)', 'Krishnendu Samanta', '', '0000-00-00', '', '', '', 0, '', '7407271215', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234520001', 345, '02474', 345, '192000234520001', 'BYABATTARHAT CACS LTD(192000234520001)', 'BIRBHADRA SAMANTA', '', '0000-00-00', '', '', '', 0, '', '8670268679', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234520002', 345, '02474', 345, '192000234520002', 'BETKALLA MAHASAKTI SKUS(192000234520002)', 'LAKSHMI KANTA RAY', '', '0000-00-00', '', '', '', 0, '', '7719375001', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234520003', 345, '02479', 345, '192000234520003', 'PANCHHARI SKUS(192000234520003)', 'SHYAMAPADA BHUNIA', '', '0000-00-00', '', '', '', 0, '', '9732504194', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234520004', 345, '02479', 345, '192000234520004', 'UTTAR PATHARBERIA SKUS(192000234520004)', 'PARTHA SARATHI MONDAL', '', '0000-00-00', '', '', '', 0, '', '9775080540', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234520007', 345, '02475', 345, '192000234520007', 'JAGATPUR SITALA SKUS(192000234520007)', 'SUKUMAR SINGHA', '', '0000-00-00', '', '', '', 0, '', '8436126975', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234520008', 345, '02471', 345, '192000234520008', 'KSHETRAHAT SKUS LTD(192000234520008)', 'MONTU MOHAN NAYAK', '', '0000-00-00', '', '', '', 0, '', '9564443749', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234520018', 345, '02488', 345, '192000234520018', 'BADALPUR SKUS LTD(192000234520018)', 'ANUP PANDA', '', '0000-00-00', '', '', '', 0, '', '9732553956', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234520020', 345, '02490', 345, '192000234520020', 'KUMIRDA SKUS LTD(192000234520020)', 'LALMOHAN DWIBEDI', '', '0000-00-00', '', '', '', 0, '', '9732805929', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234520023', 345, '02490', 345, '192000234520023', 'JAMUASANKARPUR SKUS LTD(192000234520023)', 'SANKAR PARIA', '', '0000-00-00', '', '', '', 0, '', '9734631133', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234520034', 345, '02485', 345, '192000234520034', 'RAMCHAK GOPALCHAK SKUS(192000234520034)', 'MADAN MOHAN BERA', '', '0000-00-00', '', '', '', 0, '', '9734631133', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234520036', 345, '02479', 345, '192000234520036', 'BAMANBARH SUSANTA SKUS LTD(192000234520036)', 'BISWAJIT SAMANTA', '', '0000-00-00', '', '', '', 0, '', '9733400733', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234520042', 345, '02492', 345, '192000234520042', 'SAHAPUR SKUS LTD(192000234520042)', 'DILIP PRAMANIK', '', '0000-00-00', '', '', '', 0, '', '9933967317', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234520043', 345, '02479', 345, '192000234520043', 'BAMUNIA GS SKUS LTD(192000234520043)', 'SUKDEV DAS', '', '0000-00-00', '', '', '', 0, '', '9734111421', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234520053', 345, '02491', 345, '192000234520053', 'ALUYA SKUS LTD(192000234520053)', 'BRINDABAN DAS', '', '0000-00-00', '', '', '', 0, '', '9046813381', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234520056', 345, '02488', 345, '192000234520056', 'DK EKTARPUR SKUS LTD(192000234520056)', 'BHABASANKAR DAS', '', '0000-00-00', '', '', '', 0, '', '7908788052', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234520064', 345, '02471', 345, '192000234520064', 'DEHATI DHULIARA GOPALNAGAR SKUS LTD(192000234520064)', 'SUDIP KUMAR KARAN', '', '0000-00-00', '', '', '', 0, '', '9733659246', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234520066', 345, '02493', 345, '192000234520066', 'JHAUGERIA P M PUR SKUS LTD(192000234520066)', 'SUJIT KAR', '', '0000-00-00', '', '', '', 0, '', '9434300400', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234520067', 345, '02486', 345, '192000234520067', 'LAKSHI SKUS LTD(192000234520067)', 'TAPAS DAS', '', '0000-00-00', '', '', '', 0, '', '9002292079', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234520068', 345, '02493', 345, '192000234520068', 'DAHADAYA SKUS LTD(192000234520068)', 'NIRMALYA DE', '', '0000-00-00', '', '', '', 0, '', '9732899885', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234620001', 346, '02174', 346, '192000234620001', 'BHATIBARI SKUS LTD.(192000234620001)', 'Salil Sarkar', '', '0000-00-00', '', '', '', 0, '', '9800178605', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234620003', 346, '02173', 346, '192000234620003', 'PARARPAR SKUS LTD.(192000234620003)', 'Dipankar Roy', '', '0000-00-00', '', '', '', 0, '', '9775116083', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234620005', 346, '02174', 346, '192000234620005', 'BAROCHOUKI SKUS LTD(192000234620005)', 'Biswajit Roy', '', '0000-00-00', '', '', '', 0, '', '9733196129', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234620006', 346, '02173', 346, '192000234620006', 'GHAGRA SKUS LTD(192000234620006)', 'Prasenjit Roy', '', '0000-00-00', '', '', '', 0, '', '8388964332', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234620008', 346, '02175', 346, '192000234620008', 'ALINAGAR SKUS LTD(192000234620008)', 'Niren Chandra Barman', '', '0000-00-00', '', '', '', 0, '', '9734147459', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234620009', 346, '02175', 346, '192000234620009', 'KHAGENHAT SKUS LTD.(192000234620009)', 'Dilip kumar Roy', '', '0000-00-00', '', '', '', 0, '', '9064969892', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234620010', 346, '02175', 346, '192000234620010', 'PROMODE NAGAR SKUS LTD.(192000234620010)', 'Paresh Chandra roy', '', '0000-00-00', '', '', '', 0, '', '8509343408', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234620011', 346, '02175', 346, '192000234620011', 'Malsagaon Guabarnagar SKUS LTD.(192000234620011)', 'Bimal Chandra Roy', '', '0000-00-00', '', '', '', 0, '', '9593218021', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234620012', 346, '02175', 346, '192000234620012', 'NEW JATESWAR SKUS LTD.(192000234620012)', 'Debabrata Saha', '', '0000-00-00', '', '', '', 0, '', '9734040304', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234820004', 348, '02441', 348, '192000234820004', 'SARPURA RAJPARA SKUS LTD (192000234820004)', 'Baidyanath Karan', '', '0000-00-00', '', '', '', 0, '', '9775437541', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000234820005', 348, '02442', 348, '192000234820005', 'MOULARA SKUS LTD(192000234820005)', 'Ranjit Ghosh', '', '0000-00-00', '', '', '', 0, '', '7908465295', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000333420008', 334, '02260', 334, '192000333420008', 'DESHALPUR SKUS LTD(192000333420008)', 'Prashanta Kundu', '', '0000-00-00', '', '', '', 0, '', '8926903996', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000333420011', 334, '02253', 334, '192000333420011', 'RAMPURHAT L/S MULTIPURPOSE COOP SOCIETY LTD(192000333420011)', 'MRINAL HANSDA', '', '0000-00-00', '', '', '', 0, '', '8617436439', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000333820004', 338, '02338', 338, '192000333820004', 'JOYKRISHNAPUR SKUS LTD(192000333820004)', 'PINTU MAUR', '', '0000-00-00', '', '', '', 0, '', '9734021878', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000333820010', 338, '02339', 338, '192000333820010', 'Kamarpukur-I SKUS Ltd(192000333820010)', 'Radha Krishna Mondal', '', '0000-00-00', '', '', '', 0, '', '9382915316', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000334520002', 345, '02488', 345, '192000334520002', 'Baliarpur SKUS Ltd(192000334520002)', 'Chandan Mondal', '', '0000-00-00', '', '', '', 0, '', '6294758734', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000433320005', 333, '02230', 333, '192000433320005', 'BAHALNAGAR SKUS LTD(192000433320005)', 'RUHUL AMIN', '', '0000-00-00', '', '', '', 0, '', '8637534158', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000632720002', 327, '02164', 327, '192000632720002', 'BIDHANNAGAR SAMABAY KRISHIJA BIPANAN SAMITY LTD.(192000632720002)', 'ANIL CHANDRA SARKAR', '', '0000-00-00', '', '', '', 0, '', '9932236632', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000632820002', 328, '02177', 328, '192000632820002', 'SUTARERBARI DANGAPARA S. K. U. S. LTD.(192000632820002)', 'SAFIQUL ISLAM', '', '0000-00-00', '', '', '', 0, '', '9002203754', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000632820003', 328, '02178', 328, '192000632820003', 'NAKPARA SKUS LIMITED(192000632820003)', 'BHUPENDRA NATH ROY', '', '0000-00-00', '', '', '', 0, '', '9932883542', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633020001', 330, '02199', 330, '192000633020001', 'PARA O PARERGRAM SKUS LTD(192000633020001)', 'ABUL SARKAR', '', '0000-00-00', '', '', '', 0, '', '9635759830', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633020002', 330, '02194', 330, '192000633020002', 'SAHAPUR II BAKADUMURIA SKUS LTD(192000633020002)', 'MD AKIL', '', '0000-00-00', '', '', '', 0, '', '7479204323', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633020008', 330, '02196', 330, '192000633020008', 'BAHIN PASCHIM ANCHAL SKUS LTD(192000633020008)', 'PRABHAS SARKAR', '', '0000-00-00', '', '', '', 0, '', '9933131157', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633020013', 330, '02199', 330, '192000633020013', 'SONAR BANGLA AGRICULTURE PARISEBA SAMABAY SAMITY LIMITED(192000633020013)', 'SANTA KUNDU', '', '0000-00-00', '', '', '', 0, '', '9851855155', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633020015', 330, '02199', 330, '192000633020015', 'KAMARDANGA KRISHI UNNAYAN SAMITY LIMITED(192000633020015)', 'MOHIDUR RAHAMAN', '', '0000-00-00', '', '', '', 0, '', '7908014041', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633020016', 330, '02194', 330, '192000633020016', 'HATWAR SAMABAY KRISHI UNNYAN SAMITY LTD(192000633020016)', 'MD ZAVEED AKHTER', '', '0000-00-00', '', '', '', 0, '', '9933747418', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633020017', 330, '02192', 330, '192000633020017', 'AMALJHARI O DARIVIR SKUS LTD(192000633020017)', 'Md Nishar Ali', '', '0000-00-00', '', '', '', 0, '', '9832379079', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633120010', 331, '02203', 331, '192000633120010', 'BINSHIRA SKUS LTD.(192000633120010)', 'BINAY MONDAL', '', '0000-00-00', '', '', '', 0, '', '7797068917', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633120011', 331, '02205', 331, '192000633120011', 'MALANCHA SAMABAY KRISHI UNNAYAN SAMITY LTD(192000633120011)', 'SUDARSHAN PRAMANIK', '', '0000-00-00', '', '', '', 0, '', '9547705266', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633120020', 331, '02201', 331, '192000633120020', 'MOSTAFAPUR SKUS LTD(192000633120020)', 'MAHASIN ALI MIAH', '', '0000-00-00', '', '', '', 0, '', '9593237133', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633120022', 331, '02201', 331, '192000633120022', 'BHADRA SKUS LTD(192000633120022)', 'PAIGAM ALI', '', '0000-00-00', '', '', '', 0, '', '9733346365', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633420020', 334, '02261', 334, '192000633420020', 'DERPUR SAMABAY KRISHI UNNAYAN SAMITY LIMITED(192000633420020)', 'LALTU GHOSH', '', '0000-00-00', '', '', '', 0, '', '9734238535', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633420033', 334, '02263', 334, '192000633420033', 'DEBAGRAM SKUS LIMITED(192000633420033)', 'Malay Kr Ghosh', '', '0000-00-00', '', '', '', 0, '', '6295133669', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633420034', 334, '02261', 334, '192000633420034', 'MAJHIGRAM MADANPUR S.S.S. LTD.(192000633420034)', 'SRIJIB MONDAL', '', '0000-00-00', '', '', '', 0, '', '9593467892', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633520005', 335, '02297', 335, '192000633520005', 'GOPALPUR S.K.U.S LTD(192000633520005)', 'NA', 'NA', '2021-11-16', 'NA', 'NA', 'NA', 0, 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'SCMFBWN004, 16/11/2021', 'synergic', '2022-05-09', 'NA', '2022-05-09'),
('192000633520016', 335, '02277', 335, '192000633520016', 'DIGHA GOBINDAPUR SKUS LTD (192000633520016)', 'NA', 'NA', '2021-12-03', 'NA', 'NA', 'NA', 0, 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'SCMFBWN018, 03/12/2021', 'synergic', '2022-04-22', 'NA', '2022-04-22'),
('192000633520022', 335, '02286', 335, '192000633520022', 'ARUAR ANCHALIK S.K.U.S LTD(192000633520022)', 'NA', 'NA', '2021-11-16', 'NA', 'NA', 'NA', 0, 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'SCMFBWN002, 16/11/2021', 'synergic', '2022-04-28', 'NA', '2022-04-28'),
('192000633520027', 335, '02281', 335, '192000633520027', 'TRIPALLY SEVA SAMABAY SAMITY LTD(192000633520027)', 'NA', 'NA', '2021-11-16', 'NA', 'NA', 'NA', 0, 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'SCMFBWN003, 16/11/2021', 'synergic', '2022-05-18', 'NA', '2022-05-18');
INSERT INTO `md_society` (`sl_no`, `dist`, `block`, `branch_id`, `society_code`, `soc_name`, `inchargename`, `reg_no`, `reg_date`, `tan`, `police_station`, `post_office`, `pin`, `soc_addr`, `ph_no`, `email`, `bank_name`, `branch_name`, `acc_type`, `acc_no`, `ifsc_code`, `pan_no`, `gst_no`, `guide_lines_id`, `agreementno`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
('192000633520050', 335, '02277', 335, '192000633520050', 'DIGNAGAR SKUS LTD(192000633520050)', 'NA', 'NA', '2021-12-09', 'NA', 'NA', 'NA', 0, 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'SCMFBWN022, 09/12/2021', 'synergic', '2022-04-24', 'NA', '2022-04-24'),
('192000633520058', 335, '02288', 335, '192000633520058', 'BAKTA MALLIKPUR SKUS LTD(192000633520058)', 'NA', 'NA', '2021-11-22', 'NA', 'NA', 'NA', 0, 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'SCMFBWN007, 22/11/2021', 'synergic', '2022-05-01', 'NA', '2022-05-01'),
('192000633620003', 336, '02313', 336, '192000633620003', 'MATIKUMRA KUTIRPARA S K U S LIMITED(192000633620003)', 'NARAYAN CHANDRA BISWAS', '', '0000-00-00', '', '', '', 0, '', '9333071870', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633620022', 336, '02312', 336, '192000633620022', 'KALINARAYANPUR S.K.U.S LTD(192000633620022)', 'SUJIT DEBNATH', '', '0000-00-00', '', '', '', 0, '', '7432910822', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633620033', 336, '02315', 336, '192000633620033', 'TRIGRAM SKUS LTD(192000633620033)', 'Asim Ghosh', '', '0000-00-00', '', '', '', 0, '', '9734870171', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633620037', 336, '02315', 336, '192000633620037', 'MALIDANGA SKUS LTD(192000633620037)', 'Lutfar Rahaman', '', '0000-00-00', '', '', '', 0, '', '9775953104', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633720005', 337, '02318', 337, '192000633720005', 'GAIGHATA C.A.D.P F.S.C.S LTD(192000633720005)', 'RAMPRASAD BISWAS', '', '0000-00-00', '', '', '', 0, '', '9330900875', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633720030', 337, '02322', 337, '192000633720030', 'AGROGAMI S.K.U.S.LTD.(192000633720030)', 'MD.MOMINUR RAHAMAN', '', '0000-00-00', '', '', '', 0, '', '7407800111', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633720059', 337, '02316', 337, '192000633720059', 'CHUADANGA SKUS LTD(192000633720059)', 'AJIT GHOSH', '', '0000-00-00', '', '', '', 0, '', '7003464437', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633720060', 337, '02318', 337, '192000633720060', 'JADABPURSAMABAY KRISHI UNNAY SAMITY LTD.(192000633720060)', 'BISHNAPADA MONDAL', '', '0000-00-00', '', '', '', 0, '', '8250618369', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633920016', 339, '02360', 339, '192000633920016', 'SATAMI GRAMSOVA SAMABAY KRISHI UNNAYAN SAMITY LIMI(192000633920016)', 'BABAN BHADRA', '', '0000-00-00', '', '', '', 0, '', '7550897272', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633920020', 339, '02367', 339, '192000633920020', 'SANTRA TENTULMURI SKUS LTD.(192000633920020)', 'SADANANDA DEY 8967641685', '', '0000-00-00', '', '', '', 0, '', '8967641685', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633920026', 339, '02367', 339, '192000633920026', 'PANUA SKUS LTD.(192000633920026)', 'SK FIROZ', '', '0000-00-00', '', '', '', 0, '', '9382592883', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000633920027', 339, '02365', 339, '192000633920027', 'NARICHA S.K.U.S LTD(192000633920027)', 'DURGAPADA NAYEK', '', '0000-00-00', '', '', '', 0, '', '9733165361', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000634020009', 340, '02383', 340, '192000634020009', 'NETURIA LAMPS LIMITED(192000634020009)', 'SHIBARAM MURMU', '', '0000-00-00', '', '', '', 0, '', '7384630717', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000634020011', 340, '02385', 340, '192000634020011', 'RANGAMATI RANJANDIH GP SKUS LTD(192000634020011)', 'SUPRIYA DUBE', '', '0000-00-00', '', '', '', 0, '', '8918971920', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000634520033', 345, '02492', 345, '192000634520033', 'SHYAMPUR SKUS LTD(192000634520033)', 'ARUP MAL', '', '0000-00-00', '', '', '', 0, '', '8346905185', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000634620009', 346, '02174', 346, '192000634620009', 'BAKLA MAHAKALGURI S.K.U.S LTD(192000634620009)', 'Ajay Debnath', '', '0000-00-00', '', '', '', 0, '', '9749891688', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('192000634620010', 346, '02174', 346, '192000634620010', 'PASCHIM CHEPANI SKUS LTD(192000634620010)', 'BAPI NANDI', '', '0000-00-00', '', '', '', 0, '', '9002536644', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100232820001', 328, '02166', 328, '202100232820001', 'SARDARPARA SERVICE CO-OPERATIVE SOCIETY LTD(202100232820001)', 'MD ASHARAFUL ALAM', '', '0000-00-00', '', '', '', 0, '', '9734735783', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100232820002', 328, '02178', 328, '202100232820002', 'ROYAL SERVICE COOPERATIVE SOCIETY LTD(202100232820002)', 'HARIKANTA ROY', '', '0000-00-00', '', '', '', 0, '', '9933450260', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100232820003', 328, '02177', 328, '202100232820003', 'NABADAY PSS LTD(202100232820003)', 'AYAN DAKSHI', '', '0000-00-00', '', '', '', 0, '', '7602250603', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100232820004', 328, '02177', 328, '202100232820004', 'DAKSHIN BARAGILA SKUS LTD(202100232820004)', 'SAFIQUL ISLAM', '', '0000-00-00', '', '', '', 0, '', '9475250668', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100232820005', 328, '02178', 328, '202100232820005', 'MAHAKAL SERVICE CO-OPERATIVE SOCIETY LTD(202100232820005)', 'SANJOY MUKHERJEE', '', '0000-00-00', '', '', '', 0, '', '9733415693', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100232820006', 328, '02178', 328, '202100232820006', 'NITYANANDA NAGAR SKUS LTD(202100232820006)', 'AKHIL CH. ROY', '', '0000-00-00', '', '', '', 0, '', '9733343177', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100232820007', 328, '02177', 328, '202100232820007', 'MAYNAGURI ROAD SERVICE CO-OPERATIVE SOCIETY LTD(202100232820007)', 'RATAN MALLIK', '', '0000-00-00', '', '', '', 0, '', '9932056412', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100232820008', 328, '02177', 328, '202100232820008', 'BHUSKADANGA SKUS LTD(202100232820008)', 'UTTAM ROY', '', '0000-00-00', '', '', '', 0, '', '6294577497', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100232920001', 329, '02188', 329, '202100232920001', 'KHARIJA BANIADAHA SKUS LTD(202100232920001)', 'KRISHNA CH. SEN', '', '0000-00-00', '', '', '', 0, '', '8670754230', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233020003', 330, '02192', 330, '202100233020003', 'BASUNDHARA AGRICULTURAL MULTIPURPOSE CO-OPERATIVE SOCIETY LTD(202100233020003)', 'BHARGAB TALAPATRA', '', '0000-00-00', '', '', '', 0, '', '8617014851', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233020005', 330, '02192', 330, '202100233020005', 'BHUJAGAON O PATAGORA SKUS LTD(202100233020005)', 'MD HABIB ALAM', '', '0000-00-00', '', '', '', 0, '', '8777898934', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233020006', 330, '02198', 330, '202100233020006', 'BARUNA GP SKUS LTD(202100233020006)', 'JALADHAR CH ROY', '', '0000-00-00', '', '', '', 0, '', '9733285250', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233020009', 330, '02198', 330, '202100233020009', 'BHUINHARA GRAM SEVA SAMABAY KRISHI UNNAYAN SAMITY LIMITED(202100233020009)', 'PROKASH CHANDRA DEBSHARMA', '', '0000-00-00', '', '', '', 0, '', '8436353834', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233020010', 330, '02196', 330, '202100233020010', 'SONAR BANGLA AGRIL PRODUCT MULTIPURPOSE CO OPERATIVE SOCIETY LTD(202100233020010)', 'SWAPAN DEB BARMAN', '', '0000-00-00', '', '', '', 0, '', '6297025354', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233120002', 331, '02204', 331, '202100233120002', 'NOKSHA SKUS LTD(202100233120002)', 'MANIK DEBNATH', '', '0000-00-00', '', '', '', 0, '', '6297018399', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233220001', 332, '02214', 332, '202100233220001', 'Sekhpara Manikore SKUS Ltd(202100233220001)', 'Javed Ahamed', '', '0000-00-00', '', '', '', 0, '', '9800829698', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233220002', 332, '02215', 332, '202100233220002', 'Bamangola L/S Co - op Agricultural Marketing Society Ltd(202100233220002)', 'Tanmoy Bhattacharjee', '', '0000-00-00', '', '', '', 0, '', '9832648999', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233220004', 332, '02214', 332, '202100233220004', 'Kadubari SKUS Ltd(202100233220004)', 'Subodh Pal', '', '0000-00-00', '', '', '', 0, '', '9593674857', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233320002', 333, '02238', 333, '202100233320002', 'NAGARA SKUS LTD(202100233320002)', 'RATHIN MONNDAL', '', '0000-00-00', '', '', '', 0, '', '9593097642', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233320005', 333, '02235', 333, '202100233320005', 'DAKSHINNAGAR ADARSHA KRETA SAMABAY SAMITY LTD(202100233320005)', 'RAKIBUL ISLAM', '', '0000-00-00', '', '', '', 0, '', '7797583423', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233320012', 333, '02245', 333, '202100233320012', 'ANDULBERIYA MOUZA SKUS LTD(202100233320012)', 'PROMATHA SARKAR', '', '0000-00-00', '', '', '', 0, '', '6296191580', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233420001', 334, '02261', 334, '202100233420001', 'Bhromorkol SKUS Ltd(202100233420001)', 'Parimal Banerjee', '', '0000-00-00', '', '', '', 0, '', '9832418119', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233420002', 334, '02251', 334, '202100233420002', 'Sultanpur SKUS Ltd(202100233420002)', 'Santosh Mal', '', '0000-00-00', '', '', '', 0, '', '8372064729', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233420003', 334, '02250', 334, '202100233420003', 'Bonha SKUS Ltd(202100233420003)', 'Kudrat Ali', '', '0000-00-00', '', '', '', 0, '', '9476144638', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233420006', 334, '02266', 334, '202100233420006', 'Purbadubrajpur SKUS Ltd(202100233420006)', 'Baidyanath Sengupta', '', '0000-00-00', '', '', '', 0, '', '7001514545', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233420007', 334, '02266', 334, '202100233420007', 'Sija SKUS Ltd(202100233420007)', 'Faizur Rahaman', '', '0000-00-00', '', '', '', 0, '', '9732069590', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233420008', 334, '02263', 334, '202100233420008', 'Nanoor Thana CAMS Ltd(202100233420008)', 'Kh Enayet Ali', '', '0000-00-00', '', '', '', 0, '', '9732092272', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233420009', 334, '02255', 334, '202100233420009', 'Bajitpur SKUS Ltd(202100233420009)', 'Pratap Roy', '', '0000-00-00', '', '', '', 0, '', '6297792563', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233520003', 335, '02290', 335, '202100233520003', 'BRAHMANPARA SKUS LTD(202100233520003)', 'NA', 'NA', '2021-11-29', 'NA', 'NA', 'NA', 0, 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'SCMFBWN015, 29/11/2021', 'synergic', '2022-04-27', 'NA', '2022-04-27'),
('202100233520005', 335, '02277', 335, '202100233520005', 'SILUT BABURBANDH SKUS LTD(202100233520005)', 'HARADHAN KONER', '', '0000-00-00', '', '', '', 0, '', '9732094802', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233620001', 336, '02307', 336, '202100233620001', 'Majdia SKUS Ltd(202100233620001)', 'MANAS KR MONDAL', '', '0000-00-00', '', '', '', 0, '', '9432426786', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233620002', 336, '02308', 336, '202100233620002', 'Jatrapur SKUS Ltd KRISHNAGAR -1(202100233620002)', 'Abbasali Sekh', '', '0000-00-00', '', '', '', 0, '', '9800853366', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233620003', 336, '02306', 336, '202100233620003', 'Panditpur SKUS Ltd(202100233620003)', 'KHOKAN CHANDRA GHOSH', '', '0000-00-00', '', '', '', 0, '', '9434112078', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233720002', 337, '02317', 337, '202100233720002', 'PALLA SKUS LTD(202100233720002)', 'TAPAN SARKAR', '', '0000-00-00', '', '', '', 0, '', '9932460669', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233820003', 338, '02341', 338, '202100233820003', 'RASULPUR ALATI S K U S LTD(202100233820003)', 'PAMPA GUCHHAIT', '', '0000-00-00', '', '', '', 0, '', '9830141065', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233820004', 338, '02338', 338, '202100233820004', 'BAJUA SKUS LTD(202100233820004)', 'SONJOY MUKHERJEE', '', '0000-00-00', '', '', '', 0, '', '9002007784', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233820005', 338, '02349', 338, '202100233820005', 'NOAPARA SKUS LTD(202100233820005)', 'BISWAJIT BAKSHI', '', '0000-00-00', '', '', '', 0, '', '9088723103', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233820006', 338, '02353', 338, '202100233820006', 'BORHAL SKUS LTD(202100233820006)', 'ALTAF ALI MULLICK', '', '0000-00-00', '', '', '', 0, '', '9733664221', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233920001', 339, '02365', 339, '202100233920001', 'KUSHMURI SKUS LTD(202100233920001)', 'MAHIDUL ISLAM', '', '0000-00-00', '', '', '', 0, '', '9564068060', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233920004', 339, '02377', 339, '202100233920004', 'NUTANDIHI SKUS LTD(202100233920004)', 'PURNACHANDRA MAHATA', '', '0000-00-00', '', '', '', 0, '', '8972180347', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233920005', 339, '02368', 339, '202100233920005', 'JAGANNATHPUR A SKUS LTD(202100233920005)', 'UDAY MIDYA', '', '0000-00-00', '', '', '', 0, '', '8001517856', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233920006', 339, '02367', 339, '202100233920006', 'HAZRAPUKUR SKUS LTD(202100233920006)', 'SK BAPAN ALI', '', '0000-00-00', '', '', '', 0, '', '9064392300', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233920007', 339, '02376', 339, '202100233920007', 'MANDALKULI AAGSSB AND KRS LTD(202100233920007)', 'PASUPATI MUDI', '', '0000-00-00', '', '', '', 0, '', '9564229506', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233920009', 339, '02367', 339, '202100233920009', 'SIHAR LAEGE SIZED PRIMARY CO-OPERATIVE AGRICULTURAL CREDIT SOCIETY LTD(202100233920009)', 'PRASANTA KOLEY', '', '0000-00-00', '', '', '', 0, '', '9800004842', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233920011', 339, '02362', 339, '202100233920011', 'KHIRAIJURI MALINDASI SKUS LTD(202100233920011)', 'Rajendra Chatterjee', '', '0000-00-00', '', '', '', 0, '', '9002894002', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100233920014', 339, '02367', 339, '202100233920014', 'KOTULPUR FSCS LTD(202100233920014)', 'BABLU RUIDAS', '', '0000-00-00', '', '', '', 0, '', '8016444646', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234020001', 340, '02395', 340, '202100234020001', 'Jobla SKUS Ltd(202100234020001)', 'Sadhu Charan Mahato', '', '0000-00-00', '', '', '', 0, '', '9679819450', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234020005', 340, '02392', 340, '202100234020005', 'Patahensal GP SKUS Ltd(202100234020005)', 'Laldhari Sao', '', '0000-00-00', '', '', '', 0, '', '8372930646', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234020006', 340, '02390', 340, '202100234020006', 'Tulin GP SKUS Ltd(202100234020006)', 'Ramnath Mahato', '', '0000-00-00', '', '', '', 0, '', '8016056726', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234120001', 341, '02398', 341, '202100234120001', 'KANSONA SKUS Ltd(202100234120001)', 'JAYANTA KUMAR MODAK', '', '0000-00-00', '', '', '', 0, '', '9775074783', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234320001', 343, '02423', 343, '202100234320001', 'KULDIA SKUS LTD(202100234320001)', 'DIPANKAR MONDAL', '', '0000-00-00', '', '', '', 0, '', '9874031327', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234320002', 343, '02435', 343, '202100234320002', 'DAYAPUR SKUS LTD(202100234320002)', 'SUBIR MONDAL', '', '0000-00-00', '', '', '', 0, '', '6294371481', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234320003', 343, '02440', 343, '202100234320003', 'BANASHYAMNAGAR SKUS LTD(202100234320003)', 'TAPAN MAITY', '', '0000-00-00', '', '', '', 0, '', '9832509954', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234320004', 343, '02440', 343, '202100234320004', 'PATHAR PRATIMA BAZAR SMALL ENTREPRENEURS COOPERATIVE CREDIT SOCIETY LIMITED(202100234320004)', 'TAPAN GOL', '', '0000-00-00', '', '', '', 0, '', '8013106621', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234320005', 343, '02439', 343, '202100234320005', 'DK DURGAPUR RADHANAGAR SKUS LTD(202100234320005)', 'ASHOK SAMANTA', '', '0000-00-00', '', '', '', 0, '', '8240208500', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234420001', 344, '02446', 344, '202100234420001', 'JARA SKUS LTD(202100234420001)', 'SUDIP KHANRA', '', '0000-00-00', '', '', '', 0, '', '9734700757', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234420002', 344, '02452', 344, '202100234420002', 'BURIPALA SKUS LTD(202100234420002)', 'TANMOY GHOSH', '', '0000-00-00', '', '', '', 0, '', '8116974513', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234420005', 344, '02450', 344, '202100234420005', 'GOURA SONAMUI SKUS LTD(202100234420005)', 'SAIKAT JANA', '', '0000-00-00', '', '', '', 0, '', '8001268885', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234420006', 344, '02465', 344, '202100234420006', 'ASTIPATNA SKUS LTD(202100234420006)', 'RANJAN JANA', '', '0000-00-00', '', '', '', 0, '', '9064848612', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234420007', 344, '02446', 344, '202100234420007', 'AMDAN DEOPUR SKUS LTD(202100234420007)', 'HARI SADHAN GHOSH', '', '0000-00-00', '', '', '', 0, '', '9732094210', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234420008', 344, '02453', 344, '202100234420008', 'DHARMAPUR SKUS LTD(202100234420008)', 'ARABINDA GHOSH', '', '0000-00-00', '', '', '', 0, '', '8250980673', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234420009', 344, '02469', 344, '202100234420009', 'GOMUNDA SKUS LTD(202100234420009)', 'BIVAKAR PATRA', '', '0000-00-00', '', '', '', 0, '', '9434205727', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234520002', 345, '02477', 345, '202100234520002', 'SRIDURGA SKUS LTD(202100234520002)', 'Mrinal Kanti Bhunia', '', '0000-00-00', '', '', '', 0, '', '9735596539', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234520004', 345, '02475', 345, '202100234520004', 'KALIKAKUNDU BOXICHAK SKUS LTD(202100234520004)', 'Ajoy Patra', '', '0000-00-00', '', '', '', 0, '', '9434118883', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234520005', 345, '02478', 345, '202100234520005', 'MATHURA GRAM SAVA SKUS LTD(202100234520005)', 'DILIP KR JANA', '', '0000-00-00', '', '', '', 0, '', '7479021084', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234520006', 345, '02493', 345, '202100234520006', 'ALANKARPUR SKUS LTD(202100234520006)', 'Biswajit Hazra', '', '0000-00-00', '', '', '', 0, '', '9679026796', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234520009', 345, '02492', 345, '202100234520009', 'KHEJURDA SKUS LTD(202100234520009)', 'Chittaranjan Maity', '', '0000-00-00', '', '', '', 0, '', '9733803771', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234620001', 346, '02175', 346, '202100234620001', 'DEOMALI SKUS LTD(202100234620001)', 'Moksedul Haque', '', '0000-00-00', '', '', '', 0, '', '8509182545', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100234620002', 346, '02174', 346, '202100234620002', 'Dakshin Salsalabari Samabay Krishi Unnayan Samity Limited(202100234620002)', 'SUMIT MONDAL', '', '0000-00-00', '', '', '', 0, '', '8101267164', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100433320011', 333, '02230', 333, '202100433320011', 'KANTANAGAR SKUS LTD(202100433320011)', 'PRASANJIT MANDAL', '', '0000-00-00', '', '', '', 0, '', '6360018027', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100632820001', 328, '02177', 328, '202100632820001', 'PASCHIM BAROGHARIA S. K. U. S. LTD.(202100632820001)', 'LALIT ROY', '', '0000-00-00', '', '', '', 0, '', '8016447359', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100632820008', 328, '02178', 328, '202100632820008', 'FARMING SERVICE COOPERATIVE SOCIETY LTD.(202100632820008)', 'PRAKASH BISWAS', '', '0000-00-00', '', '', '', 0, '', '7586963636', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100633320028', 333, '02244', 333, '202100633320028', 'BELDANGA BLOCK I COOPERATIVE MARKETING SOCIETY LTD(202100633320028)', 'KAZEM ALI', '', '0000-00-00', '', '', '', 0, '', '9732660274', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100633420007', 334, '02254', 334, '202100633420007', 'BISHNUPUR SAMABAY KRISHI UNNAYAN SAMITY LIMITED(202100633420007)', 'SATYABRATA DAS', '', '0000-00-00', '', '', '', 0, '', '9339131075', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100633420011', 334, '02261', 334, '202100633420011', 'KEORA JINAIPUR SAMABAY SEVA SAMITY LIMITED(202100633420011)', 'RAGHURAM PAL', '', '0000-00-00', '', '', '', 0, '', '9083253793', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100633520007', 335, '02285', 335, '202100633520007', 'KULJORA SKUS LTD.(202100633520007)', 'NA', 'NA', '2021-12-09', 'NA', 'NA', 'NA', 0, 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'SCMFBWN023, 09/12/2021', 'synergic', '2022-05-15', 'NA', '2022-05-15'),
('202100633920007', 339, '02360', 339, '202100633920007', 'RAGHUNATHZEW SKUS LTD(202100633920007)', 'BISWAJIT MONDAL', '', '0000-00-00', '', '', '', 0, '', '8637863656', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100634420006', 344, '02449', 344, '202100634420006', 'BIPLABI KSHUDIRAM SAMABAY KRISHI UNNAYAN SAMITY LTD.(202100634420006)', 'Sumit Samanta', '', '0000-00-00', '', '', '', 0, '', '8927032337', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202100634520011', 345, '02478', 345, '202100634520011', 'MUSTAFAPUR JK SAMABAY KRISHI UNNAYAN SAMITY LIMITED(202100634520011)', 'NIMAI CHARAN BERA', '', '0000-00-00', '', '', '', 0, '', '9800910035', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200232820001', 328, '02176', 328, '202200232820001', 'BAROGHARIA SAMABAY KRISHI UNNAYAN SAMITY LTD(202200232820001)', 'TAPU ROY', '', '0000-00-00', '', '', '', 0, '', '8927446859', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200232820002', 328, '02178', 328, '202200232820002', 'SIDDHIVINAYAK SERVICE CO-OPERATIVE SOCIETY LTD(202200232820002)', 'NIRMALENDU GHOSH', '', '0000-00-00', '', '', '', 0, '', '9474590742', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233020001', 330, '02196', 330, '202200233020001', 'SRISTI PORISEBA SAMABAY SAMITY LIMITED(202200233020001)', 'SAJAL DAS', '', '0000-00-00', '', '', '', 0, '', '9832987779', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233020002', 330, '02196', 330, '202200233020002', 'BAHIN SAMABAY KRISHI UNNAYAN SAMITY LIMITED(202200233020002)', 'SAHIDUR RAHAMAN', '', '0000-00-00', '', '', '', 0, '', '8101415152', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233020003', 330, '02198', 330, '202200233020003', 'MAA MULTIPURPOSE COOPERATIVE SOCIETY LTD(202200233020003)', 'RUSTAM ALI', '', '0000-00-00', '', '', '', 0, '', '7797950807', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233020004', 330, '02194', 330, '202200233020004', 'SAHAPUR II CONSUMERS COOPERATIVE SOCIETY LTD(202200233020004)', 'MD SAMSER ALI', '', '0000-00-00', '', '', '', 0, '', '8145911668', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233120001', 331, '02201', 331, '202200233120001', 'NEHEMBA SKUS LTD(202200233120001)', 'SAIFUR RAHAMAN', '', '0000-00-00', '', '', '', 0, '', '9593601962', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233120002', 331, '02205', 331, '202200233120002', 'Bazrapukur SKUS Ltd(202200233120002)', 'CHANCHAL ROY', '', '0000-00-00', '', '', '', 0, '', '8617070368', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233120003', 331, '02201', 331, '202200233120003', 'BURIMATA SKUS LTD', 'CHANDAN KR SARKAR', 'NA', '2022-04-01', 'NA', 'NA', 'NA', 0, 'NA', '9547713717', 'NA', 'NA', 'NA', 'NA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-01', NULL, NULL),
('202200233120004', 331, '02205', 331, '202200233120004', 'FATEPUR TELIGHATA SKUS LTD(202200233120004)', 'DIPESH BARMAN', '', '0000-00-00', '', '', '', 0, '', '9002917933', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233420001', 334, '02262', 334, '202200233420001', 'Bipratikuri SKUS Ltd.(202200233420001)', 'Apurba Kr Dey', '', '0000-00-00', '', '', '', 0, '', '9932723236', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233420002', 334, '02251', 334, '202200233420002', 'Gossainpur SKUS Ltd.(202200233420002)', 'Bikash Ch Sahu', '', '0000-00-00', '', '', '', 0, '', '6294478300', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233420003', 334, '02256', 334, '202200233420003', 'Kanutia SKUS Ltd.(202200233420003)', 'Abdu Odud', '', '0000-00-00', '', '', '', 0, '', '9434581947', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233420004', 334, '02249', 334, '202200233420004', 'Murarai Thana Large Sized Agril CMS Ltd(202200233420004)', 'Md Rejaul Islam', '', '0000-00-00', '', '', '', 0, '', '9153575336', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233520001', 335, '02281', 335, '202200233520001', 'GIDHAGRAM SKUS LTD(202200233520001)', 'NA', 'NA', '2021-11-24', 'NA', 'NA', 'NA', 0, 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'SCMFBWN008, 24/11/2021', 'synergic', '2022-05-17', 'NA', '2022-05-17'),
('202200233520002', 335, '02278', 335, '202200233520002', 'NEGUN UCACS LTD(202200233520002)', 'NA', 'NA', '2021-11-25', 'NA', 'NA', 'NA', 0, 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'SCMFBWN010, 25/11/2021', 'synergic', '2022-05-22', 'NA', '2022-05-22'),
('202200233520003', 335, '02282', 335, '202200233520003', 'SRIBATI SKUS LTD(202200233520003)', 'NA', 'NA', '2021-12-08', 'NA', 'NA', 'NA', 0, 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'SCMFBWN020, 08/12/2021', 'synergic', '2022-05-19', 'NA', '2022-05-19'),
('202200233520004', 335, '02277', 335, '202200233520004', 'DIRGHANAGAR UCACS LTD(202200233520004)', 'PROSANTA GOSWAMI', '', '0000-00-00', '', '', '', 0, '', '9474044957', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233620001', 336, '02304', 336, '202200233620001', 'Tentulberia SKUS Ltd(202200233620001)', 'Abdul Malique Mondal', '', '0000-00-00', '', '', '', 0, '', '9933726384', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233620002', 336, '02304', 336, '202200233620002', 'Charkurmipara SKUS Ltd(202200233620002)', 'Surhit Acharya', '', '0000-00-00', '', '', '', 0, '', '9933732588', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233620003', 336, '02304', 336, '202200233620003', 'Kanchkuli SKUS Ltd(202200233620003)', 'Sanjoy Acharya', '', '0000-00-00', '', '', '', 0, '', '7872129633', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233620004', 336, '02314', 336, '202200233620004', 'Charsarati Anchalik SKUS Ltd(202200233620004)', 'Amirul Mondal', '', '0000-00-00', '', '', '', 0, '', '8583025073', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233620005', 336, '02315', 336, '202200233620005', 'Barasat Dakshin Duttapara SKUS Ltd(202200233620005)', 'Saiful Haque', '', '0000-00-00', '', '', '', 0, '', '9836831564', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233620006', 336, '02313', 336, '202200233620006', 'Angana Rindan Samabay Samity Ltd(202200233620006)', 'Nandita Biswas', '', '0000-00-00', '', '', '', 0, '', '7602204076', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233620007', 336, '02315', 336, '202200233620007', 'Kastodanga Purbanchal SKUS Ltd(202200233620007)', 'Kanak Debnath', '', '0000-00-00', '', '', '', 0, '', '9732897477', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233620008', 336, '02311', 336, '202200233620008', 'Sreerampur SKUS Ltd(202200233620008)', 'Probhat Dhara', '', '0000-00-00', '', '', '', 0, '', '9641130062', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233620009', 336, '02303', 336, '202200233620009', 'Panchpota SKUS Ltd(202200233620009)', 'Ramananda Sen', '', '0000-00-00', '', '', '', 0, '', '9734313215', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233620010', 336, '02303', 336, '202200233620010', 'Bairampur Khorda Plassey SKUS Ltd(202200233620010)', 'MD. Jahiruddin Sekh', '', '0000-00-00', '', '', '', 0, '', '7001078590', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233620011', 336, '02307', 336, '202200233620011', 'Anandabas SKUS Ltd(202200233620011)', 'Dinislam Molla', '', '0000-00-00', '', '', '', 0, '', '9635615915', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233720001', 337, '02318', 337, '202200233720001', 'GOPALPUR NAIGACHI SKUS LTD(202200233720001)', 'SHIMUL PAUL', '', '0000-00-00', '', '', '', 0, '', '9153323982', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233720002', 337, '02336', 337, '202200233720002', 'MURARISHA DK PARA SKUS LTD(202200233720002)', 'ABDUL HAMID MOLLAH', '', '0000-00-00', '', '', '', 0, '', '9614354308', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233720003', 337, '02318', 337, '202200233720003', 'UTTAR RAMPUR SKUS LTD(202200233720003)', 'GOUTAM HALDER', '', '0000-00-00', '', '', '', 0, '', '9735341087', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233720004', 337, '02316', 337, '202200233720004', 'KANIARA SKUS LTD(202200233720004)', 'BIDYUT RAY', '', '0000-00-00', '', '', '', 0, '', '9932460669', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233720005', 337, '02316', 337, '202200233720005', 'SINDRANI SKUS LTD(202200233720005)', 'KULDIP MITRA', '', '0000-00-00', '', '', '', 0, '', '9832731635', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233820001', 338, '02344', 338, '202200233820001', 'PONTBA SAMABAY KRISHI UNNAYAN SAMITY LTD(202200233820001)', 'SABUJ MARICK', '', '0000-00-00', '', '', '', 0, '', '6295180823', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233820002', 338, '02353', 338, '202200233820002', 'MUNDALIKA SKUS LIMITED(202200233820002)', 'AJOY NANGAL', '', '0000-00-00', '', '', '', 0, '', '9733591565', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233820003', 338, '02341', 338, '202200233820003', 'RAUTARA SAMABAYA KRISHI UNNAYAN SAMITY LIMITED(202200233820003)', 'MADAN MOHAN BERA', '', '0000-00-00', '', '', '', 0, '', '9732730622', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233820004', 338, '02353', 338, '202200233820004', 'AKNA SENPUR O KHANDAKSHETRA SAMABAY KRISHI UNNAYAN SAMITY LIMITED(202200233820004)', 'VIVEKANANDA PACHHAL', '', '0000-00-00', '', '', '', 0, '', '8617514403', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233820005', 338, '02353', 338, '202200233820005', 'RASHPUR GHANASHYAMPUR SAMABAYA KRISHI UNNAYAN SAMITY LTD(202200233820005)', 'DIBYENDU GHOSH', '', '0000-00-00', '', '', '', 0, '', '9732995593', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233820006', 338, '02340', 338, '202200233820006', 'KAPSIT VIVEKANANDA SKUS LTD(202200233820006)', 'MIRJA NASIRUL ISLAM', '', '0000-00-00', '', '', '', 0, '', '9775726273', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233820007', 338, '02353', 338, '202200233820007', 'GOPALPUR SAMABAY KRISHI UNNAYAN SAMITY LIMITED(202200233820007)', 'UTTAM KUMAR PANJA', '', '0000-00-00', '', '', '', 0, '', '7872106102', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233820008', 338, '02348', 338, '202200233820008', 'DULLYA BAHIRKHAND SAMABAYA KRISHI UNNAYAN SAMITY LTD(202200233820008)', 'BISWAJIT SANTRA', '', '0000-00-00', '', '', '', 0, '', '8348001404', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233820009', 338, '02338', 338, '202200233820009', 'BALI SAMABAY KRISHI UNNAYAN SAMITY LIMITED(202200233820009)', 'UDAY SANKAR GHOSH', '', '0000-00-00', '', '', '', 0, '', '8250485784', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233820010', 338, '02349', 338, '202200233820010', 'ANANDANAGAR SAMABAY KRISHI UNNAYAN SAMITY LTD(202200233820010)', 'Ananda Banerjee', '', '0000-00-00', '', '', '', 0, '', '6291876656', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233920001', 339, '02370', 339, '202200233920001', 'PAHARPUR SKUS LTD(202200233920001)', 'SWAPAN SHIT', '', '0000-00-00', '', '', '', 0, '', '9732266478', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200233920002', 339, '02377', 339, '202200233920002', 'MOUKURA SKUS LTD(202200233920002)', 'SAMIRAN MAHATO', '', '0000-00-00', '', '', '', 0, '', '7797727009', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200234020001', 340, '02381', 340, '202200234020001', 'Chelyama GP SKUS Ltd(202200234020001)', 'Dibakar Majhi', '', '0000-00-00', '', '', '', 0, '', '8918972691', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200234020002', 340, '02396', 340, '202200234020002', 'Manbazar Bl-II LS Agril LAMS(202200234020002)', 'Chunaram Hembram', '', '0000-00-00', '', '', '', 0, '', '9609600331', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200234020003', 340, '02397', 340, '202200234020003', 'Bandwan South LAMS(202200234020003)', 'Kalipada Hansda', '', '0000-00-00', '', '', '', 0, '', '8670427248', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200234020004', 340, '02394', 340, '202200234020004', 'Banjora SKUS Ltd(202200234020004)', 'Sachidananda Mahato', '', '0000-00-00', '', '', '', 0, '', '9933950378', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200234020005', 340, '02390', 340, '202200234020005', 'Goria UGSSBOKRS Ltd(202200234020005)', 'Biswanath Majhi', '', '0000-00-00', '', '', '', 0, '', '9883785208', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200234320001', 343, '02424', 343, '202200234320001', 'RANGILABAD SKUS LTD(202200234320001)', 'SANAT KUMAR NASKAR', '', '0000-00-00', '', '', '', 0, '', '8013106621', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200234320002', 343, '02440', 343, '202200234320002', 'DAKSHIN DURGAPUR SKUS LTD(202200234320002)', 'BIMAL CHANDRA DAS', '', '0000-00-00', '', '', '', 0, '', '7003282817', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200234320003', 343, '02435', 343, '202200234320003', 'LAUSKBAGAN PARASHMONI SKUS LTD(202200234320003)', 'NILKANTA SARKAR', '', '0000-00-00', '', '', '', 0, '', '6294371481', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200234420001', 344, '02467', 344, '202200234420001', 'ALIKASHA SKUS LTD(202200234420001)', 'Mrinal Kanti Khatua', '', '0000-00-00', '', '', '', 0, '', '6294492127', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200234420002', 344, '02451', 344, '202200234420002', 'Ghoshdiha SKUS Ltd(202200234420002)', 'Arun Kr jana', '', '0000-00-00', '', '', '', 0, '', '9547150215', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200234420003', 344, '02461', 344, '202200234420003', 'CHANGUAL SKUS LTD(202200234420003)', 'MANABENDRA GHOSH', '', '0000-00-00', '', '', '', 0, '', '9593192396', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200234520001', 345, '02489', 345, '202200234520001', 'BENICHAK SKUS LTD(202200234520001)', 'Sankar Maity', '', '0000-00-00', '', '', '', 0, '', '9735813199', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200234520002', 345, '02488', 345, '202200234520002', 'KAMARPUT SKUS LTD(202200234520002)', 'Dipak kumar Shyamal', '', '0000-00-00', '', '', '', 0, '', '9933556461', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200234520003', 345, '02477', 345, '202200234520003', 'MAKRAMPUR JANAKALYAN SKUS LTD(202200234520003)', 'Arun Kumar Sahoo', '', '0000-00-00', '', '', '', 0, '', '9734576838', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200234520004', 345, '02493', 345, '202200234520004', 'BIRHAMPUR SKUS(202200234520004)', 'Sukumar Maity', '', '0000-00-00', '', '', '', 0, '', '9564397480', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200234620001', 346, '02173', 346, '202200234620001', 'BHOLARDABRI SKUS LTD(202200234620001)', 'PARITOSH DUTTA', '', '0000-00-00', '', '', '', 0, '', '9434367967', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL),
('202200234620002', 346, '02175', 346, '202200234620002', 'Balasundar SKUS Ltd(202200234620002)', 'Anil Ch Adhikary', '', '0000-00-00', '', '', '', 0, '', '8972672030', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'synergic', '2022-04-05', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_soc_commision_rate`
--

CREATE TABLE `md_soc_commision_rate` (
  `id` int(11) NOT NULL,
  `effective_dt` date NOT NULL,
  `rice_type` varchar(5) NOT NULL,
  `rate` decimal(7,2) NOT NULL,
  `kms_id` int(11) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_soc_commision_rate`
--

INSERT INTO `md_soc_commision_rate` (`id`, `effective_dt`, `rice_type`, `rate`, `kms_id`, `created_by`, `created_dt`) VALUES
(1, '2020-02-01', 'P', '31.25', 2, 'synergic', '2020-02-05'),
(2, '2020-02-01', 'R', '31.25', 2, 'sss', '2020-08-21');

-- --------------------------------------------------------

--
-- Table structure for table `md_soc_mill`
--

CREATE TABLE `md_soc_mill` (
  `branch_id` int(11) NOT NULL,
  `soc_id` varchar(20) NOT NULL,
  `mill_id` varchar(20) NOT NULL,
  `dist` int(11) NOT NULL DEFAULT 0,
  `distance` decimal(10,2) NOT NULL,
  `reg_no` varchar(30) NOT NULL,
  `target` double(10,2) NOT NULL,
  `kms_id` int(11) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_dt` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_dt` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_soc_mill`
--

INSERT INTO `md_soc_mill` (`branch_id`, `soc_id`, `mill_id`, `dist`, `distance`, `reg_no`, `target`, `kms_id`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(343, '192000234320028', '572', 343, '20.00', 'SCMF/SOUTH24PGS/2021-22/01', 10000.00, 4, 'Susmita Nath', '2022-04-06 08:26:57', '', ''),
(343, '192000234320025', '568', 343, '20.00', 'SCMF/SOUTH24PGS/2021-22/02', 8000.00, 4, 'Susmita Nath', '2022-04-06 08:28:08', '', ''),
(343, '202100234320001', '572', 343, '35.00', 'SCMF/SOUTH24PGS/2021-22/03', 10000.00, 4, 'Susmita Nath', '2022-04-06 08:28:56', '', ''),
(343, '192000234320001', '568', 343, '22.00', 'SCMF/SOUTH24PGS/2021-22/04', 8000.00, 4, 'Susmita Nath', '2022-04-06 08:29:41', '', ''),
(343, '192000234320027', '568', 343, '45.00', 'SCMF/SOUTH24PGS/2021-22/05', 100.00, 4, 'Susmita Nath', '2022-04-06 08:30:20', '', ''),
(343, '202100234320002', '571', 343, '68.00', 'SCMF/SOUTH24PGS/2021-22/07', 13000.00, 4, 'Susmita Nath', '2022-04-06 08:33:53', 'Susmita Nath', '2022-04-06 08:48:09'),
(343, '192000234320018', '569', 343, '98.10', 'SCMF/SOUTH24PGS/2021-22/08', 15000.00, 4, 'Susmita Nath', '2022-04-06 08:35:03', 'Susmita Nath', '2022-04-07 06:51:53'),
(343, '202100234320004', '565', 343, '93.00', 'SCMF/SOUTH24PGS/2021-22/09', 16000.00, 4, 'Susmita Nath', '2022-04-06 08:35:51', 'Susmita Nath', '2022-04-07 06:56:21'),
(343, '192000234320029', '567', 343, '24.00', 'SCMF/SOUTH24PGS/2021-22/10', 17000.00, 4, 'Susmita Nath', '2022-04-06 08:36:39', '', ''),
(343, '192000234320023', '565', 343, '20.00', 'SCMF/SOUTH24PGS/2021-22/11', 1000.00, 4, 'Susmita Nath', '2022-04-06 08:37:14', '', ''),
(343, '192000234320020', '569', 343, '97.70', 'SCMF/SOUTH24PGS/2021-22/12', 1000.00, 4, 'Susmita Nath', '2022-04-06 08:38:41', 'Susmita Nath', '2022-04-06 08:40:32'),
(343, '192000234320011', '569', 343, '88.10', 'SCMF/SOUTH24PGS/2021-22/13', 12000.00, 4, 'Susmita Nath', '2022-04-06 08:39:34', 'Susmita Nath', '2022-04-06 08:40:59'),
(343, '192000234320013', '569', 343, '86.20', 'SCMF/SOUTH24PGS/2021-22/14', 1000.00, 4, 'Susmita Nath', '2022-04-06 08:40:14', '', ''),
(343, '192000234320015', '569', 343, '105.50', 'SCMF/SOUTH24PGS/2021-22/15', 13000.00, 4, 'Susmita Nath', '2022-04-06 08:41:50', '', ''),
(343, '192000234320032', '567', 343, '90.00', 'SCMF/SOUTH24PGS/2021-22/16', 15000.00, 4, 'Susmita Nath', '2022-04-06 08:42:41', 'Susmita Nath', '2022-04-07 06:52:12'),
(343, '192000234320005', '571', 343, '60.00', 'SCMF/SOUTH24PGS/2021-22/17', 13000.00, 4, 'Susmita Nath', '2022-04-06 08:44:17', 'Susmita Nath', '2022-04-06 08:48:26'),
(343, '202200234320001', '565', 343, '0.00', 'SCMF/SOUTH24PGS/2021-22/18', 15000.00, 4, 'Susmita Nath', '2022-04-06 08:44:47', '', ''),
(343, '192000234320014', '569', 343, '105.50', 'SCMF/SOUTH24PGS/2021-22/19', 300.00, 4, 'Susmita Nath', '2022-04-06 08:45:19', '', ''),
(343, '202100234320005', '569', 343, '65.00', 'SCMF/SOUTH24PGS/2021-22/20', 200.00, 4, 'Susmita Nath', '2022-04-06 08:47:17', 'Susmita Nath', '2022-04-07 06:55:02'),
(343, '192000234320010', '569', 343, '102.00', 'SCMF/SOUTH24PGS/2021-22/21', 1000.00, 4, 'Susmita Nath', '2022-04-06 08:48:52', '', ''),
(343, '202200234320002', '567', 343, '45.00', 'SCMF/SOUTH24PGS/2021-22/22', 10000.00, 4, 'Susmita Nath', '2022-04-06 08:50:07', '', ''),
(343, '192000234320009', '569', 343, '97.70', 'SCMF/SOUTH24PGS/2021-22/23', 5100.00, 4, 'Susmita Nath', '2022-04-06 08:50:57', '', ''),
(343, '192000234320012', '569', 343, '101.40', 'SCMF/SOUTH24PGS/2021-22/24', 1000.00, 4, 'Susmita Nath', '2022-04-06 08:51:26', '', ''),
(343, '192000234320019', '567', 343, '45.00', 'SCMF/SOUTH24PGS/2021-22/25', 1000.00, 4, 'Susmita Nath', '2022-04-06 08:52:02', 'Susmita Nath', '2022-04-07 06:52:50'),
(343, '192000234320026', '567', 343, '45.00', 'SCMF/SOUTH24PGS/2021-22/26', 500.00, 4, 'Susmita Nath', '2022-04-06 08:52:33', '', ''),
(343, '202100234320003', '567', 343, '45.00', 'SCMF/SOUTH24PGS/2021-22/27', 100.00, 4, 'Susmita Nath', '2022-04-06 08:52:59', '', ''),
(343, '202200234320003', '571', 343, '74.00', 'SCMF/SOUTH24PGS/2021-22/28', 5500.00, 4, 'Susmita Nath', '2022-04-06 08:53:39', '', ''),
(343, '192000234320030', '569', 343, '98.90', 'SCMF/SOUTH24PGS/2021-22/29', 500.00, 4, 'Susmita Nath', '2022-04-06 08:54:19', '', ''),
(343, '192000234320007', '566', 343, '20.00', 'SCMF/SOUTH24PGS/2021-22/06', 1500.00, 4, 'Susmita Nath', '2022-04-07 06:15:03', '', ''),
(336, '192000233620016', '357', 336, '30.00', 'SCMF/NAD/21-22/001 DT 26.11.21', 3000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:03:04', '', ''),
(336, '192000233620004', '355', 336, '80.00', 'SCMF/NAD/21-22/002 DT 29.11.21', 14000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:04:48', '', ''),
(336, '192000233620004', '352', 336, '45.00', 'SCMF/NAD/21-22/002-A DT 29.11.', 0.00, 4, 'Sudip Kumar Das', '2022-04-07 08:05:40', '', ''),
(336, '192000233620014', '351', 336, '18.00', 'SCMF/NAD/21-22/003 DT 29.11.21', 17000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:06:29', '', ''),
(336, '192000233620014', '352', 336, '18.00', 'SCMF/NAD/21-22/003-A DT 29.11.', 0.00, 4, 'Sudip Kumar Das', '2022-04-07 08:07:12', '', ''),
(336, '192000233620013', '355', 336, '45.00', 'SCMF/NAD/21-22/004 DT 29.11.21', 9000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:08:31', '', ''),
(336, '192000233620013', '356', 336, '46.00', 'SCMF/NAD/21-22/004-A DT 29.11.', 9000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:09:01', '', ''),
(336, '192000233620012', '351', 336, '29.00', 'SCMF/NAD/21-22/005 DT 29.11.21', 9000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:09:44', '', ''),
(336, '192000233620012', '352', 336, '0.00', 'SCMF/NAD/21-22/005-A DT 29.11.', 0.00, 4, 'Sudip Kumar Das', '2022-04-07 08:10:17', '', ''),
(336, '192000233620030', '352', 336, '5.00', 'SCMF/NAD/21-22/006 DT 29.11.21', 8000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:11:36', '', ''),
(336, '192000233620030', '351', 336, '5.00', 'SCMF/NAD/21-22/006-A DT 29.11.', 4000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:12:17', '', ''),
(336, '192000233620015', '351', 336, '0.00', 'SCMF/NAD/21-22/007 DT 29.11.21', 0.00, 4, 'Sudip Kumar Das', '2022-04-07 08:13:53', '', ''),
(336, '192000233620015', '352', 336, '3.00', 'SCMF/NAD/21-22/007-A DT 29.11.', 16000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:14:32', '', ''),
(336, '192000233620019', '354', 336, '60.00', 'SCMF/NAD/21-22/008 DT 29.11.21', 5000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:15:48', '', ''),
(336, '192000233620019', '357', 336, '0.00', 'SCMF/NAD/21-22/008-A DT 29.11.', 0.00, 4, 'Sudip Kumar Das', '2022-04-07 08:16:26', '', ''),
(336, '192000233620037', '363', 336, '97.00', 'SCMF/NAD/21-22/009 DT 01.12.21', 12000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:17:23', 'Sudip Kumar Das', '2022-04-08 12:08:22'),
(336, '192000633620033', '363', 336, '6.00', 'SCMF/NAD/21-22/009 DT 01.12.21', 15000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:17:55', 'Sudip Kumar Das', '2022-04-08 12:04:18'),
(336, '192000233620031', '363', 336, '108.00', 'SCMF/NAD/21-22/011 DT 01.12.21', 7000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:18:57', '', ''),
(336, '202200233620001', '358', 336, '60.00', 'SCMF/NAD/21-22/012 DT 07.12.21', 5000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:20:20', '', ''),
(336, '202200233620001', '356', 336, '94.00', 'SCMF/NAD/21-22/012-A DT 07.12.', 4500.00, 4, 'Sudip Kumar Das', '2022-04-07 08:21:16', '', ''),
(336, '192000233620001', '358', 336, '30.00', 'SCMF/NAD/21-22/013 DT 07.12.21', 4000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:22:05', '', ''),
(336, '192000233620001', '354', 336, '50.00', 'SCMF/NAD/21-22/013-A DT 07.12.', 4000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:22:53', '', ''),
(336, '192000233620001', '363', 336, '62.00', 'SCMF/NAD/21-22/013-B DT 10.01.', 0.00, 4, 'Sudip Kumar Das', '2022-04-07 08:23:55', '', ''),
(336, '192000233620039', '352', 336, '54.00', 'SCMF/NAD/21-22/014 DT 07.12.21', 10000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:24:53', '', ''),
(336, '192000233620039', '356', 336, '89.00', 'SCMF/NAD/21-22/014-A DT 07.12.', 4000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:25:36', '', ''),
(336, '192000233620024', '358', 336, '30.00', 'SCMF/NAD/21-22/015 DT 07.12.21', 3000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:26:39', '', ''),
(336, '202200233620002', '355', 336, '90.00', 'SCMF/NAD/21-22/016 DT 07.12.21', 12000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:28:24', '', ''),
(336, '202200233620002', '352', 336, '50.00', 'SCMF/NAD/21-22/016-A DT 07.12.', 0.00, 4, 'Sudip Kumar Das', '2022-04-07 08:29:55', '', ''),
(336, '202200233620003', '355', 336, '85.00', 'SCMF/NAD/21-22/017 DT 07.12.21', 5000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:30:34', '', ''),
(336, '202200233620003', '351', 336, '35.00', 'SCMF/NAD/21-22/017-A DT 07.12.', 6000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:31:02', '', ''),
(336, '192000233620042', '351', 336, '11.00', 'SCMF/NAD/21-22/018 DT 07.12.21', 1500.00, 4, 'Sudip Kumar Das', '2022-04-07 08:40:10', '', ''),
(336, '192000233620022', '357', 336, '12.00', 'SCMF/NAD/21-22/019 DT 07.12.21', 4000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:42:30', '', ''),
(336, '202100233620003', '351', 336, '43.00', 'SCMF/NAD/21-22/020 DT 07.12.21', 16000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:44:26', '', ''),
(336, '202100233620003', '355', 336, '0.00', 'SCMF/NAD/21-22/020-A DT 07.12.', 0.00, 4, 'Sudip Kumar Das', '2022-04-07 08:44:59', '', ''),
(336, '202100233620002', '354', 336, '55.00', 'SCMF/NAD/21-22/021 DT 07.12.21', 3000.00, 4, 'Sudip Kumar Das', '2022-04-07 08:46:08', '', ''),
(336, '202100233620002', '363', 336, '55.00', 'SCMF/NAD/21-22/021-A DT 10..01', 0.00, 4, 'Sudip Kumar Das', '2022-04-07 09:18:55', '', ''),
(336, '192000233620034', '354', 336, '2.00', 'SCMF/NAD/21-22/022 DT 07.12.21', 4000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:19:57', '', ''),
(336, '192000233620008', '354', 336, '2.00', 'SCMF/NAD/21-22/023 DT 09.12.21', 3500.00, 4, 'Sudip Kumar Das', '2022-04-07 09:21:00', '', ''),
(336, '192000233620011', '351', 336, '32.00', 'SCMF/NAD/21-22/024 DT 09.12.21', 7500.00, 4, 'Sudip Kumar Das', '2022-04-07 09:21:32', '', ''),
(336, '192000233620011', '356', 336, '0.00', 'SCMF/NAD/21-22/024-A DT 09.12.', 0.00, 4, 'Sudip Kumar Das', '2022-04-07 09:22:03', '', ''),
(336, '192000233620032', '351', 336, '23.00', 'SCMF/NAD/21-22/025 DT 13.12.21', 3000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:23:05', '', ''),
(336, '192000233620026', '358', 336, '7.00', 'SCMF/NAD/21-22/026 DT 13.12.21', 1000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:23:40', '', ''),
(336, '192000233620026', '354', 336, '20.00', 'SCMF/NAD/21-22/026-A DT 13.12.', 2000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:24:10', '', ''),
(336, '192000633620037', '355', 336, '8.00', 'SCMF/NAD/21-22/027 DT 15.12.21', 4000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:24:59', '', ''),
(336, '202200233620007', '355', 336, '1.00', 'SCMF/NAD/21-22/028 DT 15.12.21', 4000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:25:57', '', ''),
(336, '192000233620007', '351', 336, '36.00', 'SCMF/NAD/21-22/029 DT 15.12.21', 2000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:26:41', '', ''),
(336, '192000633620003', '358', 336, '13.00', 'SCMF/NAD/21-22/030 DT 15.12.21', 2000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:27:27', '', ''),
(336, '192000633620003', '354', 336, '0.00', 'SCMF/NAD/21-22/030 -ADT 15.12.', 0.00, 4, 'Sudip Kumar Das', '2022-04-07 09:28:19', '', ''),
(336, '192000633620003', '363', 336, '36.00', 'SCMF/NAD/21-22/030 -BDT 15.12.', 5000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:36:56', '', ''),
(336, '192000233620044', '363', 336, '80.00', 'SCMF/NAD/21-22/031 DT 15.12.21', 2000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:37:31', '', ''),
(336, '192000233620044', '351', 336, '0.00', 'SCMF/NAD/21-22/031-A DT 15.12.', 0.00, 4, 'Sudip Kumar Das', '2022-04-07 09:38:01', '', ''),
(336, '192000233620040', '362', 336, '60.00', 'SCMF/NAD/21-22/032 DT 15.12.21', 3000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:40:30', '', ''),
(336, '192000233620040', '352', 336, '0.00', 'SCMF/NAD/21-22/032-A DT 17.12.', 0.00, 4, 'Sudip Kumar Das', '2022-04-07 09:41:15', '', ''),
(336, '202200233620004', '355', 336, '22.00', 'SCMF/NAD/21-22/033 DT 17.12.21', 4000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:41:59', '', ''),
(336, '192000633620022', '351', 336, '10.00', 'SCMF/NAD/21-22/034 DT 17.12.21', 11000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:43:17', '', ''),
(336, '192000633620022', '352', 336, '5.00', 'SCMF/NAD/21-22/034-A DT 17.12.', 0.00, 4, 'Sudip Kumar Das', '2022-04-07 09:43:46', '', ''),
(336, '202200233620005', '355', 336, '12.00', 'SCMF/NAD/21-22/035 DT 17.12.21', 4000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:44:18', '', ''),
(336, '202200233620006', '351', 336, '7.00', 'SCMF/NAD/21-22/036 DT 20.12.21', 500.00, 4, 'Sudip Kumar Das', '2022-04-07 09:44:58', '', ''),
(336, '192000233620033', '351', 336, '30.00', 'SCMF/NAD/21-22/037 DT 23.12.21', 2000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:45:35', '', ''),
(336, '192000233620041', '351', 336, '22.00', 'SCMF/NAD/21-22/038 DT 23.12.21', 13000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:46:06', '', ''),
(336, '202100233620001', '362', 336, '50.00', 'SCMF/NAD/21-22/039 DT 23.12.21', 1000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:46:44', '', ''),
(336, '202100233620001', '354', 336, '45.00', 'SCMF/NAD/21-22/039-A DT 23.12.', 0.00, 4, 'Sudip Kumar Das', '2022-04-07 09:47:12', '', ''),
(336, '192000233620018', '363', 336, '30.00', 'SCMF/NAD/21-22/041 DT 27.12.21', 5000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:48:22', '', ''),
(336, '192000233620009', '352', 336, '80.00', 'SCMF/NAD/21-22/042 DT 28.12.21', 2000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:49:16', '', ''),
(336, '192000233620035', '354', 336, '3.00', 'SCMF/NAD/21-22/043 DT 28.12.21', 1000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:49:54', '', ''),
(336, '192000233620017', '354', 336, '52.00', 'SCMF/NAD/21-22/044 DT 28.12.21', 1000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:50:25', '', ''),
(336, '192000233620017', '357', 336, '0.00', 'SCMF/NAD/21-22/044-A DT 28.12.', 0.00, 4, 'Sudip Kumar Das', '2022-04-07 09:51:03', '', ''),
(336, '192000233620017', '363', 336, '68.00', 'SCMF/NAD/21-22/044 -B DT 10.01', 1000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:51:51', '', ''),
(336, '192000233620027', '354', 336, '55.00', 'SCMF/NAD/21-22/045 DT 30.12.21', 4000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:52:22', '', ''),
(336, '192000233620027', '356', 336, '0.00', 'SCMF/NAD/21-22/045-A DT 30.12.', 0.00, 4, 'Sudip Kumar Das', '2022-04-07 09:52:49', '', ''),
(336, '192000233620020', '358', 336, '48.00', 'SCMF/NAD/21-22/046 DT 05.01.22', 1000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:53:33', '', ''),
(336, '202200233620009', '363', 336, '100.00', 'SCMF/NAD/21-22/047 DT 11.01.22', 500.00, 4, 'Sudip Kumar Das', '2022-04-07 09:54:28', 'Sudip Kumar Das', '2022-04-07 09:55:33'),
(336, '202200233620010', '363', 336, '100.00', 'SCMF/NAD/21-22/048 DT 10.01.22', 500.00, 4, 'Sudip Kumar Das', '2022-04-07 09:55:10', '', ''),
(336, '202200233620008', '357', 336, '0.00', 'SCMF/NAD/21-22/049 DT 10.01.22', 0.00, 4, 'Sudip Kumar Das', '2022-04-07 09:56:27', '', ''),
(336, '202200233620011', '361', 336, '65.00', 'SCMF/NAD/21-22/050 DT 17.01.22', 1000.00, 4, 'Sudip Kumar Das', '2022-04-07 09:56:57', '', ''),
(336, '192000233620028', '353', 336, '48.00', 'SCMF/NAD/21-22/051 DT 20.01.22', 500.00, 4, 'Sudip Kumar Das', '2022-04-07 09:57:33', '', ''),
(334, '192000233420031', '91', 334, '0.00', 'SCMFBIR002', 7676.50, 4, 'Mantu Kumar Maji', '2022-04-07 12:39:45', '', ''),
(334, '192000233420019', '59', 334, '0.00', 'SCMFBIR008', 10235.28, 4, 'Mantu Kumar Maji', '2022-04-07 12:40:42', '', ''),
(334, '202100233420006', '67', 334, '0.00', 'SCMFBIR020', 5117.64, 4, 'Mantu Kumar Maji', '2022-04-07 12:42:11', '', ''),
(334, '202100233420007', '63', 334, '0.00', 'SCMFBIR013', 6397.05, 4, 'Mantu Kumar Maji', '2022-04-07 12:43:05', '', ''),
(334, '192000233420027', '91', 334, '0.00', 'SCMFBIR001', 5117.64, 4, 'Mantu Kumar Maji', '2022-04-07 12:43:57', '', ''),
(334, '192000233420004', '109', 334, '0.00', 'SCMFBIR003', 7676.46, 4, 'Mantu Kumar Maji', '2022-04-07 12:45:08', '', ''),
(334, '202100233420008', '66', 334, '0.00', 'SCMFBIR017', 14073.51, 4, 'Mantu Kumar Maji', '2022-04-07 12:46:44', '', ''),
(334, '202100233420008', '102', 334, '0.00', 'SCMFBIR035', 20470.60, 4, 'Mantu Kumar Maji', '2022-04-07 12:48:14', '', ''),
(334, '192000233420022', '101', 334, '0.00', 'SCMFBIR005', 6397.05, 4, 'Mantu Kumar Maji', '2022-04-07 12:49:11', '', ''),
(334, '192000233420024', '107', 334, '0.00', 'SCMFBIR021', 6397.05, 4, 'Mantu Kumar Maji', '2022-04-07 12:50:10', '', ''),
(334, '192000633420033', '106', 334, '0.00', 'SCMFBIR027', 10235.28, 4, 'Mantu Kumar Maji', '2022-04-07 12:51:38', '', ''),
(334, '202200233420001', '76', 334, '0.00', 'SCMFBIR012', 8955.87, 4, 'Mantu Kumar Maji', '2022-04-07 12:54:36', '', ''),
(334, '192000233420015', '88', 334, '0.00', 'SCMFBIR006', 16632.30, 4, 'Mantu Kumar Maji', '2022-04-07 12:55:45', '', ''),
(334, '192000233420025', '80', 334, '0.00', 'SCMFBIR007', 10235.28, 4, 'Mantu Kumar Maji', '2022-04-07 12:56:45', '', ''),
(334, '192000633420020', '99', 334, '0.00', 'SCMFBIR011', 2558.82, 4, 'Mantu Kumar Maji', '2022-04-07 12:58:09', '', ''),
(334, '202100233420001', '79', 334, '0.00', 'SCMFBIR018', 10235.28, 4, 'Mantu Kumar Maji', '2022-04-07 12:59:26', '', ''),
(334, '202100633420011', '98', 334, '0.00', 'SCMFBIR019', 14073.51, 4, 'Mantu Kumar Maji', '2022-04-07 01:00:36', '', ''),
(334, '192000633420034', '58', 334, '0.00', 'SCMFBIR034', 7676.50, 4, 'Mantu Kumar Maji', '2022-04-07 01:01:43', '', ''),
(334, '192000333420008', '99', 334, '0.00', 'SCMFBIR030', 2558.82, 4, 'Mantu Kumar Maji', '2022-04-07 01:02:30', '', ''),
(334, '192000233420017', '77', 334, '0.00', 'SCMFBIR009', 14073.50, 4, 'Mantu Kumar Maji', '2022-04-07 01:03:51', '', ''),
(334, '192000233420016', '108', 334, '0.00', 'SCMFBIR031', 2558.82, 4, 'Mantu Kumar Maji', '2022-04-07 01:04:42', '', ''),
(334, '202100233420009', '65', 334, '0.00', 'SCMFBIR025', 10252.29, 4, 'Mantu Kumar Maji', '2022-04-07 01:05:57', '', ''),
(334, '192000233420023', '84', 334, '0.00', 'SCMFBIR026', 5117.64, 4, 'Mantu Kumar Maji', '2022-04-07 01:06:49', '', ''),
(334, '202200233420003', '62', 334, '0.00', 'SCMFBIR029', 3838.20, 4, 'Mantu Kumar Maji', '2022-04-07 01:07:42', '', ''),
(334, '192000333420011', '90', 334, '0.00', 'SCMFBIR024', 5117.64, 4, 'Mantu Kumar Maji', '2022-04-07 01:08:32', '', ''),
(334, '192000233420042', '97', 334, '0.00', 'SCMFBIR010', 6397.05, 4, 'Mantu Kumar Maji', '2022-04-07 01:09:19', '', ''),
(334, '202100633420007', '104', 334, '0.00', 'SCMFBIR023', 6397.05, 4, 'Mantu Kumar Maji', '2022-04-07 01:10:06', '', ''),
(334, '192000233420013', '109', 334, '0.00', 'SCMFBIR004', 6397.05, 4, 'Mantu Kumar Maji', '2022-04-07 01:10:54', '', ''),
(334, '202100233420002', '100', 334, '0.00', 'SCMFBIR015', 10613.28, 4, 'Mantu Kumar Maji', '2022-04-07 01:12:05', '', ''),
(334, '192000233420046', '112', 334, '0.00', 'SCMFBIR016', 6397.05, 4, 'Mantu Kumar Maji', '2022-04-07 01:12:51', '', ''),
(334, '202200233420002', '95', 334, '0.00', 'SCMFBIR022', 3838.23, 4, 'Mantu Kumar Maji', '2022-04-07 01:14:24', '', ''),
(334, '202100233420003', '81', 334, '0.00', 'SCMFBIR014', 14073.50, 4, 'Mantu Kumar Maji', '2022-04-07 01:15:35', '', ''),
(334, '202200233420004', '65', 334, '0.00', 'SCMFBIR028', 1279.41, 4, 'Mantu Kumar Maji', '2022-04-07 01:16:24', '', ''),
(334, '192000233420014', '78', 334, '0.00', 'SCMFBIR033', 10235.28, 4, 'Mantu Kumar Maji', '2022-04-07 01:17:28', '', ''),
(331, '192000633120022', '123', 331, '0.00', 'SCMF/DDB/21-22/12', 1000.00, 4, 'Marshal Sengel Baskey', '2022-04-07 02:18:28', '', ''),
(331, '192000633120022', '136', 331, '0.00', 'SCMF/DDB/21-22/13', 5500.00, 4, 'Marshal Sengel Baskey', '2022-04-07 02:19:40', '', ''),
(331, '192000633120022', '125', 331, '0.00', 'SCMF/DDB/21-22/14', 2100.00, 4, 'Marshal Sengel Baskey', '2022-04-07 02:20:31', '', ''),
(331, '192000633120011', '123', 331, '0.00', 'SCMF/DDB/21-22/18', 15500.00, 4, 'Marshal Sengel Baskey', '2022-04-07 02:21:50', '', ''),
(331, '192000633120011', '127', 331, '0.00', 'SCMF/DDB/21-22/19', 1500.00, 4, 'Marshal Sengel Baskey', '2022-04-07 02:22:18', '', ''),
(331, '202200233120002', '123', 331, '0.00', 'SCMF/DDB/21-22/23', 14000.00, 4, 'Marshal Sengel Baskey', '2022-04-07 02:23:50', '', ''),
(331, '202200233120002', '127', 331, '0.00', 'SCMF/DDB/21-22/24', 5000.00, 4, 'Marshal Sengel Baskey', '2022-04-07 02:24:23', '', ''),
(331, '192000633120020', '125', 331, '0.00', 'SCMF/DDB/21-22/09', 16000.00, 4, 'Marshal Sengel Baskey', '2022-04-07 02:26:44', '', ''),
(331, '192000633120020', '132', 331, '0.00', 'SCMF/DDB/21-22/10', 1500.00, 4, 'Marshal Sengel Baskey', '2022-04-07 02:27:40', '', ''),
(331, '192000633120020', '136', 331, '0.00', 'SCMF/DDB/21-22/11', 2250.00, 4, 'Marshal Sengel Baskey', '2022-04-07 02:28:39', '', ''),
(331, '192000633120020', '134', 331, '0.00', 'SCMF/DDB/21-22/17', 1500.00, 4, 'Marshal Sengel Baskey', '2022-04-07 02:30:40', 'Marshal Sengel Baskey', '2022-04-08 06:38:01'),
(331, '192000233120001', '128', 331, '0.00', 'SCMF/DDB/21-22/07', 5600.00, 4, 'Marshal Sengel Baskey', '2022-04-07 02:32:04', '', ''),
(331, '192000233120001', '126', 331, '0.00', 'SCMF/DDB/21-22/08', 1800.00, 4, 'Marshal Sengel Baskey', '2022-04-07 02:32:36', 'Marshal Sengel Baskey', '2022-04-08 06:03:33'),
(331, '192000233120011', '128', 331, '0.00', 'SCMF/DDB/21-22/01', 10030.00, 4, 'Marshal Sengel Baskey', '2022-04-07 02:34:58', '', ''),
(331, '192000233120011', '126', 331, '0.00', 'SCMF/DDB/21-22/02', 5000.00, 4, 'Marshal Sengel Baskey', '2022-04-07 02:35:33', '', ''),
(331, '202200233120001', '128', 331, '0.00', 'SCMF/DDB/21-22/22', 1500.00, 4, 'Marshal Sengel Baskey', '2022-04-07 02:38:00', '', ''),
(331, '202200233120001', '126', 331, '0.00', 'SCMF/DDB/21-22/25', 1800.00, 4, 'Marshal Sengel Baskey', '2022-04-07 02:38:57', '', ''),
(331, '192000233120010', '129', 331, '0.00', 'SCMF/DDB/21-22/03', 5200.00, 4, 'Marshal Sengel Baskey', '2022-04-08 05:53:47', '', ''),
(331, '192000233120010', '133', 331, '0.00', 'SCMF/DDB/21-22/04', 300.00, 4, 'Marshal Sengel Baskey', '2022-04-08 05:55:08', '', ''),
(331, '192000233120010', '132', 331, '0.00', 'SCMF/DDB/21-22/26', 1200.00, 4, 'Marshal Sengel Baskey', '2022-04-08 06:23:36', 'Marshal Sengel Baskey', '2022-04-08 06:26:12'),
(331, '192000633120010', '132', 331, '0.00', 'SCMF/DDB/21-22/05', 7200.00, 4, 'Marshal Sengel Baskey', '2022-04-08 06:26:45', '', ''),
(331, '192000633120010', '133', 331, '0.00', 'SCMF/DDB/21-22/06', 5200.00, 4, 'Marshal Sengel Baskey', '2022-04-08 06:27:12', '', ''),
(331, '202200233120004', '135', 331, '0.00', 'SCMF/DDB/21-22/28', 1000.00, 4, 'Marshal Sengel Baskey', '2022-04-08 06:29:47', 'Marshal Sengel Baskey', '2022-04-08 06:32:32'),
(331, '202100233120002', '128', 331, '0.00', 'SCMF/DDB/21-22/15', 2100.00, 4, 'Marshal Sengel Baskey', '2022-04-08 06:31:11', '', ''),
(331, '202100233120002', '126', 331, '0.00', 'SCMF/DDB/21-22/16', 7000.00, 4, 'Marshal Sengel Baskey', '2022-04-08 06:31:37', '', ''),
(335, '192000233520004', '467', 335, '1.00', 'SCMFBWN026', 8000.00, 4, 'Subrata Sen', '2022-04-08 06:50:05', 'Subrata Sen', '2022-04-13 08:19:15'),
(335, '192000233520016', '503', 335, '29.00', 'SCMFBWN025', 20000.00, 4, 'Subrata Sen', '2022-04-08 06:51:10', '', ''),
(335, '192000233520019', '454', 335, '2.00', 'SCMFBWN016', 9000.00, 4, 'Subrata Sen', '2022-04-08 06:53:36', '', ''),
(335, '192000233520024', '527', 335, '10.00', 'SCMFBWN012', 10000.00, 4, 'Subrata Sen', '2022-04-08 06:55:19', '', ''),
(335, '192000233520027', '505', 335, '60.00', 'SCMFBWN017', 12000.00, 4, 'Subrata Sen', '2022-04-08 06:57:24', '', ''),
(335, '202100233520005', '451', 335, '9.00', 'SCMFBWN014', 20000.00, 4, 'Subrata Sen', '2022-04-08 07:00:13', 'Subrata Sen', '2022-04-08 07:03:36'),
(335, '202200233520004', '477', 335, '1.00', 'SCMFBWN021', 9000.00, 4, 'Subrata Sen', '2022-04-08 07:03:27', '', ''),
(335, '192000233520016', '459', 335, '7.00', 'SCMFBWN028', 8000.00, 4, 'Subrata Sen', '2022-04-08 07:26:32', '', ''),
(335, '192000233520016', '509', 335, '8.00', 'SCMFBWN029', 5000.00, 4, 'Subrata Sen', '2022-04-08 07:27:10', '', ''),
(335, '192000233520016', '519', 335, '14.00', 'SCMFBWN030', 4000.00, 4, 'Subrata Sen', '2022-04-08 07:27:41', '', ''),
(335, '192000233520016', '419', 335, '15.00', 'SCMFBWN031', 5000.00, 4, 'Subrata Sen', '2022-04-08 07:28:10', '', ''),
(335, '192000233520027', '496', 335, '10.00', 'SCMFBWN032', 10000.00, 4, 'Subrata Sen', '2022-04-08 07:38:18', '', ''),
(330, '192000233020001', '585', 330, '5.00', 'UD/21-22/070', 1000.00, 4, 'Kashinath Mukherjee', '2022-04-08 07:43:32', '', ''),
(330, '192000233020001', '581', 330, '20.00', 'UD/21-22/010', 6000.00, 4, 'Kashinath Mukherjee', '2022-04-08 07:51:07', '', ''),
(330, '192000233020002', '585', 330, '5.00', 'UD/21-22/016', 3500.00, 4, 'Kashinath Mukherjee', '2022-04-08 07:52:49', '', ''),
(330, '192000233020003', '585', 330, '20.00', 'UD/21-22/014', 4500.00, 4, 'Kashinath Mukherjee', '2022-04-08 07:54:53', '', ''),
(330, '192000233020007', '578', 330, '20.00', 'UD/21-22/036', 11500.00, 4, 'Kashinath Mukherjee', '2022-04-08 07:56:15', '', ''),
(330, '192000233020008', '585', 330, '7.00', 'UD/21-22/009', 4500.00, 4, 'Kashinath Mukherjee', '2022-04-08 07:58:48', '', ''),
(330, '192000233020009', '582', 330, '3.00', 'UD/21-22/003', 500.00, 4, 'Kashinath Mukherjee', '2022-04-08 08:00:39', '', ''),
(330, '192000233020009', '581', 330, '4.00', 'UD/21-22/004', 2000.00, 4, 'Kashinath Mukherjee', '2022-04-08 08:01:25', '', ''),
(330, '192000233020009', '585', 330, '20.00', 'UD/21-22/001', 4000.00, 4, 'Kashinath Mukherjee', '2022-04-08 08:02:23', '', ''),
(330, '192000233020009', '578', 330, '7.00', 'UD/21-22/068', 15000.00, 4, 'Kashinath Mukherjee', '2022-04-08 08:03:25', '', ''),
(330, '192000233020010', '575', 330, '5.00', 'UD/21-22/032', 1500.00, 4, 'Kashinath Mukherjee', '2022-04-08 08:15:48', '', ''),
(330, '192000233020010', '578', 330, '25.00', 'UD/21-22/048', 26000.00, 4, 'Kashinath Mukherjee', '2022-04-08 08:16:52', '', ''),
(330, '192000233020011', '581', 330, '10.00', 'UD/21-22/002', 2000.00, 4, 'Kashinath Mukherjee', '2022-04-08 08:18:46', '', ''),
(330, '192000233020011', '582', 330, '10.00', 'UD/21-22/063', 1000.00, 4, 'Kashinath Mukherjee', '2022-04-08 08:19:30', '', ''),
(330, '192000233020013', '575', 330, '2.00', 'UD/21-22/030', 2500.00, 4, 'Kashinath Mukherjee', '2022-04-08 08:21:35', '', ''),
(330, '192000233020013', '576', 330, '5.00', 'UD/21-22/081', 500.00, 4, 'Kashinath Mukherjee', '2022-04-08 08:22:12', '', ''),
(330, '192000233020014', '575', 330, '15.00', 'UD/21-22/017', 3000.00, 4, 'Kashinath Mukherjee', '2022-04-08 08:23:50', '', ''),
(345, '192000234520001', '547', 345, '54.00', 'SCMF/MID E/01', 15000.00, 4, 'Subhanu Ghosh', '2022-04-08 09:49:40', 'Subhanu Ghosh', '2022-04-08 02:58:21'),
(330, '192000233020015', '576', 330, '15.00', 'UD/21-22/027', 3000.00, 4, 'Kashinath Mukherjee', '2022-04-08 09:54:10', '', ''),
(330, '192000233020016', '585', 330, '10.00', 'UD/21-22/008', 4500.00, 4, 'Kashinath Mukherjee', '2022-04-08 09:55:44', '', ''),
(330, '192000233020017', '582', 330, '25.00', 'UD/21-22/054', 2500.00, 4, 'Kashinath Mukherjee', '2022-04-08 09:56:52', '', ''),
(345, '192000234520018', '540', 345, '16.00', 'SCMF/MID E/02', 15000.00, 4, 'Subhanu Ghosh', '2022-04-08 09:57:20', '', ''),
(330, '192000233020017', '585', 330, '25.00', 'UD/21-22/075', 1000.00, 4, 'Kashinath Mukherjee', '2022-04-08 09:57:51', '', ''),
(330, '192000233020018', '585', 330, '10.00', 'UD/21-22/005', 4500.00, 4, 'Kashinath Mukherjee', '2022-04-08 09:59:22', '', ''),
(330, '192000233020019', '576', 330, '15.00', 'UD/21-22/028', 3000.00, 4, 'Kashinath Mukherjee', '2022-04-08 10:12:12', '', ''),
(330, '192000233020020', '582', 330, '20.00', 'UD/21-22/044', 500.00, 4, 'Kashinath Mukherjee', '2022-04-08 10:13:16', '', ''),
(345, '192000234520003', '528', 345, '18.00', 'SCMF/MID E/04', 20000.00, 4, 'Subhanu Ghosh', '2022-04-08 10:14:44', '', ''),
(330, '192000233020020', '581', 330, '20.00', 'UD/21-22/064', 2000.00, 4, 'Kashinath Mukherjee', '2022-04-08 10:15:08', '', ''),
(330, '192000233020020', '586', 330, '5.00', 'UD/21-22/069', 1000.00, 4, 'Kashinath Mukherjee', '2022-04-08 10:15:54', '', ''),
(330, '192000233020021', '585', 330, '20.00', 'UD/21-22/007', 2000.00, 4, 'Kashinath Mukherjee', '2022-04-08 10:17:00', '', ''),
(330, '192000233020021', '586', 330, '15.00', 'UD/21-22/015', 500.00, 4, 'Kashinath Mukherjee', '2022-04-08 10:17:51', '', ''),
(345, '192000234520007', '547', 345, '68.00', 'SCMF/MID E/05', 15000.00, 4, 'Subhanu Ghosh', '2022-04-08 10:19:43', '', ''),
(345, '192000234520056', '535', 345, '17.00', 'SCMF/MID E/06', 15000.00, 4, 'Subhanu Ghosh', '2022-04-08 10:23:53', '', ''),
(345, '192000234520036', '530', 345, '14.00', 'SCMF/MID E/07', 20000.00, 4, 'Subhanu Ghosh', '2022-04-08 10:26:07', '', ''),
(330, '192000233020021', '580', 330, '5.00', 'UD/21-22/037', 500.00, 4, 'Kashinath Mukherjee', '2022-04-08 10:30:16', '', ''),
(330, '192000233020021', '574', 330, '5.00', 'UD/21-22/057', 4500.00, 4, 'Kashinath Mukherjee', '2022-04-08 10:31:10', '', ''),
(330, '192000233020022', '585', 330, '5.00', 'UD/21-22/006', 6000.00, 4, 'Kashinath Mukherjee', '2022-04-08 10:32:22', '', ''),
(345, '192000234520002', '544', 345, '12.00', 'SCMF/MID E/09', 15000.00, 4, 'Subhanu Ghosh', '2022-04-08 10:33:40', '', ''),
(330, '192000233020023', '580', 330, '7.00', 'UD/21-22/018', 4000.00, 4, 'Kashinath Mukherjee', '2022-04-08 10:36:51', '', ''),
(330, '192000233020023', '573', 330, '15.00', 'UD/21-22/065', 3500.00, 4, 'Kashinath Mukherjee', '2022-04-08 10:38:31', '', ''),
(330, '192000233020024', '575', 330, '10.00', 'UD/21-22/051', 2000.00, 4, 'Kashinath Mukherjee', '2022-04-08 10:39:46', '', ''),
(345, '202100234520006', '545', 345, '33.00', 'SCMF/MID E/10', 15000.00, 4, 'Subhanu Ghosh', '2022-04-08 10:40:23', '', ''),
(330, '192000233020024', '576', 330, '12.00', 'UD/21-22/052', 500.00, 4, 'Kashinath Mukherjee', '2022-04-08 10:40:29', '', ''),
(345, '192000234520067', '542', 345, '22.00', 'SCMF/MID E/11', 15000.00, 4, 'Subhanu Ghosh', '2022-04-08 10:43:36', '', ''),
(345, '192000234520042', '541', 345, '18.00', 'SCMF/MID E/08', 15000.00, 4, 'Subhanu Ghosh', '2022-04-08 10:47:21', '', ''),
(330, '192000233020024', '581', 330, '25.00', 'UD/21-22/053', 500.00, 4, 'Kashinath Mukherjee', '2022-04-08 10:50:14', '', ''),
(330, '192000233020025', '581', 330, '5.00', 'UD/21-22/042', 2000.00, 4, 'Kashinath Mukherjee', '2022-04-08 10:52:27', '', ''),
(330, '192000233020025', '582', 330, '7.00', 'UD/21-22/043', 500.00, 4, 'Kashinath Mukherjee', '2022-04-08 10:54:36', '', ''),
(330, '192000233020025', '578', 330, '3.00', 'UD/21-22/059', 3000.00, 4, 'Kashinath Mukherjee', '2022-04-08 10:55:47', '', ''),
(330, '192000233020026', '578', 330, '15.00', 'UD/21-22/073', 500.00, 4, 'Kashinath Mukherjee', '2022-04-08 11:07:06', '', ''),
(330, '192000233020026', '577', 330, '15.00', 'UD/21-22/082', 3000.00, 4, 'Kashinath Mukherjee', '2022-04-08 11:07:50', '', ''),
(330, '192000233020028', '586', 330, '20.00', 'UD/21-22/029', 4000.00, 4, 'Kashinath Mukherjee', '2022-04-08 11:09:27', '', ''),
(330, '192000233020028', '581', 330, '10.00', 'UD/21-22/040', 500.00, 4, 'Kashinath Mukherjee', '2022-04-08 11:10:09', '', ''),
(330, '192000233020028', '584', 330, '20.00', 'UD/21-22/056', 3000.00, 4, 'Kashinath Mukherjee', '2022-04-08 11:11:05', '', ''),
(330, '192000233020029', '586', 330, '25.00', 'UD/21-22/023', 3500.00, 4, 'Kashinath Mukherjee', '2022-04-08 11:13:02', '', ''),
(330, '192000233020029', '581', 330, '10.00', 'UD/21-22/024', 2500.00, 4, 'Kashinath Mukherjee', '2022-04-08 11:13:46', '', ''),
(330, '192000233020029', '582', 330, '12.00', 'UD/21-22/041', 1000.00, 4, 'Kashinath Mukherjee', '2022-04-08 11:14:36', '', ''),
(330, '192000233020029', '578', 330, '7.00', 'UD/21-22/055', 2000.00, 4, 'Kashinath Mukherjee', '2022-04-08 11:15:24', '', ''),
(330, '192000233020029', '574', 330, '10.00', 'UD/21-22/062', 500.00, 4, 'Kashinath Mukherjee', '2022-04-08 11:16:35', '', ''),
(330, '192000233020029', '580', 330, '5.00', 'UD/21-22/071', 500.00, 4, 'Kashinath Mukherjee', '2022-04-08 11:17:15', '', ''),
(330, '192000233020030', '576', 330, '5.00', 'UD/21-22/039', 4500.00, 4, 'Kashinath Mukherjee', '2022-04-08 11:52:13', '', ''),
(330, '192000233020032', '575', 330, '10.00', 'UD/21-22/031', 3500.00, 4, 'Kashinath Mukherjee', '2022-04-08 11:53:21', '', ''),
(330, '192000233020033', '580', 330, '10.00', 'UD/21-22/020', 3000.00, 4, 'Kashinath Mukherjee', '2022-04-08 11:54:36', '', ''),
(330, '192000233020033', '582', 330, '10.00', 'UD/21-22/021', 1500.00, 4, 'Kashinath Mukherjee', '2022-04-08 11:57:01', '', ''),
(330, '192000233020033', '581', 330, '12.00', 'UD/21-22/022', 1000.00, 4, 'Kashinath Mukherjee', '2022-04-08 11:58:04', '', ''),
(330, '192000633020001', '587', 330, '5.00', 'UD/21-22/013', 4500.00, 4, 'Kashinath Mukherjee', '2022-04-08 11:59:35', '', ''),
(345, '192000334520002', '540', 345, '15.00', 'SCMF/MID E/03', 10000.00, 4, 'Subhanu Ghosh', '2022-04-08 03:03:56', '', ''),
(345, '202100234520005', '539', 345, '7.00', 'SCMF/MID E/12', 15000.00, 4, 'Subhanu Ghosh', '2022-04-08 03:32:19', '', ''),
(345, '202100234520004', '529', 345, '14.00', 'SCMF/MID E/13', 15000.00, 4, 'Subhanu Ghosh', '2022-04-08 03:35:55', '', ''),
(345, '192000234520043', '530', 345, '15.00', 'SCMF/MID E/14', 15000.00, 4, 'Subhanu Ghosh', '2022-04-08 03:40:00', '', ''),
(345, '192000234520023', '536', 345, '2.00', 'SCMF/MID E/15', 25000.00, 4, 'Subhanu Ghosh', '2022-04-08 03:42:44', '', ''),
(345, '192000234520004', '528', 345, '5.00', 'SCMF/MID E/16', 14000.00, 4, 'Subhanu Ghosh', '2022-04-08 03:46:24', '', ''),
(345, '192000234520053', '549', 345, '35.00', 'SCMF/MID E/17', 10000.00, 4, 'Subhanu Ghosh', '2022-04-09 05:37:01', '', ''),
(345, '192000234520068', '535', 345, '50.00', 'SCMF/MID E/18', 25000.00, 4, 'Subhanu Ghosh', '2022-04-09 05:38:48', '', ''),
(345, '202200234520003', '546', 345, '16.00', 'SCMF/MID E/21', 20000.00, 4, 'Subhanu Ghosh', '2022-04-09 05:41:07', '', ''),
(345, '192000234520066', '541', 345, '62.00', 'SCMF/MID E/22', 5000.00, 4, 'Subhanu Ghosh', '2022-04-09 05:42:57', '', ''),
(345, '192000234520034', '536', 345, '49.00', 'SCMF/MID E/23', 10000.00, 4, 'Subhanu Ghosh', '2022-04-09 05:44:37', '', ''),
(345, '202200234520001', '535', 345, '31.00', 'SCMF/MID E/24', 10000.00, 4, 'Subhanu Ghosh', '2022-04-09 05:47:08', '', ''),
(345, '202100234520002', '534', 345, '45.00', 'SCMF/MID E/26', 15000.00, 4, 'Subhanu Ghosh', '2022-04-09 05:51:31', '', ''),
(345, '192000234520064', '544', 345, '7.00', 'SCMF/MID E/27', 10000.00, 4, 'Subhanu Ghosh', '2022-04-09 05:56:33', '', ''),
(345, '192000634520033', '549', 345, '10.00', 'SCMF/MID E/28', 10000.00, 4, 'Subhanu Ghosh', '2022-04-09 05:57:54', '', ''),
(345, '192000234520020', '532', 345, '12.00', 'SCMF/MID E/31', 10000.00, 4, 'Subhanu Ghosh', '2022-04-09 06:00:38', '', ''),
(345, '202100234520009', '548', 345, '10.00', 'SCMF/MID E/43', 5000.00, 4, 'Subhanu Ghosh', '2022-04-09 06:02:13', '', ''),
(345, '192000234520008', '538', 345, '15.00', 'SCMF/MID E/44', 10000.00, 4, 'Subhanu Ghosh', '2022-04-09 06:04:04', '', ''),
(345, '202100634520011', '539', 345, '47.00', 'SCMF/MID E/51', 10000.00, 4, 'Subhanu Ghosh', '2022-04-09 06:05:49', '', ''),
(330, '192000633020002', '576', 330, '10.00', 'UD/21-22/078', 500.00, 4, 'Kashinath Mukherjee', '2022-04-11 06:58:25', '', ''),
(330, '192000633020002', '575', 330, '12.00', 'UD/21-22/079', 500.00, 4, 'Kashinath Mukherjee', '2022-04-11 06:59:16', '', ''),
(330, '192000633020008', '582', 330, '5.00', 'UD/21-22/047', 500.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:00:53', '', ''),
(330, '192000633020008', '581', 330, '15.00', 'UD/21-22/076', 1500.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:01:42', '', ''),
(330, '192000633020013', '578', 330, '15.00', 'UD/21-22/061', 7000.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:03:23', '', ''),
(330, '192000633020013', '577', 330, '15.00', 'UD/21-22/083', 10500.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:04:03', '', ''),
(330, '192000633020015', '573', 330, '15.00', 'UD/21-22/045', 2500.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:05:15', '', ''),
(330, '192000633020015', '582', 330, '20.00', 'UD/21-22/046', 3000.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:06:07', '', ''),
(330, '192000633020016', '575', 330, '10.00', 'UD/21-22/034', 2500.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:07:34', '', ''),
(330, '192000633020017', '576', 330, '5.00', 'UD/21-22/038', 3000.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:08:32', '', ''),
(330, '202100233020003', '576', 330, '5.00', 'UD/21-22/049', 2500.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:09:41', '', ''),
(330, '202100233020003', '582', 330, '25.00', 'UD/21-22/050', 500.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:10:21', '', ''),
(330, '202100233020003', '578', 330, '22.00', 'UD/21-22/072', 9500.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:10:59', '', ''),
(330, '202100233020005', '575', 330, '10.00', 'UD/21-22/033', 3500.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:12:16', '', ''),
(330, '202100233020006', '587', 330, '15.00', 'UD/21-22/012', 6000.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:13:17', '', ''),
(330, '202100233020009', '587', 330, '15.00', 'UD/21-22/011', 5500.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:14:15', '', ''),
(330, '202100233020010', '580', 330, '10.00', 'UD/21-22/019', 2500.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:15:30', '', ''),
(330, '202100233020010', '586', 330, '20.00', 'UD/21-22/035', 2500.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:16:37', '', ''),
(330, '202100233020010', '585', 330, '25.00', 'UD/21-22/060', 2000.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:20:11', '', ''),
(330, '202100233020010', '582', 330, '10.00', 'UD/21-22/066', 1000.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:21:43', '', ''),
(330, '202100233020010', '581', 330, '10.00', 'UD/21-22/067', 500.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:23:30', '', ''),
(330, '202200233020001', '586', 330, '15.00', 'UD/21-22/025', 1500.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:29:33', '', ''),
(330, '202200233020001', '581', 330, '5.00', 'UD/21-22/026', 2500.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:30:15', '', ''),
(330, '202200233020001', '578', 330, '10.00', 'UD/21-22/058', 500.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:30:51', '', ''),
(330, '202200233020002', '587', 330, '15.00', 'UD/21-22/074', 3000.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:31:51', '', ''),
(330, '202200233020003', '585', 330, '5.00', 'UD/21-22/077', 2500.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:32:49', '', ''),
(330, '202200233020004', '576', 330, '10.00', 'UD/21-22/080', 1000.00, 4, 'Kashinath Mukherjee', '2022-04-11 07:33:54', '', ''),
(333, '192000233320029', '325', 333, '75.00', 'SCMF/MSD/21-22/1', 10000.00, 4, 'Subhro Das', '2022-04-11 08:07:13', '', ''),
(332, '202100233220002', '300', 332, '7.00', 'SCMF/MLD/001', 7500.00, 4, 'Ishan Banik', '2022-04-11 08:15:23', '', ''),
(332, '202100233220002', '314', 332, '7.00', 'SCMF/MLD/002', 6000.00, 4, 'Ishan Banik', '2022-04-11 08:16:07', '', ''),
(332, '192000233220001', '295', 332, '25.00', 'SCMF/MLD/003', 6000.00, 4, 'Ishan Banik', '2022-04-11 08:20:41', '', ''),
(332, '192000233220001', '302', 332, '22.00', 'SCMF/MLD/004', 6000.00, 4, 'Ishan Banik', '2022-04-11 08:23:14', '', ''),
(332, '192000233220007', '293', 332, '14.00', 'SCMF/MLD/005', 14000.00, 4, 'Ishan Banik', '2022-04-11 08:25:31', '', ''),
(332, '192000233220007', '298', 332, '14.00', 'SCMF/MLD/028', 2000.00, 4, 'Ishan Banik', '2022-04-11 08:31:51', '', ''),
(332, '192000233220010', '300', 332, '4.00', 'SCMF/MLD/006', 8000.00, 4, 'Ishan Banik', '2022-04-11 08:33:58', '', ''),
(332, '192000233220010', '314', 332, '4.00', 'SCMF/MLD/007', 8000.00, 4, 'Ishan Banik', '2022-04-11 08:34:40', '', ''),
(332, '202100233220004', '297', 332, '8.00', 'SCMF/MLD/008', 8000.00, 4, 'Ishan Banik', '2022-04-11 08:37:12', '', ''),
(332, '202100233220004', '299', 332, '5.00', 'SCMF/MLD/009', 9000.00, 4, 'Ishan Banik', '2022-04-11 08:38:09', '', ''),
(332, '202100233220001', '308', 332, '3.00', 'SCMF/MLD/010', 4000.00, 4, 'Ishan Banik', '2022-04-11 10:30:44', '', ''),
(332, '202100233220001', '309', 332, '2.00', 'SCMF/MLD/011', 11000.00, 4, 'Ishan Banik', '2022-04-11 10:31:26', '', ''),
(332, '192000233220024', '300', 332, '13.00', 'SCMF/MLD/012', 9000.00, 4, 'Ishan Banik', '2022-04-11 10:47:46', '', ''),
(332, '192000233220024', '311', 332, '12.00', 'SCMF/MLD/013', 7500.00, 4, 'Ishan Banik', '2022-04-11 10:48:32', '', ''),
(332, '192000233220004', '299', 332, '12.00', 'SCMF/MLD/025', 6000.00, 4, 'Ishan Banik', '2022-04-11 11:27:59', '', ''),
(332, '192000233220004', '309', 332, '8.00', 'SCMF/MLD/026', 4000.00, 4, 'Ishan Banik', '2022-04-11 11:28:34', '', ''),
(332, '192000233220002', '313', 332, '2.00', 'SCMF/MLD/014', 8000.00, 4, 'Ishan Banik', '2022-04-11 11:29:23', '', ''),
(332, '192000233220002', '293', 332, '2.00', 'SCMF/MLD/015', 7000.00, 4, 'Ishan Banik', '2022-04-11 11:29:59', '', ''),
(332, '192000233220008', '307', 332, '20.00', 'SCMF/MLD/016', 12000.00, 4, 'Ishan Banik', '2022-04-11 11:30:40', '', ''),
(332, '192000233220017', '301', 332, '10.00', 'SCMF/MLD/017', 13000.00, 4, 'Ishan Banik', '2022-04-11 11:31:25', '', ''),
(332, '192000233220018', '303', 332, '7.00', 'SCMF/MLD/018', 8000.00, 4, 'Ishan Banik', '2022-04-11 11:32:58', '', ''),
(332, '192000233220018', '312', 332, '7.00', 'SCMF/MLD/019', 9000.00, 4, 'Ishan Banik', '2022-04-11 11:34:57', '', ''),
(332, '192000233220020', '294', 332, '20.00', 'SCMF/MLD/020', 8000.00, 4, 'Ishan Banik', '2022-04-11 11:35:41', '', ''),
(332, '192000233220020', '296', 332, '13.00', 'SCMF/MLD/021', 6000.00, 4, 'Ishan Banik', '2022-04-11 11:36:14', '', ''),
(332, '192000233220013', '294', 332, '2.00', 'SCMF/MLD/022', 12000.00, 4, 'Ishan Banik', '2022-04-11 11:36:59', '', ''),
(332, '192000233220003', '303', 332, '6.00', 'SCMF/MLD/023', 10000.00, 4, 'Ishan Banik', '2022-04-11 11:39:39', '', ''),
(332, '192000233220003', '312', 332, '6.00', 'SCMF/MLD/024', 6000.00, 4, 'Ishan Banik', '2022-04-11 11:41:36', '', ''),
(338, '192000233820050', '200', 338, '36.00', '06', 20000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:01:44', 'Bidyut Bhushan Sadhu', '2022-04-18 07:24:35'),
(338, '192000233820030', '200', 338, '26.00', '07', 18000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:03:12', 'Bidyut Bhushan Sadhu', '2022-04-18 07:19:12'),
(338, '192000233820052', '200', 338, '38.00', '08', 20000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:04:34', 'Bidyut Bhushan Sadhu', '2022-04-18 07:25:05'),
(338, '192000233820009', '200', 338, '25.00', '09', 25000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:05:47', 'Bidyut Bhushan Sadhu', '2022-04-18 07:14:02'),
(338, '192000233820042', '200', 338, '25.00', '11', 20000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:06:47', 'Bidyut Bhushan Sadhu', '2022-04-18 07:22:31'),
(338, '202100233820006', '200', 338, '44.00', '12', 20000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:07:39', 'Bidyut Bhushan Sadhu', '2022-04-18 07:28:15'),
(338, '202200233820002', '200', 338, '52.00', '10', 4000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:09:28', 'Bidyut Bhushan Sadhu', '2022-04-18 07:28:32'),
(338, '192000233820032', '200', 338, '21.00', '13', 16000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:15:38', 'Bidyut Bhushan Sadhu', '2022-04-18 07:19:32'),
(338, '192000233820004', '167', 338, '2.00', '14', 30000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:16:28', 'Bidyut Bhushan Sadhu', '2022-04-18 07:12:32'),
(338, '192000233820005', '167', 338, '15.00', '15', 25000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:17:29', 'Bidyut Bhushan Sadhu', '2022-04-18 07:13:02'),
(338, '192000233820053', '167', 338, '23.00', '34', 10000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:18:25', 'Bidyut Bhushan Sadhu', '2022-04-18 07:25:20'),
(338, '202200233820010', '167', 338, '25.00', '77', 4000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:19:21', 'Bidyut Bhushan Sadhu', '2022-04-18 07:30:01'),
(338, '192000233820035', '167', 338, '30.00', '78', 6000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:20:41', 'Bidyut Bhushan Sadhu', '2022-04-18 07:21:12'),
(338, '192000233820001', '167', 338, '45.00', '79', 8000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:21:22', 'Bidyut Bhushan Sadhu', '2022-04-18 07:11:38'),
(338, '192000233820007', '232', 338, '9.00', '24', 15000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:28:04', 'Bidyut Bhushan Sadhu', '2022-04-18 07:13:35'),
(338, '192000233820008', '232', 338, '13.00', '25', 20000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:29:30', 'Bidyut Bhushan Sadhu', '2022-04-18 07:13:50'),
(338, '202200233820005', '232', 338, '6.00', '39', 10000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:31:24', 'Bidyut Bhushan Sadhu', '2022-04-18 07:29:10'),
(338, '202200233820004', '232', 338, '10.00', '40', 6000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:32:10', 'Bidyut Bhushan Sadhu', '2022-04-18 07:28:57'),
(338, '192000233820051', '232', 338, '9.00', '41', 8000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:33:03', 'Bidyut Bhushan Sadhu', '2022-04-18 07:24:48'),
(338, '192000233820038', '209', 338, '30.00', '18', 12000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:38:40', 'Bidyut Bhushan Sadhu', '2022-04-18 07:21:51'),
(338, '192000233820034', '209', 338, '1.00', '71', 18000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:39:44', 'Bidyut Bhushan Sadhu', '2022-04-18 07:20:06'),
(338, '192000233820006', '169', 338, '14.00', '21', 30000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:40:28', 'Bidyut Bhushan Sadhu', '2022-04-18 07:13:23'),
(338, '192000233820048', '169', 338, '8.00', '56', 12000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:41:59', 'Bidyut Bhushan Sadhu', '2022-04-18 07:24:22'),
(338, '192000233820002', '174', 338, '44.00', '37', 10000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:44:14', 'Bidyut Bhushan Sadhu', '2022-04-18 07:11:47'),
(338, '192000233820054', '174', 338, '15.00', '27', 10000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:45:03', 'Bidyut Bhushan Sadhu', '2022-04-18 07:25:37'),
(338, '192000233820018', '174', 338, '34.00', '49', 10000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:45:52', 'Bidyut Bhushan Sadhu', '2022-04-18 07:17:09'),
(338, '192000233820019', '186', 338, '22.00', '28', 20000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:46:49', 'Bidyut Bhushan Sadhu', '2022-04-18 07:17:25'),
(338, '192000233820002', '186', 338, '46.00', '36', 10000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:48:09', 'Bidyut Bhushan Sadhu', '2022-04-18 07:11:57'),
(338, '192000233820004', '235', 338, '12.00', '16', 30000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:55:22', 'Bidyut Bhushan Sadhu', '2022-04-18 07:12:44'),
(338, '192000233820005', '235', 338, '10.00', '17', 20000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:55:54', 'Bidyut Bhushan Sadhu', '2022-04-18 07:13:12'),
(338, '192000233820040', '235', 338, '12.00', '20', 10000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 07:56:25', 'Bidyut Bhushan Sadhu', '2022-04-18 07:22:07'),
(338, '192000233820012', '188', 338, '55.00', '53', 20000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:03:50', 'Bidyut Bhushan Sadhu', '2022-04-18 07:14:42'),
(338, '192000233820013', '188', 338, '9.00', '54', 20000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:04:22', 'Bidyut Bhushan Sadhu', '2022-04-18 07:15:59'),
(338, '192000333820004', '188', 338, '19.00', '61', 18000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:05:09', 'Bidyut Bhushan Sadhu', '2022-04-18 07:26:43'),
(338, '202200233820009', '188', 338, '23.00', '76', 10000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:05:57', 'Bidyut Bhushan Sadhu', '2022-04-18 07:29:45'),
(338, '192000233820025', '156', 338, '25.00', '32', 12000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:08:42', 'Bidyut Bhushan Sadhu', '2022-04-18 07:18:26'),
(338, '192000233820024', '156', 338, '32.00', '35', 10000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:09:33', 'Bidyut Bhushan Sadhu', '2022-04-18 07:18:13'),
(338, '192000233820035', '156', 338, '23.00', '48', 8000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:10:22', 'Bidyut Bhushan Sadhu', '2022-04-18 07:20:16'),
(332, '192000233220013', '304', 332, '4.00', 'SCMF/MLD/027', 2000.00, 4, 'Ishan Banik', '2022-04-12 08:10:46', '', ''),
(338, '192000233820010', '193', 338, '46.00', '59', 15000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:12:23', 'Bidyut Bhushan Sadhu', '2022-04-18 07:14:15'),
(338, '192000233820013', '185', 338, '13.00', '60', 15000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:13:12', 'Bidyut Bhushan Sadhu', '2022-04-18 07:15:46'),
(338, '202100233820004', '185', 338, '11.00', '72', 8000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:13:56', 'Bidyut Bhushan Sadhu', '2022-04-18 07:27:49'),
(338, '192000233820017', '158', 338, '28.00', '51', 12000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:26:36', 'Bidyut Bhushan Sadhu', '2022-04-18 07:16:43'),
(338, '192000233820015', '158', 338, '20.00', '68', 12000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:27:30', 'Bidyut Bhushan Sadhu', '2022-04-18 07:16:28'),
(338, '202200233820006', '174', 338, '1.00', '62', 3000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:28:20', 'Bidyut Bhushan Sadhu', '2022-04-18 07:29:22'),
(338, '192000233820059', '171', 338, '17.00', '46', 5000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:29:01', 'Bidyut Bhushan Sadhu', '2022-04-18 07:25:56'),
(338, '192000233820014', '162', 338, '34.00', '29', 35000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:33:04', 'Bidyut Bhushan Sadhu', '2022-04-18 07:16:13'),
(338, '202200233820007', '160', 338, '64.00', '64', 6000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:33:55', 'Bidyut Bhushan Sadhu', '2022-04-18 07:29:34'),
(338, '192000233820033', '228', 338, '28.00', '30', 12000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:34:48', 'Bidyut Bhushan Sadhu', '2022-04-18 07:19:45'),
(338, '192000233820023', '228', 338, '44.00', '33', 10000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:35:31', 'Bidyut Bhushan Sadhu', '2022-04-18 07:18:02'),
(338, '192000333820004', '152', 338, '7.00', '73', 16000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:36:10', 'Bidyut Bhushan Sadhu', '2022-04-18 07:26:27'),
(338, '192000233820013', '161', 338, '10.00', '74', 25000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:36:46', 'Bidyut Bhushan Sadhu', '2022-04-18 07:14:55'),
(338, '192000133820008', '161', 338, '35.00', '70', 10000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:37:21', 'Bidyut Bhushan Sadhu', '2022-04-18 08:16:26');
INSERT INTO `md_soc_mill` (`branch_id`, `soc_id`, `mill_id`, `dist`, `distance`, `reg_no`, `target`, `kms_id`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(338, '192000233820013', '182', 338, '14.00', '55', 25000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:41:28', 'Bidyut Bhushan Sadhu', '2022-04-18 07:15:24'),
(338, '192000233820029', '182', 338, '38.00', '43', 7000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:42:52', 'Bidyut Bhushan Sadhu', '2022-04-18 07:18:59'),
(338, '192000233820022', '182', 338, '53.00', '45', 10000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:44:33', 'Bidyut Bhushan Sadhu', '2022-04-18 07:17:51'),
(338, '192000233820020', '182', 338, '50.00', '42', 10000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:45:18', 'Bidyut Bhushan Sadhu', '2022-04-18 07:17:39'),
(338, '202100233820004', '182', 338, '7.00', '63', 20000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:46:42', 'Bidyut Bhushan Sadhu', '2022-04-18 07:27:22'),
(338, '202100233820005', '159', 338, '15.00', '57', 2000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:48:24', 'Bidyut Bhushan Sadhu', '2022-04-18 07:28:01'),
(338, '192000233820011', '214', 338, '55.00', '44', 20000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 08:55:11', 'Bidyut Bhushan Sadhu', '2022-04-18 07:14:27'),
(338, '192000233820013', '178', 338, '20.00', '65', 25000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 09:02:14', 'Bidyut Bhushan Sadhu', '2022-04-18 07:15:06'),
(338, '192000133820005', '178', 338, '28.00', '67', 25000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 09:03:05', 'Bidyut Bhushan Sadhu', '2022-04-18 07:08:31'),
(338, '192000233820046', '163', 338, '22.00', '52', 15000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 09:04:03', 'Bidyut Bhushan Sadhu', '2022-04-18 07:24:06'),
(338, '192000233820027', '224', 338, '27.00', '47', 16000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 09:05:01', 'Bidyut Bhushan Sadhu', '2022-04-18 07:18:41'),
(338, '192000333820010', '214', 338, '4.00', '50', 10000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 09:07:07', 'Bidyut Bhushan Sadhu', '2022-04-18 07:26:55'),
(338, '192000233820036', '194', 338, '34.00', '01', 25000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 09:39:15', 'Bidyut Bhushan Sadhu', '2022-04-18 07:21:39'),
(338, '192000233820044', '194', 338, '63.00', '2', 20000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 09:40:14', 'Bidyut Bhushan Sadhu', '2022-04-18 07:22:51'),
(338, '192000233820003', '194', 338, '94.00', '04', 25000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 09:40:57', 'Bidyut Bhushan Sadhu', '2022-04-18 07:12:21'),
(338, '192000233820041', '194', 338, '16.00', '05', 15000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 09:41:41', 'Bidyut Bhushan Sadhu', '2022-04-18 07:22:21'),
(338, '202200233820003', '194', 338, '25.00', '19', 22000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 09:42:46', 'Bidyut Bhushan Sadhu', '2022-04-18 07:28:44'),
(338, '192000233820045', '194', 338, '25.00', '38', 25000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 09:45:23', 'Bidyut Bhushan Sadhu', '2022-04-18 07:23:55'),
(338, '202100233820003', '194', 338, '39.00', '31', 20000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-12 09:57:02', 'Bidyut Bhushan Sadhu', '2022-04-18 07:27:09'),
(348, '192000234820004', '283', 348, '15.00', 'SCMF/JGM/0003', 20000.00, 4, 'Aparajita Samanta', '2022-04-13 10:24:51', '', ''),
(348, '192000234820005', '280', 348, '19.00', 'SCMF/JGM/0002', 7000.00, 4, 'Aparajita Samanta', '2022-04-13 10:26:27', '', ''),
(348, '192000234820005', '277', 348, '18.00', 'SCMF/JGM/0001', 4500.00, 4, 'Aparajita Samanta', '2022-04-13 10:28:03', '', ''),
(348, '192000234820005', '284', 348, '19.00', 'SCMF/JGM/0006', 7000.00, 4, 'Aparajita Samanta', '2022-04-13 10:29:16', '', ''),
(348, '192000234820005', '282', 348, '20.00', 'SCMF/JGM/0005', 12000.00, 4, 'Aparajita Samanta', '2022-04-13 10:30:28', '', ''),
(338, '192000233820026', '194', 338, '38.00', '26', 10000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-18 11:22:29', '', ''),
(338, '202200233820008', '194', 338, '50.00', '75', 10000.00, 4, 'Bidyut Bhushan Sadhu', '2022-04-18 11:30:01', '', ''),
(329, '192000232920001', '116', 329, '0.00', 'SCMFCOB001', 11500.00, 4, 'Koushik Chakraborty', '2022-04-19 07:31:25', '', ''),
(329, '192000232920001', '120', 329, '0.00', 'SCMFCOB023', 7500.00, 4, 'Koushik Chakraborty', '2022-04-19 07:32:45', '', ''),
(329, '192000232920002', '114', 329, '0.00', 'SCMFCOB004', 4500.00, 4, 'Koushik Chakraborty', '2022-04-19 07:33:22', '', ''),
(329, '192000232920002', '121', 329, '0.00', 'SCMFCOB018', 4500.00, 4, 'Koushik Chakraborty', '2022-04-19 07:34:13', '', ''),
(329, '192000232920003', '114', 329, '0.00', 'SCMFCOB002', 4500.00, 4, 'Koushik Chakraborty', '2022-04-19 07:34:51', '', ''),
(329, '192000232920003', '118', 329, '0.00', 'SCMFCOB010', 7500.00, 4, 'Koushik Chakraborty', '2022-04-19 07:35:39', '', ''),
(329, '192000232920004', '120', 329, '0.00', 'SCMFCOB024', 4500.00, 4, 'Koushik Chakraborty', '2022-04-19 07:38:10', '', ''),
(329, '192000232920005', '116', 329, '0.00', 'SCMFCOB029', 5000.00, 4, 'Koushik Chakraborty', '2022-04-19 07:38:49', '', ''),
(329, '192000232920006', '121', 329, '0.00', 'SCMFCOB016', 9000.00, 4, 'Koushik Chakraborty', '2022-04-19 07:39:18', '', ''),
(329, '192000232920006', '120', 329, '0.00', 'SCMFCOB014', 6500.00, 4, 'Koushik Chakraborty', '2022-04-19 07:40:06', '', ''),
(329, '192000232920007', '121', 329, '0.00', 'SCMFCOB017', 7500.00, 4, 'Koushik Chakraborty', '2022-04-19 07:43:14', '', ''),
(329, '192000232920007', '116', 329, '0.00', 'SCMFCOB021', 6500.00, 4, 'Koushik Chakraborty', '2022-04-19 07:44:46', '', ''),
(329, '192000232920008', '119', 329, '0.00', 'SCMFCOB012', 6500.00, 4, 'Koushik Chakraborty', '2022-04-19 07:45:54', '', ''),
(329, '192000232920008', '118', 329, '0.00', 'SCMFCOB008', 6500.00, 4, 'Koushik Chakraborty', '2022-04-19 07:46:27', '', ''),
(329, '192000232920009', '115', 329, '0.00', 'SCMFCOB006', 3500.00, 4, 'Koushik Chakraborty', '2022-04-19 07:47:03', '', ''),
(329, '192000232920010', '115', 329, '0.00', 'SCMFCOB026', 4500.00, 4, 'Koushik Chakraborty', '2022-04-19 07:52:07', '', ''),
(329, '192000232920011', '117', 329, '0.00', 'SCMFCOB025', 4000.00, 4, 'Koushik Chakraborty', '2022-04-19 07:52:49', '', ''),
(329, '192000232920012', '117', 329, '0.00', 'SCMFCOB022', 6500.00, 4, 'Koushik Chakraborty', '2022-04-19 07:53:30', '', ''),
(329, '192000232920013', '122', 329, '0.00', 'SCMFCOB019', 7500.00, 4, 'Koushik Chakraborty', '2022-04-19 07:54:05', '', ''),
(329, '192000232920015', '119', 329, '0.00', 'SCMFCOB013', 9500.00, 4, 'Koushik Chakraborty', '2022-04-19 07:56:09', '', ''),
(329, '192000232920015', '118', 329, '0.00', 'SCMFCOB011', 6500.00, 4, 'Koushik Chakraborty', '2022-04-19 07:56:49', '', ''),
(329, '192000232920017', '115', 329, '0.00', 'SCMFCOB005', 4000.00, 4, 'Koushik Chakraborty', '2022-04-19 07:57:32', '', ''),
(329, '192000232920018', '120', 329, '0.00', 'SCMFCOB015', 3500.00, 4, 'Koushik Chakraborty', '2022-04-19 07:58:37', '', ''),
(329, '192000232920020', '118', 329, '0.00', 'SCMFCOB009', 4000.00, 4, 'Koushik Chakraborty', '2022-04-19 07:59:23', '', ''),
(329, '202100232920001', '114', 329, '0.00', 'SCMFCOB003', 5000.00, 4, 'Koushik Chakraborty', '2022-04-19 08:00:15', '', ''),
(329, '202100232920001', '117', 329, '0.00', 'SCMFCOB007', 4500.00, 4, 'Koushik Chakraborty', '2022-04-19 08:01:06', '', ''),
(339, '192000233920005', '31', 339, '0.00', 'SCMF/BNK/21-22/001', 4000.00, 4, 'Kalyan Biswas', '2022-04-19 04:21:59', '', ''),
(339, '192000233920005', '43', 339, '0.00', 'SCMF/BNK/21-22/001A', 4000.00, 4, 'Kalyan Biswas', '2022-04-19 04:22:39', '', ''),
(339, '192000233920013', '41', 339, '0.00', 'SCMF/BNK/21-22/002', 4000.00, 4, 'Kalyan Biswas', '2022-04-19 04:23:15', '', ''),
(339, '192000233920046', '46', 339, '0.00', 'SCMF/BNK/21-22/003', 4000.00, 4, 'Kalyan Biswas', '2022-04-19 04:23:47', '', ''),
(339, '192000233920046', '47', 339, '0.00', 'SCMF/BNK/21-22/003A', 4000.00, 4, 'Kalyan Biswas', '2022-04-19 04:24:10', '', ''),
(339, '192000233920022', '41', 339, '0.00', 'SCMF/BNK/21-22/004', 6000.00, 4, 'Kalyan Biswas', '2022-04-19 04:24:51', '', ''),
(339, '192000233920004', '41', 339, '0.00', 'SCMF/BNK/21-22/005', 6000.00, 4, 'Kalyan Biswas', '2022-04-19 04:25:17', '', ''),
(339, '192000233920036', '26', 339, '0.00', 'SCMF/BNK/21-22/006', 500.00, 4, 'Kalyan Biswas', '2022-04-19 04:26:09', '', ''),
(339, '192000233920036', '30', 339, '0.00', 'SCMF/BNK/21-22/006A', 500.00, 4, 'Kalyan Biswas', '2022-04-19 04:26:29', '', ''),
(339, '192000233920036', '56', 339, '0.00', 'SCMF/BNK/21-22/006B', 6000.00, 4, 'Kalyan Biswas', '2022-04-19 04:27:01', '', ''),
(339, '202100233920004', '26', 339, '0.00', 'SCMF/BNK/21-22/007', 4000.00, 4, 'Kalyan Biswas', '2022-04-19 04:27:35', '', ''),
(339, '202100233920004', '30', 339, '0.00', 'SCMF/BNK/21-22/007A', 4000.00, 4, 'Kalyan Biswas', '2022-04-19 04:28:01', '', ''),
(339, '202100233920004', '36', 339, '0.00', 'SCMF/BNK/21-22/007B', 3000.00, 4, 'Kalyan Biswas', '2022-04-19 04:28:29', '', ''),
(339, '192000233920033', '26', 339, '0.00', 'SCMF/BNK/21-22/008', 4000.00, 4, 'Kalyan Biswas', '2022-04-19 04:29:07', '', ''),
(339, '192000233920033', '30', 339, '0.00', 'SCMF/BNK/21-22/008A', 4000.00, 4, 'Kalyan Biswas', '2022-04-19 04:29:25', '', ''),
(339, '192000233920050', '35', 339, '0.00', 'SCMF/BNK/21-22/009', 4000.00, 4, 'Kalyan Biswas', '2022-04-19 04:29:55', '', ''),
(339, '192000233920050', '47', 339, '0.00', 'SCMF/BNK/21-22/009A', 4000.00, 4, 'Kalyan Biswas', '2022-04-19 04:30:15', '', ''),
(339, '192000233920051', '47', 339, '0.00', 'SCMF/BNK/21-22/010', 3000.00, 4, 'Kalyan Biswas', '2022-04-19 04:30:51', '', ''),
(339, '192000233920032', '47', 339, '0.00', 'SCMF/BNK/21-22/011', 4000.00, 4, 'Kalyan Biswas', '2022-04-19 04:31:21', '', ''),
(339, '192000233920032', '35', 339, '0.00', 'SCMF/BNK/21-22/011A', 4000.00, 4, 'Kalyan Biswas', '2022-04-19 04:31:38', '', ''),
(339, '192000233920024', '29', 339, '0.00', 'SCMF/BNK/21-22/012', 4000.00, 4, 'Kalyan Biswas', '2022-04-19 04:32:32', '', ''),
(339, '192000233920024', '28', 339, '0.00', 'SCMF/BNK/21-22/012A', 4000.00, 4, 'Kalyan Biswas', '2022-04-19 04:32:54', '', ''),
(339, '192000233920048', '42', 339, '0.00', 'SCMF/BNK/21-22/013', 4000.00, 4, 'Kalyan Biswas', '2022-04-19 04:33:33', '', ''),
(339, '192000233920048', '48', 339, '0.00', 'SCMF/BNK/21-22/013A', 4000.00, 4, 'Kalyan Biswas', '2022-04-19 04:34:00', '', ''),
(339, '192000233920018', '31', 339, '0.00', 'SCMF/BNK/21-22/014', 4000.00, 4, 'Kalyan Biswas', '2022-04-19 04:34:33', '', ''),
(339, '192000233920018', '43', 339, '0.00', 'SCMF/BNK/21-22/014A', 4000.00, 4, 'Kalyan Biswas', '2022-04-19 04:35:09', '', ''),
(339, '192000633920027', '42', 339, '0.00', 'SCMF/BNK/21-22/015', 4000.00, 4, 'Kalyan Biswas', '2022-04-19 04:35:39', '', ''),
(339, '202100233920007', '40', 339, '0.00', 'SCMF/BNK/21-22/016', 3000.00, 4, 'Kalyan Biswas', '2022-04-19 04:36:20', '', ''),
(339, '202100233920006', '41', 339, '0.00', 'SCMF/BNK/21-22/017', 5000.00, 4, 'Kalyan Biswas', '2022-04-19 04:36:58', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `md_soc_mill_bk`
--

CREATE TABLE `md_soc_mill_bk` (
  `branch_id` int(11) NOT NULL,
  `soc_id` varchar(20) CHARACTER SET latin1 NOT NULL,
  `mill_id` varchar(20) CHARACTER SET latin1 NOT NULL,
  `dist` int(11) NOT NULL,
  `distance` int(11) NOT NULL,
  `reg_no` varchar(30) CHARACTER SET latin1 NOT NULL,
  `target` double(10,2) NOT NULL,
  `kms_id` int(11) NOT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 NOT NULL,
  `created_dt` varchar(50) CHARACTER SET latin1 NOT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 NOT NULL,
  `modified_dt` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `md_tds_rate`
--

CREATE TABLE `md_tds_rate` (
  `effective_date` date NOT NULL,
  `charge_head` int(11) NOT NULL,
  `tds_rate` decimal(6,2) NOT NULL,
  `prop_tds_rate` decimal(6,2) NOT NULL DEFAULT 0.00,
  `created_by` varchar(100) DEFAULT NULL,
  `created_dt` date DEFAULT NULL,
  `modified_by` varchar(100) DEFAULT NULL,
  `modified_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `md_tds_rate`
--

INSERT INTO `md_tds_rate` (`effective_date`, `charge_head`, `tds_rate`, `prop_tds_rate`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
('2020-04-01', 1, '0.00', '0.00', NULL, NULL, NULL, NULL),
('2020-04-01', 2, '1.50', '1.00', NULL, NULL, NULL, NULL),
('2020-04-01', 3, '1.50', '1.00', NULL, NULL, NULL, NULL),
('2020-04-01', 4, '1.50', '1.00', NULL, NULL, NULL, NULL),
('2020-04-01', 5, '1.50', '1.00', NULL, NULL, NULL, NULL),
('2020-04-01', 6, '1.50', '1.00', NULL, NULL, NULL, NULL),
('2020-04-01', 7, '0.00', '0.00', NULL, NULL, NULL, NULL),
('2020-04-01', 8, '3.75', '3.75', NULL, NULL, NULL, NULL),
('2020-04-01', 9, '1.50', '1.00', NULL, NULL, NULL, NULL),
('2020-04-01', 10, '0.00', '0.00', NULL, NULL, NULL, NULL),
('2020-04-01', 11, '1.50', '1.00', NULL, NULL, NULL, NULL),
('2020-04-01', 12, '0.00', '0.00', NULL, NULL, NULL, NULL),
('2021-04-01', 1, '0.00', '0.00', NULL, NULL, NULL, NULL),
('2021-04-01', 2, '2.00', '1.00', NULL, NULL, NULL, NULL),
('2021-04-01', 3, '2.00', '1.00', NULL, NULL, NULL, NULL),
('2021-04-01', 4, '2.00', '1.00', NULL, NULL, NULL, NULL),
('2021-04-01', 5, '2.00', '1.00', NULL, NULL, NULL, NULL),
('2021-04-01', 6, '2.00', '1.00', NULL, NULL, NULL, NULL),
('2021-04-01', 7, '0.00', '0.00', NULL, NULL, NULL, NULL),
('2021-04-01', 8, '5.00', '5.00', NULL, NULL, NULL, NULL),
('2021-04-01', 9, '2.00', '1.00', NULL, NULL, NULL, NULL),
('2021-04-01', 10, '0.00', '0.00', NULL, NULL, NULL, NULL),
('2021-04-01', 11, '2.00', '1.00', NULL, NULL, NULL, NULL),
('2021-04-01', 12, '0.00', '0.00', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_transport_charges`
--

CREATE TABLE `md_transport_charges` (
  `id` int(11) NOT NULL,
  `kms_id` int(11) NOT NULL,
  `transport_type` enum('P','C','I') NOT NULL,
  `dist_from` int(11) NOT NULL DEFAULT 0,
  `distance_to` int(11) NOT NULL,
  `amount` decimal(6,2) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_transport_charges`
--

INSERT INTO `md_transport_charges` (`id`, `kms_id`, `transport_type`, `dist_from`, `distance_to`, `amount`, `created_by`, `created_dt`) VALUES
(1, 2, 'P', 0, 25, '18.38', NULL, '2020-08-14 00:00:00'),
(2, 2, 'P', 26, 50, '0.50', NULL, '2020-08-14 00:00:00'),
(3, 2, 'P', 51, 99, '0.20', NULL, '2020-08-14 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `md_users`
--

CREATE TABLE `md_users` (
  `user_id` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` enum('U','M','A','B') NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_status` char(1) NOT NULL,
  `branch_id` varchar(20) NOT NULL,
  `st` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_users`
--

INSERT INTO `md_users` (`user_id`, `password`, `user_type`, `user_name`, `user_status`, `branch_id`, `st`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
('abdulk', '$2y$10$sLq.fPRfb/an4eW1xRRXm.AOLhPG7Y6FlG8vkrHWE3LMqDSulztyW', 'U', 'Abdul Kalam', 'A', '334', 0, 'synergic', '2019-12-10 11:30:21', 'synergic', '2019-12-11 07:36:45'),
('abirlalb', '$2y$10$WJou1qmKBbExsO2eMi1GmucDoAprttcLrBqkJS1uvbtX3umbi2gtW', 'M', 'Abirlal Bhuiya', 'A', '337', 0, 'synergic', '2019-12-10 12:24:03', NULL, NULL),
('ajayp', '$2y$10$2v.wHWlgr52Zl.tRAw7v0uP4Olrqh9JgqQrHjdhVmsDe0qgbvHS/i', 'M', 'Ajay Kr Paul', 'A', '337', 0, 'synergic', '2019-12-10 11:48:12', NULL, NULL),
('aksamm', '$2y$10$.bQ6XMbnyNiowyQ/.9Hp7.Cam.d4P86DSEVbSBL33wrUlhwP4eTp2', 'U', 'Md. Aksam Ali Mondal', 'A', '335', 0, 'synergic', '2019-12-10 12:11:30', NULL, NULL),
('alokek', '$2y$10$B04pBdohpn1n0ooXaH9dSOWQ.KadlZ0y6qV4lmkHCiNiVh.cIbBi6', 'M', 'Aloke Kr. Koley', 'A', '343', 0, 'synergic', '2019-12-10 11:46:34', NULL, NULL),
('anilc', '$2y$10$Zv1OSNnBsi7lxedzEgFXaeMkEdRkp21CxxMT5RoTKoFyPQSq0Glby', 'M', 'Anil Ch. Halder', 'A', '327', 0, 'synergic', '2019-12-10 11:55:16', NULL, NULL),
('anilh', '$2y$10$sLq.fPRfb/an4eW1xRRXm.AOLhPG7Y6FlG8vkrHWE3LMqDSulztyW', 'M', 'Anil Ch. Halder', 'A', '328', 0, 'synergic', '2019-12-10 12:05:46', NULL, NULL),
('aninditak', '$2y$10$AJ/NeLcMHKy60aP1YtDCEezzjNqtuIHn9t.xkIfexQ002Npc1fsgS', 'U', 'Anindita Karmakar', 'A', '335', 0, 'synergic', '2019-12-10 12:11:06', NULL, NULL),
('anirbanc', '$2y$10$VJSRo7yWYD95LbPNYXBqkO27FZKCx0WyO8IBLekbFXEuoWi5QZPjm', 'A', 'Anirban Chakraborty', 'A', '342', 0, 'synergic', '2020-01-10 10:10:38', NULL, NULL),
('anupamm', '$2y$10$178RwZd8Lljb4Re0bXgADu3QIRbNqgfDb1mQ10ANo80m9Jqn7UiZy', 'A', 'Anupam Mukherjee', 'A', '342', 0, 'synergic', '2019-12-11 07:32:46', NULL, NULL),
('anupp', '$2y$10$nrHHZUGAOThTF4D3fngXnufDoQVy3PF9WwCweBtSTHoRW9V/M1Hw2', 'U', 'Anup Kumar Pal', 'I', '338', 0, 'synergic', '2019-12-10 12:25:00', 'Somnath Kotal', '2020-12-25 04:46:15'),
('aparajitas', '$2y$10$HZPhfrdYv2lgK7SHobUw2ujhrA6HXwwlA4z1Q0WVow7UGF9aQryrS', 'M', 'Aparajita Samanta', 'A', '344', 0, 'synergic', '2019-12-10 12:29:22', NULL, NULL),
('aparajitas1', '$2y$10$y7zcWEzNWjQ.xOyEQ6ZYf.ww/Eu1bKuCGVotfyQSYeNbTUEx9jKk.', 'M', 'Aparajita Samanta', 'A', '348', 0, 'synergic', '2019-12-16 06:46:38', NULL, NULL),
('ashokeb', '$2y$10$2jkKrmRi/MkfWiR597Fau.7QELml2GP305Ty4DWR6/h64Bi50yggS', 'U', 'Ashoke Kumar Banerjee', 'A', '335', 0, 'synergic', '2019-12-10 12:11:41', NULL, NULL),
('bank', '$2y$10$UQ56rdoPRpa.K/JLqi6CQOOS5gJdRdEygcRzYuKr3nIUgr8iuWxtm', 'B', 'bank(ICICI)', 'A', '342', 0, 'synergic', '2020-06-05 09:48:01', NULL, NULL),
('barund', '$2y$10$a1KjSnASk.PH/BE53wD84etLQEoEO8irXqdPpa/c9Xv25Yq8pCVSS', 'A', 'Barun Das', 'A', '342', 0, 'synergic', '2019-12-11 07:33:36', NULL, NULL),
('bholanathm', '$2y$10$Z48qnPc8Fq5O8CVK.NVIUuQz.C1.hqrSuswi0s2wcIhvBynQtQhVy', 'A', 'Bholanath Mondal', 'A', '342', 0, 'synergic', '2019-12-11 07:33:12', NULL, NULL),
('bidyuts', '$2y$10$9651nga3/lIpZK.H/s9GT.LLAazY3yi2Ay3d481IuqHezWvh6f2ky', 'U', 'Bidyut Bhushan Sadhu', 'A', '338', 0, 'synergic', '2019-12-10 12:24:47', NULL, NULL),
('biswajitm', '$2y$10$GXfTbtD5y5FkziIg9Li8Fujh3SLB5DU1c9/fR.Ro62G3JXRdgItHO', 'U', 'Biswajit Mukherjee', 'A', '335', 0, 'synergic', '2019-12-10 12:10:55', NULL, NULL),
('debanikh', '$2y$10$O3sLgr0z4.5BnpbRzWrnWuZf9OtkS5r/YBMmaWU0GyFhLMUy14L8O', 'M', 'Debanik Hore', 'A', '344', 0, 'synergic', '2019-12-10 12:29:08', NULL, NULL),
('debashisr', '$2y$10$6eAYP7mSothSPE99fdZyq.zvgEOhDhldyy4t4.31svkhDqWkFGRjC', 'U', 'Debashis Roy ', 'A', '335', 0, 'synergic', '2019-12-10 12:10:07', NULL, NULL),
('debasisc', '$2y$10$rHd8YN0b.KH7NigAWTaSF.FqGpqzkrCzn8rmWLpZlyDmPXL7.ktES', 'U', 'Debasis Chatterjee', 'A', '332', 0, 'synergic', '2019-12-10 11:59:07', NULL, NULL),
('debasisd', '$2y$10$j7DQtHyE8gXWCfPWbi/IteVJztvz9ZrKtYebsi8zFIn12/cuMzT22', 'M', 'Debasis Dutta', 'A', '339', 0, 'synergic', '2019-12-10 12:12:33', NULL, NULL),
('debasisd1', '$2y$10$DuA8DZhjyVER3JUuPTySv.cQsGNj8j4TVRghDAsL3Z7cq7PrTwrd6', 'M', 'Debasis Dutta', 'A', '340', 0, 'synergic', '2019-12-10 12:30:42', 'Suman Chakraborty', '2021-01-22 11:46:36'),
('dipakb', '$2y$10$PQyogs3pF3dP9LYhTNyE0Oo6FW1vKPSC8AD1FDRvXOXEB2SKiJ7cm', 'M', 'Dipak Barua', 'A', '331', 0, 'synergic', '2019-12-10 12:02:13', NULL, NULL),
('dipakp', '$2y$10$NguRaq86gsJW/bRUO4otdOMnOQkW3TxvsYHsW4zh05PoF6S0Y8afC', 'U', 'Dipak Kumar Pal', 'A', '333', 0, 'synergic', '2019-12-10 11:35:07', NULL, NULL),
('eshanm', '$2y$10$3fHNK1jjueH/0uqXbiBl2OWse4YYIr9tDnIxk00tbD25ueStpPmeO', 'A', 'Eshan Mondal', 'A', '342', 0, 'synergic', '2020-06-15 10:29:09', NULL, NULL),
('hiralalp', '$2y$10$zYC5dkoDl4PvRXjxqLJoVursc1wcPNKlHuwctiLU.tExyeOa2fQyu', 'M', 'Hiralal Piri', 'A', '335', 0, 'synergic', '2019-12-10 12:10:35', NULL, NULL),
('ishanb', '$2y$10$yV251bRvLXnFMDkI3dFTWe0uekbOY.SYY5.KJ1a2LSAIAZv./uSDu', 'M', 'Ishan Banik', 'A', '332', 0, 'synergic', '2019-12-10 11:58:27', NULL, NULL),
('jamira', '$2y$10$gPQWK8WBtfHU6uljf4.YzOSTs2LaNtc4hFEzs/0vpPZyW00WwELya', 'U', 'Jamir Ahmed Khan', 'A', '344', 0, 'synergic', '2019-12-10 12:29:34', NULL, NULL),
('jayantab', '$2y$10$ulsAfjujWFzWcbm5/8ibTuAKlwqeMQKQDn8gzOpbtB5Gvw7t2UK0e', 'U', 'Jayanta Basu', 'A', '328', 0, 'synergic', '2019-12-10 12:06:20', NULL, NULL),
('jayantah', '$2y$10$aKg7yyb9bfzn6s34MtY5Lek9D5Dq0gf0rufh3DM6y/nH.dVKRxmSS', 'U', 'Jayanta Kumar Halder', 'A', '340', 0, 'synergic', '2019-12-10 12:31:24', NULL, NULL),
('jayantas', '$2y$10$bL3Op2HGmsZCgTi962.8NOSkEZuMleN/ryRkuogRZhLjY3Iao4LvS', 'U', 'Jayanta Kr. Saha', 'A', '334', 0, 'synergic', '2019-12-10 11:28:26', NULL, NULL),
('joydeepc', '$2y$10$jnREX5pjjFVOTwqRrEj6PeqOn9SMuPXobJ/yMwTHoPFaDl1znFtdW', 'U', 'Joydeep Chakraborty', 'A', '333', 0, 'synergic', '2019-12-10 11:35:22', NULL, NULL),
('kalyanb', '$2y$10$d.BLC80wFbnFw7aW8c9eheJYh877U75Mc18Sq0Z0o..6Vu1ou526e', 'M', 'Kalyan Biswas', 'A', '339', 0, 'synergic', '2019-12-10 12:12:17', NULL, NULL),
('kalyann', '$2y$10$Xtn7b4QCMsi/RbxpuMcK0u4c84L0.a/HYEAt8/qzW/TDICDHp2sbS', 'M', 'Kalyan Naskar', 'A', '330', 0, 'synergic', '2019-12-10 12:00:45', NULL, NULL),
('kanchans', '$2y$10$r3Dm9c.Yirniwlxjkx8PhOIa84xUcSAfDjBOkm7jf8f3C2Y2ILZdS', 'U', 'Kanchan Sengupta', 'A', '343', 0, 'synergic', '2019-12-10 11:47:19', NULL, NULL),
('kashinathm', '$2y$10$5kfp3id/xY3wvrqlUucXtuyVQaH1iLBmla38Maki6zccI9JTG7bdm', 'U', 'Kashinath Mukherjee', 'A', '330', 0, 'synergic', '2019-12-10 12:01:01', NULL, NULL),
('koushikc', '$2y$10$nJTWEADJC6HDhRxi03UiAOnsRyudnzP4FxfNLTY2FVtDLb.0ChnXK', 'M', 'Koushik Chakraborty', 'A', '329', 0, 'synergic', '2019-12-10 11:51:22', NULL, NULL),
('koushikc1', '$2y$10$7AG1F.vlZ3KMggliGEtUa.uL5PkGW0/T7iIe9oCJi8xuL9KzB5IbK', 'M', 'Koushik Chakraborty', 'A', '346', 0, 'synergic', '2019-12-18 05:07:24', NULL, NULL),
('kurmanuddins', '$2y$10$9.7DFohkt4K3Os9urghY3u.o8Wa3C9iBRZc6pnH57vwD2zi67Y4NW', 'U', 'Sk. Kurmanuddin', 'A', '343', 0, 'synergic', '2019-12-10 11:47:03', NULL, NULL),
('maheshdeo', '$2y$10$vHxQzQL8luXn/0/2Rhia0uiYLNXLLLGwJZk1tCseYLiaZfJdCWcPi', 'U', 'Maheswar Das', 'A', '340', 0, 'Suman Chakraborty', '2021-01-22 11:46:26', NULL, NULL),
('manab', '$2y$10$4lh8owRjV9NClHfR6nA11O67Btw/HrMsU0L01QAg4DTcQRubInxdW', 'A', 'Manab Babu', 'A', '342', 0, 'synergic', '2020-07-27 06:20:29', NULL, NULL),
('manasap', '$2y$10$F4n57IJiQNLcWzXxCS/A.uHKU/B9xI0haoncA1KmXk6PRQq15iCt.', 'U', 'Manasa Ram pal', 'A', '331', 0, 'synergic', '2019-12-10 12:02:35', NULL, NULL),
('Mantum', '$2y$10$Ke9/gMW0L28QKINHq0eC0OUMc.fVljOMjiezJM0K6jO94EwjpINJ2', 'M', 'Mantu Kumar Maji', 'A', '334', 0, 'synergic', '2019-12-10 11:27:41', NULL, NULL),
('mehabuba', '$2y$10$dRckFKKvsUq4JZVd2Pu6IOsBbDsgC43u7.9KIPKvwmVRHt21VEQqG', 'U', 'Mehabub Alam', 'A', '334', 0, 'synergic', '2019-12-10 11:30:35', NULL, NULL),
('mihirs', '$2y$10$3lRg3BVL1Ep4ERm9JsmNDevGbzabnR3Qa2ZcH1iEOjFq0lizrxd0e', 'U', 'Mihir Kr. Saha', 'A', '334', 0, 'synergic', '2019-12-10 11:29:45', NULL, NULL),
('mridulm', '$2y$10$0ZWmzYk6mpVNO0qC4ZERd.I2M3NZ1pHUswZT8/3y/L6WbnuvuwwFm', 'M', 'Mridul Mandal', 'A', '327', 0, 'synergic', '2019-12-10 11:54:52', NULL, NULL),
('mridulman', '$2y$10$LM84yELBw/3ZceD04joM9uXFNIl2dZ23XJ8LxQ3ASKK51LI0YmUri', 'M', 'Mridul Mandal', 'A', '328', 0, 'synergic', '2019-12-10 12:05:17', NULL, NULL),
('narayang', '$2y$10$f2RCS3wmms3RrukZHThXbe50hDjoOoiGeWQJUgtqrNGsUwmFSGr6i', 'U', 'Narayan Ch. Ghosh', 'I', '338', 0, 'synergic', '2019-12-10 12:24:33', 'Somnath Kotal', '2020-12-25 04:46:44'),
('natarajm', '$2y$10$dN1wv5kR9KZWf6F5KdjqAuThNdS0FQFJzo9romlPEYLFb8tkw71da', 'U', 'Nataraj Mukherjee', 'A', '335', 0, 'synergic', '2019-12-10 12:11:18', NULL, NULL),
('parthar', '$2y$10$nxp6CcuIoS22ZQprQbaYCugDqjUtz/ZacNWzRbyFPITs2mCb9LEdy', 'U', 'Partha Roy', 'A', '332', 0, 'synergic', '2019-12-10 11:59:29', NULL, NULL),
('pijushkp', '$2y$10$X8fGrKV5ZcdxEwHULXr8meTFdrMdAEhj.kb8O5.rrZqRjf/9ujEZm', 'U', 'pijush kanty patra', 'I', '338', 0, 'Somnath Kotal', '2021-01-05 07:39:12', 'Somnath Kotal', '2021-01-18 09:48:52'),
('pijushp', '$2y$10$bTFh.xW7R0DKWEZehsdfR.lgr/3dAxzVn8wJtWNuYi9FzbxhnHdkq', 'M', 'Pijush Kanti  Patra', 'I', '345', 0, 'synergic', '2019-12-10 12:28:15', 'Anirban Chakraborty', '2022-04-20 07:08:29'),
('pijushpk', '$2y$10$qeFFG52PvctX8pX07b8WtO2LghAPs2fJXZAngxbC9Q/010EViAEba', 'U', 'pijush kanty patra', 'A', '338', 0, 'Somnath Kotal', '2021-01-18 09:49:46', 'Somnath Kotal', '2021-08-05 05:57:38'),
('prabird', '$2y$10$3TvgVa3NVLcaNv/1HeK5fu7SuZ5xipgl2rSYTNni0vlml6Ug6t4Ai', 'M', 'Prabir Dutta', 'A', '334', 0, 'synergic', '2019-12-10 11:28:03', 'Mantu Kumar Maji', '2022-03-24 09:26:29'),
('prabird2', '$2y$10$LZYRNFEyPaGSxrK4u.1aReMfs8eaAxcag0CIUSkDEkc/OUmVMG5Ta', 'U', 'Prabir Kumar Dutta', 'A', '339', 0, 'synergic', '2019-12-10 12:13:29', 'Kalyan Biswas', '2019-12-31 08:01:58'),
('prabirdutta', '$2y$10$ilng1U.hD0wUVWoWTRBeK.VmTljy9gOmmOBTLp93Bphk3looBmRwK', 'U', 'PRABIR KUMAR DUTTA', 'A', '334', 0, 'Mantu Kumar Maji', '2022-03-24 09:26:59', NULL, NULL),
('prabirs', '$2y$10$ruOv0sygcNMf2032fCSJqeShD2jegAiCs8NEeJYibfryU52d8K9pu', 'U', 'Prabir Kr. Seth', 'A', '339', 0, 'synergic', '2019-12-10 12:13:52', NULL, NULL),
('prosadm', '$2y$10$GR4yHGrbZqAXfdiv0Aw3H.hITZDaSdyuJhTzGMGqODUYzt.HocuL6', 'M', 'Prosad Mandal', 'A', '330', 0, 'synergic', '2019-12-10 12:00:33', NULL, NULL),
('ram', '$2y$10$1PH.NgfJMQ5Ax1Z/0JDo3OiwcvmBTgQsTRQRqT3XQzCXQ6raosQiS', 'U', 'ram dey', 'A', '341', 0, 'synergic', '2019-12-23 12:44:12', NULL, NULL),
('rupak', '$2y$10$LgdJZuH1q1NRrjh9VLoZSOwZ19gtvzYxgswlTE6UrhQuGiptNYrbW', 'U', 'Rupak Das', 'A', '345', 0, 'Anirban Chakraborty', '2022-04-20 07:09:15', NULL, NULL),
('rupakd', '$2y$10$1Ur1.Z5SaX1dTEHq4zr6suMzBUSrFb23zOH0PLhzDOs9md7NmarIS', 'M', 'Rupak Das', 'A', '341', 0, 'synergic', '2019-12-10 11:50:26', NULL, NULL),
('sabitab', '$2y$10$GMu7kpoVNISfYD.sqMnIbOP7wsA4rPhxa5xfHAYUwYwFpqIrszux6', 'M', 'Sabita Biswas', 'A', '337', 0, 'synergic', '2019-12-10 11:47:52', NULL, NULL),
('saiefi', '$2y$10$tDHGl5Z54jLBKGM1BqiTN.IzZ6xoEfN/JWzQilsh6D4HsRSs7JtFu', 'U', 'Saief Iqbal', 'A', '328', 0, 'synergic', '2019-12-10 12:06:08', NULL, NULL),
('salamath', '$2y$10$G.QIF.u68R2Kte5EycZVv.OL465b/B9RxwReJM82EJhtGq2eyQ0rC', 'U', 'Md. Salamat Hossain', 'A', '332', 0, 'synergic', '2019-12-10 11:59:46', NULL, NULL),
('samik', '$2y$10$soiEAUxRMkIrCBBLdlF.A.bxSuD0v00ytj3EeMFG2uWIGuPvawMvy', 'M', 'samik', 'A', '342', 0, 'synergic', '2020-09-09 08:13:17', NULL, NULL),
('samird', '$2y$10$dwxOf.qo7.ezrtpSQME41euwCirc.DhYCqHsV.mL4juTr8DdFHSoa', 'U', 'Samir Kumar Das', 'A', '341', 0, 'synergic', '2019-12-10 11:50:40', NULL, NULL),
('samirp', '$2y$10$Qz99S8yF.dmrsOqgOWJJlerw7P5mrE/JRwRX/NFyVuCcBXwFCxN3G', 'U', 'Samir Pandit', 'A', '329', 0, 'synergic', '2019-12-10 11:51:54', NULL, NULL),
('samirp1', '$2y$10$slVBqJtlmUc6Lne706t3RebNu0oA0uJjyFQogIGoDqyMmqGIOnrOC', 'U', 'Samir Pandit', 'A', '346', 0, 'synergic', '2019-12-19 06:30:56', 'Koushik Chakraborty', '2020-02-10 09:56:06'),
('samsuddinm', '$2y$10$EuTSe4HwhoTNJducOSmQJ.1mQPPhI//DyHDv1YvN0tazGNL5StxDK', 'U', 'Samsuddin Mondal', 'A', '334', 0, 'synergic', '2019-12-10 11:30:50', NULL, NULL),
('sanjoym', '$2y$10$73ln2zuRBxrTd3wuwg84A.UjWsncR2aCpC3nupNNv26Pzf3Ov/3QC', 'U', 'Sanjoy Mula', 'A', '344', 0, 'Anirban Chakraborty', '2021-11-22 09:05:49', NULL, NULL),
('sanjoym_hof', '$2y$10$zQKOHvAxCQRyzn9Y19JbWOa2Fv0Pzr8VGTnl0ZrpZfyxwpDCUl/q6', 'U', 'Sanjoy Mula', 'A', '342', 0, 'Anirban Chakraborty', '2021-12-09 11:15:31', NULL, NULL),
('sarajitg', '$2y$10$78gWsx2/nHpMnejUR2quw.ehMppwYS3cJ.1Rux3h//emmWuY6YM1S', 'U', 'Sarajit Ghosal', 'A', '333', 0, 'synergic', '2019-12-10 11:34:51', NULL, NULL),
('satyendrag', '$2y$10$fhCVFjz8utipH1KgJ/rMdO.xxQQDCXHw9j7A3hwsFwRx6MbQ.shN.', 'U', 'Satyendra Nath Ghosh', 'A', '339', 0, 'synergic', '2019-12-10 12:14:02', NULL, NULL),
('saumenk', '$2y$10$w7W4WVg0zVeg/7vaqFPdHeuQQiYSpS.o8vAMZWp9cDK5GGo.0X5eO', 'M', 'Saumen Kundu', 'A', '333', 0, 'synergic', '2019-12-10 11:34:30', NULL, NULL),
('saumenk1', '$2y$10$4Ae7nfJxj57oKMIrj9zG8OFkdQIozXHpK24viZLzJWT3vnedD0RjS', 'M', 'Saumen Kundu ', 'A', '336', 0, 'synergic', '2019-12-10 11:37:09', 'Subhashish Biswas', '2020-12-16 02:18:36'),
('sengelb', '$2y$10$6qAMl0aSrzo95XBvgoQ4jeYEvxpfRskfaE.s14iIwfXNcpeQyEKru', 'M', 'Marshal Sengel Baskey', 'A', '331', 0, 'synergic', '2019-12-10 12:02:00', NULL, NULL),
('shantih', '$2y$10$s4yDWUJex51Cm5Gh9lvYz.qacv3JdPrtEVReitIIUa2EHF.2bwVtK', 'U', 'Shanti Nath Hazra', 'A', '345', 0, 'synergic', '2019-12-10 12:28:30', NULL, NULL),
('shyamc', '$2y$10$jpWNkZxR8gs2yZwoVdTcS.s.jCBVaJg/csMsZjcpYOBngWeeT4o5K', 'U', 'Shyam Kumar Chhetri', 'A', '332', 0, 'synergic', '2019-12-10 11:59:18', NULL, NULL),
('somnathk', '$2y$10$HLNRxcJFgBeLruAsTLEIPultOTFTefebkXEFmVO10oXst3g2M0gCO', 'M', 'Somnath Kotal', 'A', '338', 0, 'synergic', '2019-12-10 12:23:50', NULL, NULL),
('sss', '$2y$10$.hGN2NZbdZxhvY6t4f7Xp.izntLjFMXhKAY1rIBaShZUbMdmH1KvG', 'A', 'synergic', 'A', '341', 0, 'Synergic Softek', NULL, NULL, NULL),
('SubhamayA', '$2y$10$H3CXeWxOXZE7Kt9LcX2c0emwgefdZv/hJH7m9FF5hFwD6zKMht5MS', 'U', 'Subhamay Datta', 'A', '346', 0, 'Koushik Chakraborty', '2020-11-05 07:13:51', NULL, NULL),
('SubhamayC', '$2y$10$A9zNwry4Pm04sGlcXXwEO.NfdT65PMfhqTFm8cZbQJBNAciXSjgCu', 'U', 'Subhamay Datta', 'I', '346', 0, 'Koushik Chakraborty', '2020-11-05 07:12:11', 'Koushik Chakraborty', '2020-11-05 07:13:23'),
('SubhamayCob', '$2y$10$sR8vma7GnixZD.KRmFald.SoXiZM1SHZgYCPbWilEnA8e8Yl39EeO', 'U', 'Subhamay Datta', 'A', '329', 0, 'Koushik Chakraborty', '2020-11-05 07:14:54', NULL, NULL),
('subhanug', '$2y$10$BUszNXQ396kM5gd91vLQseZVTBNNVH27uxCtWl8fPA7W09RMiNI0C', 'M', 'Subhanu Ghosh', 'A', '345', 0, 'synergic', '2019-12-10 12:28:02', NULL, NULL),
('subhashishb', '$2y$10$Db3yo2wI/4XTlubVvEoswePPmSk6epG4QZ8tEpNEMpx5mXyqtNUKa', 'M', 'Subhashish Biswas', 'A', '336', 0, 'synergic', '2019-12-10 11:35:58', NULL, NULL),
('subhasishr', '$2y$10$k4DyfETO00QxPgVcgaHhC.6Fwn.odKoGtjCpEjxWFYwZQJXoEhl/W', 'U', 'Subhasish Roy', 'A', '343', 0, 'synergic', '2019-12-10 11:46:15', NULL, NULL),
('subhasj', '$2y$10$QS4Qc0CysbcfWJPA1qXu9ukMddvgcaMijrn/guy5MrW9bK3Eu1y3e', 'U', 'Subhas  Chandra Jalal', 'A', '339', 0, 'synergic', '2019-12-10 12:12:45', NULL, NULL),
('subhayum', '$2y$10$F8FcXrQoRL3pj/vChT0X9ueEgGtKGL7nf4y0a4sOAtsMdYITFXVOm', 'U', 'Subhayu Mazumder', 'A', '338', 0, 'synergic', '2019-12-10 12:25:40', NULL, NULL),
('subhrod', '$2y$10$ERaeu7jLZbuStThLMXyMV..IpkwDOE6U30cVMjUg3z5qhHss6.lQ6', 'M', 'Subhro Das', 'A', '333', 0, 'synergic', '2019-12-10 11:33:55', NULL, NULL),
('subratabb', '$2y$10$GsYuWVeoyzCzxFcNbv4Uy.D9VEejwxPT6fvF6nmA4sgsBtBpMYkmO', 'U', 'Subrata Kumar Bose', 'A', '337', 0, 'synergic', '2019-12-10 11:48:38', 'Sabita Biswas', '2020-03-07 08:09:50'),
('subratac', '$2y$10$fv0CFIwQY/7PWLG0SZz/TOIFrGjEuUVIzofSESAYTbokMN3xaTUvu', 'M', 'Subrata Chattopadhya', 'A', '341', 0, 'synergic', '2019-12-10 11:49:25', NULL, NULL),
('subratad', '$2y$10$GvG/c8lIHOenmbXdHndqBOEslvk4MPbRg0XEavx/QHVzFYzHoKsgO', 'U', 'Subrata Kr. Dutta', 'A', '330', 0, 'synergic', '2019-12-10 12:01:13', NULL, NULL),
('subratal', '$2y$10$93MyKO7kiSfjhHSZP2Jz.uVzv00y2dm1roIFo4qu6.jVumtxLIK5S', 'U', 'Subrata Kumar Laha', 'A', '345', 0, 'synergic', '2019-12-10 12:28:43', NULL, NULL),
('subratas', '$2y$10$Ewq7ao2ztPLoJLT9HM1H3e8.iyNn2dYJtbCu5uqgvozuAnUrNa4Um', 'M', 'Subrata Sen', 'A', '335', 0, 'synergic', '2019-12-10 12:10:20', NULL, NULL),
('sudipd', '$2y$10$0NBos9bNPL0uLO1/XY/mOO0C1zJYPgqlSGkW/5VhiQ03TBeKib3YS', 'U', 'Sudip Kumar Das', 'A', '336', 0, 'synergic', '2019-12-10 11:36:13', NULL, NULL),
('suhasranjans', '$2y$10$3gDojg.eRSoCUy6v4LCiE.n/iJovJmXLdabO8XxeHvUto7Dj.4kKK', 'U', 'Suhasranjan Sen', 'A', '339', 0, 'synergic', '2019-12-10 12:13:42', NULL, NULL),
('sujits', '$2y$10$rm/7A0UVOLZTmpmPfEwDA.E/kEjfwk0Ch31VwpKhzxziblp6QvZF.', 'U', 'Sujit Kumar Saha', 'A', '344', 0, 'synergic', '2019-12-10 12:29:51', NULL, NULL),
('sumanc', '$2y$10$UZUbgx062k4bBDw94/JMrO1q2Yd2h9WBM0IbfkYQh71CXAtTkO4Ku', 'M', 'Suman Chakraborty', 'A', '340', 0, 'synergic', '2019-12-10 12:31:12', NULL, NULL),
('sunilc', '$2y$10$.neADX3hhNA4T30LHJVyXOzqk7cSubvm1S6f3dByvGULtZn4yivL.', 'M', 'Sunil Chandra Sarker', 'A', '329', 0, 'synergic', '2019-12-10 11:51:42', 'Koushik Chakraborty', '2019-12-19 06:21:37'),
('sunilc1', '$2y$10$bMR8V1UfvUj3R9To6dDJIeoGR0L0sQxTHTSUgmstY6mxFHMcWJKNS', 'U', 'Sunil Chandra Sarker', 'A', '346', 0, 'synergic', '2019-12-19 06:31:16', NULL, NULL),
('sunils', '$2y$10$4.t4jkLJ/Lu0lruVXdN25eiOV9LIJ6eZyowaK/w.NIprL0HPMJkJK', 'U', 'Sunil Kumar Samanta', 'A', '341', 0, 'synergic', '2019-12-10 11:50:52', NULL, NULL),
('surojg', '$2y$10$5URK9tModGGSvtzGc9HHEepRSyKcRVzdIqqpsayj0e.3QW0Hx/.1i', 'U', 'Suroj Gejmir', 'A', '327', 0, 'synergic', '2019-12-10 11:55:46', NULL, NULL),
('surojitn', '$2y$10$.hGN2NZbdZxhvY6t4f7Xp.izntLjFMXhKAY1rIBaShZUbMdmH1KvG', 'M', 'Surojit Naskar', 'A', '332', 0, 'synergic', '2019-12-10 11:58:52', NULL, NULL),
('susantam', '$2y$10$zReLrXDi40abjg7qvq9gIOhVN0Cc8qqXJnN4Bj3dcYYD1WvXjloKG', 'U', 'Susanta Kr. Mondal', 'A', '327', 0, 'synergic', '2019-12-10 11:55:30', NULL, NULL),
('susmitan', '$2y$10$GV2FOf/mnxfRA/Ilnfc9W.qKGGkeWTuPl9i62kq4Km090elPIRY7O', 'M', 'Susmita Nath', 'A', '343', 0, 'synergic', '2019-12-10 11:45:56', NULL, NULL),
('tapank', '$2y$10$4HX4ZJn0AXN1eHMrA6Rj/OnZnIeiB8uLbA23Ey2fKF0jKQdYjokm2', 'U', 'Tapan Kr. Karfa', 'A', '334', 0, 'synergic', '2019-12-10 11:31:31', NULL, NULL),
('tapass', '$2y$10$DRpwiNcA/zlXj0696PMFUuRMp3Y9M6ksIMowvWu509KCQTqt1.uHK', 'U', 'Tapas Singha Roy', 'A', '331', 0, 'synergic', '2019-12-10 12:02:23', NULL, NULL),
('tapast', '$2y$10$LxzXOwjx6nbZ7tRY2dXQC.OVFoNJF9RzCWKRgIbAV3FXHTM8muQXS', 'U', 'Tapas Kumar Thakur', 'A', '337', 0, 'synergic', '2019-12-10 11:48:25', NULL, NULL),
('tusharm', '$2y$10$0J.9Hk12C7gkX99aKgiOZOaUU.vjFprBwNBCS6j871XdOefxQYTCe', 'U', 'Tushar Kanti Mondal', 'A', '344', 0, 'synergic', '2019-12-10 12:30:02', NULL, NULL),
('ujjalp', '$2y$10$3L/0AIEFHXkyG8haRgxsdOznyvXfck0/ahZ/KJvpLq5ocsg4pW7.y', 'U', 'Ujjal Baran Pal', 'A', '339', 0, 'synergic', '2019-12-10 12:12:58', NULL, NULL),
('yudhistir', '$2y$10$KAM5o7OnT/Ms7lr7hEjR4ORPpds1jHXu0hj8OD3Gmaj4HycALlYS2', 'U', 'Yudhistir Dey', 'A', '338', 0, 'synergic', '2019-12-10 12:25:26', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_village`
--

CREATE TABLE `md_village` (
  `dist_code` varchar(5) NOT NULL,
  `blockcode` varchar(8) NOT NULL,
  `villagecode` varchar(8) NOT NULL,
  `villagename` varchar(100) NOT NULL,
  `created_by` varchar(55) NOT NULL,
  `created_dt` date NOT NULL,
  `modified_by` varchar(55) NOT NULL,
  `modified_dt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_audit_trail`
--

CREATE TABLE `td_audit_trail` (
  `sl_no` int(10) UNSIGNED NOT NULL,
  `login_dt` datetime DEFAULT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  `terminal_name` varchar(50) DEFAULT NULL,
  `logout` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `td_audit_trail`
--

INSERT INTO `td_audit_trail` (`sl_no`, `login_dt`, `user_id`, `terminal_name`, `logout`) VALUES
(0, '2022-04-04 07:02:49', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-04 07:44:34', 'sss', '122.163.123.68', '2022-04-21 10:19:31'),
(0, '2022-04-04 07:54:55', 'subhrod', '43.252.250.104', '2022-04-21 10:19:31'),
(0, '2022-04-04 08:17:35', 'bholanathm', '103.242.190.102', '2022-04-21 10:19:31'),
(0, '2022-04-04 10:16:20', 'sss', '122.163.123.68', '2022-04-21 10:19:31'),
(0, '2022-04-04 10:25:01', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-04 10:49:45', 'sss', '122.163.123.68', '2022-04-21 10:19:31'),
(0, '2022-04-04 11:24:07', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-04 11:30:01', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-04 01:43:28', 'sarajitg', '43.252.250.104', '2022-04-21 10:19:31'),
(0, '2022-04-05 05:45:15', 'bholanathm', '103.242.190.102', '2022-04-21 10:19:31'),
(0, '2022-04-05 08:21:12', 'sanjoym', '103.242.190.102', '2022-04-21 10:19:31'),
(0, '2022-04-05 09:06:45', 'sss', '122.163.123.68', '2022-04-21 10:19:31'),
(0, '2022-04-05 09:24:28', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-05 09:24:41', 'sss', '122.163.123.68', '2022-04-21 10:19:31'),
(0, '2022-04-05 09:27:07', 'sss', '122.163.123.68', '2022-04-21 10:19:31'),
(0, '2022-04-05 09:29:15', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-05 09:29:17', 'sss', '122.163.123.68', '2022-04-21 10:19:31'),
(0, '2022-04-05 09:31:57', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-05 09:32:54', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-05 10:41:49', 'sss', '122.163.123.68', '2022-04-21 10:19:31'),
(0, '2022-04-05 10:44:02', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-05 11:53:27', 'sss', '122.163.123.68', '2022-04-21 10:19:31'),
(0, '2022-04-06 06:10:44', 'SUDIPD', '117.203.148.122', '2022-04-21 10:19:31'),
(0, '2022-04-06 06:13:20', 'SUDIPD', '117.203.148.122', '2022-04-21 10:19:31'),
(0, '2022-04-06 06:49:24', 'SUDIPD', '117.203.148.122', '2022-04-21 10:19:31'),
(0, '2022-04-06 06:53:27', 'susmitan', '103.24.86.12', '2022-04-21 10:19:31'),
(0, '2022-04-06 08:14:32', 'bholanathm', '103.242.190.110', '2022-04-21 10:19:31'),
(0, '2022-04-06 08:14:42', 'bholanathm', '103.242.190.110', '2022-04-21 10:19:31'),
(0, '2022-04-06 08:17:59', 'susmitan', '103.24.86.44', '2022-04-21 10:19:31'),
(0, '2022-04-07 04:36:24', 'sss', '223.223.144.244', '2022-04-21 10:19:31'),
(0, '2022-04-07 04:37:04', 'sss', '223.223.144.244', '2022-04-21 10:19:31'),
(0, '2022-04-07 04:42:35', 'SUBRATAS', '45.249.82.107', '2022-04-21 10:19:31'),
(0, '2022-04-07 04:43:04', 'sss', '223.223.144.244', '2022-04-21 10:19:31'),
(0, '2022-04-07 05:38:05', 'SUDIPD', '117.203.146.9', '2022-04-21 10:19:31'),
(0, '2022-04-07 05:58:43', 'susmitan', '103.24.86.44', '2022-04-21 10:19:31'),
(0, '2022-04-07 07:08:52', 'prabirdutta', '202.142.81.162', '2022-04-21 10:19:31'),
(0, '2022-04-07 07:10:08', 'prabirdutta', '202.142.81.162', '2022-04-21 10:19:31'),
(0, '2022-04-07 07:13:31', 'prabirdutta', '202.142.81.162', '2022-04-21 10:19:31'),
(0, '2022-04-07 08:00:17', 'SUDIPD', '117.203.145.4', '2022-04-21 10:19:31'),
(0, '2022-04-07 08:00:49', 'SUDIPD', '117.203.145.4', '2022-04-21 10:19:31'),
(0, '2022-04-07 10:52:26', 'SUBHASHISHB', '117.203.144.63', '2022-04-21 10:19:31'),
(0, '2022-04-07 11:00:42', 'bidyuts', '115.124.42.44', '2022-04-21 10:19:31'),
(0, '2022-04-07 11:48:40', 'SUBHASHISHB', '117.203.145.209', '2022-04-21 10:19:31'),
(0, '2022-04-07 11:57:58', 'SUBRATAS', '45.249.82.107', '2022-04-21 10:19:31'),
(0, '2022-04-07 12:05:38', 'aparajitas', '202.142.119.34', '2022-04-21 10:19:31'),
(0, '2022-04-07 12:37:23', 'Mantum', '106.211.152.74', '2022-04-21 10:19:31'),
(0, '2022-04-07 12:38:53', 'subratas', '47.11.75.167', '2022-04-21 10:19:31'),
(0, '2022-04-07 01:56:11', 'sengelb', '223.233.35.39', '2022-04-21 10:19:31'),
(0, '2022-04-07 02:15:06', 'sengelb', '103.211.133.215', '2022-04-21 10:19:31'),
(0, '2022-04-07 02:40:01', 'subhanug', '202.142.68.180', '2022-04-21 10:19:31'),
(0, '2022-04-07 02:40:25', 'sengelb', '103.211.133.215', '2022-04-21 10:19:31'),
(0, '2022-04-07 03:07:25', 'subhayum', '45.64.227.156', '2022-04-21 10:19:31'),
(0, '2022-04-08 02:55:32', 'sabitab', '157.40.190.148', '2022-04-21 10:19:31'),
(0, '2022-04-08 03:37:48', 'Mantum', '202.142.70.69', '2022-04-21 10:19:31'),
(0, '2022-04-08 04:08:41', 'Mantum', '202.142.70.69', '2022-04-21 10:19:31'),
(0, '2022-04-08 04:28:53', 'subhrod', '103.194.157.168', '2022-04-21 10:19:31'),
(0, '2022-04-08 04:44:16', 'Mantum', '202.142.70.69', '2022-04-21 10:19:31'),
(0, '2022-04-08 05:31:34', 'SUDIPD', '117.203.144.229', '2022-04-21 10:19:31'),
(0, '2022-04-08 05:46:03', 'sengelb', '103.211.133.215', '2022-04-21 10:19:31'),
(0, '2022-04-08 05:55:26', 'prabirdutta', '202.142.70.69', '2022-04-21 10:19:31'),
(0, '2022-04-08 06:17:56', 'sabitab', '103.76.82.68', '2022-04-21 10:19:31'),
(0, '2022-04-08 06:19:23', 'mantum', '202.142.70.69', '2022-04-21 10:19:31'),
(0, '2022-04-08 06:26:51', 'Mantum', '202.142.70.69', '2022-04-21 10:19:31'),
(0, '2022-04-08 06:33:51', 'subratas', '45.249.82.107', '2022-04-21 10:19:31'),
(0, '2022-04-08 06:49:50', 'SUBRATAS', '45.249.82.107', '2022-04-21 10:19:31'),
(0, '2022-04-08 06:49:52', 'sengelb', '103.211.133.215', '2022-04-21 10:19:31'),
(0, '2022-04-08 06:50:13', 'sengelb', '103.211.133.215', '2022-04-21 10:19:31'),
(0, '2022-04-08 07:00:06', 'KashinathM', '103.18.168.86', '2022-04-21 10:19:31'),
(0, '2022-04-08 07:02:16', 'SUDIPD', '117.203.144.229', '2022-04-21 10:19:31'),
(0, '2022-04-08 07:07:22', 'sss', '122.163.123.68', '2022-04-21 10:19:31'),
(0, '2022-04-08 07:08:10', 'Jayantas', '202.142.70.69', '2022-04-21 10:19:31'),
(0, '2022-04-08 07:08:36', 'Jayantas', '202.142.70.69', '2022-04-21 10:19:31'),
(0, '2022-04-08 07:09:23', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-08 07:12:32', 'Mantum', '202.142.70.69', '2022-04-21 10:19:31'),
(0, '2022-04-08 07:30:14', 'jayantab', '103.217.230.97', '2022-04-21 10:19:31'),
(0, '2022-04-08 07:42:26', 'bidyuts', '115.124.42.44', '2022-04-21 10:19:31'),
(0, '2022-04-08 07:52:08', 'Jayantas', '202.142.70.69', '2022-04-21 10:19:31'),
(0, '2022-04-08 08:36:02', 'sengelb', '103.211.133.215', '2022-04-21 10:19:31'),
(0, '2022-04-08 08:45:42', 'prabirdutta', '202.142.70.69', '2022-04-21 10:19:31'),
(0, '2022-04-08 09:14:09', 'SUDIPD', '117.203.144.229', '2022-04-21 10:19:31'),
(0, '2022-04-08 09:39:49', 'subhanug', '106.196.2.21', '2022-04-21 10:19:31'),
(0, '2022-04-08 10:19:01', 'SUDIPD', '117.203.144.229', '2022-04-21 10:19:31'),
(0, '2022-04-08 10:29:08', 'KashinathM', '103.18.168.86', '2022-04-21 10:19:31'),
(0, '2022-04-08 11:01:34', 'subhanug', '202.142.68.155', '2022-04-21 10:19:31'),
(0, '2022-04-08 11:23:37', 'sengelb', '106.211.140.203', '2022-04-21 10:19:31'),
(0, '2022-04-08 11:37:10', 'sss', '122.163.123.68', '2022-04-21 10:19:31'),
(0, '2022-04-08 11:56:44', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-08 11:57:00', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-08 12:27:57', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-08 12:29:54', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-08 12:30:34', 'sss', '136.232.64.10', '2022-04-21 10:19:31'),
(0, '2022-04-08 12:37:16', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-08 12:46:03', 'surojitn', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-08 12:47:57', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-08 01:03:46', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-08 01:10:39', 'surojitn', '139.5.141.49', '2022-04-21 10:19:31'),
(0, '2022-04-08 01:14:15', 'surojitn', '139.5.141.49', '2022-04-21 10:19:31'),
(0, '2022-04-08 02:56:41', 'subhanug', '106.196.3.49', '2022-04-21 10:19:31'),
(0, '2022-04-08 11:46:27', 'Mantum', '223.176.33.112', '2022-04-21 10:19:31'),
(0, '2022-04-09 04:39:29', 'subhanug', '106.196.9.121', '2022-04-21 10:19:31'),
(0, '2022-04-10 03:19:19', 'anirbanc', '223.191.18.62', '2022-04-21 10:19:31'),
(0, '2022-04-10 03:20:48', 'anirbanc', '223.191.18.62', '2022-04-21 10:19:31'),
(0, '2022-04-10 03:20:58', 'anirbanc', '223.191.18.62', '2022-04-21 10:19:31'),
(0, '2022-04-10 05:28:59', 'subhanug', '106.196.3.39', '2022-04-21 10:19:31'),
(0, '2022-04-11 06:55:56', 'KashinathM', '103.18.168.78', '2022-04-21 10:19:31'),
(0, '2022-04-11 08:02:35', 'subhrod', '223.191.50.218', '2022-04-21 10:19:31'),
(0, '2022-04-11 08:05:07', 'subhrod', '157.40.172.138', '2022-04-21 10:19:31'),
(0, '2022-04-11 08:09:11', 'ishanb', '139.5.141.49', '2022-04-21 10:19:31'),
(0, '2022-04-11 08:44:49', 'ishanb', '139.5.141.49', '2022-04-21 10:19:31'),
(0, '2022-04-11 08:49:42', 'ishanb', '139.5.141.49', '2022-04-21 10:19:31'),
(0, '2022-04-11 10:18:04', 'KashinathM', '103.18.168.78', '2022-04-21 10:19:31'),
(0, '2022-04-11 10:29:59', 'ishanb', '139.5.141.49', '2022-04-21 10:19:31'),
(0, '2022-04-11 11:27:07', 'ishanb', '139.5.141.49', '2022-04-21 10:19:31'),
(0, '2022-04-11 11:57:42', 'SUDIPD', '117.203.146.199', '2022-04-21 10:19:31'),
(0, '2022-04-11 02:29:28', 'subhanug', '106.196.3.229', '2022-04-21 10:19:31'),
(0, '2022-04-11 03:28:41', 'subhanug', '106.196.3.229', '2022-04-21 10:19:31'),
(0, '2022-04-11 04:31:17', 'subhanug', '106.196.11.229', '2022-04-21 10:19:31'),
(0, '2022-04-12 03:27:49', 'subhasj', '49.37.50.99', '2022-04-21 10:19:31'),
(0, '2022-04-12 03:37:13', 'Mantum', '202.142.70.119', '2022-04-21 10:19:31'),
(0, '2022-04-12 05:08:32', 'Mantum', '202.142.70.119', '2022-04-21 10:19:31'),
(0, '2022-04-12 05:40:13', 'Mantum', '202.142.70.119', '2022-04-21 10:19:31'),
(0, '2022-04-12 05:49:00', 'SUDIPD', '117.203.145.142', '2022-04-21 10:19:31'),
(0, '2022-04-12 06:02:21', 'KashinathM', '103.18.168.78', '2022-04-21 10:19:31'),
(0, '2022-04-12 06:45:10', 'bidyuts', '115.124.42.44', '2022-04-21 10:19:31'),
(0, '2022-04-12 07:10:31', 'subratas', '115.187.59.172', '2022-04-21 10:19:31'),
(0, '2022-04-12 07:12:27', 'ishanb', '139.5.141.49', '2022-04-21 10:19:31'),
(0, '2022-04-12 08:58:29', 'ishanb', '139.5.141.49', '2022-04-21 10:19:31'),
(0, '2022-04-12 09:58:03', 'KashinathM', '103.18.168.78', '2022-04-21 10:19:31'),
(0, '2022-04-12 10:06:53', 'ishanb', '139.5.141.49', '2022-04-21 10:19:31'),
(0, '2022-04-12 10:26:16', 'ishanb', '139.5.141.49', '2022-04-21 10:19:31'),
(0, '2022-04-12 11:07:33', 'ishanb', '139.5.141.49', '2022-04-21 10:19:31'),
(0, '2022-04-12 04:08:02', 'subhanug', '106.196.0.194', '2022-04-21 10:19:31'),
(0, '2022-04-12 05:44:44', 'subhayum', '45.64.227.215', '2022-04-21 10:19:31'),
(0, '2022-04-13 01:46:25', 'sengelb', '157.40.176.18', '2022-04-21 10:19:31'),
(0, '2022-04-13 07:42:53', 'bidyuts', '115.124.42.44', '2022-04-21 10:19:31'),
(0, '2022-04-13 08:13:52', 'subratas', '115.187.59.172', '2022-04-21 10:19:31'),
(0, '2022-04-13 08:26:04', 'Mantum', '223.233.9.235', '2022-04-21 10:19:31'),
(0, '2022-04-13 09:47:32', 'pijushp', '115.124.42.44', '2022-04-21 10:19:31'),
(0, '2022-04-13 09:47:49', 'subhayum', '115.124.42.44', '2022-04-21 10:19:31'),
(0, '2022-04-13 10:19:41', 'aparajitas1', '202.142.119.141', '2022-04-21 10:19:31'),
(0, '2022-04-13 12:06:13', 'ishanb', '139.5.141.49', '2022-04-21 10:19:31'),
(0, '2022-04-13 01:26:16', 'ishanb', '139.5.141.49', '2022-04-21 10:19:31'),
(0, '2022-04-18 04:11:03', 'Mantum', '202.142.70.139', '2022-04-21 10:19:31'),
(0, '2022-04-18 05:03:32', 'subhanug', '106.196.0.119', '2022-04-21 10:19:31'),
(0, '2022-04-18 05:21:17', 'subratas', '115.187.59.172', '2022-04-21 10:19:31'),
(0, '2022-04-18 05:31:11', 'aparajitas1', '202.142.119.96', '2022-04-21 10:19:31'),
(0, '2022-04-18 05:54:34', 'SubhamayCob', '103.147.88.85', '2022-04-21 10:19:31'),
(0, '2022-04-18 07:07:52', 'bidyuts', '115.124.42.44', '2022-04-21 10:19:31'),
(0, '2022-04-18 07:41:15', 'prabirdutta', '202.142.70.139', '2022-04-21 10:19:31'),
(0, '2022-04-18 10:11:05', 'natarajm', '115.187.59.172', '2022-04-21 10:19:31'),
(0, '2022-04-18 11:10:46', 'bidyuts', '115.124.42.44', '2022-04-21 10:19:31'),
(0, '2022-04-18 10:47:11', 'subhrod', '43.252.250.107', '2022-04-21 10:19:31'),
(0, '2022-04-19 03:36:28', 'Mantum', '202.142.81.125', '2022-04-21 10:19:31'),
(0, '2022-04-19 06:10:07', 'maheshdeo', '103.217.228.185', '2022-04-21 10:19:31'),
(0, '2022-04-19 07:08:21', 'surojitn', '139.5.141.49', '2022-04-21 10:19:31'),
(0, '2022-04-19 07:11:17', 'KoushikC', '103.147.88.84', '2022-04-21 10:19:31'),
(0, '2022-04-19 07:11:57', 'SubhamayCob', '103.147.88.84', '2022-04-21 10:19:31'),
(0, '2022-04-19 07:17:18', 'bidyuts', '115.124.42.44', '2022-04-21 10:19:31'),
(0, '2022-04-19 08:08:27', 'SUBRATAS', '103.51.149.162', '2022-04-21 10:19:31'),
(0, '2022-04-19 08:14:47', 'ishanb', '139.5.141.49', '2022-04-21 10:19:31'),
(0, '2022-04-19 10:23:40', 'subratac', '103.88.217.229', '2022-04-21 10:19:31'),
(0, '2022-04-19 11:17:45', 'bholanathm', '103.242.190.214', '2022-04-21 10:19:31'),
(0, '2022-04-19 04:20:16', 'kalyanb', '49.37.53.251', '2022-04-21 10:19:31'),
(0, '2022-04-20 04:11:15', 'subhanug', '202.142.68.198', '2022-04-21 10:19:31'),
(0, '2022-04-20 05:58:09', 'subhanug', '202.142.69.57', '2022-04-21 10:19:31'),
(0, '2022-04-20 06:07:49', 'subhanug', '202.142.69.57', '2022-04-21 10:19:31'),
(0, '2022-04-20 06:37:42', 'SUDIPD', '117.203.147.103', '2022-04-21 10:19:31'),
(0, '2022-04-20 06:43:30', 'SUBHASHISHB', '117.203.147.103', '2022-04-21 10:19:31'),
(0, '2022-04-20 06:50:36', 'bidyuts', '115.124.42.44', '2022-04-21 10:19:31'),
(0, '2022-04-20 10:51:21', 'bidyuts', '115.124.42.44', '2022-04-21 10:19:31'),
(0, '2022-04-20 11:38:34', 'KashinathM', '47.11.235.101', '2022-04-21 10:19:31'),
(0, '2022-04-20 07:07:56', 'anirbanc', '223.191.41.203', '2022-04-21 10:19:31'),
(0, '2022-04-21 05:14:43', 'SUDIPD', '117.203.144.255', '2022-04-21 10:19:31'),
(0, '2022-04-21 05:41:29', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-21 05:42:05', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-21 05:42:14', 'KashinathM', '103.18.168.9', '2022-04-21 10:19:31'),
(0, '2022-04-21 06:13:22', 'subhanug', '223.29.193.197', '2022-04-21 10:19:31'),
(0, '2022-04-21 06:13:57', 'rupak', '223.29.193.197', '2022-04-21 10:19:31'),
(0, '2022-04-21 06:14:53', 'rupak', '223.29.193.197', '2022-04-21 10:19:31'),
(0, '2022-04-21 06:26:46', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-21 06:32:19', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-21 07:04:33', 'surojitn', '139.5.141.49', '2022-04-21 10:19:31'),
(0, '2022-04-21 07:19:25', 'Somnathk', '115.124.42.44', '2022-04-21 10:19:31'),
(0, '2022-04-21 07:49:04', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-21 08:48:05', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-21 08:48:21', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-21 08:50:56', 'sss', '122.176.27.53', '2022-04-21 10:19:31'),
(0, '2022-04-21 09:11:06', 'sengelb', '103.211.133.215', '2022-04-21 10:19:31'),
(0, '2022-04-21 09:40:41', 'barund', '103.242.190.209', '2022-04-21 10:19:31');

-- --------------------------------------------------------

--
-- Table structure for table `td_bill`
--

CREATE TABLE `td_bill` (
  `bill_no` varchar(50) NOT NULL,
  `bill_dt` date NOT NULL,
  `kms_yr` varchar(15) NOT NULL,
  `pool_type` varchar(15) NOT NULL,
  `rice_type` varchar(20) NOT NULL,
  `dist` int(11) NOT NULL,
  `block` int(11) NOT NULL,
  `soc_id` int(11) NOT NULL,
  `mill_id` int(11) NOT NULL,
  `paddy_qty` decimal(10,3) NOT NULL,
  `tot_msp` decimal(20,3) NOT NULL,
  `market_fee` int(11) NOT NULL,
  `mandi_chrg` decimal(10,2) NOT NULL,
  `transport_dist` decimal(10,2) NOT NULL DEFAULT 0.00,
  `transportation1` decimal(10,2) NOT NULL DEFAULT 0.00,
  `transportation2` decimal(10,2) NOT NULL DEFAULT 0.00,
  `transportation3` decimal(10,2) NOT NULL DEFAULT 0.00,
  `inter_dist_transprt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `driage` decimal(10,2) NOT NULL DEFAULT 0.00,
  `comm_soc` decimal(10,2) NOT NULL DEFAULT 0.00,
  `comm_mill` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cgst_milling` decimal(10,2) NOT NULL DEFAULT 0.00,
  `sgst_milling` decimal(10,2) NOT NULL DEFAULT 0.00,
  `admin_chrg` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tot_milled_paddy` decimal(10,2) NOT NULL DEFAULT 0.00,
  `out_ratio` int(11) NOT NULL,
  `sub_tot_cmr_qty` decimal(10,3) NOT NULL DEFAULT 0.000,
  `sub_tot_cmr_rate` decimal(10,3) NOT NULL DEFAULT 0.000,
  `transport_dist1` decimal(10,2) NOT NULL DEFAULT 0.00,
  `transportation_cmr1` decimal(10,2) NOT NULL DEFAULT 0.00,
  `transportation_cmr2` decimal(10,2) NOT NULL DEFAULT 0.00,
  `transportation_cmr3` decimal(10,2) NOT NULL DEFAULT 0.00,
  `gunny_usege` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cgst_gunny` decimal(10,2) NOT NULL DEFAULT 0.00,
  `sgst_gunny` decimal(10,2) NOT NULL DEFAULT 0.00,
  `butta_cut` decimal(10,2) NOT NULL DEFAULT 0.00,
  `gunny_cut` decimal(10,2) NOT NULL DEFAULT 0.00,
  `approval_status` varchar(1) NOT NULL DEFAULT 'U',
  `approved_by` varchar(50) DEFAULT NULL,
  `approved_dt` datetime DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_dt` datetime NOT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_bill_submit`
--

CREATE TABLE `td_bill_submit` (
  `submit_no` int(11) NOT NULL,
  `submit_date` date NOT NULL,
  `kms_year` varchar(10) NOT NULL,
  `pool_type` varchar(2) NOT NULL,
  `tot_amt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_by` varchar(50) NOT NULL,
  `created_dt` date NOT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_cmr_delivery`
--

CREATE TABLE `td_cmr_delivery` (
  `trans_dt` date NOT NULL,
  `kms_year` varchar(10) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `trans_no` int(11) NOT NULL,
  `block` varchar(10) NOT NULL,
  `soc_id` varchar(25) NOT NULL,
  `mill_id` varchar(15) NOT NULL,
  `do_number` varchar(50) NOT NULL,
  `dist` int(11) NOT NULL,
  `delivery_dt` varchar(15) NOT NULL,
  `goodown_name` varchar(255) NOT NULL,
  `inter_dist` enum('Y','N') NOT NULL DEFAULT 'N',
  `rm_gd_dist` int(11) NOT NULL DEFAULT 0,
  `cmr_type` varchar(5) DEFAULT NULL,
  `sp` decimal(10,3) NOT NULL DEFAULT 0.000,
  `cp` decimal(10,3) NOT NULL DEFAULT 0.000,
  `fci` decimal(10,3) NOT NULL DEFAULT 0.000,
  `tot_delivery` decimal(10,3) NOT NULL DEFAULT 0.000,
  `cmr_yet_to_be_delivery_as_do_number` decimal(10,2) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_cmr_offered`
--

CREATE TABLE `td_cmr_offered` (
  `trans_dt` date NOT NULL,
  `kms_year` varchar(10) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `trans_no` int(11) NOT NULL,
  `block_id` varchar(20) NOT NULL,
  `soc_id` varchar(25) NOT NULL,
  `mill_id` int(11) NOT NULL,
  `progressive_paddy_received` decimal(11,5) NOT NULL,
  `rice_type` char(1) NOT NULL,
  `progressive_res_paddy` decimal(11,5) NOT NULL,
  `milled` decimal(11,5) DEFAULT 0.00000,
  `resultant_cmr` decimal(11,5) NOT NULL DEFAULT 0.00000,
  `cmr_offered_now` decimal(11,5) NOT NULL,
  `total_progres_cmr_offered` decimal(11,5) NOT NULL,
  `cmr_yet_to_offered` decimal(11,5) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_dt` datetime NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_dt` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_collections`
--

CREATE TABLE `td_collections` (
  `kms_id` int(11) NOT NULL,
  `camp_no` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `block_id` varchar(20) NOT NULL,
  `soc_id` varchar(20) NOT NULL,
  `mill_id` varchar(10) NOT NULL,
  `muster_roll_no` varchar(10) DEFAULT NULL,
  `trans_dt` date NOT NULL,
  `trans_id` int(11) NOT NULL,
  `forward_trans_id` bigint(20) DEFAULT NULL,
  `bulk_trans_id` int(11) NOT NULL,
  `forward_bulk_trans_id` varchar(50) DEFAULT NULL,
  `bank_sl_no` int(11) NOT NULL,
  `trans_type` varchar(2) DEFAULT NULL,
  `reg_no` varchar(55) DEFAULT NULL,
  `farmer_name` varchar(255) DEFAULT NULL,
  `quantity` decimal(5,3) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `book_no` varchar(50) DEFAULT '0',
  `cheque_no` varchar(30) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `chq_status` enum('U','I','C','R','S','P','A','L','Z','Q') NOT NULL,
  `ifsc_code` varchar(15) DEFAULT NULL,
  `acc_no` varchar(30) DEFAULT NULL,
  `certificate_1` varchar(3) NOT NULL DEFAULT 'N',
  `certificate_2` varchar(3) NOT NULL DEFAULT 'N',
  `certificate_4` varchar(3) NOT NULL DEFAULT 'N',
  `certificate_3` varchar(3) NOT NULL DEFAULT 'N',
  `certificate_5` varchar(3) NOT NULL DEFAULT 'N',
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `ho_status` varchar(5) DEFAULT '0',
  `dwn_flag` enum('0','1') NOT NULL DEFAULT '0',
  `chq_clg_dt` datetime DEFAULT NULL,
  `hdfc_sl_no` int(11) DEFAULT NULL,
  `created_by` varchar(55) DEFAULT NULL,
  `created_dt` date DEFAULT NULL,
  `forwarded_by` varchar(55) DEFAULT NULL,
  `forwarded_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_collections_forward`
--

CREATE TABLE `td_collections_forward` (
  `forward_dt` datetime NOT NULL,
  `forward_bulk_trans_id` varchar(25) NOT NULL,
  `forward_trans_id` bigint(20) NOT NULL,
  `ifsc_code` varchar(13) NOT NULL,
  `acc_no` bigint(20) NOT NULL,
  `forward_sl` int(11) NOT NULL DEFAULT 0,
  `bank_id` int(11) NOT NULL,
  `kms_id` int(11) NOT NULL,
  `response` varchar(55) DEFAULT NULL,
  `response_dt` datetime DEFAULT NULL,
  `status` enum('C','R') DEFAULT NULL,
  `forwarded_by` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_collection_bkp`
--

CREATE TABLE `td_collection_bkp` (
  `kms_id` int(11) NOT NULL,
  `camp_no` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `block_id` varchar(20) NOT NULL,
  `soc_id` varchar(20) NOT NULL,
  `mill_id` varchar(10) NOT NULL,
  `muster_roll_no` varchar(10) DEFAULT NULL,
  `trans_dt` date NOT NULL,
  `trans_id` int(11) NOT NULL,
  `bulk_trans_id` int(11) NOT NULL,
  `bank_sl_no` int(11) NOT NULL,
  `reg_no` varchar(55) DEFAULT NULL,
  `quantity` decimal(5,3) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `book_no` varchar(50) DEFAULT NULL,
  `cheque_no` varchar(30) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `chq_status` enum('U','I','C','R') NOT NULL,
  `certificate_1` varchar(3) NOT NULL DEFAULT 'N',
  `certificate_2` varchar(3) NOT NULL DEFAULT 'N',
  `certificate_4` varchar(3) NOT NULL DEFAULT 'N',
  `certificate_3` varchar(3) NOT NULL DEFAULT 'N',
  `certificate_5` varchar(3) NOT NULL DEFAULT 'N',
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `ho_status` varchar(5) DEFAULT NULL,
  `dwn_flag` enum('0','1') NOT NULL DEFAULT '0',
  `chq_clg_dt` date DEFAULT NULL,
  `created_by` varchar(55) DEFAULT NULL,
  `created_dt` date DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_commission_bill`
--

CREATE TABLE `td_commission_bill` (
  `trans_dt` date NOT NULL,
  `pmt_commission_no` bigint(20) NOT NULL,
  `kms_year` varchar(10) NOT NULL,
  `dist` int(11) NOT NULL,
  `soc_id` int(11) NOT NULL,
  `tot_paddy` decimal(10,3) NOT NULL DEFAULT 0.000,
  `con_bill_no` varchar(9) NOT NULL,
  `con_bill_dt` date NOT NULL,
  `soc_bill_no` varchar(9) NOT NULL,
  `soc_bill_dt` date NOT NULL,
  `paddy_qty` decimal(10,3) NOT NULL DEFAULT 0.000,
  `rate_per_qtls` decimal(10,3) NOT NULL DEFAULT 0.000,
  `value` decimal(10,3) NOT NULL DEFAULT 0.000,
  `pool_type` char(2) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_dt` datetime NOT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_commission_bill_dtls`
--

CREATE TABLE `td_commission_bill_dtls` (
  `trans_dt` date NOT NULL,
  `pmt_commission_no` bigint(20) NOT NULL,
  `tds_percentage` decimal(10,2) NOT NULL DEFAULT 0.00,
  `deducted_amt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payble_amt` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_details_farmer`
--

CREATE TABLE `td_details_farmer` (
  `coll_no` bigint(20) NOT NULL,
  `trans_id` varchar(150) NOT NULL,
  `trans_dt` date NOT NULL,
  `kms_year` varchar(10) NOT NULL DEFAULT '',
  `beneficiary_name` varchar(250) NOT NULL,
  `ifsc` varchar(30) NOT NULL,
  `acc_no` varchar(30) NOT NULL,
  `paddy_qty` decimal(10,3) NOT NULL DEFAULT 0.000,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_doc_maintenance`
--

CREATE TABLE `td_doc_maintenance` (
  `bill_no` int(11) NOT NULL,
  `pool_type` char(1) NOT NULL,
  `kms_year` varchar(10) NOT NULL,
  `doc_id` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_do_isseued`
--

CREATE TABLE `td_do_isseued` (
  `trans_dt` date NOT NULL,
  `kms_year` varchar(10) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `trans_no` int(11) NOT NULL,
  `block_id` varchar(15) NOT NULL,
  `dist` int(11) NOT NULL,
  `soc_id` varchar(25) NOT NULL,
  `mill_id` int(11) NOT NULL,
  `tot_cmr_offered` decimal(11,5) NOT NULL DEFAULT 0.00000,
  `do_number` varchar(50) NOT NULL,
  `goodown_name` varchar(255) NOT NULL,
  `inter_dist` enum('Y','N') NOT NULL DEFAULT 'N',
  `rm_gd_dist` decimal(10,2) NOT NULL DEFAULT 0.00,
  `rice_type` char(1) NOT NULL,
  `sp` decimal(11,5) NOT NULL DEFAULT 0.00000,
  `cp` decimal(11,5) NOT NULL DEFAULT 0.00000,
  `fci` decimal(11,5) NOT NULL DEFAULT 0.00000,
  `tot_doisseued` decimal(11,5) NOT NULL DEFAULT 0.00000,
  `do_yet_to_be_issued` decimal(11,5) NOT NULL DEFAULT 0.00000,
  `created_by` varchar(50) NOT NULL,
  `created_dt` datetime NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_farmer_reg`
--

CREATE TABLE `td_farmer_reg` (
  `kms_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `dist` int(11) NOT NULL,
  `block` varchar(8) NOT NULL,
  `soc_id` varchar(20) NOT NULL,
  `reg_dt` date NOT NULL,
  `reg_no` varchar(100) NOT NULL,
  `farm_name` varchar(150) NOT NULL,
  `father_name` varchar(150) DEFAULT NULL,
  `relation` varchar(55) DEFAULT NULL,
  `caste` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `epic_no` varchar(20) NOT NULL,
  `villagecode` varchar(50) DEFAULT NULL,
  `account_no` varchar(50) NOT NULL,
  `ifsc_code` varchar(20) NOT NULL,
  `land_holding` decimal(10,6) DEFAULT NULL,
  `land_description` text DEFAULT NULL,
  `farmer_type` varchar(30) DEFAULT NULL,
  `addhar_no` varchar(20) DEFAULT NULL,
  `pan_no` varchar(20) DEFAULT NULL,
  `pin_no` int(11) DEFAULT NULL,
  `mobile_number` varchar(10) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_by` varchar(55) DEFAULT NULL,
  `created_dt` date DEFAULT NULL,
  `upd_flag` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `td_farmer_reg`
--
DELIMITER $$
CREATE TRIGGER `upd_farm_name` AFTER UPDATE ON `td_farmer_reg` FOR EACH ROW BEGIN
     update td_collections
     set farmer_name = old.farm_name
     where reg_no = old.reg_no;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `td_fund_requisition`
--

CREATE TABLE `td_fund_requisition` (
  `req_dt` date NOT NULL,
  `sl_no` int(11) NOT NULL,
  `req_no` varchar(30) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `kms_id` int(11) NOT NULL,
  `block_id` varchar(20) NOT NULL,
  `soc_id` varchar(30) NOT NULL,
  `mill_id` varchar(20) NOT NULL,
  `wqsc_no` varchar(50) NOT NULL,
  `tot_paddy` decimal(12,5) NOT NULL,
  `tot_cmr` decimal(12,5) NOT NULL,
  `ho_flag` tinyint(1) NOT NULL,
  `approve1` enum('0','1','2') DEFAULT '0',
  `remark1` text NOT NULL,
  `approve1_by` varchar(55) DEFAULT NULL,
  `approve1_dt` datetime DEFAULT NULL,
  `approve2` enum('0','1','2') DEFAULT '0',
  `remark2` text NOT NULL,
  `approve2_by` varchar(55) DEFAULT NULL,
  `approve2_dt` datetime DEFAULT NULL,
  `approve3` enum('0','1','2') DEFAULT '0',
  `approve3_by` varchar(55) DEFAULT NULL,
  `approve3_dt` datetime DEFAULT NULL,
  `fund_flag` enum('0','1') NOT NULL DEFAULT '0',
  `funded_by` varchar(50) DEFAULT NULL,
  `funded_dt` datetime DEFAULT NULL,
  `sanc_no` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL,
  `approve_by` varchar(50) DEFAULT NULL,
  `approve_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_fund_requisition_dtls`
--

CREATE TABLE `td_fund_requisition_dtls` (
  `trans_dt` date NOT NULL,
  `req_no` varchar(30) NOT NULL,
  `account_type` varchar(50) NOT NULL,
  `per_unit_rate` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_amt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tds_amt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cgst_amt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `sgst_amt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `claim_amt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payble_amt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_flag` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_import_collection`
--

CREATE TABLE `td_import_collection` (
  `dist_cd` int(11) NOT NULL,
  `trans_id` int(11) NOT NULL,
  `bulk_trans_id` int(11) NOT NULL,
  `soc_id` varchar(55) NOT NULL,
  `mill_id` varchar(20) NOT NULL,
  `trans_dt` date NOT NULL,
  `bank_id` int(11) NOT NULL,
  `ben_name` varchar(200) NOT NULL,
  `qty` decimal(10,3) NOT NULL,
  `amt` decimal(10,2) NOT NULL,
  `chq_no` varchar(10) DEFAULT NULL,
  `chq_dt` date DEFAULT NULL,
  `ifsc_code` varchar(15) DEFAULT NULL,
  `acc_no` varchar(30) DEFAULT NULL,
  `trans_type` varchar(2) NOT NULL DEFAULT 'C'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `td_import_collection`
--
DELIMITER $$
CREATE TRIGGER `import_collection` AFTER INSERT ON `td_import_collection` FOR EACH ROW BEGIN
	declare ls_block			varchar(5);
    declare ld_bulk_id          Integer;
    
        select block
        into   ls_block
        from   md_society
        where  society_code  = new.soc_id
        and    branch_id     = new.dist_cd;
        
    insert into td_collections(kms_id,
                               camp_no,
                               branch_id,
                               block_id,
                               soc_id,
                               mill_id,
                               trans_dt,
                               trans_id,
                               bulk_trans_id,
                               bank_sl_no,
                               trans_type,
                               reg_no,
                               quantity,
                               amount,
                               cheque_no,
                               cheque_date,
                               chq_status,
                               ifsc_code,
                               acc_no,
                               certificate_1,
                               certificate_2,
                               certificate_4,
                               certificate_3,
                               certificate_5,
                               created_by,
                               muster_roll_no,
                               ho_status)
                      values(2,
                             1,
                             new.dist_cd,
                             ls_block,
                             new.soc_id,
                             new.mill_id,
                             new.trans_dt,
                             new.trans_id,
                             new.bulk_trans_id,
                             new.bank_id,
                             new.trans_type,
                             new.ben_name,
                             new.qty,
                             new.amt,
                             new.chq_no,
                             new.chq_dt,
                             'U',
                             new.ifsc_code,
                             new.acc_no,
                             'Y','Y','Y','Y','Y',
                             'Import',
                             0,
                             1
                             );
                             
    
    
    
    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `td_neft_reconciliation`
--

CREATE TABLE `td_neft_reconciliation` (
  `sequence_no` varchar(15) NOT NULL,
  `transaction_ref` varchar(30) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `value_date` date NOT NULL,
  `sending_branch_ifsc` varchar(15) NOT NULL,
  `sender_ac_type` varchar(5) NOT NULL,
  `sender_ac_no` varchar(20) NOT NULL,
  `sender_ac_name` varchar(100) NOT NULL,
  `benf_branch` varchar(15) NOT NULL,
  `benf_ac_type` varchar(5) NOT NULL,
  `benf_ac_no` varchar(20) NOT NULL,
  `benf_ac_name` varchar(100) NOT NULL,
  `txn_status` enum('Completed','Paid','Returned','NackBySFMS','Rejected','YES','NO','PROCESSED','Expired or Rejected by Authorizer/Confirmer') NOT NULL,
  `originator_of_remittance` varchar(100) NOT NULL,
  `sender_to_receiver_information` text NOT NULL,
  `reason` text NOT NULL,
  `remarks` text NOT NULL,
  `uploaded_by` varchar(55) NOT NULL,
  `uploaded_dt` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `td_neft_reconciliation`
--
DELIMITER $$
CREATE TRIGGER `neft_reconsiliation` AFTER INSERT ON `td_neft_reconciliation` FOR EACH ROW BEGIN
		DECLARE		ld_dist_id				integer;
        DECLARE		ldt_trans_dt			date;
        DECLARE	    ls_reg_no				varchar(50);
        DECLARE	    ld_trans_id				integer;
        DECLARE		ls_status				varchar(5);
        DECLARE		ls_fwd_status				varchar(5);
        DECLARE		ls_dwn_status				varchar(5);
        
        
        
        
        
        SET ld_dist_id 		= substr(SUBSTRING_INDEX(new.remarks,'/',2),-3); 
        SET ldt_trans_dt	= substr(new.remarks,-10);
        SET ls_reg_no 		= substr(new.remarks,1,instr(new.remarks,'/')-1); 
SET ld_trans_id     = substr(SUBSTRING_INDEX(new.remarks,'/',-2),1,instr(SUBSTRING_INDEX(new.remarks,'/',-2),'/')-1);
        
        
        
        

		INSERT INTO td_reconciliation_yes
                                        (dist_id,
                                         trans_dt,
                                         value_dt,
                                         trans_description,
                                         reference_no,
                                         amount,
                                         kms_id,
                                         trans_type,
                                         reg_no,
                                         bulk_trans_id,
                                         created_by,
                                         created_dt)
                                   values(ld_dist_id,
                                          ldt_trans_dt,
                                          new.value_date,
                                          concat(new.txn_status,' ',trim(new.reason)),
                                          new.transaction_ref,
                                          new.amount,
                                          2,
                                          'N',
                                          ls_reg_no,
                                          ld_trans_id,
                                          new.uploaded_by,
                                          new.uploaded_dt);
                                          
        if trim(new.txn_status) in('Paid', 'Completed','YES','PROCESSED') THEN		

                  SET ls_status = 'C';
                  SET ls_fwd_status = '1';
                  SET ls_dwn_status = '1';
      ELSE

                  SET ls_status = 'R';
                  SET ls_fwd_status = '0';
                  SET ls_dwn_status = '0';

      END IF;
                                          
       update  td_collections
       set     cheque_no  = new.transaction_ref,
               chq_status = ls_status,
               status     = ls_fwd_status,
               dwn_flag   = ls_dwn_status,
           	   chq_clg_dt = new.value_date
        where  branch_id  = ld_dist_id
        and    kms_id     = 2
        and    trans_dt   = ldt_trans_dt 
        
        and    reg_no        = ls_reg_no;                                 
                                          
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `td_paddy_qty_dates`
--

CREATE TABLE `td_paddy_qty_dates` (
  `id` int(11) NOT NULL,
  `paddy_dt` date NOT NULL,
  `max_qty` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `td_paddy_qty_dates`
--

INSERT INTO `td_paddy_qty_dates` (`id`, `paddy_dt`, `max_qty`) VALUES
(1, '2021-11-01', '90');

-- --------------------------------------------------------

--
-- Table structure for table `td_paddy_return_chq`
--

CREATE TABLE `td_paddy_return_chq` (
  `kms_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `trans_dt` date NOT NULL,
  `trans_id` int(11) NOT NULL,
  `bulk_trans_id` int(11) NOT NULL,
  `chq_no` varchar(6) DEFAULT NULL,
  `bank_sl_no` int(11) DEFAULT NULL,
  `chq_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_paddy_transaction`
--

CREATE TABLE `td_paddy_transaction` (
  `branch_id` int(11) NOT NULL,
  `kms_id` int(11) NOT NULL,
  `transactionid` varchar(20) NOT NULL,
  `centercode` varchar(25) NOT NULL,
  `reg_no` varchar(55) NOT NULL,
  `procurement_dt` varchar(50) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `chequeno` varchar(6) DEFAULT NULL,
  `chequedate` varchar(15) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_paid_bill_dtls`
--

CREATE TABLE `td_paid_bill_dtls` (
  `paid_no` int(11) NOT NULL,
  `bill_no` int(11) NOT NULL,
  `kms_year` varchar(10) NOT NULL,
  `pool_type` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_paid_dtls`
--

CREATE TABLE `td_paid_dtls` (
  `payment_dt` date NOT NULL,
  `paid_no` int(11) NOT NULL,
  `kms_year` varchar(10) NOT NULL,
  `total_payble` decimal(10,2) DEFAULT 0.00,
  `amount` decimal(10,2) DEFAULT 0.00,
  `trans_type` char(1) NOT NULL,
  `chq_no` varchar(10) NOT NULL,
  `chq_dt` date NOT NULL,
  `bank` int(11) NOT NULL,
  `approval_status` char(1) NOT NULL DEFAULT 'U',
  `approve_by` varchar(50) DEFAULT NULL,
  `approve_dt` datetime DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_dt` datetime NOT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_payment_bill`
--

CREATE TABLE `td_payment_bill` (
  `trans_dt` date NOT NULL,
  `pmt_bill_no` bigint(20) NOT NULL,
  `kms_id` varchar(10) NOT NULL,
  `dist` int(11) NOT NULL,
  `block` varchar(6) NOT NULL,
  `soc_id` varchar(50) NOT NULL,
  `mill_id` varchar(20) NOT NULL,
  `sanc_no` varchar(25) NOT NULL,
  `wqsc` varchar(55) NOT NULL,
  `tot_paddy` decimal(10,3) NOT NULL DEFAULT 0.000,
  `tot_cmr` decimal(10,3) NOT NULL DEFAULT 0.000,
  `ben_bill_no` varchar(9) NOT NULL,
  `ben_bill_dt` date NOT NULL,
  `mill_bill_no` varchar(9) NOT NULL,
  `mill_bill_dt` date NOT NULL,
  `paddy_qty` decimal(10,3) NOT NULL DEFAULT 0.000,
  `paddy_cmr` decimal(10,3) NOT NULL DEFAULT 0.000,
  `paddy_butta` decimal(10,3) NOT NULL DEFAULT 0.000,
  `gunny_cut` varchar(20) NOT NULL,
  `rice_type` char(1) NOT NULL,
  `pool_type` char(2) NOT NULL,
  `mandi_board` varchar(255) NOT NULL,
  `mandi_board_addr` varchar(255) NOT NULL,
  `transport_agency_name` varchar(100) NOT NULL,
  `transport_agency_addr` varchar(255) NOT NULL,
  `pay_mode` enum('C','R','N') NOT NULL,
  `bank_id` int(11) NOT NULL,
  `ref_no` varchar(35) NOT NULL,
  `ho_status` tinyint(1) NOT NULL DEFAULT 0,
  `ho_bill_number` varchar(55) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_dt` datetime NOT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_payment_bill_dtls`
--

CREATE TABLE `td_payment_bill_dtls` (
  `trans_dt` date NOT NULL,
  `pmt_bill_no` bigint(20) NOT NULL,
  `kms_id` int(11) NOT NULL,
  `dist` int(11) NOT NULL,
  `account_type` varchar(50) NOT NULL,
  `per_unit` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_amt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tds_amt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cgst_amt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `sgst_amt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `claim_amt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payble_amt` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_payment_dtls`
--

CREATE TABLE `td_payment_dtls` (
  `payment_dt` date NOT NULL,
  `trans_no` int(11) NOT NULL,
  `pmt_bill_no` int(11) NOT NULL,
  `total_payble` decimal(10,2) DEFAULT 0.00,
  `amount` decimal(10,2) DEFAULT 0.00,
  `trans_type` char(1) NOT NULL,
  `chq_no` varchar(10) NOT NULL,
  `chq_dt` date NOT NULL,
  `bank` int(11) NOT NULL,
  `approval_status` char(1) NOT NULL DEFAULT 'U',
  `approve_by` varchar(50) DEFAULT NULL,
  `approve_dt` datetime DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_dt` datetime NOT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `mofified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_payment_received`
--

CREATE TABLE `td_payment_received` (
  `received_no` int(11) NOT NULL,
  `received_date` date NOT NULL,
  `kms_year` varchar(10) NOT NULL,
  `pool_type` varchar(2) NOT NULL,
  `payment_type` char(2) NOT NULL,
  `payment_for` char(4) NOT NULL,
  `receivable_amt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tot_amt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_by` varchar(50) NOT NULL,
  `created_dt` date NOT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_received`
--

CREATE TABLE `td_received` (
  `trans_dt` date NOT NULL,
  `api_date` datetime DEFAULT NULL,
  `kms_year` int(11) NOT NULL,
  `branch_id` varchar(20) NOT NULL,
  `trans_no` int(11) NOT NULL,
  `dist` int(11) NOT NULL,
  `soc_id` varchar(25) NOT NULL,
  `mill_id` int(11) NOT NULL,
  `paddy_qty` decimal(10,3) NOT NULL DEFAULT 0.000,
  `file_no` varchar(255) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_received_bill_dtls`
--

CREATE TABLE `td_received_bill_dtls` (
  `received_no` int(11) NOT NULL,
  `bill_no` int(11) NOT NULL,
  `kms_year` varchar(10) NOT NULL,
  `pool_type` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_received_temp`
--

CREATE TABLE `td_received_temp` (
  `trans_dt` date NOT NULL,
  `api_date` datetime DEFAULT NULL,
  `kms_year` int(11) NOT NULL,
  `branch_id` varchar(20) NOT NULL,
  `trans_no` int(11) NOT NULL,
  `dist` int(11) NOT NULL,
  `soc_id` varchar(25) NOT NULL,
  `mill_id` int(11) NOT NULL,
  `paddy_qty` decimal(10,3) NOT NULL DEFAULT 0.000,
  `file_no` varchar(255) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_reconciliation_yes`
--

CREATE TABLE `td_reconciliation_yes` (
  `sl_no` int(11) NOT NULL,
  `dist_id` int(11) NOT NULL,
  `trans_dt` date NOT NULL,
  `value_dt` date DEFAULT NULL,
  `trans_description` varchar(255) NOT NULL,
  `reference_no` varchar(30) NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `kms_id` int(11) NOT NULL,
  `trans_type` enum('N','C') NOT NULL,
  `reg_no` varchar(50) DEFAULT NULL,
  `bulk_trans_id` int(11) NOT NULL,
  `reconsile_flag` varchar(5) NOT NULL DEFAULT 'N',
  `created_by` varchar(55) NOT NULL,
  `created_dt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_reissue_chq`
--

CREATE TABLE `td_reissue_chq` (
  `kms_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `issue_dt` date NOT NULL,
  `issue_id` int(11) NOT NULL,
  `trans_type` varchar(2) NOT NULL DEFAULT 'C',
  `old_chq_no` varchar(6) NOT NULL,
  `old_chq_bnk` int(11) NOT NULL,
  `proc_date` date DEFAULT NULL,
  `reg_no` varchar(50) NOT NULL,
  `new_chq_no` varchar(10) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `qty` decimal(5,2) NOT NULL,
  `amt` decimal(8,2) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_dt` date DEFAULT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_reverse_feed`
--

CREATE TABLE `td_reverse_feed` (
  `sl_no` bigint(20) NOT NULL,
  `kms_id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `forward_trans_id` bigint(20) NOT NULL,
  `book_no` int(11) NOT NULL,
  `corporate_code` varchar(55) DEFAULT NULL,
  `payment_run_date` datetime NOT NULL,
  `product_code` varchar(10) NOT NULL,
  `utr_no` varchar(100) DEFAULT NULL,
  `status_code` varchar(55) NOT NULL,
  `status_description` text DEFAULT NULL,
  `batch_no` int(11) NOT NULL,
  `reg_no` varchar(55) NOT NULL,
  `value_date` datetime NOT NULL,
  `bank_ref_no` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `dr_ac_no` varchar(55) DEFAULT NULL,
  `dr_ifsc_code` varchar(25) NOT NULL,
  `dr_cr_flag` varchar(10) NOT NULL,
  `cr_acc_no` varchar(100) NOT NULL,
  `file_no` varchar(150) DEFAULT NULL,
  `update_flag` varchar(5) NOT NULL DEFAULT 'N',
  `created_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_society_commision`
--

CREATE TABLE `td_society_commision` (
  `kms_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `trans_dt` date NOT NULL,
  `trans_cd` int(11) NOT NULL,
  `block_id` varchar(10) NOT NULL,
  `soc_id` varchar(20) NOT NULL,
  `mill_id` varchar(10) NOT NULL,
  `aggrement_no` varchar(20) NOT NULL,
  `sanc_no` varchar(55) DEFAULT NULL,
  `wqsc` varchar(55) NOT NULL,
  `branch_ref_no` varchar(20) NOT NULL,
  `pool_type` varchar(10) NOT NULL,
  `soc_bill_no` varchar(15) NOT NULL,
  `soc_bill_date` date DEFAULT NULL,
  `rice_type` varchar(5) NOT NULL,
  `qty` decimal(8,2) NOT NULL,
  `rate` decimal(8,2) NOT NULL,
  `amount_claimed` decimal(8,2) NOT NULL,
  `tot_amt` decimal(8,2) NOT NULL,
  `sgst_amt` decimal(6,2) DEFAULT NULL,
  `cgst_amt` decimal(6,2) DEFAULT NULL,
  `tds_amt` decimal(6,2) NOT NULL,
  `paid_amt` decimal(8,2) NOT NULL,
  `pay_mode` varchar(20) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `ref_no` varchar(20) NOT NULL,
  `remarks` text NOT NULL,
  `ho_bill_no` varchar(55) NOT NULL,
  `approved_status` enum('U','A') NOT NULL DEFAULT 'U',
  `created_by` varchar(50) NOT NULL,
  `created_dt` date DEFAULT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_dt` date DEFAULT NULL,
  `approved_by` varchar(50) NOT NULL,
  `approved_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `td_work_order`
--

CREATE TABLE `td_work_order` (
  `pre_order_no` varchar(55) NOT NULL,
  `order_no` int(11) NOT NULL,
  `block` varchar(20) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `trans_dt` date NOT NULL,
  `kms_year` varchar(10) NOT NULL,
  `soc_id` varchar(30) NOT NULL,
  `mill_id` varchar(20) NOT NULL,
  `paddy_qty` decimal(10,3) NOT NULL DEFAULT 0.000 COMMENT 'Unit is quintal',
  `created_by` varchar(30) NOT NULL,
  `created_dt` datetime NOT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL,
  `approval_status` char(2) DEFAULT 'U',
  `approved_by` varchar(50) DEFAULT NULL,
  `approved_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `td_work_order`
--

INSERT INTO `td_work_order` (`pre_order_no`, `order_no`, `block`, `branch_id`, `trans_dt`, `kms_year`, `soc_id`, `mill_id`, `paddy_qty`, `created_by`, `created_dt`, `modified_by`, `modified_dt`, `approval_status`, `approved_by`, `approved_dt`) VALUES
('S24-89', 1, '02429', 343, '2021-12-03', '4', '192000234320028', '572', '1000.000', 'susmitan', '2022-04-06 09:13:11', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-111', 2, '02429', 343, '2021-12-17', '4', '192000234320028', '572', '2000.000', 'susmitan', '2022-04-06 09:14:14', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-144', 3, '02429', 343, '2022-01-03', '4', '192000234320028', '572', '2000.000', 'susmitan', '2022-04-06 09:15:08', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-101', 4, '02435', 343, '2021-12-09', '4', '202100234320002', '571', '1000.000', 'susmitan', '2022-04-06 09:19:51', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-112', 5, '02435', 343, '2021-12-17', '4', '202100234320002', '571', '2000.000', 'susmitan', '2022-04-06 09:21:03', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-135(A)', 6, '02435', 343, '2021-12-27', '4', '202100234320002', '571', '2000.000', 'susmitan', '2022-04-06 09:25:41', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-154', 7, '02435', 343, '2022-01-03', '4', '202100234320002', '571', '3000.000', 'susmitan', '2022-04-06 09:26:21', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-', 8, '02440', 343, '2022-01-10', '4', '192000234320027', '568', '100.000', 'susmitan', '2022-04-06 09:32:14', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-167', 9, '02440', 343, '2022-01-17', '4', '192000234320019', '567', '1000.000', 'susmitan', '2022-04-06 09:34:41', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-165', 10, '02440', 343, '2022-01-13', '4', '202100234320003', '567', '100.000', 'susmitan', '2022-04-06 09:35:43', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-164', 11, '02440', 343, '2022-01-13', '4', '192000234320026', '567', '500.000', 'susmitan', '2022-04-06 09:36:29', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-106', 12, '02439', 343, '2021-12-17', '4', '192000234320020', '569', '1000.000', 'susmitan', '2022-04-06 09:39:20', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-108', 14, '02439', 343, '2021-12-17', '4', '192000234320013', '569', '1000.000', 'susmitan', '2022-04-06 09:43:00', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-166', 15, '02439', 343, '2022-01-17', '4', '192000234320010', '569', '1000.000', 'susmitan', '2022-04-06 09:44:09', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-162', 16, '02439', 343, '2022-01-10', '4', '192000234320014', '569', '200.000', 'susmitan', '2022-04-06 09:45:02', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-159(A)', 17, '02429', 343, '2021-12-29', '4', '192000234320028', '572', '2000.000', 'susmitan', '2022-04-06 09:51:05', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-162(A)', 18, '02429', 343, '2022-01-10', '4', '192000234320028', '572', '2200.000', 'susmitan', '2022-04-06 09:59:19', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-125(A)', 19, '02435', 343, '2021-12-23', '4', '202100234320002', '571', '2000.000', 'susmitan', '2022-04-06 10:03:30', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-164(A)', 20, '02435', 343, '2022-01-13', '4', '202100234320002', '571', '3000.000', 'susmitan', '2022-04-06 10:06:35', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-126', 21, '02435', 343, '2021-12-24', '4', '192000234320005', '571', '3000.000', 'susmitan', '2022-04-06 10:09:34', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-146', 22, '02435', 343, '2022-01-03', '4', '192000234320005', '571', '6000.000', 'susmitan', '2022-04-06 10:10:30', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-168(A)', 23, '02435', 343, '2022-01-18', '4', '192000234320005', '571', '4000.000', 'susmitan', '2022-04-06 10:11:40', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-128', 24, '02440', 343, '2021-12-29', '4', '202200234320002', '567', '3000.000', 'susmitan', '2022-04-06 10:14:53', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-151', 25, '02440', 343, '2022-01-03', '4', '202200234320002', '567', '6000.000', 'susmitan', '2022-04-06 10:15:37', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-110', 26, '02424', 343, '2021-12-17', '4', '192000234320029', '567', '4000.000', 'susmitan', '2022-04-06 10:17:10', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-120', 27, '02424', 343, '2021-12-23', '4', '192000234320029', '567', '4000.000', 'susmitan', '2022-04-06 10:19:56', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-136', 28, '02424', 343, '2021-12-27', '4', '192000234320029', '567', '3000.000', 'susmitan', '2022-04-06 10:20:44', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-152', 29, '02424', 343, '2022-01-03', '4', '192000234320029', '567', '5000.000', 'susmitan', '2022-04-06 10:21:54', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-105', 30, '02440', 343, '2021-12-17', '4', '192000234320032', '567', '3000.000', 'susmitan', '2022-04-06 10:23:27', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-119', 31, '02440', 343, '2021-12-23', '4', '192000234320032', '567', '3000.000', 'susmitan', '2022-04-06 10:23:59', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-135', 32, '02440', 343, '2021-12-27', '4', '192000234320032', '567', '3000.000', 'susmitan', '2022-04-06 10:25:20', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-150', 33, '02440', 343, '2022-01-03', '4', '192000234320032', '567', '5000.000', 'susmitan', '2022-04-06 10:25:55', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-107', 34, '02440', 343, '2021-12-17', '4', '202100234320004', '565', '3000.000', 'susmitan', '2022-04-06 10:27:37', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-118', 35, '02440', 343, '2021-12-23', '4', '202100234320004', '565', '3000.000', 'susmitan', '2022-04-06 10:28:16', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-134', 36, '02440', 343, '2021-12-27', '4', '202100234320004', '565', '3000.000', 'susmitan', '2022-04-06 10:29:45', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-149', 37, '02440', 343, '2022-01-03', '4', '202100234320004', '565', '5000.000', 'susmitan', '2022-04-06 10:30:14', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-175(A)', 38, '02440', 343, '2022-01-19', '4', '202100234320004', '565', '1000.000', 'susmitan', '2022-04-06 10:32:27', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-121', 39, '02424', 343, '2021-12-23', '4', '202200234320001', '565', '4000.000', 'susmitan', '2022-04-06 10:34:38', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-137', 40, '02424', 343, '2021-12-27', '4', '202200234320001', '565', '3000.000', 'susmitan', '2022-04-06 10:35:15', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-153', 41, '02424', 343, '2022-01-03', '4', '202200234320001', '565', '7000.000', 'susmitan', '2022-04-06 10:35:43', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-91', 42, '02423', 343, '2021-12-07', '4', '202100234320001', '572', '3000.000', 'susmitan', '2022-04-06 10:37:47', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-125', 43, '02423', 343, '2021-12-23', '4', '202100234320001', '572', '3000.000', 'susmitan', '2022-04-06 10:38:15', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-145', 44, '02423', 343, '2022-01-03', '4', '202100234320001', '572', '4000.000', 'susmitan', '2022-04-06 10:38:41', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-90', 45, '02436', 343, '2021-12-07', '4', '192000234320001', '568', '3000.000', 'susmitan', '2022-04-06 10:41:56', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-109', 46, '02436', 343, '2021-12-17', '4', '192000234320001', '568', '3000.000', 'susmitan', '2022-04-06 10:42:30', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-159', 47, '02436', 343, '2022-01-03', '4', '192000234320001', '568', '2000.000', 'susmitan', '2022-04-06 10:42:57', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-88', 48, '02429', 343, '2021-12-03', '4', '192000234320025', '568', '2000.000', 'susmitan', '2022-04-06 10:49:24', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-124', 49, '02429', 343, '2021-12-23', '4', '192000234320025', '568', '3000.000', 'susmitan', '2022-04-06 10:49:53', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-158', 50, '02429', 343, '2022-01-03', '4', '192000234320025', '568', '2500.000', 'susmitan', '2022-04-06 10:50:39', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-160', 51, '02439', 343, '2022-01-10', '4', '192000234320012', '569', '500.000', 'susmitan', '2022-04-06 10:52:36', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-168', 52, '02439', 343, '2022-01-18', '4', '192000234320012', '569', '500.000', 'susmitan', '2022-04-06 10:53:32', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-140', 53, '02439', 343, '2021-12-27', '4', '192000234320009', '569', '2000.000', 'susmitan', '2022-04-06 10:54:47', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-157', 54, '02439', 343, '2022-01-03', '4', '192000234320009', '569', '3000.000', 'susmitan', '2022-04-06 10:56:33', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-165(A)', 55, '02439', 343, '2022-01-13', '4', '192000234320009', '569', '100.000', 'susmitan', '2022-04-06 10:59:05', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-122', 56, '02439', 343, '2021-12-23', '4', '192000234320011', '569', '3000.000', 'susmitan', '2022-04-06 11:07:38', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-138', 57, '02439', 343, '2021-12-27', '4', '192000234320011', '569', '4000.000', 'susmitan', '2022-04-06 11:08:26', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-155', 58, '02439', 343, '2022-01-03', '4', '192000234320011', '569', '3000.000', 'susmitan', '2022-04-06 11:08:51', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-161(A)', 59, '02439', 343, '2022-01-10', '4', '192000234320011', '569', '2000.000', 'susmitan', '2022-04-06 11:09:43', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-123', 60, '02439', 343, '2021-12-23', '4', '192000234320015', '569', '3000.000', 'susmitan', '2022-04-06 11:13:15', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-139', 61, '02439', 343, '2021-12-27', '4', '192000234320015', '569', '3000.000', 'susmitan', '2022-04-06 11:13:47', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-156', 62, '02439', 343, '2022-01-03', '4', '192000234320015', '569', '3000.000', 'susmitan', '2022-04-06 11:14:17', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-166(A)', 63, '02439', 343, '2022-01-17', '4', '192000234320015', '569', '3000.000', 'susmitan', '2022-04-06 11:16:32', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-92', 64, '02438', 343, '2021-12-07', '4', '192000234320018', '569', '2000.000', 'susmitan', '2022-04-06 11:18:48', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-103', 65, '02438', 343, '2021-12-09', '4', '192000234320018', '569', '2000.000', 'susmitan', '2022-04-06 11:19:15', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-113', 66, '02438', 343, '2021-12-17', '4', '192000234320018', '569', '2500.000', 'susmitan', '2022-04-06 11:20:09', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-117', 67, '02438', 343, '2021-12-23', '4', '192000234320018', '569', '3000.000', 'susmitan', '2022-04-06 11:22:52', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-133', 68, '02438', 343, '2021-12-27', '4', '192000234320018', '569', '2000.000', 'susmitan', '2022-04-06 11:23:25', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-147', 69, '02438', 343, '2022-01-03', '4', '192000234320018', '569', '3000.000', 'susmitan', '2022-04-06 11:23:53', NULL, NULL, 'A', 'Susmita Nath', '2022-04-06'),
('S24-102', 70, '02418', 343, '2021-12-09', '4', '192000234320007', '566', '1000.000', 'susmitan', '2022-04-07 06:17:44', NULL, NULL, 'A', 'Susmita Nath', '2022-04-07'),
('S24-127', 71, '02418', 343, '2021-12-27', '4', '192000234320007', '566', '500.000', 'susmitan', '2022-04-07 06:18:35', NULL, NULL, 'A', 'Susmita Nath', '2022-04-07'),
('NDA-SCMF/NB/0', 74, '02315', 336, '2021-12-03', '4', '192000633620033', '363', '1000.000', 'sudipd', '2022-04-07 10:51:38', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-07'),
('NDA-SCMF/NB/00', 75, '02314', 336, '2021-12-03', '4', '192000233620013', '355', '1000.000', 'sudipd', '2022-04-08 06:30:25', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/00241/', 76, '02313', 336, '2021-12-03', '4', '192000233620014', '351', '1000.000', 'sudipd', '2022-04-08 06:32:48', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/00242/', 77, '02314', 336, '2021-12-03', '4', '192000233620030', '352', '1000.000', 'sudipd', '2022-04-08 06:34:27', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/00243/', 78, '02304', 336, '2021-12-06', '4', '192000233620019', '354', '1000.000', 'sudipd', '2022-04-08 06:35:37', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('BRH-384', 80, '02263', 334, '2021-12-22', '4', '192000233420004', '109', '5117.640', 'Mantum', '2022-04-08 07:19:08', NULL, NULL, 'A', 'Mantu Kumar Maji', '2022-04-08'),
('NDA-SCMF/NB/0249', 82, '02304', 336, '2021-12-08', '4', '202200233620002', '355', '1000.000', 'sudipd', '2022-04-08 07:50:12', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0248/', 83, '02304', 336, '2021-12-08', '4', '202200233620001', '358', '1000.000', 'sudipd', '2022-04-08 07:51:47', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0247/', 84, '02304', 336, '2021-12-08', '4', '192000233620039', '352', '1000.000', 'sudipd', '2022-04-08 07:52:37', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0246/', 85, '02304', 336, '2021-12-08', '4', '202200233620003', '355', '1000.000', 'sudipd', '2022-04-08 07:53:24', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0245/', 86, '02312', 336, '2021-12-08', '4', '192000233620015', '352', '1000.000', 'sudipd', '2022-04-08 07:54:06', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0258/', 87, '02308', 336, '2021-12-08', '4', '192000233620012', '351', '1000.000', 'sudipd', '2022-04-08 07:55:18', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0250/', 88, '02303', 336, '2021-12-08', '4', '192000233620031', '363', '1000.000', 'sudipd', '2022-04-08 07:56:49', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0251/', 89, '02302', 336, '2021-12-08', '4', '192000233620037', '363', '1000.000', 'sudipd', '2022-04-08 07:57:31', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0257/', 91, '02308', 336, '2021-12-08', '4', '202100233620002', '354', '1000.000', 'sudipd', '2022-04-08 08:01:10', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0256/', 92, '02308', 336, '2021-12-08', '4', '192000233620001', '358', '1000.000', 'sudipd', '2022-04-08 08:01:48', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0259/', 93, '02314', 336, '2021-12-10', '4', '192000233620022', '357', '1000.000', 'sudipd', '2022-04-08 08:02:38', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0260/', 94, '02308', 336, '2021-12-10', '4', '192000233620011', '351', '1000.000', 'sudipd', '2022-04-08 08:03:33', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0261/', 95, '02306', 336, '2021-12-10', '4', '202100233620003', '351', '1000.000', 'sudipd', '2022-04-08 08:04:34', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0262', 96, '02314', 336, '2021-12-10', '4', '192000233620008', '354', '1000.000', 'sudipd', '2022-04-08 08:05:35', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0263', 97, '02308', 336, '2021-12-14', '4', '192000233620024', '358', '1000.000', 'sudipd', '2022-04-08 08:06:50', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0264/', 98, '02306', 336, '2021-12-14', '4', '192000233620004', '355', '1000.000', 'sudipd', '2022-04-08 08:31:44', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0265/', 100, '02313', 336, '2021-12-14', '4', '192000233620014', '351', '3000.000', 'sudipd', '2022-04-08 08:35:58', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0270/', 101, '02315', 336, '2021-12-15', '4', '192000633620033', '363', '3000.000', 'sudipd', '2022-04-08 08:37:40', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0272/', 102, '02313', 336, '2021-12-15', '4', '192000233620026', '358', '1000.000', 'sudipd', '2022-04-08 08:38:27', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0271/', 103, '02314', 336, '2021-12-15', '4', '192000233620034', '354', '1000.000', 'sudipd', '2022-04-08 08:39:48', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0269', 104, '02312', 336, '2021-12-15', '4', '192000233620015', '352', '3000.000', 'sudipd', '2022-04-08 08:40:18', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0268/', 105, '02314', 336, '2021-12-15', '4', '192000233620013', '355', '3000.000', 'sudipd', '2022-04-08 08:40:54', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0273', 106, '02312', 336, '2021-12-16', '4', '192000233620042', '351', '1000.000', 'sudipd', '2022-04-08 08:41:19', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0275/', 107, '02314', 336, '2021-12-16', '4', '192000233620030', '352', '3000.000', 'sudipd', '2022-04-08 08:41:51', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0278/', 108, '02304', 336, '2021-12-16', '4', '202200233620002', '355', '3000.000', 'sudipd', '2022-04-08 08:42:26', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0276/', 109, '02304', 336, '2021-12-16', '4', '202200233620003', '355', '3000.000', 'sudipd', '2022-04-08 08:43:03', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0279/', 110, '02304', 336, '2021-12-16', '4', '202200233620001', '358', '3000.000', 'sudipd', '2022-04-08 08:43:51', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0277/', 111, '02304', 336, '2021-12-16', '4', '192000233620039', '352', '3000.000', 'sudipd', '2022-04-08 08:44:16', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0281/', 112, '02304', 336, '2021-12-17', '4', '192000233620019', '354', '2000.000', 'sudipd', '2022-04-08 08:44:48', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0285/', 113, '02314', 336, '2021-12-17', '4', '192000233620008', '354', '2000.000', 'sudipd', '2022-04-08 08:45:17', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0288', 114, '02308', 336, '2021-12-17', '4', '192000233620001', '358', '2000.000', 'sudipd', '2022-04-08 08:45:41', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0289/', 115, '02310', 336, '2021-12-17', '4', '192000233620007', '351', '1000.000', 'sudipd', '2022-04-08 08:46:10', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0282', 116, '02308', 336, '2021-12-17', '4', '192000233620012', '351', '3000.000', 'sudipd', '2022-04-08 08:46:39', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0287/', 117, '02303', 336, '2021-12-17', '4', '192000233620031', '363', '3000.000', 'sudipd', '2022-04-08 08:47:11', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0286/', 118, '02302', 336, '2021-12-17', '4', '192000233620037', '363', '3000.000', 'sudipd', '2022-04-08 08:47:37', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0280', 119, '02313', 336, '2021-12-17', '4', '192000633620003', '358', '1000.000', 'sudipd', '2022-04-08 08:48:04', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0283/', 120, '02308', 336, '2021-12-17', '4', '192000233620011', '351', '2000.000', 'sudipd', '2022-04-08 08:48:29', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0284/', 121, '02306', 336, '2021-12-17', '4', '202100233620003', '351', '3000.000', 'sudipd', '2022-04-08 08:48:55', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0290', 122, '02310', 336, '2021-12-20', '4', '192000233620033', '351', '1000.000', 'sudipd', '2022-04-08 08:49:31', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0293/', 123, '02308', 336, '2021-12-20', '4', '202100233620002', '354', '2000.000', 'sudipd', '2022-04-08 08:50:07', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0292/', 124, '02312', 336, '2021-12-20', '4', '192000233620016', '357', '1000.000', 'sudipd', '2022-04-08 08:50:38', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0291/', 125, '02310', 336, '2021-12-20', '4', '192000233620032', '351', '1000.000', 'sudipd', '2022-04-08 08:51:06', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0295/', 126, '02314', 336, '2021-12-21', '4', '192000233620034', '354', '1000.000', 'sudipd', '2022-04-08 08:52:00', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0294/', 127, '02304', 336, '2021-12-21', '4', '192000233620044', '363', '1000.000', 'sudipd', '2022-04-08 08:52:30', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0303/', 128, '02306', 336, '2021-12-22', '4', '192000233620004', '355', '3000.000', 'sudipd', '2022-04-08 08:53:02', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0304/', 129, '02307', 336, '2021-12-22', '4', '192000233620040', '362', '1000.000', 'sudipd', '2022-04-08 08:53:36', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0306/', 130, '02308', 336, '2021-12-23', '4', '192000233620001', '354', '1000.000', 'sudipd', '2022-04-08 08:54:09', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0309/', 131, '02311', 336, '2021-12-23', '4', '192000233620041', '351', '1000.000', 'sudipd', '2022-04-08 08:54:33', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0308/', 132, '02312', 336, '2021-12-23', '4', '192000633620022', '351', '1000.000', 'sudipd', '2022-04-08 08:55:10', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0307', 133, '02314', 336, '2021-12-23', '4', '202200233620004', '355', '1000.000', 'sudipd', '2022-04-08 08:55:41', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0310/', 134, '02313', 336, '2021-12-23', '4', '202200233620006', '351', '500.000', 'sudipd', '2022-04-08 08:56:26', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0311/', 135, '02314', 336, '2021-12-24', '4', '192000233620022', '357', '1000.000', 'sudipd', '2022-04-08 08:57:06', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0312', 136, '02307', 336, '2021-12-24', '4', '202100233620001', '362', '1000.000', 'sudipd', '2022-04-08 08:57:51', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0317/', 137, '02315', 336, '2021-12-24', '4', '192000633620033', '363', '3000.000', 'sudipd', '2022-04-08 08:58:58', NULL, NULL, 'U', NULL, NULL),
('NDA-SCMF/NB/0316', 138, '02314', 336, '2021-12-24', '4', '192000233620013', '355', '3000.000', 'sudipd', '2022-04-08 08:59:28', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0315/', 139, '02313', 336, '2021-12-24', '4', '192000233620014', '351', '3000.000', 'sudipd', '2022-04-08 09:00:00', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0319', 140, '02312', 336, '2021-12-24', '4', '192000633620022', '351', '3000.000', 'sudipd', '2022-04-08 09:01:00', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0320', 141, '02308', 336, '2021-12-24', '4', '192000233620024', '358', '1000.000', 'sudipd', '2022-04-08 09:01:23', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0313/', 142, '02315', 336, '2021-12-24', '4', '192000633620037', '355', '1000.000', 'sudipd', '2022-04-08 09:01:57', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0314/', 143, '02315', 336, '2021-12-24', '4', '202200233620005', '355', '1000.000', 'sudipd', '2022-04-08 09:14:45', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0318/', 144, '02302', 336, '2021-12-24', '4', '192000233620037', '363', '2000.000', 'sudipd', '2022-04-08 09:15:43', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0329/', 145, '02313', 336, '2021-12-27', '4', '192000233620018', '363', '1000.000', 'sudipd', '2022-04-08 09:16:23', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0330', 146, '02301', 336, '2021-12-27', '4', '192000233620009', '352', '1000.000', 'sudipd', '2022-04-08 09:16:57', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0323', 147, '02310', 336, '2021-12-27', '4', '192000233620032', '351', '2000.000', 'sudipd', '2022-04-08 09:17:37', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0327/', 148, '02304', 336, '2021-12-27', '4', '192000233620019', '354', '1000.000', 'sudipd', '2022-04-08 09:18:39', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0326/', 149, '02315', 336, '2021-12-27', '4', '202200233620007', '355', '1000.000', 'sudipd', '2022-04-08 09:19:16', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0324/', 150, '02308', 336, '2021-12-27', '4', '192000233620001', '354', '1000.000', 'sudipd', '2022-04-08 09:20:13', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0328/', 151, '02313', 336, '2021-12-27', '4', '192000633620003', '358', '1000.000', 'sudipd', '2022-04-08 10:26:00', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0340/', 152, '02308', 336, '2021-12-28', '4', '192000233620012', '351', '2000.000', 'sudipd', '2022-04-08 10:26:35', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0338/', 153, '02308', 336, '2021-12-28', '4', '192000233620011', '351', '2000.000', 'sudipd', '2022-04-08 10:27:04', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0342/', 154, '02314', 336, '2021-12-28', '4', '192000233620030', '352', '2000.000', 'sudipd', '2022-04-08 10:27:43', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0337/', 155, '02314', 336, '2021-12-28', '4', '202200233620004', '355', '3000.000', 'sudipd', '2022-04-08 10:28:32', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0339/', 156, '02306', 336, '2021-12-28', '4', '202100233620003', '351', '3000.000', 'sudipd', '2022-04-08 10:29:16', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0341/', 157, '02312', 336, '2021-12-28', '4', '192000233620015', '352', '3000.000', 'sudipd', '2022-04-08 10:29:57', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0336/', 158, '02312', 336, '2021-12-28', '4', '192000233620016', '357', '1000.000', 'sudipd', '2022-04-08 10:30:34', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0346/', 159, '02311', 336, '2021-12-29', '4', '192000233620041', '351', '3000.000', 'sudipd', '2022-04-08 10:31:25', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0347', 160, '02302', 336, '2021-12-29', '4', '192000233620037', '363', '2000.000', 'sudipd', '2022-04-08 10:32:00', NULL, NULL, 'U', NULL, NULL),
('NDA-SCMF/NB/0348/', 161, '02304', 336, '2021-12-29', '4', '192000233620039', '352', '2000.000', 'sudipd', '2022-04-08 10:33:11', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0349/', 162, '02315', 336, '2021-12-29', '4', '192000633620033', '363', '2000.000', 'sudipd', '2022-04-08 10:33:46', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0343/', 163, '02306', 336, '2021-12-29', '4', '192000233620027', '354', '1000.000', 'sudipd', '2022-04-08 10:34:42', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0345/', 164, '02314', 336, '2021-12-29', '4', '192000233620035', '354', '1000.000', 'sudipd', '2022-04-08 10:35:13', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0344/', 165, '02307', 336, '2021-12-29', '4', '192000233620017', '354', '1000.000', 'sudipd', '2022-04-08 10:35:52', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0352/', 166, '02307', 336, '2021-12-31', '4', '192000233620040', '362', '1000.000', 'sudipd', '2022-04-08 10:36:40', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0355/', 167, '02314', 336, '2022-01-03', '4', '192000233620034', '354', '1000.000', 'sudipd', '2022-04-08 10:37:27', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0361/', 168, '02310', 336, '2022-01-03', '4', '192000233620033', '351', '1000.000', 'sudipd', '2022-04-08 10:38:07', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0359/', 169, '02308', 336, '2022-01-03', '4', '192000233620001', '358', '1000.000', 'sudipd', '2022-04-08 10:38:42', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0358/', 170, '02303', 336, '2022-01-03', '4', '192000233620031', '363', '2000.000', 'sudipd', '2022-04-08 10:39:33', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0367/', 171, '02306', 336, '2022-01-05', '4', '192000233620004', '355', '2000.000', 'sudipd', '2022-04-08 10:40:19', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0365/', 172, '02305', 336, '2022-01-05', '4', '192000233620020', '358', '1000.000', 'sudipd', '2022-04-08 10:40:50', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0366', 173, '02313', 336, '2022-01-05', '4', '192000633620003', '363', '1000.000', 'sudipd', '2022-04-08 10:41:53', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0371/', 174, '02313', 336, '2022-01-07', '4', '192000233620014', '351', '2000.000', 'sudipd', '2022-04-08 10:43:18', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0374/', 175, '02304', 336, '2022-01-07', '4', '202200233620003', '355', '1000.000', 'sudipd', '2022-04-08 10:44:02', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0372/', 176, '02314', 336, '2022-01-07', '4', '192000233620030', '352', '1000.000', 'sudipd', '2022-04-08 10:44:59', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0373/', 177, '02302', 336, '2022-01-07', '4', '192000233620037', '363', '2000.000', 'sudipd', '2022-04-08 10:45:32', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0381/', 178, '02313', 336, '2022-01-10', '4', '192000233620018', '363', '2000.000', 'sudipd', '2022-04-08 10:46:10', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0379/', 179, '02314', 336, '2022-01-10', '4', '192000233620008', '354', '500.000', 'sudipd', '2022-04-08 10:46:47', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0380/', 180, '02308', 336, '2022-01-10', '4', '192000233620011', '351', '1000.000', 'sudipd', '2022-04-08 10:47:43', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0382/', 181, '02304', 336, '2022-01-10', '4', '202200233620003', '351', '1000.000', 'sudipd', '2022-04-08 10:48:21', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0389/', 182, '02303', 336, '2022-01-13', '4', '202200233620009', '363', '500.000', 'sudipd', '2022-04-08 10:50:40', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0390/', 183, '02303', 336, '2022-01-13', '4', '202200233620010', '363', '500.000', 'sudipd', '2022-04-08 10:51:42', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0388/', 184, '02312', 336, '2022-01-13', '4', '192000233620015', '352', '1000.000', 'sudipd', '2022-04-08 10:57:55', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0387/', 185, '02314', 336, '2021-01-13', '4', '192000233620013', '355', '1000.000', 'sudipd', '2022-04-08 10:59:12', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0386', 186, '02306', 336, '2022-01-13', '4', '202100233620003', '351', '1000.000', 'sudipd', '2022-04-08 10:59:54', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0393/', 187, '02304', 336, '2022-01-14', '4', '202200233620001', '358', '1000.000', 'sudipd', '2022-04-08 11:00:28', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0392/', 188, '02304', 336, '2022-01-14', '4', '202200233620002', '355', '2000.000', 'sudipd', '2022-04-08 11:01:21', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0394/', 189, '02308', 336, '2022-01-14', '4', '192000233620012', '351', '1000.000', 'sudipd', '2022-04-08 11:01:54', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0395/', 190, '02306', 336, '2022-01-14', '4', '192000233620027', '354', '1000.000', 'sudipd', '2022-04-08 11:02:26', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0400/', 191, '02314', 336, '2022-01-17', '4', '192000233620022', '357', '1000.000', 'sudipd', '2022-04-08 11:02:51', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0403/', 192, '02313', 336, '2022-01-17', '4', '192000233620026', '354', '1000.000', 'sudipd', '2022-04-08 11:03:24', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0402', 193, '02311', 336, '2022-01-17', '4', '192000233620041', '351', '3000.000', 'sudipd', '2022-04-08 11:03:54', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0397/', 194, '02306', 336, '2022-01-17', '4', '202100233620003', '351', '2000.000', 'sudipd', '2022-04-08 11:04:21', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0406/', 195, '02314', 336, '2022-01-17', '4', '192000233620013', '355', '1000.000', 'sudipd', '2022-04-08 11:05:11', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0404', 196, '02313', 336, '2022-01-17', '4', '192000633620003', '363', '1000.000', 'sudipd', '2022-04-08 11:06:26', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0405/', 197, '02314', 336, '2022-01-17', '4', '192000233620030', '352', '1000.000', 'sudipd', '2022-04-08 11:07:02', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0401/', 198, '02308', 336, '2022-01-17', '4', '192000233620011', '351', '1000.000', 'sudipd', '2022-04-08 11:07:41', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0410/', 199, '02312', 336, '2022-01-19', '4', '192000233620016', '357', '1000.000', 'sudipd', '2022-04-08 11:08:16', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0411/', 200, '02314', 336, '2022-01-19', '4', '192000233620034', '354', '1000.000', 'sudipd', '2022-04-08 11:09:05', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0415/', 201, '02301', 336, '2022-01-20', '4', '192000233620009', '352', '1000.000', 'sudipd', '2022-04-08 11:10:08', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0414/', 202, '02307', 336, '2022-01-20', '4', '202200233620011', '361', '1000.000', 'sudipd', '2022-04-08 11:10:47', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0413/', 203, '02306', 336, '2022-01-20', '4', '192000233620004', '355', '1000.000', 'sudipd', '2022-04-08 11:11:31', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0424', 204, '02312', 336, '2022-01-21', '4', '192000633620022', '351', '2000.000', 'sudipd', '2022-04-08 11:13:31', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0421/', 205, '02312', 336, '2022-01-21', '4', '192000233620015', '352', '2000.000', 'sudipd', '2022-04-08 11:14:02', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0420', 206, '02313', 336, '2022-01-21', '4', '192000233620014', '351', '3000.000', 'sudipd', '2022-04-08 11:14:32', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0423/', 207, '02308', 336, '2022-01-21', '4', '192000233620012', '351', '2000.000', 'sudipd', '2022-04-08 11:15:18', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0422', 208, '02315', 336, '2022-01-21', '4', '192000633620033', '363', '2000.000', 'sudipd', '2022-04-08 11:16:56', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0428/', 209, '02306', 336, '2022-01-24', '4', '192000233620027', '354', '1000.000', 'sudipd', '2022-04-08 11:18:12', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0431/', 210, '02314', 336, '2022-01-25', '4', '192000233620013', '356', '2000.000', 'sudipd', '2022-04-08 11:18:48', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0432/', 211, '02304', 336, '2022-01-25', '4', '192000233620039', '356', '2000.000', 'sudipd', '2022-04-08 11:19:42', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0429', 212, '02304', 336, '2022-01-25', '4', '192000233620019', '354', '1000.000', 'sudipd', '2022-04-08 11:20:16', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0430/', 213, '02314', 336, '2022-01-25', '4', '192000233620030', '351', '2000.000', 'sudipd', '2022-04-08 11:20:46', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0435/', 214, '02313', 336, '2022-01-27', '4', '192000633620003', '363', '2000.000', 'sudipd', '2022-04-08 11:22:04', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0437/', 215, '02307', 336, '2022-01-27', '4', '192000233620017', '363', '1000.000', 'sudipd', '2022-04-08 11:22:32', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0436/', 216, '02308', 336, '2022-01-27', '4', '192000233620028', '353', '500.000', 'sudipd', '2022-04-08 11:23:24', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0441/', 217, '02304', 336, '2022-01-28', '4', '192000233620044', '363', '1000.000', 'sudipd', '2022-04-08 11:24:03', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0444/', 218, '02304', 336, '2022-01-28', '4', '202200233620003', '351', '2000.000', 'sudipd', '2022-04-08 11:24:49', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0443/', 219, '02312', 336, '2022-01-28', '4', '192000633620022', '351', '3000.000', 'sudipd', '2022-04-08 11:25:18', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0442/', 220, '02308', 336, '2022-01-28', '4', '192000233620011', '351', '500.000', 'sudipd', '2022-04-08 11:27:04', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0458', 221, '02306', 336, '2022-01-31', '4', '192000233620027', '354', '1000.000', 'sudipd', '2022-04-08 11:27:53', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0450', 222, '02314', 336, '2022-01-31', '4', '192000233620022', '357', '1000.000', 'sudipd', '2022-04-08 11:38:17', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0452/', 223, '02307', 336, '2022-01-31', '4', '192000233620040', '362', '1000.000', 'sudipd', '2022-04-08 11:39:02', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0451/', 224, '02312', 336, '2022-01-31', '4', '192000233620042', '351', '500.000', 'sudipd', '2022-04-08 11:41:41', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0454/', 225, '02315', 336, '2022-01-31', '4', '202200233620005', '355', '1000.000', 'sudipd', '2022-04-08 11:42:22', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0455/', 226, '02315', 336, '2022-01-31', '4', '192000633620037', '355', '1000.000', 'sudipd', '2022-04-08 11:47:48', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0499/', 227, '02306', 336, '2022-01-31', '4', '202100233620003', '351', '2000.000', 'sudipd', '2022-04-08 11:48:19', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0453/', 228, '02311', 336, '2022-01-31', '4', '192000233620041', '351', '2000.000', 'sudipd', '2022-04-08 11:48:52', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0448/', 229, '02303', 336, '2022-01-31', '4', '192000233620031', '363', '1000.000', 'sudipd', '2022-04-08 11:49:30', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0459/', 230, '02304', 336, '2022-02-01', '4', '202200233620001', '356', '2000.000', 'sudipd', '2022-04-08 11:50:18', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0465/', 231, '02312', 336, '2022-02-02', '4', '192000233620015', '352', '2000.000', 'sudipd', '2022-04-08 11:50:54', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0468/', 232, '02308', 336, '2022-02-03', '4', '192000233620024', '358', '1000.000', 'sudipd', '2022-04-08 11:51:21', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0472', 233, '02306', 336, '2022-02-07', '4', '192000233620004', '355', '2000.000', 'sudipd', '2022-04-08 11:52:39', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0474/', 234, '02304', 336, '2022-02-07', '4', '202200233620002', '355', '2000.000', 'sudipd', '2022-04-08 11:53:16', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0473/', 235, '02314', 336, '2022-02-07', '4', '192000233620013', '356', '3000.000', 'sudipd', '2022-04-08 11:53:47', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0479/', 236, '02313', 336, '2022-02-08', '4', '192000233620014', '351', '2000.000', 'sudipd', '2022-04-08 11:54:29', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0481/', 237, '02311', 336, '2022-02-08', '4', '192000233620041', '351', '2000.000', 'sudipd', '2022-04-08 11:55:03', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0480/', 238, '02304', 336, '2022-02-08', '4', '202200233620003', '351', '1000.000', 'sudipd', '2022-04-08 11:55:36', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0477/', 239, '02313', 336, '2022-02-08', '4', '192000233620026', '354', '1000.000', 'sudipd', '2022-04-08 11:56:13', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0478/', 240, '02308', 336, '2022-02-08', '4', '192000233620001', '354', '2000.000', 'sudipd', '2022-04-08 11:57:04', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0484/', 241, '02315', 336, '2022-02-09', '4', '202200233620005', '355', '2000.000', 'sudipd', '2022-04-08 11:57:37', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0483/', 242, '02304', 336, '2022-02-09', '4', '192000233620039', '356', '2000.000', 'sudipd', '2022-04-08 11:58:12', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0486/', 243, '02313', 336, '2022-02-10', '4', '192000633620003', '363', '1000.000', 'sudipd', '2022-04-08 11:58:48', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0493/', 244, '02306', 336, '2022-02-11', '4', '202100233620003', '351', '2000.000', 'sudipd', '2022-04-08 11:59:57', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0492/', 245, '02312', 336, '2022-02-11', '4', '192000233620015', '352', '2000.000', 'sudipd', '2022-04-08 12:00:29', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0496/', 246, '02312', 336, '2022-02-11', '4', '192000633620022', '351', '2000.000', 'sudipd', '2022-04-08 12:01:01', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0495/', 247, '02315', 336, '2022-02-11', '4', '202200233620007', '355', '1000.000', 'sudipd', '2022-04-08 12:01:51', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0497/', 248, '02313', 336, '2022-02-11', '4', '192000233620018', '363', '2000.000', 'sudipd', '2022-04-08 12:02:25', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0490/', 249, '02314', 336, '2022-02-11', '4', '192000233620030', '351', '1000.000', 'sudipd', '2022-04-08 12:03:04', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0491/', 250, '02315', 336, '2022-02-11', '4', '192000633620033', '363', '2000.000', 'sudipd', '2022-04-08 12:04:33', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0504/', 251, '02315', 336, '2022-02-15', '4', '192000633620037', '355', '2000.000', 'sudipd', '2022-04-08 12:05:18', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0506/', 252, '02314', 336, '2022-02-16', '4', '192000233620030', '351', '1000.000', 'sudipd', '2022-04-08 12:05:48', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0507/', 253, '02304', 336, '2022-02-16', '4', '202200233620002', '355', '2000.000', 'sudipd', '2022-04-08 12:06:21', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0508/', 254, '02313', 336, '2022-02-17', '4', '192000233620014', '351', '2000.000', 'sudipd', '2022-04-08 12:06:50', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0509/', 255, '02304', 336, '2022-02-17', '4', '202200233620003', '351', '2000.000', 'sudipd', '2022-04-08 12:07:32', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0513/', 256, '02302', 336, '2022-02-18', '4', '192000233620037', '363', '2000.000', 'sudipd', '2022-04-08 12:08:33', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0512', 257, '02315', 336, '2022-02-18', '4', '202200233620007', '355', '2000.000', 'sudipd', '2022-04-08 12:09:11', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0511/', 258, '02311', 336, '2022-02-18', '4', '192000233620041', '351', '2000.000', 'sudipd', '2022-04-08 12:09:37', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('BRH-349', 260, '02261', 334, '2021-12-07', '4', '192000233420025', '80', '5117.640', 'Mantum', '2022-04-08 11:52:01', NULL, NULL, 'U', NULL, NULL),
('BRH-20', 261, '02261', 334, '2022-01-07', '4', '192000233420025', '80', '5117.640', 'Mantum', '2022-04-08 11:52:49', NULL, NULL, 'U', NULL, NULL),
('BRH-350', 262, '02254', 334, '2021-12-07', '4', '192000233420013', '109', '5117.640', 'Mantum', '2022-04-08 11:53:44', NULL, NULL, 'U', NULL, NULL),
('BRH-41', 263, '02254', 334, '2022-01-14', '4', '192000233420013', '109', '1279.410', 'Mantum', '2022-04-08 11:54:55', NULL, NULL, 'U', NULL, NULL),
('BRH-351', 264, '02266', 334, '2021-12-07', '4', '202100233420007', '63', '5117.640', 'Mantum', '2022-04-08 11:55:49', NULL, NULL, 'U', NULL, NULL),
('BRH-352', 265, '02257', 334, '2021-12-07', '4', '192000233420017', '77', '5117.640', 'Mantum', '2022-04-08 11:57:31', NULL, NULL, 'U', NULL, NULL),
('BRH-67', 266, '02257', 334, '2022-01-18', '4', '192000233420017', '77', '5117.640', 'Mantum', '2022-04-09 12:00:18', NULL, NULL, 'U', NULL, NULL),
('BRH-169', 267, '02257', 334, '2022-03-07', '4', '192000233420017', '77', '3838.220', 'Mantum', '2022-04-09 12:01:17', NULL, NULL, 'U', NULL, NULL),
('BRH-353', 268, '02261', 334, '2021-12-07', '4', '192000233420015', '88', '5117.640', 'Mantum', '2022-04-09 12:01:55', NULL, NULL, 'U', NULL, NULL),
('BRH-19', 269, '02261', 334, '2022-01-07', '4', '192000233420015', '88', '5117.640', 'Mantum', '2022-04-09 12:02:40', NULL, NULL, 'U', NULL, NULL),
('BRH-93', 270, '02261', 334, '2022-01-31', '4', '192000233420015', '88', '2558.882', 'Mantum', '2022-04-09 12:03:49', NULL, NULL, 'U', NULL, NULL),
('BRH-184', 271, '02261', 334, '2022-03-09', '4', '192000233420015', '88', '2558.820', 'Mantum', '2022-04-09 12:04:30', NULL, NULL, 'U', NULL, NULL),
('BRH-218A', 272, '02261', 334, '2022-03-23', '4', '192000233420015', '88', '1279.318', 'Mantum', '2022-04-09 12:06:20', NULL, NULL, 'U', NULL, NULL),
('BRH-354', 273, '02266', 334, '2021-12-07', '4', '192000233420031', '91', '5117.640', 'Mantum', '2022-04-09 12:07:30', NULL, NULL, 'U', NULL, NULL),
('BRH-18', 274, '02266', 334, '2022-01-07', '4', '192000233420031', '91', '1279.410', 'Mantum', '2022-04-09 12:08:07', NULL, NULL, 'U', NULL, NULL),
('BRH-356', 275, '02254', 334, '2021-12-09', '4', '202100633420007', '104', '5117.640', 'Mantum', '2022-04-09 12:09:47', NULL, NULL, 'U', NULL, NULL),
('BRH-357', 276, '02251', 334, '2021-12-09', '4', '202200233420002', '95', '3838.220', 'Mantum', '2022-04-09 12:11:13', NULL, NULL, 'U', NULL, NULL),
('BRH-358', 277, '02263', 334, '2021-12-09', '4', '192000233420024', '107', '5117.640', 'Mantum', '2022-04-09 12:12:16', NULL, NULL, 'U', NULL, NULL),
('BRH-359', 278, '02263', 334, '2021-12-09', '4', '202100233420008', '66', '5117.640', 'Mantum', '2022-04-09 12:14:05', NULL, NULL, 'U', NULL, NULL),
('BRH-199', 279, '02263', 334, '2022-03-14', '4', '202100233420008', '66', '2558.882', 'Mantum', '2022-04-09 12:14:39', NULL, NULL, 'U', NULL, NULL),
('BRH-414', 280, '02263', 334, '2021-12-28', '4', '202100233420008', '102', '5117.640', 'Mantum', '2022-04-09 12:15:17', NULL, NULL, 'U', NULL, NULL),
('BRH-21', 281, '02263', 334, '2022-01-07', '4', '202100233420008', '102', '5117.640', 'Mantum', '2022-04-09 12:15:48', NULL, NULL, 'U', NULL, NULL),
('BRH-148', 282, '02263', 334, '2022-02-24', '4', '202100233420008', '102', '5117.640', 'Mantum', '2022-04-09 12:17:06', NULL, NULL, 'U', NULL, NULL),
('BRH-360', 283, '02261', 334, '2021-12-09', '4', '202100633420011', '98', '5117.640', 'Mantum', '2022-04-09 12:18:25', NULL, NULL, 'U', NULL, NULL),
('BRH-42', 284, '02261', 334, '2022-01-14', '4', '202100633420011', '98', '5117.640', 'Mantum', '2022-04-09 12:19:03', NULL, NULL, 'U', NULL, NULL),
('BRH-185', 285, '02261', 334, '2022-03-09', '4', '202100633420011', '98', '2558.820', 'Mantum', '2022-04-09 12:20:55', NULL, NULL, 'U', NULL, NULL),
('BRH-184A', 286, '02261', 334, '2022-03-09', '4', '202100633420011', '98', '1279.410', 'Mantum', '2022-04-09 12:21:48', NULL, NULL, 'U', NULL, NULL),
('BRH-361', 287, '02251', 334, '2021-12-09', '4', '192000233420046', '112', '5117.640', 'Mantum', '2022-04-09 12:22:24', NULL, NULL, 'U', NULL, NULL),
('BRH-362', 288, '02251', 334, '2021-12-09', '4', '202100233420002', '100', '5117.640', 'Mantum', '2022-04-09 12:23:35', NULL, NULL, 'U', NULL, NULL),
('BRH-206', 289, '02251', 334, '2022-03-17', '4', '202100233420002', '100', '378.000', 'Mantum', '2022-04-09 12:25:04', NULL, NULL, 'U', NULL, NULL),
('BRH-363', 290, '02261', 334, '2021-12-09', '4', '202100233420001', '79', '5117.640', 'Mantum', '2022-04-09 12:25:38', NULL, NULL, 'U', NULL, NULL),
('BRH-73', 291, '02261', 334, '2022-01-21', '4', '202100233420001', '79', '5117.640', 'Mantum', '2022-04-09 12:26:10', NULL, NULL, 'U', NULL, NULL),
('BRH-364', 292, '02250', 334, '2021-12-09', '4', '202100233420003', '81', '5117.640', 'Mantum', '2022-04-09 12:26:51', NULL, NULL, 'U', NULL, NULL),
('BRH-365', 293, '02262', 334, '2021-12-09', '4', '202200233420001', '76', '5117.640', 'Mantum', '2022-04-09 12:28:17', NULL, NULL, 'U', NULL, NULL);
INSERT INTO `td_work_order` (`pre_order_no`, `order_no`, `block`, `branch_id`, `trans_dt`, `kms_year`, `soc_id`, `mill_id`, `paddy_qty`, `created_by`, `created_dt`, `modified_by`, `modified_dt`, `approval_status`, `approved_by`, `approved_dt`) VALUES
('BRH-71', 294, '02262', 334, '2021-12-24', '4', '202200233420001', '76', '3838.230', 'Mantum', '2022-04-09 12:29:05', NULL, NULL, 'U', NULL, NULL),
('BRH-366', 295, '02254', 334, '2021-12-09', '4', '192000233420042', '97', '5117.640', 'Mantum', '2022-04-09 12:29:44', NULL, NULL, 'U', NULL, NULL),
('BRH-367', 296, '02266', 334, '2021-12-09', '4', '192000233420019', '59', '5117.640', 'Mantum', '2022-04-09 12:30:53', NULL, NULL, 'U', NULL, NULL),
('BRH-94', 297, '02266', 334, '2022-01-31', '4', '192000233420019', '59', '2558.820', 'Mantum', '2022-04-09 12:31:28', NULL, NULL, 'U', NULL, NULL),
('BRH-200', 298, '02266', 334, '2022-03-14', '4', '192000233420019', '59', '2558.820', 'Mantum', '2022-04-09 12:32:01', NULL, NULL, 'U', NULL, NULL),
('BRH-368', 299, '02265', 334, '2021-12-09', '4', '192000233420027', '91', '5117.640', 'Mantum', '2022-04-09 12:32:46', NULL, NULL, 'U', NULL, NULL),
('BRH-369', 300, '02263', 334, '2021-12-09', '4', '192000233420022', '101', '5117.640', 'Mantum', '2022-04-09 12:33:25', NULL, NULL, 'U', NULL, NULL),
('BRH-171', 301, '02263', 334, '2022-03-07', '4', '192000233420022', '101', '1279.410', 'Mantum', '2022-04-09 12:33:52', NULL, NULL, 'U', NULL, NULL),
('BRH-371', 302, '02266', 334, '2021-12-15', '4', '202100233420006', '67', '5117.640', 'Mantum', '2022-04-09 12:34:26', NULL, NULL, 'U', NULL, NULL),
('BRH-372', 303, '02253', 334, '2021-12-15', '4', '192000333420011', '90', '5117.640', 'Mantum', '2022-04-09 12:34:56', NULL, NULL, 'U', NULL, NULL),
('BRH-385', 304, '02256', 334, '2021-12-22', '4', '202200233420003', '62', '2558.882', 'Mantum', '2022-04-09 12:36:45', NULL, NULL, 'U', NULL, NULL),
('BRH-386', 305, '02255', 334, '2021-12-22', '4', '202100233420009', '65', '5117.640', 'Mantum', '2022-04-09 12:38:36', NULL, NULL, 'U', NULL, NULL),
('BRH-202', 306, '02255', 334, '2022-03-14', '4', '202100233420009', '65', '2558.820', 'Mantum', '2022-04-09 12:40:16', NULL, NULL, 'U', NULL, NULL),
('BRH-219A', 307, '02255', 334, '2022-03-26', '4', '202100233420009', '65', '17.010', 'Mantum', '2022-04-09 12:41:05', NULL, NULL, 'U', NULL, NULL),
('BRH-387', 308, '02256', 334, '2021-12-22', '4', '192000233420023', '84', '2558.820', 'Mantum', '2022-04-09 12:41:52', NULL, NULL, 'U', NULL, NULL),
('BRH-201', 309, '02256', 334, '2022-03-14', '4', '192000233420023', '84', '1279.410', 'Mantum', '2022-04-09 12:42:58', NULL, NULL, 'U', NULL, NULL),
('BRH-388', 310, '02261', 334, '2021-12-22', '4', '192000633420020', '99', '2558.820', 'Mantum', '2022-04-09 12:43:38', NULL, NULL, 'U', NULL, NULL),
('BRH-389', 311, '02249', 334, '2021-12-22', '4', '202200233420004', '65', '1279.410', 'Mantum', '2022-04-09 12:44:20', NULL, NULL, 'U', NULL, NULL),
('BRH-390', 312, '02257', 334, '2021-12-22', '4', '192000233420016', '108', '2558.820', 'Mantum', '2022-04-09 12:44:50', NULL, NULL, 'U', NULL, NULL),
('BRH-416', 313, '02263', 334, '2021-12-28', '4', '192000633420033', '106', '2558.820', 'Mantum', '2022-04-09 12:45:29', NULL, NULL, 'U', NULL, NULL),
('BRH-83A', 314, '02263', 334, '2022-01-25', '4', '192000633420033', '106', '2558.820', 'Mantum', '2022-04-09 12:46:05', NULL, NULL, 'U', NULL, NULL),
('BRH-217A', 315, '02261', 334, '2022-03-23', '4', '192000633420034', '58', '1279.410', 'Mantum', '2022-04-09 12:48:30', NULL, NULL, 'U', NULL, NULL),
('BRH-84', 316, '02260', 334, '2022-01-27', '4', '192000333420008', '99', '2558.820', 'Mantum', '2022-04-09 12:49:05', NULL, NULL, 'U', NULL, NULL),
('BRH-85', 317, '02249', 334, '2022-01-27', '4', '192000233420014', '78', '5117.640', 'Mantum', '2022-04-09 12:49:40', NULL, NULL, 'U', NULL, NULL),
('BRH-170', 318, '02249', 334, '2022-03-07', '4', '192000233420014', '78', '5117.640', 'Mantum', '2022-04-09 12:50:12', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/01', 319, '02474', 345, '2021-12-06', '4', '192000234520001', '547', '5000.000', 'subhanug', '2022-04-10 05:33:08', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/02', 320, '02488', 345, '2021-12-06', '4', '192000234520018', '540', '5000.000', 'subhanug', '2022-04-10 05:35:39', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/03', 321, '02488', 345, '2021-12-06', '4', '192000334520002', '540', '5000.000', 'subhanug', '2022-04-10 05:37:16', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/04', 322, '02479', 345, '2021-12-06', '4', '192000234520003', '528', '5000.000', 'subhanug', '2022-04-10 05:39:13', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/05', 323, '02475', 345, '2021-12-06', '4', '192000234520007', '547', '5000.000', 'subhanug', '2022-04-10 05:41:48', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/06', 324, '02488', 345, '2021-12-06', '4', '192000234520056', '535', '5000.000', 'subhanug', '2022-04-10 05:43:40', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/07', 325, '02479', 345, '2021-12-06', '4', '192000234520036', '530', '5000.000', 'subhanug', '2022-04-10 05:45:20', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/08', 326, '02492', 345, '2021-12-13', '4', '192000234520042', '541', '5000.000', 'subhanug', '2022-04-10 05:47:48', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/09', 327, '02474', 345, '2021-12-13', '4', '192000234520002', '544', '5000.000', 'subhanug', '2022-04-10 05:49:19', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/10', 328, '02493', 345, '2021-12-21', '4', '202100234520006', '545', '5000.000', 'subhanug', '2022-04-10 05:51:38', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/11', 329, '02486', 345, '2021-12-21', '4', '192000234520067', '542', '5000.000', 'subhanug', '2022-04-10 05:53:36', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/12', 330, '02478', 345, '2021-12-21', '4', '202100234520005', '539', '5000.000', 'subhanug', '2022-04-10 05:55:11', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/13', 331, '02475', 345, '2021-12-21', '4', '202100234520004', '529', '5000.000', 'subhanug', '2022-04-10 05:56:43', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/14', 332, '02479', 345, '2021-12-21', '4', '192000234520043', '530', '5000.000', 'subhanug', '2022-04-10 05:59:15', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/15', 333, '02490', 345, '2021-12-21', '4', '192000234520023', '536', '5000.000', 'subhanug', '2022-04-10 06:01:40', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/16', 334, '02479', 345, '2021-12-21', '4', '192000234520004', '528', '5000.000', 'subhanug', '2022-04-10 06:02:30', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/1', 335, '02196', 330, '2021-12-07', '4', '192000233020009', '585', '1000.000', 'kashinathm', '2022-04-11 07:40:58', 'Kashinath Mukherjee', '2022-04-11 07:42:24', 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/2', 336, '02198', 330, '2021-12-09', '4', '192000233020001', '581', '1000.000', 'kashinathm', '2022-04-11 07:43:30', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/3', 337, '02197', 330, '2021-12-09', '4', '192000233020003', '585', '1100.000', 'kashinathm', '2022-04-11 07:44:49', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/4', 338, '02196', 330, '2021-12-09', '4', '192000233020009', '581', '1000.000', 'kashinathm', '2022-04-11 07:45:53', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/5', 339, '02198', 330, '2021-12-09', '4', '202100233020009', '587', '1000.000', 'kashinathm', '2022-04-11 07:47:38', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/6', 340, '02196', 330, '2021-12-09', '4', '192000233020023', '580', '1000.000', 'kashinathm', '2022-04-11 07:48:42', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/7', 341, '02198', 330, '2021-12-09', '4', '192000233020002', '585', '1000.000', 'kashinathm', '2022-04-11 07:49:32', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/8', 342, '02196', 330, '2021-12-09', '4', '192000233020029', '586', '1000.000', 'kashinathm', '2022-04-11 07:50:57', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/9', 343, '02199', 330, '2021-12-09', '4', '192000233020007', '578', '2000.000', 'kashinathm', '2022-04-11 07:51:53', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/10', 344, '02196', 330, '2021-12-14', '4', '192000233020028', '586', '800.000', 'kashinathm', '2022-04-11 10:19:21', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/11', 345, '02196', 330, '2021-12-14', '4', '192000233020029', '578', '800.000', 'kashinathm', '2022-04-11 10:20:16', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/12', 346, '02193', 330, '2021-12-14', '4', '192000233020019', '576', '800.000', 'kashinathm', '2022-04-11 10:21:33', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/13', 347, '02193', 330, '2021-12-14', '4', '192000233020010', '575', '800.000', 'kashinathm', '2022-04-11 10:30:03', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/14', 348, '02198', 330, '2021-12-14', '4', '202100233020009', '587', '1000.000', 'kashinathm', '2022-04-11 10:31:26', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/15', 349, '02196', 330, '2021-12-14', '4', '192000233020021', '585', '800.000', 'kashinathm', '2022-04-11 10:32:45', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/16', 350, '02194', 330, '2021-12-14', '4', '192000233020015', '576', '900.000', 'kashinathm', '2022-04-11 10:33:51', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/17', 351, '02196', 330, '2021-12-14', '4', '192000233020033', '582', '800.000', 'kashinathm', '2022-04-11 10:34:46', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/18', 352, '02194', 330, '2021-12-14', '4', '192000233020014', '575', '1000.000', 'kashinathm', '2022-04-11 10:35:40', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/19', 353, '02198', 330, '2021-12-14', '4', '192000233020008', '585', '800.000', 'kashinathm', '2022-04-11 10:36:25', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/20', 354, '02196', 330, '2021-12-14', '4', '192000233020011', '581', '800.000', 'kashinathm', '2022-04-11 10:37:17', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/21', 355, '02196', 330, '2021-12-14', '4', '192000233020017', '582', '850.000', 'kashinathm', '2022-04-11 10:37:53', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/22', 356, '02196', 330, '2022-04-11', '4', '192000233020023', '580', '800.000', 'kashinathm', '2022-04-11 10:38:33', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/23', 357, '02196', 330, '2021-12-14', '4', '202200233020001', '581', '800.000', 'kashinathm', '2022-04-11 10:39:18', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/24', 358, '02194', 330, '2021-12-14', '4', '192000633020016', '575', '1000.000', 'kashinathm', '2022-04-11 10:40:01', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/25', 359, '02195', 330, '2021-12-14', '4', '192000233020020', '581', '1000.000', 'kashinathm', '2022-04-11 10:40:38', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/26', 360, '02199', 330, '2021-12-14', '4', '192000633020015', '582', '900.000', 'kashinathm', '2022-04-11 10:41:16', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/27', 361, '02196', 330, '2021-12-14', '4', '192000233020025', '578', '800.000', 'kashinathm', '2022-04-11 10:58:14', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/28', 362, '02197', 330, '2021-12-14', '4', '192000233020003', '585', '950.000', 'kashinathm', '2022-04-11 10:58:48', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/29', 363, '02192', 330, '2021-12-14', '4', '192000233020030', '576', '800.000', 'kashinathm', '2022-04-11 10:59:44', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/30', 364, '02198', 330, '2021-12-14', '4', '202100233020006', '587', '1000.000', 'kashinathm', '2022-04-11 11:00:36', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/31', 365, '02198', 330, '2021-12-14', '4', '192000233020001', '581', '900.000', 'kashinathm', '2022-04-11 11:01:16', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/32', 366, '02198', 330, '2021-12-14', '4', '192000233020016', '585', '800.000', 'kashinathm', '2022-04-11 11:01:50', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/33', 367, '02197', 330, '2021-12-14', '4', '192000233020018', '585', '800.000', 'kashinathm', '2022-04-11 11:02:24', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/34', 368, '02194', 330, '2021-12-14', '4', '192000233020032', '575', '850.000', 'kashinathm', '2022-04-11 11:03:06', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/35', 369, '02192', 330, '2021-12-14', '4', '192000633020017', '576', '800.000', 'kashinathm', '2022-04-11 11:03:51', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/36', 370, '02199', 330, '2021-12-14', '4', '192000633020001', '587', '1000.000', 'kashinathm', '2022-04-11 11:04:47', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/37', 371, '02196', 330, '2021-12-14', '4', '192000233020009', '585', '600.000', 'kashinathm', '2022-04-11 11:05:21', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/38', 372, '02193', 330, '2021-12-14', '4', '192000233020013', '575', '800.000', 'kashinathm', '2022-04-11 11:06:02', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/39', 373, '02196', 330, '2021-12-14', '4', '202100233020010', '580', '800.000', 'kashinathm', '2022-04-11 11:06:46', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/40', 374, '02192', 330, '2021-12-14', '4', '202100233020005', '575', '800.000', 'kashinathm', '2022-04-11 11:07:49', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/41', 375, '02196', 330, '2021-12-14', '4', '192000233020025', '581', '800.000', 'kashinathm', '2022-04-11 11:20:14', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/42', 376, '02197', 330, '2021-12-14', '4', '192000233020022', '585', '800.000', 'kashinathm', '2022-04-11 11:20:51', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/43', 377, '02199', 330, '2021-12-14', '4', '192000233020007', '578', '1000.000', 'kashinathm', '2022-04-11 11:21:27', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/44', 378, '02192', 330, '2021-12-14', '4', '202100233020003', '576', '1000.000', 'kashinathm', '2022-04-11 11:22:02', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/45', 379, '02194', 330, '2021-12-14', '4', '192000233020024', '575', '850.000', 'kashinathm', '2022-04-11 11:22:41', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/46', 380, '02193', 330, '2021-12-14', '4', '192000233020010', '578', '10600.000', 'kashinathm', '2022-04-11 11:23:29', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/17', 381, '02491', 345, '2021-12-23', '4', '192000234520053', '549', '5000.000', 'subhanug', '2022-04-11 02:39:32', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/18', 382, '02493', 345, '2021-12-23', '4', '192000234520068', '535', '2000.000', 'subhanug', '2022-04-11 02:44:01', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/20', 384, '02479', 345, '2021-12-23', '4', '192000234520003', '528', '5000.000', 'subhanug', '2022-04-11 02:48:23', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/21', 385, '02477', 345, '2021-12-24', '4', '202200234520003', '546', '5000.000', 'subhanug', '2022-04-11 03:17:15', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/22', 386, '02493', 345, '2021-12-24', '4', '192000234520066', '541', '3000.000', 'subhanug', '2022-04-11 03:29:43', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/23', 387, '02485', 345, '2021-12-24', '4', '192000234520034', '536', '5000.000', 'subhanug', '2022-04-11 03:31:45', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/24', 388, '02489', 345, '2021-12-27', '4', '202200234520001', '535', '5000.000', 'subhanug', '2022-04-11 03:33:55', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/26', 389, '02477', 345, '2021-12-28', '4', '202100234520002', '534', '5000.000', 'subhanug', '2022-04-11 03:55:21', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/47', 390, '02193', 330, '2021-12-22', '4', '192000233020019', '576', '750.000', 'kashinathm', '2022-04-12 06:04:44', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/48', 391, '02198', 330, '2021-12-22', '4', '202100233020009', '587', '1000.000', 'kashinathm', '2022-04-12 06:05:55', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/49', 392, '02196', 330, '2021-12-22', '4', '192000233020033', '580', '800.000', 'kashinathm', '2022-04-12 06:06:35', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/50', 393, '02198', 330, '2021-12-22', '4', '192000233020008', '585', '800.000', 'kashinathm', '2022-04-12 06:07:27', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/51', 394, '02196', 330, '2021-12-22', '4', '192000233020023', '573', '1000.000', 'kashinathm', '2022-04-12 06:08:24', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/52', 395, '02196', 330, '2021-12-22', '4', '192000233020025', '578', '750.000', 'kashinathm', '2022-04-12 06:09:00', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/53', 396, '02199', 330, '2021-12-22', '4', '192000233020007', '578', '1000.000', 'kashinathm', '2022-04-12 06:09:31', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/54', 397, '02196', 330, '2021-12-22', '4', '202100233020010', '582', '800.000', 'kashinathm', '2022-04-12 06:10:15', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/55', 398, '02196', 330, '2021-12-22', '4', '192000233020029', '581', '500.000', 'kashinathm', '2022-04-12 06:10:50', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/56', 399, '02196', 330, '2021-12-22', '4', '192000233020021', '574', '800.000', 'kashinathm', '2022-04-12 06:11:20', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/57', 400, '02197', 330, '2021-12-22', '4', '192000233020003', '585', '550.000', 'kashinathm', '2022-04-12 06:11:48', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/58', 401, '02198', 330, '2021-12-22', '4', '192000233020001', '581', '800.000', 'kashinathm', '2022-04-12 06:12:17', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/59', 402, '02194', 330, '2021-12-22', '4', '192000233020032', '575', '500.000', 'kashinathm', '2022-04-12 06:12:58', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/60', 403, '02192', 330, '2021-12-22', '4', '202100233020005', '575', '850.000', 'kashinathm', '2022-04-12 06:14:09', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/61', 404, '02199', 330, '2021-12-22', '4', '192000633020013', '578', '950.000', 'kashinathm', '2022-04-12 06:14:59', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/62', 405, '02196', 330, '2021-12-22', '4', '192000233020028', '584', '500.000', 'kashinathm', '2022-04-12 06:17:52', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/63', 406, '02194', 330, '2021-12-22', '4', '192000233020015', '576', '650.000', 'kashinathm', '2022-04-12 06:18:24', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/64', 407, '02194', 330, '2021-12-22', '4', '192000233020014', '575', '500.000', 'kashinathm', '2022-04-12 06:18:56', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/65', 408, '02196', 330, '2021-12-22', '4', '192000233020017', '582', '700.000', 'kashinathm', '2022-04-12 06:19:27', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/66', 409, '02194', 330, '2021-12-22', '4', '192000633020016', '575', '600.000', 'kashinathm', '2022-04-12 06:20:09', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/67', 410, '02199', 330, '2021-12-22', '4', '192000633020015', '582', '800.000', 'kashinathm', '2022-04-12 06:20:54', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/68', 411, '02198', 330, '2021-12-22', '4', '202100233020006', '587', '1000.000', 'kashinathm', '2022-04-12 06:21:24', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/69', 412, '02198', 330, '2021-12-22', '4', '192000233020016', '585', '800.000', 'kashinathm', '2022-04-12 06:21:54', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/70', 413, '02193', 330, '2021-12-22', '4', '192000233020013', '575', '500.000', 'kashinathm', '2022-04-12 06:22:21', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/71', 414, '02199', 330, '2021-12-22', '4', '192000233020007', '578', '1000.000', 'kashinathm', '2022-04-12 06:22:53', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/72', 415, '02198', 330, '2021-12-22', '4', '192000233020001', '581', '850.000', 'kashinathm', '2022-04-12 06:23:21', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/73', 416, '02196', 330, '2021-12-22', '4', '192000233020028', '586', '900.000', 'kashinathm', '2022-04-12 06:23:54', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/74', 417, '02196', 330, '2021-12-22', '4', '202200233020001', '581', '650.000', 'kashinathm', '2022-04-12 06:24:28', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/75', 418, '02192', 330, '2021-12-22', '4', '192000233020030', '576', '500.000', 'kashinathm', '2022-04-12 06:25:00', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/76', 419, '02197', 330, '2021-12-22', '4', '192000233020018', '585', '500.000', 'kashinathm', '2022-04-12 06:25:29', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/77', 420, '02192', 330, '2021-12-22', '4', '192000633020017', '576', '550.000', 'kashinathm', '2022-04-12 06:25:57', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/78', 421, '02196', 330, '2021-12-22', '4', '202100233020010', '580', '800.000', 'kashinathm', '2022-04-12 06:26:30', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/79', 422, '02192', 330, '2021-12-22', '4', '202100233020003', '576', '600.000', 'kashinathm', '2022-04-12 06:26:57', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/80', 423, '02199', 330, '2021-12-22', '4', '192000633020013', '578', '1000.000', 'kashinathm', '2022-04-12 06:27:29', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/81', 424, '02196', 330, '2021-12-22', '4', '192000233020011', '582', '800.000', 'kashinathm', '2022-04-12 06:39:59', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/82', 425, '02195', 330, '2021-12-22', '4', '192000233020020', '582', '500.000', 'kashinathm', '2022-04-12 06:40:36', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/83', 426, '02199', 330, '2021-12-22', '4', '192000633020001', '587', '1000.000', 'kashinathm', '2022-04-12 06:41:17', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/84', 427, '02197', 330, '2021-12-22', '4', '192000233020022', '585', '800.000', 'kashinathm', '2022-04-12 06:41:43', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/85', 428, '02194', 330, '2021-12-22', '4', '192000233020024', '581', '500.000', 'kashinathm', '2022-04-12 06:42:21', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/86', 429, '02199', 330, '2021-12-22', '4', '192000233020007', '578', '1000.000', 'kashinathm', '2022-04-12 06:42:50', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/87', 430, '02199', 330, '2021-12-22', '4', '192000633020013', '578', '950.000', 'kashinathm', '2022-04-12 06:43:29', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/88', 431, '02194', 330, '2021-12-22', '4', '192000233020032', '575', '500.000', 'kashinathm', '2022-04-12 06:44:03', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/89', 432, '02196', 330, '2021-12-29', '4', '192000233020029', '586', '800.000', 'kashinathm', '2022-04-12 06:45:10', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/90', 433, '02197', 330, '2021-12-29', '4', '192000233020022', '585', '1000.000', 'kashinathm', '2022-04-12 06:45:37', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/91', 434, '02196', 330, '2021-12-29', '4', '202100233020010', '585', '650.000', 'kashinathm', '2022-04-12 06:47:14', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/92', 435, '02199', 330, '2021-12-29', '4', '192000233020007', '578', '1000.000', 'kashinathm', '2022-04-12 06:47:42', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/93', 436, '02199', 330, '2021-12-29', '4', '192000633020013', '578', '1000.000', 'kashinathm', '2022-04-12 06:48:14', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/94', 437, '02196', 330, '2021-12-29', '4', '192000633020008', '581', '650.000', 'kashinathm', '2022-04-12 06:48:56', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/95', 438, '02196', 330, '2021-12-29', '4', '192000233020023', '573', '1000.000', 'kashinathm', '2022-04-12 06:49:28', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/96', 439, '02196', 330, '2021-12-29', '4', '192000233020028', '586', '800.000', 'kashinathm', '2022-04-12 06:49:57', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/97', 440, '02198', 330, '2021-12-29', '4', '202100233020006', '587', '1000.000', 'kashinathm', '2022-04-12 06:50:27', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/98', 441, '02197', 330, '2021-12-29', '4', '192000233020018', '585', '1000.000', 'kashinathm', '2022-04-12 06:53:49', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/99', 442, '02198', 330, '2021-12-29', '4', '192000233020002', '585', '1000.000', 'kashinathm', '2022-04-12 06:58:18', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/100', 443, '02199', 330, '2021-12-29', '4', '192000233020007', '578', '1000.000', 'kashinathm', '2022-04-12 06:58:57', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/101', 444, '02199', 330, '2021-12-29', '4', '192000633020013', '578', '1000.000', 'kashinathm', '2022-04-12 07:20:57', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/102', 445, '02196', 330, '2021-12-29', '4', '202200233020001', '586', '500.000', 'kashinathm', '2022-04-12 07:21:28', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/103', 446, '02193', 330, '2021-12-29', '4', '192000233020019', '576', '700.000', 'kashinathm', '2022-04-12 07:21:57', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/104', 447, '02194', 330, '2021-12-29', '4', '192000233020032', '575', '500.000', 'kashinathm', '2022-04-12 07:22:28', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/105', 448, '02196', 330, '2021-12-29', '4', '192000233020021', '574', '800.000', 'kashinathm', '2022-04-12 07:22:56', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/106', 449, '02196', 330, '2021-12-29', '4', '192000233020021', '585', '1000.000', 'kashinathm', '2022-04-12 07:23:23', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/107', 450, '02197', 330, '2021-12-29', '4', '192000233020003', '585', '500.000', 'kashinathm', '2022-04-12 07:23:53', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/108', 451, '02196', 330, '2021-12-29', '4', '192000233020025', '578', '500.000', 'kashinathm', '2022-04-12 07:24:24', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/109', 452, '02199', 330, '2021-12-29', '4', '192000233020007', '578', '1000.000', 'kashinathm', '2022-04-12 07:24:53', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/110', 453, '02199', 330, '2021-12-29', '4', '192000633020013', '578', '1000.000', 'kashinathm', '2022-04-12 07:25:22', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/111', 454, '02199', 330, '2021-12-29', '4', '192000633020015', '573', '1000.000', 'kashinathm', '2022-04-12 07:26:00', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/112', 455, '02196', 330, '2021-12-29', '4', '202100233020010', '586', '650.000', 'kashinathm', '2022-04-12 07:26:51', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/113', 456, '02198', 330, '2021-12-29', '4', '202100233020009', '587', '1000.000', 'kashinathm', '2022-04-12 07:27:22', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/114', 457, '02196', 330, '2021-12-29', '4', '192000233020023', '580', '800.000', 'kashinathm', '2022-04-12 07:28:09', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/115', 458, '02194', 330, '2021-12-29', '4', '192000233020014', '575', '700.000', 'kashinathm', '2022-04-12 07:28:47', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/116', 459, '02198', 330, '2021-12-29', '4', '192000233020016', '585', '950.000', 'kashinathm', '2022-04-12 07:33:30', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/117', 460, '02199', 330, '2021-12-29', '4', '192000233020007', '578', '1000.000', 'kashinathm', '2022-04-12 07:33:59', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/118', 461, '02196', 330, '2021-12-29', '4', '192000233020028', '584', '750.000', 'kashinathm', '2022-04-12 07:34:33', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/119', 462, '02194', 330, '2021-12-29', '4', '192000233020032', '575', '600.000', 'kashinathm', '2022-04-12 07:35:03', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/120', 463, '02196', 330, '2021-12-29', '4', '192000233020021', '574', '800.000', 'kashinathm', '2022-04-12 07:35:32', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/121', 464, '02193', 330, '2021-12-29', '4', '192000233020013', '575', '500.000', 'kashinathm', '2022-04-12 07:36:14', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/122', 465, '02194', 330, '2021-12-29', '4', '192000233020015', '576', '650.000', 'kashinathm', '2022-04-12 07:36:43', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/123', 466, '02192', 330, '2021-12-29', '4', '192000233020030', '576', '500.000', 'kashinathm', '2022-04-12 07:37:17', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/124', 467, '02198', 330, '2021-12-29', '4', '192000233020008', '585', '1000.000', 'kashinathm', '2022-04-12 07:37:46', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/125', 468, '02199', 330, '2021-12-29', '4', '192000633020013', '578', '1000.000', 'kashinathm', '2022-04-12 07:38:16', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/126', 469, '02196', 330, '2021-12-29', '4', '192000233020029', '586', '750.000', 'kashinathm', '2022-04-12 07:38:50', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/127', 470, '02199', 330, '2021-12-29', '4', '192000633020001', '587', '1000.000', 'kashinathm', '2022-04-12 07:39:23', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/128', 471, '02196', 330, '2021-12-29', '4', '192000233020033', '580', '800.000', 'kashinathm', '2022-04-12 07:39:55', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/129', 472, '02192', 330, '2021-12-29', '4', '202100233020005', '575', '750.000', 'kashinathm', '2022-04-12 07:40:27', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/130', 473, '02192', 330, '2021-12-29', '4', '192000633020017', '576', '600.000', 'kashinathm', '2022-04-12 07:40:57', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/131', 474, '02192', 330, '2021-12-29', '4', '202100233020003', '576', '600.000', 'kashinathm', '2022-04-12 07:41:31', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/132', 475, '02194', 330, '2021-12-29', '4', '192000233020024', '575', '500.000', 'kashinathm', '2022-04-12 07:42:03', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/133', 476, '02193', 330, '2021-12-29', '4', '192000233020010', '578', '5000.000', 'kashinathm', '2022-04-12 07:42:38', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/134', 477, '02196', 330, '2021-12-29', '4', '192000233020009', '578', '5000.000', 'kashinathm', '2022-04-12 07:43:21', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/135', 478, '02192', 330, '2022-01-13', '4', '202100233020003', '578', '5000.000', 'kashinathm', '2022-04-12 07:44:30', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/136', 479, '02196', 330, '2022-01-13', '4', '192000233020009', '578', '5000.000', 'kashinathm', '2022-04-12 07:45:23', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/137', 480, '02196', 330, '2022-01-14', '4', '192000233020033', '580', '500.000', 'kashinathm', '2022-04-12 07:46:35', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/138', 481, '02195', 330, '2022-01-14', '4', '192000233020020', '586', '500.000', 'kashinathm', '2022-04-12 07:47:04', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/139', 482, '02198', 330, '2022-01-14', '4', '192000233020001', '581', '600.000', 'kashinathm', '2022-04-12 07:47:31', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/140', 483, '02197', 330, '2022-01-14', '4', '192000233020003', '585', '1000.000', 'kashinathm', '2022-04-12 07:47:58', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/141', 484, '02198', 330, '2022-01-14', '4', '192000233020008', '585', '1000.000', 'kashinathm', '2022-04-12 07:48:31', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/142', 485, '02199', 330, '2022-01-14', '4', '192000633020015', '573', '800.000', 'kashinathm', '2022-04-12 07:49:00', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/143', 486, '02196', 330, '2022-01-14', '4', '192000233020017', '582', '600.000', 'kashinathm', '2022-04-12 07:49:30', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/144', 487, '02196', 330, '2022-01-14', '4', '192000233020025', '578', '500.000', 'kashinathm', '2022-04-12 07:50:00', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/145', 488, '02198', 330, '2022-01-14', '4', '202100233020006', '587', '1000.000', 'kashinathm', '2022-04-12 07:50:28', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/146', 489, '02198', 330, '2022-01-14', '4', '192000233020016', '585', '1000.000', 'kashinathm', '2022-04-12 07:50:58', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/147', 490, '02196', 330, '2022-01-14', '4', '192000233020029', '581', '800.000', 'kashinathm', '2022-04-12 07:51:31', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/148', 491, '02196', 330, '2022-01-14', '4', '202100233020010', '580', '500.000', 'kashinathm', '2022-04-12 07:52:04', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/149', 492, '02198', 330, '2022-01-14', '4', '192000233020002', '585', '1000.000', 'kashinathm', '2022-04-12 07:52:35', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/150', 493, '02196', 330, '2022-01-14', '4', '192000233020011', '581', '500.000', 'kashinathm', '2022-04-12 07:53:03', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/151', 494, '02196', 330, '2022-01-14', '4', '192000233020028', '586', '900.000', 'kashinathm', '2022-04-12 08:00:42', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/152', 495, '02196', 330, '2022-01-14', '4', '192000233020021', '574', '900.000', 'kashinathm', '2022-04-12 08:01:09', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/153', 496, '02198', 330, '2022-01-14', '4', '202100233020009', '587', '1000.000', 'kashinathm', '2022-04-12 08:01:36', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/154', 497, '02196', 330, '2022-01-14', '4', '192000233020009', '585', '800.000', 'kashinathm', '2022-04-12 08:02:04', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/155', 498, '02196', 330, '2022-01-14', '4', '192000233020023', '580', '800.000', 'kashinathm', '2022-04-12 08:02:29', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/156', 499, '02199', 330, '2022-01-14', '4', '192000233020007', '578', '1000.000', 'kashinathm', '2022-04-12 08:03:04', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/157', 500, '02196', 330, '2022-01-14', '4', '192000233020009', '585', '800.000', 'kashinathm', '2022-04-12 08:03:33', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/158', 501, '02195', 330, '2022-01-14', '4', '192000233020020', '581', '650.000', 'kashinathm', '2022-04-12 08:04:00', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/159', 502, '02198', 330, '2022-01-14', '4', '192000233020001', '581', '700.000', 'kashinathm', '2022-04-12 08:04:29', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/160', 503, '02199', 330, '2022-01-14', '4', '192000633020015', '582', '850.000', 'kashinathm', '2022-04-12 08:04:59', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/161', 504, '02196', 330, '2022-01-14', '4', '192000233020009', '581', '1000.000', 'kashinathm', '2022-04-12 08:05:38', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/162', 505, '02197', 330, '2022-01-14', '4', '192000233020022', '585', '1000.000', 'kashinathm', '2022-04-12 08:06:06', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/163', 506, '02196', 330, '2022-01-14', '4', '192000233020023', '573', '1000.000', 'kashinathm', '2022-04-12 08:06:32', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/164', 507, '02196', 330, '2022-01-14', '4', '202200233020002', '587', '1000.000', 'kashinathm', '2022-04-12 08:14:00', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/165', 508, '02196', 330, '2022-01-14', '4', '192000633020008', '581', '800.000', 'kashinathm', '2022-04-12 08:14:50', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/166', 509, '02196', 330, '2022-01-14', '4', '202100233020010', '585', '1000.000', 'kashinathm', '2022-04-12 08:15:28', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/167', 510, '02196', 330, '2022-01-14', '4', '202200233020001', '586', '900.000', 'kashinathm', '2022-04-12 08:16:03', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/168', 511, '02196', 330, '2022-01-14', '4', '192000233020028', '584', '900.000', 'kashinathm', '2022-04-12 08:16:34', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/169', 512, '02199', 330, '2022-01-14', '4', '192000633020001', '587', '1000.000', 'kashinathm', '2022-04-12 08:17:15', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/170', 513, '02196', 330, '2022-01-14', '4', '202100233020010', '586', '800.000', 'kashinathm', '2022-04-12 08:17:48', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/171', 514, '02197', 330, '2022-01-14', '4', '192000233020018', '585', '1000.000', 'kashinathm', '2022-04-12 08:18:45', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/172', 515, '02196', 330, '2022-01-14', '4', '192000233020033', '581', '850.000', 'kashinathm', '2022-04-12 08:19:21', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/173', 516, '02196', 330, '2022-01-14', '4', '192000233020029', '586', '600.000', 'kashinathm', '2022-04-12 08:19:57', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/174', 517, '02197', 330, '2022-01-14', '4', '192000233020022', '585', '800.000', 'kashinathm', '2022-04-12 08:20:25', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/175', 518, '02193', 330, '2022-01-14', '4', '192000233020010', '578', '5000.000', 'kashinathm', '2022-04-12 08:20:56', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/176', 519, '02196', 330, '2022-01-14', '4', '192000233020029', '578', '900.000', 'kashinathm', '2022-04-12 08:21:31', NULL, NULL, 'U', NULL, NULL),
('MLD-SCMF/MB/F-3/2021-22/277', 520, '02209', 332, '2022-01-19', '4', '192000233220003', '303', '3000.000', 'ishanb', '2022-04-12 08:22:01', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('NDNJ-SCMF/NDNJ/21-22/WO/177', 521, '02192', 330, '2022-01-14', '4', '202100233020003', '578', '4000.000', 'kashinathm', '2022-04-12 08:22:11', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/178', 522, '02193', 330, '2022-01-17', '4', '192000233020010', '578', '5000.000', 'kashinathm', '2022-04-12 08:23:04', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/179', 523, '02196', 330, '2022-01-17', '4', '192000233020009', '578', '5000.000', 'kashinathm', '2022-04-12 08:23:42', NULL, NULL, 'U', NULL, NULL),
('MLD-SCMF/MB/F-3/2021-22/276', 524, '02208', 332, '2022-01-19', '4', '192000233220013', '294', '3000.000', 'ishanb', '2022-04-12 08:23:59', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('NDNJ-SCMF/NDNJ/21-22/WO/180', 525, '02196', 330, '2022-01-17', '4', '202200233020002', '587', '1000.000', 'kashinathm', '2022-04-12 08:24:22', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/181', 526, '02198', 330, '2022-01-17', '4', '202100233020006', '587', '800.000', 'kashinathm', '2022-04-12 08:25:15', NULL, NULL, 'U', NULL, NULL),
('MLD-SCMF/MB/F-3/2021-22/275', 527, '02208', 332, '2022-01-19', '4', '192000233220020', '296', '2000.000', 'ishanb', '2022-04-12 08:25:17', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('NDNJ-SCMF/NDNJ/21-22/WO/182', 528, '02199', 330, '2022-01-17', '4', '192000233020026', '577', '3000.000', 'kashinathm', '2022-04-12 08:26:02', NULL, NULL, 'U', NULL, NULL),
('MLD-SCMF/MB/F-3/2021-22/274', 529, '02208', 332, '2022-01-19', '4', '192000233220020', '294', '2000.000', 'ishanb', '2022-04-12 08:26:17', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('NDNJ-SCMF/NDNJ/21-22/WO/183', 530, '02199', 330, '2022-01-17', '4', '192000633020013', '577', '5000.000', 'kashinathm', '2022-04-12 08:27:09', NULL, NULL, 'U', NULL, NULL),
('MLD-SCMF/MB/F-3/2021-22/273', 531, '02208', 332, '2022-01-19', '4', '192000233220018', '312', '2000.000', 'ishanb', '2022-04-12 08:27:41', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('NDNJ-SCMF/NDNJ/21-22/WO/184', 532, '02199', 330, '2022-01-24', '4', '192000633020013', '577', '3000.000', 'kashinathm', '2022-04-12 08:28:14', NULL, NULL, 'U', NULL, NULL),
('MLD-SCMF/MB/F-3/2021-22/272', 533, '02208', 332, '2022-01-19', '4', '192000233220018', '303', '2000.000', 'ishanb', '2022-04-12 08:28:26', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('NDNJ-SCMF/NDNJ/21-22/WO/185', 534, '02192', 330, '2022-02-17', '4', '192000633020017', '576', '500.000', 'kashinathm', '2022-04-12 08:29:25', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/186', 535, '02199', 330, '2022-02-17', '4', '192000233020007', '578', '500.000', 'kashinathm', '2022-04-12 08:30:01', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/187', 536, '02198', 330, '2022-02-17', '4', '192000233020001', '581', '600.000', 'kashinathm', '2022-04-12 08:30:29', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/188', 537, '02196', 330, '2022-02-17', '4', '192000233020021', '574', '500.000', 'kashinathm', '2022-04-12 08:30:57', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/189', 538, '02196', 330, '2022-02-17', '4', '192000233020009', '585', '500.000', 'kashinathm', '2022-04-12 08:31:24', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/190', 539, '02196', 330, '2022-02-17', '4', '192000233020029', '582', '550.000', 'kashinathm', '2022-04-12 08:32:00', NULL, NULL, 'U', NULL, NULL),
('MLD-SCMF/MB/F-3/2021-22/271', 540, '02210', 332, '2022-01-19', '4', '192000233220017', '301', '3000.000', 'ishanb', '2022-04-12 08:32:10', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/270', 541, '02210', 332, '2022-01-19', '4', '192000233220008', '307', '3000.000', 'ishanb', '2022-04-12 08:32:59', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/269', 542, '02217', 332, '2022-01-19', '4', '192000233220002', '293', '2000.000', 'ishanb', '2022-04-12 08:36:51', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/268', 543, '02217', 332, '2022-01-19', '4', '192000233220002', '313', '2000.000', 'ishanb', '2022-04-12 08:38:51', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/267', 544, '02214', 332, '2022-01-19', '4', '192000233220024', '311', '2000.000', 'ishanb', '2022-04-12 08:40:00', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/266', 545, '02214', 332, '2022-01-19', '4', '192000233220024', '300', '2000.000', 'ishanb', '2022-04-12 08:40:40', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/265', 546, '02214', 332, '2022-01-19', '4', '202100233220001', '309', '2000.000', 'ishanb', '2022-04-12 08:41:24', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/264', 547, '02214', 332, '2022-01-19', '4', '202100233220001', '308', '2000.000', 'ishanb', '2022-04-12 08:42:37', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/263', 548, '02214', 332, '2022-01-19', '4', '202100233220004', '299', '2000.000', 'ishanb', '2022-04-12 08:43:41', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/262', 549, '02214', 332, '2022-01-19', '4', '202100233220004', '297', '2000.000', 'ishanb', '2022-04-12 08:44:47', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/261', 550, '02214', 332, '2022-01-19', '4', '192000233220010', '314', '2000.000', 'ishanb', '2022-04-12 08:46:39', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/260', 551, '02214', 332, '2022-01-19', '4', '192000233220010', '300', '2000.000', 'ishanb', '2022-04-12 08:48:12', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/259', 552, '02216', 332, '2022-01-19', '4', '192000233220007', '293', '3000.000', 'ishanb', '2022-04-12 08:49:01', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/258', 553, '02221', 332, '2022-01-19', '4', '192000233220001', '302', '2000.000', 'ishanb', '2022-04-12 08:50:13', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/257', 554, '02221', 332, '2022-01-19', '4', '192000233220001', '295', '2000.000', 'ishanb', '2022-04-12 08:50:46', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/256', 555, '02215', 332, '2022-01-19', '4', '202100233220002', '314', '2000.000', 'ishanb', '2022-04-12 08:51:41', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/255', 556, '02215', 332, '2022-01-19', '4', '202100233220002', '300', '2000.000', 'ishanb', '2022-04-12 08:59:43', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/280', 557, '02208', 332, '2022-01-27', '4', '192000233220018', '312', '2000.000', 'ishanb', '2022-04-12 09:00:29', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/279', 558, '02214', 332, '2022-01-27', '4', '192000233220024', '300', '2000.000', 'ishanb', '2022-04-12 09:01:01', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/292', 559, '02209', 332, '2022-01-31', '4', '192000233220003', '303', '3000.000', 'ishanb', '2022-04-12 09:01:34', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/291', 560, '02208', 332, '2022-01-31', '4', '192000233220013', '294', '3000.000', 'ishanb', '2022-04-12 09:02:15', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/290', 561, '02208', 332, '2022-01-31', '4', '192000233220018', '303', '2000.000', 'ishanb', '2022-04-12 09:03:07', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/289', 562, '02210', 332, '2022-01-31', '4', '192000233220017', '301', '3000.000', 'ishanb', '2022-04-12 09:07:17', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/288', 563, '02210', 332, '2022-01-31', '4', '192000233220008', '307', '3000.000', 'ishanb', '2022-04-12 09:17:44', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/287', 564, '02217', 332, '2022-01-31', '4', '192000233220002', '293', '3000.000', 'ishanb', '2022-04-12 09:20:05', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/286', 565, '02217', 332, '2022-01-31', '4', '192000233220002', '313', '3000.000', 'ishanb', '2022-04-12 09:21:42', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/285', 566, '02214', 332, '2022-01-31', '4', '202100233220001', '309', '3000.000', 'ishanb', '2022-04-12 09:25:00', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('NDNJ-SCMF/NDNJ/21-22/WO/191', 567, '02197', 330, '2022-02-17', '4', '192000233020022', '585', '500.000', 'kashinathm', '2022-04-12 10:01:39', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/192', 568, '02196', 330, '2022-02-17', '4', '202100233020010', '586', '500.000', 'kashinathm', '2022-04-12 10:02:24', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/193', 569, '02199', 330, '2022-02-17', '4', '192000633020013', '577', '1000.000', 'kashinathm', '2022-04-12 10:02:56', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/194', 570, '02198', 330, '2022-02-17', '4', '202100233020006', '587', '650.000', 'kashinathm', '2022-04-12 10:03:28', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/195', 571, '02192', 330, '2022-02-17', '4', '202100233020003', '578', '500.000', 'kashinathm', '2022-04-12 10:03:56', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/196', 572, '02192', 330, '2022-02-17', '4', '202100233020005', '575', '500.000', 'kashinathm', '2022-04-12 10:04:31', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/197', 573, '02198', 330, '2022-02-17', '4', '192000233020002', '585', '500.000', 'kashinathm', '2022-04-12 10:04:56', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/198', 574, '02192', 330, '2022-02-17', '4', '192000233020030', '576', '500.000', 'kashinathm', '2022-04-12 10:05:24', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/199', 575, '02197', 330, '2022-02-17', '4', '192000233020022', '585', '500.000', 'kashinathm', '2022-04-12 10:05:52', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/200', 576, '02196', 330, '2022-02-17', '4', '202200233020001', '581', '500.000', 'kashinathm', '2022-04-12 10:06:23', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/201', 577, '02196', 330, '2022-02-17', '4', '192000233020028', '584', '500.000', 'kashinathm', '2022-04-12 10:06:59', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/202', 578, '02194', 330, '2022-02-17', '4', '192000233020015', '576', '500.000', 'kashinathm', '2022-04-12 10:08:33', NULL, NULL, 'U', NULL, NULL),
('MLD-SCMF/MB/F-3/2021-22/284', 579, '02214', 332, '2022-01-31', '4', '202100233220004', '299', '2000.000', 'ishanb', '2022-04-12 10:08:37', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('NDNJ-SCMF/NDNJ/21-22/WO/203', 580, '02198', 330, '2022-02-17', '4', '192000233020008', '585', '500.000', 'kashinathm', '2022-04-12 10:09:18', NULL, NULL, 'U', NULL, NULL),
('MLD-SCMF/MB/F-3/2021-22/283', 581, '02214', 332, '2022-01-31', '4', '192000233220010', '300', '2000.000', 'ishanb', '2022-04-12 10:09:23', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('NDNJ-SCMF/NDNJ/21-22/WO/204', 582, '02194', 330, '2022-02-17', '4', '192000233020032', '575', '500.000', 'kashinathm', '2022-04-12 10:09:58', NULL, NULL, 'U', NULL, NULL),
('MLD-SCMF/MB/F-3/2021-22/282', 583, '02216', 332, '2022-01-31', '4', '192000233220007', '293', '3000.000', 'ishanb', '2022-04-12 10:10:14', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('NDNJ-SCMF/NDNJ/21-22/WO/205', 584, '02196', 330, '2022-02-17', '4', '192000233020025', '581', '500.000', 'kashinathm', '2022-04-12 10:10:29', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/206', 585, '02198', 330, '2022-02-17', '4', '202200233020003', '585', '500.000', 'kashinathm', '2022-04-12 10:10:59', NULL, NULL, 'U', NULL, NULL);
INSERT INTO `td_work_order` (`pre_order_no`, `order_no`, `block`, `branch_id`, `trans_dt`, `kms_year`, `soc_id`, `mill_id`, `paddy_qty`, `created_by`, `created_dt`, `modified_by`, `modified_dt`, `approval_status`, `approved_by`, `approved_dt`) VALUES
('MLD-SCMF/MB/F-3/2021-22/281', 586, '02215', 332, '2022-01-31', '4', '202100233220002', '314', '2000.000', 'ishanb', '2022-04-12 10:11:10', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('NDNJ-SCMF/NDNJ/21-22/WO/207', 587, '02196', 330, '2022-02-17', '4', '192000233020029', '581', '500.000', 'kashinathm', '2022-04-12 10:11:28', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/208', 588, '02196', 330, '2022-02-17', '4', '192000233020023', '573', '500.000', 'kashinathm', '2022-04-12 10:12:01', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/209', 589, '02199', 330, '2022-02-17', '4', '192000633020015', '573', '500.000', 'kashinathm', '2022-04-12 10:12:28', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/210', 590, '02194', 330, '2022-02-17', '4', '192000233020014', '575', '500.000', 'kashinathm', '2022-04-12 10:12:59', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/211', 591, '02196', 330, '2022-02-17', '4', '192000233020025', '581', '500.000', 'kashinathm', '2022-04-12 10:13:34', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/212', 592, '02198', 330, '2022-02-17', '4', '202200233020003', '585', '500.000', 'kashinathm', '2022-04-12 10:14:04', NULL, NULL, 'U', NULL, NULL),
('MLD-SCMF/MB/F-3/2021-22/299', 593, '02208', 332, '2022-02-01', '4', '192000233220020', '296', '2000.000', 'ishanb', '2022-04-12 10:14:13', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('NDNJ-SCMF/NDNJ/21-22/WO/213', 594, '02196', 330, '2022-02-17', '4', '192000233020017', '582', '350.000', 'kashinathm', '2022-04-12 10:14:31', NULL, NULL, 'U', NULL, NULL),
('MLD-SCMF/MB/F-3/2021-22/298', 595, '02208', 332, '2022-02-01', '4', '192000233220020', '294', '2000.000', 'ishanb', '2022-04-12 10:14:47', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('NDNJ-SCMF/NDNJ/21-22/WO/214', 596, '02192', 330, '2022-02-17', '4', '192000233020030', '576', '500.000', 'kashinathm', '2022-04-12 10:14:58', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/215', 597, '02196', 330, '2022-02-17', '4', '202200233020001', '581', '500.000', 'kashinathm', '2022-04-12 10:15:28', NULL, NULL, 'U', NULL, NULL),
('MLD-SCMF/MB/F-3/2021-22/297', 598, '02214', 332, '2022-02-01', '4', '202100233220004', '297', '2000.000', 'ishanb', '2022-04-12 10:15:42', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('NDNJ-SCMF/NDNJ/21-22/WO/216', 599, '02197', 330, '2022-02-17', '4', '192000233020018', '585', '500.000', 'kashinathm', '2022-04-12 10:15:55', NULL, NULL, 'U', NULL, NULL),
('MLD-SCMF/MB/F-3/2021-22/296', 600, '02214', 332, '2022-02-01', '4', '192000233220010', '314', '2000.000', 'ishanb', '2022-04-12 10:16:21', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('NDNJ-SCMF/NDNJ/21-22/WO/217', 601, '02196', 330, '2022-02-17', '4', '192000233020033', '580', '500.000', 'kashinathm', '2022-04-12 10:16:26', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/218', 602, '02198', 330, '2022-02-17', '4', '192000233020001', '581', '550.000', 'kashinathm', '2022-04-12 10:16:55', NULL, NULL, 'U', NULL, NULL),
('MLD-SCMF/MB/F-3/2021-22/295', 603, '02221', 332, '2022-02-01', '4', '192000233220001', '295', '2000.000', 'ishanb', '2022-04-12 10:17:01', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('NDNJ-SCMF/NDNJ/21-22/WO/219', 604, '02193', 330, '2022-02-17', '4', '192000233020010', '575', '500.000', 'kashinathm', '2022-04-12 10:17:23', NULL, NULL, 'U', NULL, NULL),
('MLD-SCMF/MB/F-3/2021-22/294', 605, '02215', 332, '2022-02-01', '4', '202100233220002', '300', '2000.000', 'ishanb', '2022-04-12 10:17:42', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('NDNJ-SCMF/NDNJ/21-22/WO/220', 606, '02198', 330, '2022-02-17', '4', '202200233020003', '585', '500.000', 'kashinathm', '2022-04-12 10:17:51', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/221', 607, '02196', 330, '2022-02-17', '4', '192000233020029', '581', '500.000', 'kashinathm', '2022-04-12 10:18:32', NULL, NULL, 'U', NULL, NULL),
('MLD-SCMF/MB/F-3/2021-22/305', 608, '02214', 332, '2022-02-07', '4', '192000233220024', '300', '3000.000', 'ishanb', '2022-04-12 10:18:38', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('NDNJ-SCMF/NDNJ/21-22/WO/222', 609, '02194', 330, '2022-02-17', '4', '202200233020004', '576', '550.000', 'kashinathm', '2022-04-12 10:19:10', NULL, NULL, 'U', NULL, NULL),
('MLD-SCMF/MB/F-3/2021-22/304', 610, '02221', 332, '2022-02-07', '4', '192000233220001', '302', '2000.000', 'ishanb', '2022-04-12 10:19:15', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('NDNJ-SCMF/NDNJ/21-22/WO/223', 611, '02197', 330, '2022-02-17', '4', '192000233020018', '585', '500.000', 'kashinathm', '2022-04-12 10:19:37', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/224', 612, '02196', 330, '2022-02-17', '4', '202200233020002', '587', '750.000', 'kashinathm', '2022-04-12 10:20:09', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/225', 613, '02194', 330, '2022-02-17', '4', '192000633020016', '575', '500.000', 'kashinathm', '2022-04-12 10:20:50', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/226', 614, '02196', 330, '2022-02-17', '4', '192000233020009', '582', '500.000', 'kashinathm', '2022-04-12 10:21:17', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/227', 615, '02192', 330, '2022-02-17', '4', '192000233020030', '576', '500.000', 'kashinathm', '2022-04-12 10:21:46', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/228', 616, '02194', 330, '2022-02-17', '4', '192000633020002', '576', '500.000', 'kashinathm', '2022-04-12 10:22:16', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/229', 617, '02196', 330, '2022-02-17', '4', '202100233020010', '586', '450.000', 'kashinathm', '2022-04-12 10:22:59', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/230', 618, '02193', 330, '2022-02-17', '4', '192000233020013', '575', '450.000', 'kashinathm', '2022-04-12 10:23:40', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/231', 619, '02193', 330, '2022-02-17', '4', '192000233020013', '576', '100.000', 'kashinathm', '2022-04-12 10:24:19', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/232', 620, '02198', 330, '2022-02-17', '4', '202200233020003', '585', '500.000', 'kashinathm', '2022-04-12 10:24:51', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/233', 621, '02192', 330, '2022-02-17', '4', '192000633020017', '576', '450.000', 'kashinathm', '2022-04-12 10:25:19', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/234', 622, '02196', 330, '2022-02-17', '4', '192000633020008', '582', '450.000', 'kashinathm', '2022-04-12 10:25:53', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/235', 623, '02196', 330, '2022-02-17', '4', '192000233020033', '582', '500.000', 'kashinathm', '2022-04-12 10:26:26', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/236', 624, '02192', 330, '2022-02-17', '4', '202100233020005', '575', '500.000', 'kashinathm', '2022-04-12 10:26:55', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/237', 625, '02197', 330, '2022-02-17', '4', '192000233020003', '585', '400.000', 'kashinathm', '2022-04-12 10:27:24', NULL, NULL, 'U', NULL, NULL),
('MLD-SCMF/MB/F-3/2021-22/303', 626, '02208', 332, '2022-02-07', '4', '192000233220018', '312', '2000.000', 'ishanb', '2022-04-12 10:27:29', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('NDNJ-SCMF/NDNJ/21-22/WO/238', 627, '02192', 330, '2022-02-17', '4', '192000233020030', '576', '500.000', 'kashinathm', '2022-04-12 10:27:50', NULL, NULL, 'U', NULL, NULL),
('MLD-SCMF/MB/F-3/2021-22/306', 628, '02209', 332, '2022-02-07', '4', '192000233220003', '312', '2000.000', 'ishanb', '2022-04-12 10:28:10', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('NDNJ-SCMF/NDNJ/21-22/WO/239', 629, '02199', 330, '2022-02-17', '4', '192000633020013', '577', '550.000', 'kashinathm', '2022-04-12 10:28:24', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/240', 630, '02198', 330, '2022-02-17', '4', '202100233020009', '587', '500.000', 'kashinathm', '2022-04-12 10:29:00', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/241', 631, '02196', 330, '2022-02-17', '4', '192000233020021', '574', '500.000', 'kashinathm', '2022-04-12 10:29:38', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/242', 632, '02198', 330, '2022-02-17', '4', '192000233020016', '585', '500.000', 'kashinathm', '2022-04-12 10:30:05', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/243', 633, '02192', 330, '2022-02-17', '4', '192000233020030', '576', '500.000', 'kashinathm', '2022-04-12 10:30:37', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/244', 634, '02196', 330, '2022-02-17', '4', '192000233020011', '581', '350.000', 'kashinathm', '2022-04-12 10:31:03', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/245', 635, '02199', 330, '2022-02-17', '4', '192000633020013', '577', '550.000', 'kashinathm', '2022-04-12 10:31:37', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/246', 636, '02196', 330, '2022-02-17', '4', '192000233020023', '580', '550.000', 'kashinathm', '2022-04-12 10:32:10', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/247', 637, '02197', 330, '2022-02-17', '4', '192000233020022', '585', '500.000', 'kashinathm', '2022-04-12 10:32:46', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/248', 638, '02195', 330, '2022-02-17', '4', '192000233020020', '586', '500.000', 'kashinathm', '2022-04-12 10:33:15', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/249', 639, '02193', 330, '2022-02-17', '4', '192000233020019', '576', '500.000', 'kashinathm', '2022-04-12 10:33:47', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/250', 640, '02199', 330, '2022-02-17', '4', '192000633020001', '587', '500.000', 'kashinathm', '2022-04-12 10:34:14', NULL, NULL, 'U', NULL, NULL),
('MLD-SCMF/MB/F-3/2021-22/311', 641, '02208', 332, '2022-02-08', '4', '192000233220013', '294', '3000.000', 'ishanb', '2022-04-12 10:37:34', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/310', 642, '02210', 332, '2022-02-08', '4', '192000233220017', '301', '3000.000', 'ishanb', '2022-04-12 10:38:18', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/309', 643, '02214', 332, '2022-02-08', '4', '202100233220001', '309', '2000.000', 'ishanb', '2022-04-12 10:40:19', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/308', 644, '02214', 332, '2022-02-08', '4', '192000233220010', '300', '2000.000', 'ishanb', '2022-04-12 10:40:55', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/307', 645, '02216', 332, '2022-02-08', '4', '192000233220007', '293', '3000.000', 'ishanb', '2022-04-12 10:41:41', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/315', 646, '02208', 332, '2022-02-09', '4', '192000233220020', '294', '2000.000', 'ishanb', '2022-04-12 10:43:01', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/314', 647, '02210', 332, '2022-02-09', '4', '192000233220008', '307', '3000.000', 'ishanb', '2022-04-12 10:44:09', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/317', 648, '02209', 332, '2022-02-10', '4', '192000233220003', '312', '2000.000', 'ishanb', '2022-04-12 10:44:41', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('NDNJ-SCMF/NDNJ/21-22/WO/251', 649, '02194', 330, '2022-02-17', '4', '192000233020024', '575', '500.000', 'kashinathm', '2022-04-12 10:49:20', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/252', 650, '02196', 330, '2022-02-17', '4', '192000233020028', '586', '450.000', 'kashinathm', '2022-04-12 10:49:52', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/253', 651, '02198', 330, '2022-02-17', '4', '202200233020003', '585', '450.000', 'kashinathm', '2022-04-12 10:50:23', NULL, NULL, 'U', NULL, NULL),
('NDNJ-SCMF/NDNJ/21-22/WO/254', 652, '02198', 330, '2022-02-17', '4', '202100233020006', '587', '500.000', 'kashinathm', '2022-04-12 10:50:55', NULL, NULL, 'U', NULL, NULL),
('MLD-SCMF/MB/F-3/2021-22/324', 653, '02215', 332, '2022-02-11', '4', '202100233220002', '314', '2000.000', 'ishanb', '2022-04-12 10:52:59', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/323', 654, '02214', 332, '2022-02-11', '4', '202100233220004', '297', '2000.000', 'ishanb', '2022-04-12 10:53:53', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/322', 655, '02214', 332, '2022-02-11', '4', '202100233220004', '299', '2000.000', 'ishanb', '2022-04-12 10:54:37', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/321', 656, '02214', 332, '2022-02-11', '4', '192000233220024', '311', '2000.000', 'ishanb', '2022-04-12 10:55:20', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/320', 657, '02208', 332, '2022-02-11', '4', '192000233220018', '303', '2000.000', 'ishanb', '2022-04-12 10:56:03', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/319', 658, '02209', 332, '2022-02-11', '4', '192000233220003', '303', '2000.000', 'ishanb', '2022-04-12 10:56:38', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/327', 659, '02214', 332, '2022-02-11', '4', '192000233220004', '299', '2000.000', 'ishanb', '2022-04-12 10:57:59', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/326', 660, '02214', 332, '2022-02-11', '4', '192000233220004', '309', '2000.000', 'ishanb', '2022-04-12 10:59:06', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/325', 661, '02214', 332, '2022-02-11', '4', '202100233220001', '309', '2000.000', 'ishanb', '2022-04-12 11:01:45', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/318', 662, '02214', 332, '2022-02-11', '4', '192000233220010', '314', '2000.000', 'ishanb', '2022-04-12 11:02:28', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/336', 663, '02210', 332, '2022-02-15', '4', '192000233220017', '301', '2000.000', 'ishanb', '2022-04-12 11:08:20', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/335', 664, '02217', 332, '2022-02-15', '4', '192000233220002', '293', '2000.000', 'ishanb', '2022-04-12 11:09:32', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/334', 665, '02217', 332, '2022-02-15', '4', '192000233220002', '313', '2000.000', 'ishanb', '2022-04-12 11:10:48', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/333', 666, '02216', 332, '2022-02-15', '4', '192000233220007', '293', '3000.000', 'ishanb', '2022-04-12 11:11:25', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/332', 667, '02221', 332, '2022-02-15', '4', '192000233220001', '302', '2000.000', 'ishanb', '2022-04-12 11:25:26', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/331', 668, '02221', 332, '2022-02-15', '4', '192000233220001', '295', '2000.000', 'ishanb', '2022-04-12 11:25:58', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/330', 669, '02215', 332, '2022-02-15', '4', '202100233220002', '300', '2000.000', 'ishanb', '2022-04-12 11:26:40', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/343', 670, '02214', 332, '2022-02-16', '4', '192000233220024', '311', '3000.000', 'ishanb', '2022-04-12 11:27:24', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/342', 671, '02214', 332, '2022-02-16', '4', '192000233220004', '299', '2000.000', 'ishanb', '2022-04-12 11:29:40', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/341', 672, '02214', 332, '2022-02-16', '4', '192000233220004', '309', '2000.000', 'ishanb', '2022-04-12 11:32:16', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/340', 673, '02208', 332, '2022-02-16', '4', '192000233220018', '312', '2000.000', 'ishanb', '2022-04-12 11:33:59', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/339', 674, '02208', 332, '2022-02-16', '4', '192000233220020', '294', '2000.000', 'ishanb', '2022-04-12 11:34:49', NULL, NULL, 'A', 'Ishan Banik', '2022-04-12'),
('MLD-SCMF/MB/F-3/2021-22/338', 675, '02208', 332, '2022-02-16', '4', '192000233220020', '296', '2000.000', 'ishanb', '2022-04-12 11:36:54', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('MLD-SCMF/MB/F-3/2021-22/337', 676, '02208', 332, '2022-02-16', '4', '192000233220013', '294', '3000.000', 'ishanb', '2022-04-12 11:37:36', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('MLD-SCMF/MB/F-3/2021-22/348', 677, '02214', 332, '2022-02-17', '4', '192000233220010', '314', '2000.000', 'ishanb', '2022-04-12 11:38:17', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('MLD-SCMF/MB/F-3/2021-22/347', 678, '02214', 332, '2022-02-17', '4', '202100233220004', '297', '2000.000', 'ishanb', '2022-04-12 11:39:48', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('MLD-SCMF/MB/F-3/2021-22/346', 679, '02214', 332, '2022-02-17', '4', '202100233220001', '309', '2000.000', 'ishanb', '2022-04-12 11:53:50', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('MLD-SCMF/MB/F-3/2021-22/345', 680, '02210', 332, '2022-02-17', '4', '192000233220008', '307', '3000.000', 'ishanb', '2022-04-12 12:00:37', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('MLD-SCMF/MB/F-3/2021-22/363', 681, '02209', 332, '2022-02-21', '4', '192000233220003', '312', '2000.000', 'ishanb', '2022-04-12 12:03:27', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('MLD-SCMF/MB/F-3/2021-22/362', 682, '02209', 332, '2022-02-21', '4', '192000233220003', '303', '2000.000', 'ishanb', '2022-04-12 12:04:21', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('MLD-SCMF/MB/F-3/2021-22/353', 683, '02208', 332, '2022-02-18', '4', '192000233220018', '303', '2000.000', 'ishanb', '2022-04-12 12:05:42', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('EMDN-SCMF/MID E/27', 684, '02471', 345, '2021-12-31', '4', '192000234520064', '544', '5000.000', 'subhanug', '2022-04-12 04:42:03', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/28', 685, '02492', 345, '2022-01-06', '4', '192000634520033', '549', '5000.000', 'subhanug', '2022-04-12 04:43:34', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/29', 686, '02488', 345, '2022-01-04', '4', '192000234520018', '540', '5000.000', 'subhanug', '2022-04-12 04:45:45', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/31', 687, '02490', 345, '2022-01-07', '4', '192000234520020', '532', '5000.000', 'subhanug', '2022-04-12 04:54:39', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/32', 688, '02478', 345, '2022-01-10', '4', '202100234520005', '539', '5000.000', 'subhanug', '2022-04-12 05:41:38', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/33', 689, '02490', 345, '2022-01-10', '4', '192000234520023', '536', '5000.000', 'subhanug', '2022-04-12 05:42:28', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/34', 690, '02474', 345, '2022-01-10', '4', '192000234520002', '544', '5000.000', 'subhanug', '2022-04-12 05:44:15', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/35', 691, '02479', 345, '2022-01-13', '4', '192000234520003', '528', '5000.000', 'subhanug', '2022-04-12 05:45:31', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/36', 692, '02479', 345, '2022-01-13', '4', '192000234520004', '528', '5000.000', 'subhanug', '2022-04-12 05:50:57', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/37', 693, '02486', 345, '2022-01-13', '4', '192000234520067', '542', '5000.000', 'subhanug', '2022-04-12 05:52:35', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/38', 694, '02475', 345, '2022-01-13', '4', '192000234520007', '547', '5000.000', 'subhanug', '2022-04-12 05:55:32', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/39', 695, '02492', 345, '2022-01-14', '4', '192000234520042', '541', '5000.000', 'subhanug', '2022-04-12 05:57:43', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/40', 696, '02493', 345, '2022-01-14', '4', '202100234520006', '545', '5000.000', 'subhanug', '2022-04-12 05:58:57', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/41', 697, '02477', 345, '2022-01-14', '4', '202200234520003', '546', '5000.000', 'subhanug', '2022-04-12 06:00:14', NULL, NULL, 'U', NULL, NULL),
('EBDN-SCMF/BWN/WORKORDER/KMS21-22/254', 698, '02292', 335, '2021-12-28', '4', '192000233520004', '467', '3000.000', 'subratas', '2022-04-13 08:19:52', NULL, NULL, 'A', 'Subrata Sen', '2022-04-13'),
('EBDN-SCMF/BWN/WORKORDER/KMS21-22/328', 699, '02292', 335, '2022-01-14', '4', '192000233520004', '467', '3000.000', 'subratas', '2022-04-13 08:20:35', NULL, NULL, 'A', 'Subrata Sen', '2022-04-13'),
('EBDN-SCMF/BWN/WORKORDER/KMS21-22/208', 700, '02292', 335, '2021-12-08', '4', '192000233520019', '454', '3000.000', 'subratas', '2022-04-13 08:21:06', NULL, NULL, 'A', 'Subrata Sen', '2022-04-13'),
('EBDN-SCMF/BWN/WORKORDER/KMS21-22/287', 701, '02292', 335, '2022-01-04', '4', '192000233520019', '454', '3000.000', 'subratas', '2022-04-13 08:21:32', NULL, NULL, 'A', 'Subrata Sen', '2022-04-13'),
('EBDN-SCMF/BWN/WORKORDER/KMS21-22/380', 702, '02292', 335, '2022-02-01', '4', '192000233520019', '454', '2500.000', 'subratas', '2022-04-13 08:21:54', NULL, NULL, 'A', 'Subrata Sen', '2022-04-13'),
('EBDN-SCMF/BWN/WORKORDER/KMS21-22/198', 703, '02295', 335, '2021-12-03', '4', '192000233520024', '527', '3000.000', 'subratas', '2022-04-13 08:22:27', NULL, NULL, 'A', 'Subrata Sen', '2022-04-13'),
('EBDN-SCMF/BWN/WORKORDER/KMS21-22/277', 704, '02295', 335, '2022-01-03', '4', '192000233520024', '527', '3000.000', 'subratas', '2022-04-13 08:22:53', NULL, NULL, 'A', 'Subrata Sen', '2022-04-13'),
('EBDN-SCMF/BWN/WORKORDER/KMS21-22/386', 705, '02295', 335, '2022-02-01', '4', '192000233520024', '527', '3000.000', 'subratas', '2022-04-13 08:23:17', NULL, NULL, 'A', 'Subrata Sen', '2022-04-13'),
('EBDN-SCMF/BWN/WORKORDER/KMS21-22/191', 706, '02277', 335, '2021-12-03', '4', '202100233520005', '451', '3000.000', 'subratas', '2022-04-13 08:23:59', NULL, NULL, 'A', 'Subrata Sen', '2022-04-13'),
('EBDN-SCMF/BWN/WORKORDER/KMS21-22/250', 707, '02277', 335, '2021-12-27', '4', '202100233520005', '451', '3000.000', 'subratas', '2022-04-13 08:24:18', NULL, NULL, 'A', 'Subrata Sen', '2022-04-13'),
('EBDN-SCMF/BWN/WORKORDER/KMS21-22/281', 708, '02277', 335, '2022-01-04', '4', '202100233520005', '451', '3000.000', 'subratas', '2022-04-13 08:24:46', NULL, NULL, 'A', 'Subrata Sen', '2022-04-13'),
('EBDN-SCMF/BWN/WORKORDER/KMS21-22/312', 709, '02277', 335, '2022-01-11', '4', '202100233520005', '451', '3000.000', 'subratas', '2022-04-13 08:25:12', NULL, NULL, 'A', 'Subrata Sen', '2022-04-13'),
('EBDN-SCMF/BWN/WORKORDER/KMS21-22/336', 710, '02277', 335, '2022-01-17', '4', '202100233520005', '451', '3000.000', 'subratas', '2022-04-13 08:25:42', NULL, NULL, 'A', 'Subrata Sen', '2022-04-13'),
('EBDN-SCMF/BWN/WORKORDER/KMS21-22/214', 711, '02277', 335, '2021-12-10', '4', '202200233520004', '477', '3000.000', 'subratas', '2022-04-13 08:26:20', NULL, NULL, 'A', 'Subrata Sen', '2022-04-13'),
('HOG-SCMF/HB/W.O/21-22/21', 712, '02343', 338, '2021-12-14', '4', '192000233820004', '167', '3000.000', 'bidyuts', '2022-04-13 08:48:50', NULL, NULL, 'U', NULL, NULL),
('JHG-JGM/KMS2021-22/001', 713, '02441', 348, '2021-12-03', '4', '192000234820004', '283', '2000.000', 'aparajitas1', '2022-04-13 10:47:49', NULL, NULL, 'A', 'Aparajita Samanta', '2022-04-13'),
('MLD-SCMF/MB/F-3/2021-22/376', 714, '02217', 332, '2022-02-25', '4', '192000233220002', '313', '1000.000', 'ishanb', '2022-04-13 12:15:32', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('MLD-SCMF/MB/F-3/2021-22/377', 715, '02208', 332, '2022-02-25', '4', '192000233220018', '312', '1000.000', 'ishanb', '2022-04-13 12:16:19', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('MLD-SCMF/MB/F-3/2021-22/375', 716, '02214', 332, '2022-02-25', '4', '202100233220004', '299', '1000.000', 'ishanb', '2022-04-13 12:17:05', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('MLD-SCMF/MB/F-3/2021-22/369', 717, '02214', 332, '2022-02-24', '4', '192000233220024', '311', '500.000', 'ishanb', '2022-04-13 12:17:52', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('MLD-SCMF/MB/F-3/2021-22/367', 718, '02216', 332, '2022-02-23', '4', '192000233220007', '298', '2000.000', 'ishanb', '2022-04-13 12:24:57', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('MLD-SCMF/MB/F-3/2021-22/368', 719, '02208', 332, '2022-02-23', '4', '192000233220013', '304', '2000.000', 'ishanb', '2022-04-13 12:25:39', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('MLD-SCMF/MB/F-3/2021-22/356', 720, '02215', 332, '2022-02-21', '4', '202100233220002', '300', '1500.000', 'ishanb', '2022-04-13 12:26:13', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('MLD-SCMF/MB/F-3/2021-22/357', 721, '02216', 332, '2022-02-21', '4', '192000233220007', '293', '2000.000', 'ishanb', '2022-04-13 12:26:56', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('MLD-SCMF/MB/F-3/2021-22/352', 722, '02214', 332, '2022-02-18', '4', '192000233220010', '300', '2000.000', 'ishanb', '2022-04-13 12:27:33', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('MLD-SCMF/MB/F-3/2021-22/358', 723, '02214', 332, '2022-02-21', '4', '202100233220004', '299', '2000.000', 'ishanb', '2022-04-13 12:28:13', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('MLD-SCMF/MB/F-3/2021-22/359', 724, '02214', 332, '2022-02-21', '4', '192000233220024', '300', '2000.000', 'ishanb', '2022-04-13 12:29:27', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('MLD-SCMF/MB/F-3/2021-22/360', 725, '02214', 332, '2022-02-21', '4', '192000233220004', '299', '2000.000', 'ishanb', '2022-04-13 12:30:06', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('MLD-SCMF/MB/F-3/2021-22/361', 726, '02210', 332, '2022-02-21', '4', '192000233220017', '301', '2000.000', 'ishanb', '2022-04-13 12:31:07', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('MLD-SCMF/MB/F-3/2021-22/316', 727, '02214', 332, '2022-02-10', '4', '202100233220001', '308', '2000.000', 'ishanb', '2022-04-13 01:04:49', NULL, NULL, 'A', 'Ishan Banik', '2022-04-13'),
('EMDN-SCMF/MID E/42', 728, '02479', 345, '2022-01-17', '4', '192000234520043', '530', '5000.000', 'subhanug', '2022-04-18 05:15:15', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/43', 729, '02492', 345, '2022-01-17', '4', '202100234520009', '548', '2000.000', 'subhanug', '2022-04-18 05:19:35', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/44', 730, '02471', 345, '2022-01-17', '4', '192000234520008', '538', '2000.000', 'subhanug', '2022-04-18 05:22:25', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/45', 731, '02491', 345, '2022-01-20', '4', '192000234520053', '549', '3000.000', 'subhanug', '2022-04-18 05:24:35', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/46', 732, '02489', 345, '2022-01-20', '4', '202200234520001', '535', '3000.000', 'subhanug', '2022-04-18 05:26:12', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/47', 733, '02493', 345, '2022-01-20', '4', '192000234520066', '541', '1500.000', 'subhanug', '2022-04-18 05:28:21', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/49', 734, '02479', 345, '2022-01-31', '4', '192000234520036', '530', '5000.000', 'subhanug', '2022-04-18 05:31:26', NULL, NULL, 'U', NULL, NULL),
('JHG-JGM/KMS2021-22/002', 735, '02442', 348, '2021-12-13', '4', '192000234820005', '280', '1500.000', 'aparajitas1', '2022-04-18 05:38:30', NULL, NULL, 'A', 'Aparajita Samanta', '2022-04-18'),
('JHG-JGM/KMS2021-22/003', 736, '02442', 348, '2021-12-13', '4', '192000234820005', '284', '1500.000', 'aparajitas1', '2022-04-18 05:40:34', NULL, NULL, 'A', 'Aparajita Samanta', '2022-04-18'),
('JHG-JGM/KMS2021-22/004', 737, '02441', 348, '2021-12-21', '4', '192000234820004', '283', '5000.000', 'aparajitas1', '2022-04-18 05:47:30', NULL, NULL, 'A', 'Aparajita Samanta', '2022-04-18'),
('EMDN-SCMF/MID E/50', 738, '02485', 345, '2022-01-31', '4', '192000234520034', '536', '5000.000', 'subhanug', '2022-04-18 05:58:51', NULL, NULL, 'U', NULL, NULL),
('EMDN-SCMF/MID E/51', 739, '02478', 345, '2022-02-01', '4', '202100634520011', '539', '5000.000', 'subhanug', '2022-04-18 06:00:54', NULL, NULL, 'U', NULL, NULL),
('JHG-JGM/KMS2021-22/012', 740, '02442', 348, '2022-01-27', '4', '192000234820005', '284', '1000.000', 'aparajitas1', '2022-04-18 06:01:19', NULL, NULL, 'A', 'Aparajita Samanta', '2022-04-18'),
('EMDN-SCMF/MID E/52', 741, '02478', 345, '2022-02-01', '4', '202100234520005', '539', '5000.000', 'subhanug', '2022-04-18 06:01:42', NULL, NULL, 'U', NULL, NULL),
('JHG-JGM/KMS2021-22/005', 742, '02442', 348, '2021-12-24', '4', '192000234820005', '284', '3000.000', 'aparajitas1', '2022-04-18 06:02:24', NULL, NULL, 'A', 'Aparajita Samanta', '2022-04-18'),
('EMDN-SCMF/MID E/53', 743, '02490', 345, '2022-02-02', '4', '192000234520023', '536', '5000.000', 'subhanug', '2022-04-18 06:03:08', NULL, NULL, 'U', NULL, NULL),
('JHG-JGM/KMS2021-22/006', 744, '02442', 348, '2022-01-03', '4', '192000234820005', '282', '2000.000', 'aparajitas1', '2022-04-18 06:03:15', NULL, NULL, 'A', 'Aparajita Samanta', '2022-04-18'),
('EMDN-SCMF/MID E/54', 745, '02477', 345, '2022-02-07', '4', '202200234520003', '546', '5000.000', 'subhanug', '2022-04-18 06:04:03', NULL, NULL, 'U', NULL, NULL),
('JHG-JGM/KMS2021-22/007', 746, '02442', 348, '2022-01-06', '4', '192000234820005', '282', '2000.000', 'aparajitas1', '2022-04-18 06:04:44', NULL, NULL, 'A', 'Aparajita Samanta', '2022-04-18'),
('EMDN-SCMF/MID E/55', 747, '02479', 345, '2022-02-16', '4', '192000234520003', '528', '5000.000', 'subhanug', '2022-04-18 06:05:09', NULL, NULL, 'U', NULL, NULL),
('JHG-JGM/KMS2021-22/008', 748, '02442', 348, '2022-01-11', '4', '192000234820005', '280', '2000.000', 'aparajitas1', '2022-04-18 06:05:56', NULL, NULL, 'A', 'Aparajita Samanta', '2022-04-18'),
('EMDN-SCMF/MID E/56', 749, '02474', 345, '2022-02-17', '4', '192000234520002', '544', '5000.000', 'subhanug', '2022-04-18 06:06:21', NULL, NULL, 'U', NULL, NULL),
('JHG-JGM/KMS2021-22/009', 750, '02442', 348, '2022-01-17', '4', '192000234820005', '280', '2000.000', 'aparajitas1', '2022-04-18 06:18:36', NULL, NULL, 'A', 'Aparajita Samanta', '2022-04-18'),
('EMDN-SCMF/MID E/19', 751, '02479', 345, '2021-12-23', '4', '192000234520036', '530', '5000.000', 'subhanug', '2022-04-18 06:24:07', NULL, NULL, 'U', NULL, NULL),
('JHG-JGM/KMS2021-22/010', 752, '02442', 348, '2022-01-17', '4', '192000234820005', '282', '2000.000', 'aparajitas1', '2022-04-18 06:25:50', NULL, NULL, 'U', NULL, NULL),
('JHG-JGM/KMS2021-22/011', 753, '02441', 348, '2022-01-20', '4', '192000234820004', '283', '5000.000', 'aparajitas1', '2022-04-18 06:26:55', NULL, NULL, 'U', NULL, NULL),
('JHG-JGM/KMS2021-22/012A', 754, '02442', 348, '2022-01-25', '4', '192000234820005', '282', '3000.000', 'aparajitas1', '2022-04-18 06:30:02', NULL, NULL, 'U', NULL, NULL),
('JHG-JGM/KMS2021-22/016', 755, '02442', 348, '2022-01-31', '4', '192000234820005', '280', '1500.000', 'aparajitas1', '2022-04-18 06:30:55', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/100', 756, '02338', 338, '2022-01-06', '4', '192000233820013', '182', '10000.000', 'bidyuts', '2022-04-18 07:31:48', 'Bidyut Bhushan Sadhu', '2022-04-18 07:33:25', 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/101', 757, '02338', 338, '2022-01-06', '4', '192000233820013', '185', '5000.000', 'bidyuts', '2022-04-18 07:33:04', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/102', 758, '02338', 338, '2022-01-06', '4', '192000233820013', '178', '10000.000', 'bidyuts', '2022-04-18 07:34:14', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/103', 759, '02338', 338, '2022-01-06', '4', '192000233820013', '161', '5000.000', 'bidyuts', '2022-04-18 07:34:51', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/104', 760, '02338', 338, '2022-01-06', '4', '192000233820013', '188', '10000.000', 'bidyuts', '2022-04-18 07:35:33', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/109', 761, '02338', 338, '2022-01-06', '4', '192000333820004', '152', '2000.000', 'bidyuts', '2022-04-18 07:40:20', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/108', 762, '02338', 338, '2022-01-06', '4', '192000333820004', '188', '8000.000', 'bidyuts', '2022-04-18 07:41:50', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/107', 763, '02338', 338, '2022-01-06', '4', '202100233820004', '182', '8000.000', 'bidyuts', '2022-04-18 07:42:43', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/106', 764, '02338', 338, '2022-01-06', '4', '202100233820004', '185', '2000.000', 'bidyuts', '2022-04-18 07:43:21', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/79', 765, '02342', 338, '2021-12-29', '4', '192000233820042', '200', '3000.000', 'bidyuts', '2022-04-18 07:44:26', 'Bidyut Bhushan Sadhu', '2022-04-18 07:44:46', 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/142', 766, '02340', 338, '2022-01-21', '4', '202200233820006', '174', '1000.000', 'bidyuts', '2022-04-18 07:45:59', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/133', 767, '02349', 338, '2022-01-17', '4', '202200233820010', '167', '2000.000', 'bidyuts', '2022-04-18 07:46:45', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/124', 768, '02338', 338, '2022-01-17', '4', '202200233820009', '188', '3000.000', 'bidyuts', '2022-04-18 07:47:25', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/119', 769, '02341', 338, '2022-02-06', '4', '192000233820020', '182', '2000.000', 'bidyuts', '2022-04-18 07:48:45', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/120', 770, '02353', 338, '2022-01-14', '4', '192000233820011', '214', '2000.000', 'bidyuts', '2022-04-18 07:49:33', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/117', 771, '02353', 338, '2022-01-10', '4', '202200233820002', '200', '2000.000', 'bidyuts', '2022-04-18 07:51:36', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/156', 772, '02353', 338, '2022-01-28', '4', '192000233820012', '188', '2000.000', 'bidyuts', '2022-04-18 07:55:58', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/196', 773, '02353', 338, '2022-01-06', '4', '192000233820012', '188', '3000.000', 'bidyuts', '2022-04-18 07:57:00', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/86', 774, '02342', 338, '2022-01-03', '4', '192000233820023', '228', '3000.000', 'bidyuts', '2022-04-18 08:01:13', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/85', 775, '02342', 338, '2022-01-03', '4', '192000233820024', '156', '1000.000', 'bidyuts', '2022-04-18 08:02:06', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/78', 776, '02354', 338, '2021-12-29', '4', '192000133820008', '161', '3000.000', 'bidyuts', '2022-04-18 08:05:45', 'Bidyut Bhushan Sadhu', '2022-04-18 08:17:58', 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/77', 777, '02353', 338, '2021-12-29', '4', '192000233820050', '200', '3000.000', 'bidyuts', '2022-04-18 08:06:24', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/74', 778, '02344', 338, '2021-12-28', '4', '192000233820015', '158', '5000.000', 'bidyuts', '2022-04-18 08:07:04', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/67', 779, '02342', 338, '2021-12-27', '4', '192000233820002', '186', '2000.000', 'bidyuts', '2022-04-18 08:09:52', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/66', 780, '02342', 338, '2021-12-27', '4', '192000233820002', '174', '3000.000', 'bidyuts', '2022-04-18 08:10:30', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/63', 781, '02353', 338, '2021-12-24', '4', '202200233820007', '160', '2000.000', 'bidyuts', '2022-04-18 08:11:16', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/62', 782, '02344', 338, '2021-12-23', '4', '192000233820059', '171', '2000.000', 'bidyuts', '2022-04-18 08:12:02', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/59', 783, '02338', 338, '2021-12-22', '4', '192000333820004', '188', '2000.000', 'bidyuts', '2022-04-18 08:12:49', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/58', 784, '02338', 338, '2021-12-22', '4', '202100233820004', '182', '2000.000', 'bidyuts', '2022-04-18 08:13:53', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/56', 785, '02354', 338, '2021-12-22', '4', '192000133820008', '161', '2000.000', 'bidyuts', '2022-04-18 08:20:59', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/152', 786, '02341', 338, '2022-01-28', '4', '202100233820003', '194', '2000.000', 'bidyuts', '2022-04-18 08:21:54', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/130', 787, '02341', 338, '2022-01-19', '4', '202100233820003', '194', '2000.000', 'bidyuts', '2022-04-18 08:22:41', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/75', 788, '02341', 338, '2021-12-28', '4', '202100233820003', '194', '3000.000', 'bidyuts', '2022-04-18 08:23:31', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/52', 789, '02341', 338, '2021-12-17', '4', '202100233820003', '194', '2000.000', 'bidyuts', '2022-04-18 08:24:19', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/51', 790, '02342', 338, '2021-12-17', '4', '192000233820024', '156', '2000.000', 'bidyuts', '2022-04-18 08:26:05', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/50', 791, '02342', 338, '2021-12-17', '4', '192000233820038', '209', '2000.000', 'bidyuts', '2022-04-18 08:26:56', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/49', 792, '02342', 338, '2021-12-17', '4', '192000233820023', '228', '2000.000', 'bidyuts', '2022-04-18 11:11:30', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/48', 793, '02342', 338, '2021-12-17', '4', '192000233820026', '194', '2000.000', 'bidyuts', '2022-04-18 11:23:38', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/118', 794, '02340', 338, '2022-01-10', '4', '192000233820033', '228', '2000.000', 'bidyuts', '2022-04-19 07:19:03', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/153', 795, '02340', 338, '2022-01-28', '4', '192000233820033', '228', '1500.000', 'bidyuts', '2022-04-19 07:19:46', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/47', 796, '02340', 338, '2021-12-16', '4', '192000233820033', '228', '2000.000', 'bidyuts', '2022-04-19 07:20:28', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/46', 797, '02355', 338, '2022-02-07', '4', '192000233820018', '174', '1000.000', 'bidyuts', '2022-04-19 07:21:08', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/178', 798, '02355', 338, '2021-10-16', '4', '192000233820018', '174', '2000.000', 'bidyuts', '2022-04-19 07:26:30', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/159', 799, '02353', 338, '2022-01-28', '4', '192000233820027', '224', '2000.000', 'bidyuts', '2022-04-19 07:27:24', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/97', 800, '02353', 338, '2022-01-06', '4', '192000233820027', '224', '3000.000', 'bidyuts', '2022-04-19 07:28:15', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/45', 801, '02353', 338, '2021-12-15', '4', '192000233820027', '224', '2000.000', 'bidyuts', '2022-04-19 07:29:09', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/164', 802, '02340', 338, '2022-01-28', '4', '192000233820034', '209', '1000.000', 'bidyuts', '2022-04-19 07:29:47', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/88', 803, '02340', 338, '2022-01-04', '4', '192000233820034', '209', '2000.000', 'bidyuts', '2022-04-19 07:30:54', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/44', 804, '02340', 338, '2021-12-15', '4', '192000233820034', '209', '2000.000', 'bidyuts', '2022-04-19 07:31:39', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/43', 805, '02355', 338, '2021-12-15', '4', '192000233820022', '182', '2000.000', 'bidyuts', '2022-04-19 07:32:33', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/42', 806, '02342', 338, '2022-01-28', '4', '192000233820030', '200', '2000.000', 'bidyuts', '2022-04-19 07:33:19', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/138', 807, '02342', 338, '2022-01-21', '4', '192000233820030', '200', '2000.000', 'bidyuts', '2022-04-19 07:35:36', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/157', 808, '02342', 338, '2021-12-15', '4', '192000233820030', '200', '2000.000', 'bidyuts', '2022-04-19 07:37:13', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/68', 809, '02340', 338, '2021-12-27', '4', '192000233820041', '194', '5000.000', 'bidyuts', '2022-04-19 07:38:02', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/41', 810, '02340', 338, '2021-12-15', '4', '192000233820041', '194', '3000.000', 'bidyuts', '2022-04-19 07:38:52', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/126', 811, '02353', 338, '2022-01-17', '4', '202100233820006', '200', '3000.000', 'bidyuts', '2022-04-19 07:39:36', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/81', 812, '02353', 338, '2021-12-29', '4', '202100233820006', '200', '3000.000', 'bidyuts', '2022-04-19 07:40:19', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/55', 813, '02353', 338, '2021-12-22', '4', '202100233820006', '200', '3000.000', 'bidyuts', '2022-04-19 07:41:16', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/40', 814, '02353', 338, '2021-12-15', '4', '202100233820006', '200', '2000.000', 'bidyuts', '2022-04-19 07:42:13', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/60', 815, '02342', 338, '2021-12-23', '4', '192000233820036', '194', '5000.000', 'bidyuts', '2022-04-19 07:42:59', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/129', 816, '02342', 338, '2022-01-17', '4', '192000233820036', '194', '2000.000', 'bidyuts', '2022-04-19 07:44:00', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/39', 817, '02342', 338, '2021-12-14', '4', '192000233820036', '194', '3000.000', 'bidyuts', '2022-04-19 07:45:11', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/125', 818, '02353', 338, '2022-01-17', '4', '192000233820050', '200', '5000.000', 'bidyuts', '2022-04-19 07:46:25', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/38', 819, '02353', 338, '2021-12-14', '4', '192000233820050', '200', '2000.000', 'bidyuts', '2022-04-19 07:49:58', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/37', 820, '02338', 338, '2021-12-14', '4', '192000233820013', '178', '3000.000', 'bidyuts', '2022-04-19 07:51:38', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/36', 821, '02338', 338, '2021-12-14', '4', '192000233820013', '185', '3000.000', 'bidyuts', '2022-04-19 07:52:10', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/35', 822, '02338', 338, '2021-12-14', '4', '192000233820013', '182', '3000.000', 'bidyuts', '2022-04-19 07:52:42', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/34', 823, '02338', 338, '2021-12-14', '4', '192000233820013', '188', '5000.000', 'bidyuts', '2022-04-19 07:53:28', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/84', 824, '02342', 338, '2021-12-29', '4', '192000233820025', '156', '2000.000', 'bidyuts', '2022-04-19 07:55:15', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/33', 825, '02342', 338, '2021-12-14', '4', '192000233820025', '156', '2000.000', 'bidyuts', '2022-04-19 07:56:28', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/94', 826, '02344', 338, '2022-01-04', '4', '192000233820017', '158', '1500.000', 'bidyuts', '2022-04-19 07:57:14', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/32', 827, '02344', 338, '2021-12-14', '4', '192000233820017', '158', '2000.000', 'bidyuts', '2022-04-19 07:57:58', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/111', 828, '02339', 338, '2022-01-10', '4', '192000233820014', '162', '5000.000', 'bidyuts', '2022-04-19 07:58:47', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/121', 829, '02339', 338, '2022-01-14', '4', '192000233820014', '162', '3000.000', 'bidyuts', '2022-04-19 07:59:34', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/31', 830, '02339', 338, '2021-12-14', '4', '192000233820014', '162', '3000.000', 'bidyuts', '2022-04-19 08:00:39', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/139', 831, '02353', 338, '2022-01-21', '4', '192000233820006', '169', '3000.000', 'bidyuts', '2022-04-19 08:01:22', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/54', 832, '02353', 338, '2021-12-22', '4', '192000233820006', '169', '5000.000', 'bidyuts', '2022-04-19 08:02:13', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/30', 833, '02353', 338, '2021-12-14', '4', '192000233820006', '169', '3000.000', 'bidyuts', '2022-04-19 08:02:52', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/160', 834, '02351', 338, '2022-01-28', '4', '192000233820044', '194', '2000.000', 'bidyuts', '2022-04-19 08:03:37', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/110', 835, '02351', 338, '2022-01-06', '4', '192000233820044', '194', '5000.000', 'bidyuts', '2022-04-19 08:04:16', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/29', 836, '02351', 338, '2021-12-14', '4', '192000233820044', '194', '2000.000', 'bidyuts', '2022-04-19 08:04:51', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/89', 837, '02342', 338, '2022-01-04', '4', '192000233820035', '156', '1500.000', 'bidyuts', '2022-04-19 09:17:23', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/28', 838, '02342', 338, '2021-12-14', '4', '192000233820035', '156', '2000.000', 'bidyuts', '2022-04-19 09:20:51', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/158', 839, '02340', 338, '2022-01-28', '4', '192000233820054', '174', '500.000', 'bidyuts', '2022-04-19 09:21:33', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/27', 840, '02340', 338, '2021-12-14', '4', '192000233820054', '174', '2000.000', 'bidyuts', '2022-04-19 09:22:28', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/26', 841, '02349', 338, '2021-12-13', '4', '202100233820005', '159', '2000.000', 'bidyuts', '2022-04-19 09:24:11', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/25', 842, '02354', 338, '2021-12-13', '4', '192000233820029', '182', '2000.000', 'bidyuts', '2022-04-19 09:25:07', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/134', 843, '02348', 338, '2022-01-19', '4', '192000233820048', '169', '2000.000', 'bidyuts', '2022-04-19 09:25:50', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/24', 844, '02348', 338, '2021-12-13', '4', '192000233820048', '169', '2000.000', 'bidyuts', '2022-04-19 09:26:33', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/64', 845, '02340', 338, '2021-12-24', '4', '192000233820019', '186', '2000.000', 'bidyuts', '2022-04-19 09:27:24', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/146', 846, '02340', 338, '2022-01-28', '4', '192000233820019', '186', '2000.000', 'bidyuts', '2022-04-19 09:28:04', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/90', 847, '02340', 338, '2022-01-04', '4', '192000233820019', '186', '3000.000', 'bidyuts', '2022-04-19 09:29:27', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/23', 848, '02340', 338, '2021-12-13', '4', '192000233820019', '186', '2000.000', 'bidyuts', '2022-04-19 09:31:51', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/155', 849, '02343', 338, '2022-01-28', '4', '192000233820004', '235', '1000.000', 'bidyuts', '2022-04-19 09:32:28', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/154', 850, '02343', 338, '2022-01-28', '4', '192000233820004', '167', '2000.000', 'bidyuts', '2022-04-19 09:33:15', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/136', 851, '02343', 338, '2022-01-21', '4', '192000233820004', '235', '2000.000', 'bidyuts', '2022-04-19 09:33:59', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/135', 852, '02343', 338, '2022-01-21', '4', '192000233820004', '167', '3000.000', 'bidyuts', '2022-04-19 09:36:35', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/72', 853, '02343', 338, '2021-12-28', '4', '192000233820004', '235', '2000.000', 'bidyuts', '2022-04-19 09:38:27', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/71', 854, '02343', 338, '2021-12-28', '4', '192000233820004', '167', '3000.000', 'bidyuts', '2022-04-19 09:39:03', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/22', 855, '02343', 338, '2021-12-13', '4', '192000233820004', '235', '3000.000', 'bidyuts', '2022-04-19 09:40:58', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/20', 856, '02342', 338, '2021-12-13', '4', '192000233820010', '193', '2000.000', 'bidyuts', '2022-04-19 09:46:00', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/151', 857, '02341', 338, '2022-01-28', '4', '192000233820045', '194', '2000.000', 'bidyuts', '2022-04-19 10:20:07', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/131', 858, '02341', 338, '2022-01-19', '4', '192000233820045', '194', '2000.000', 'bidyuts', '2022-04-19 10:20:44', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/19', 859, '02341', 338, '2021-12-13', '4', '192000233820045', '194', '3000.000', 'bidyuts', '2022-04-19 10:21:20', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/69', 860, '02341', 338, '2021-12-27', '4', '192000233820045', '194', '5000.000', 'bidyuts', '2022-04-19 10:22:03', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/161', 861, '02353', 338, '2022-01-28', '4', '192000233820008', '232', '2000.000', 'bidyuts', '2022-04-19 10:22:42', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/137', 862, '02353', 338, '2022-01-21', '4', '192000233820008', '232', '1000.000', 'bidyuts', '2022-04-19 10:23:29', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/18', 863, '02353', 338, '2021-12-13', '4', '192000233820008', '232', '2000.000', 'bidyuts', '2022-04-19 10:24:14', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/112', 864, '02353', 338, '2022-01-10', '4', '192000233820008', '232', '2000.000', 'bidyuts', '2022-04-19 10:25:07', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/114', 865, '02353', 338, '2022-01-10', '4', '192000233820051', '232', '2000.000', 'bidyuts', '2022-04-19 10:25:58', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/17', 866, '02353', 338, '2021-12-13', '4', '192000233820051', '232', '2000.000', 'bidyuts', '2022-04-19 10:26:40', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/150', 867, '02341', 338, '2022-01-28', '4', '202200233820003', '194', '2000.000', 'bidyuts', '2022-04-19 10:27:28', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/132', 868, '02341', 338, '2022-01-19', '4', '202200233820003', '194', '2000.000', 'bidyuts', '2022-04-19 10:28:13', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/95', 869, '02341', 338, '2022-01-06', '4', '202200233820003', '194', '3000.000', 'bidyuts', '2022-04-19 10:28:54', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/76', 870, '02341', 338, '2021-12-29', '4', '202200233820003', '194', '3000.000', 'bidyuts', '2022-04-19 10:29:41', NULL, NULL, 'U', NULL, NULL);
INSERT INTO `td_work_order` (`pre_order_no`, `order_no`, `block`, `branch_id`, `trans_dt`, `kms_year`, `soc_id`, `mill_id`, `paddy_qty`, `created_by`, `created_dt`, `modified_by`, `modified_dt`, `approval_status`, `approved_by`, `approved_dt`) VALUES
('HOG-SCMF/HB/W.O/21-22/16', 871, '02341', 338, '2021-12-13', '4', '202200233820003', '194', '2000.000', 'bidyuts', '2022-04-19 10:30:19', NULL, NULL, 'U', NULL, NULL),
('NDA-SCMF/NB/0510', 872, '02314', 336, '2022-02-18', '4', '192000233620013', '356', '2000.000', 'sudipd', '2022-04-20 06:39:32', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('NDA-SCMF/NB/0494', 873, '02306', 336, '2022-02-11', '4', '192000233620004', '355', '2000.000', 'sudipd', '2022-04-20 06:41:13', NULL, NULL, 'A', 'Subhashish Biswas', '2022-04-20'),
('HOG-SCMF/HB/W.O/21-22/163', 874, '02345', 338, '2022-01-28', '4', '192000233820003', '194', '2000.000', 'bidyuts', '2022-04-20 06:51:23', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/143', 875, '02345', 338, '2022-01-21', '4', '192000233820003', '194', '2000.000', 'bidyuts', '2022-04-20 06:52:23', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/70', 876, '02345', 338, '2021-12-28', '4', '192000233820003', '194', '5000.000', 'bidyuts', '2022-04-20 06:53:22', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/15', 877, '02345', 338, '2021-12-13', '4', '192000233820003', '194', '3000.000', 'bidyuts', '2022-04-20 06:54:19', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/122', 878, '02347', 338, '2022-01-14', '4', '192000233820040', '235', '2000.000', 'bidyuts', '2022-04-20 06:55:05', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/14', 879, '02347', 338, '2022-01-13', '4', '192000233820040', '235', '2000.000', 'bidyuts', '2022-04-20 06:56:12', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/128', 880, '02342', 338, '2022-01-19', '4', '192000233820042', '200', '2000.000', 'bidyuts', '2022-04-20 06:56:55', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/53', 881, '02342', 338, '2022-04-20', '4', '192000233820042', '200', '5000.000', 'bidyuts', '2022-04-20 07:00:51', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/13', 882, '02342', 338, '2021-12-13', '4', '192000233820042', '200', '2000.000', 'bidyuts', '2022-04-20 07:01:34', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/162', 883, '02349', 338, '2022-01-28', '4', '192000233820046', '163', '2000.000', 'bidyuts', '2022-04-20 07:06:13', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/127', 884, '02349', 338, '2022-01-19', '4', '192000233820046', '163', '2000.000', 'bidyuts', '2022-04-20 07:06:43', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/12', 885, '02349', 338, '2021-12-13', '4', '192000233820046', '163', '2000.000', 'bidyuts', '2022-04-20 07:07:18', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/11', 886, '02353', 338, '2021-12-13', '4', '192000233820007', '232', '2000.000', 'bidyuts', '2022-04-20 07:07:57', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/113', 887, '02353', 338, '2022-01-10', '4', '192000233820007', '232', '2000.000', 'bidyuts', '2022-04-20 07:08:31', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/99', 888, '02353', 338, '2022-01-06', '4', '202200233820005', '232', '1000.000', 'bidyuts', '2022-04-20 07:09:38', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/10', 889, '02353', 338, '2021-12-13', '4', '202200233820005', '232', '2000.000', 'bidyuts', '2022-04-20 07:10:16', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/09', 890, '02342', 338, '2022-01-21', '4', '192000233820009', '200', '2000.000', 'bidyuts', '2022-04-20 07:14:49', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/140', 891, '02342', 338, '2022-01-21', '4', '192000233820009', '200', '3000.000', 'bidyuts', '2022-04-20 07:15:29', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/141', 892, '02342', 338, '2022-01-21', '4', '192000233820009', '200', '2000.000', 'bidyuts', '2022-04-20 07:17:30', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/83', 893, '02338', 338, '2021-12-29', '4', '192000233820032', '200', '3000.000', 'bidyuts', '2022-04-20 07:18:16', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/08', 894, '02338', 338, '2021-12-13', '4', '192000233820032', '200', '2000.000', 'bidyuts', '2022-04-20 07:19:27', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/61', 895, '02353', 338, '2021-12-23', '4', '192000233820052', '200', '3000.000', 'bidyuts', '2022-04-20 07:20:07', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/82', 896, '02353', 338, '2021-12-29', '4', '192000233820052', '200', '3000.000', 'bidyuts', '2022-04-20 07:20:57', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/07', 897, '02353', 338, '2021-12-13', '4', '192000233820052', '200', '3000.000', 'bidyuts', '2022-04-20 07:21:37', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/05', 898, '02353', 338, '2021-12-13', '4', '192000233820011', '214', '3000.000', 'bidyuts', '2022-04-20 07:26:59', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/04', 899, '02353', 338, '2021-12-13', '4', '202200233820004', '232', '2000.000', 'bidyuts', '2022-04-20 07:27:57', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/145', 900, '02349', 338, '2022-01-28', '4', '192000233820053', '167', '2000.000', 'bidyuts', '2022-04-20 07:29:46', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/03', 901, '02349', 338, '2021-12-13', '4', '192000233820053', '167', '2000.000', 'bidyuts', '2022-04-20 07:30:25', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/02', 902, '02339', 338, '2021-12-09', '4', '192000333820010', '214', '3000.000', 'bidyuts', '2022-04-20 07:33:02', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/123', 903, '02339', 338, '2022-01-17', '4', '192000333820010', '214', '2000.000', 'bidyuts', '2022-04-20 07:33:40', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/115', 904, '02347', 338, '2022-01-10', '4', '192000233820005', '167', '2000.000', 'bidyuts', '2022-04-20 07:34:22', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/147', 905, '02347', 338, '2022-01-28', '4', '192000233820005', '235', '2000.000', 'bidyuts', '2022-04-20 07:35:32', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/148', 906, '02347', 338, '2022-01-28', '4', '192000233820005', '167', '1000.000', 'bidyuts', '2022-04-20 07:36:19', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/116', 907, '02347', 338, '2022-01-10', '4', '192000233820005', '235', '5000.000', 'bidyuts', '2022-04-20 07:37:01', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/01', 910, '02347', 338, '2021-12-09', '4', '192000233820005', '235', '2400.000', 'bidyuts', '2022-04-20 08:11:39', NULL, NULL, 'U', NULL, NULL),
('HOG-SCMF/HB/W.O/21-22/01A', 911, '02347', 338, '2021-12-09', '4', '192000233820005', '167', '600.000', 'bidyuts', '2022-04-20 08:12:08', NULL, NULL, 'U', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_wqsc`
--

CREATE TABLE `td_wqsc` (
  `id` int(11) NOT NULL,
  `kms_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `wqsc_no` varchar(100) NOT NULL,
  `wqsc_date` date DEFAULT NULL,
  `rice_mill_qc_no` int(11) NOT NULL,
  `pool` varchar(35) NOT NULL,
  `goodown_name` varchar(255) NOT NULL,
  `goodown_dist` int(11) NOT NULL,
  `memo_no` varchar(55) NOT NULL,
  `memo_dt` date NOT NULL,
  `rice_type` varchar(15) NOT NULL,
  `bag_type` int(11) DEFAULT NULL,
  `block` varchar(6) NOT NULL,
  `soc_name` varchar(20) NOT NULL,
  `mill_id` varchar(55) NOT NULL,
  `gunny_cut` varchar(10) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `created_by` varchar(55) NOT NULL,
  `created_dt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `td_wqsc_dtls`
--

CREATE TABLE `td_wqsc_dtls` (
  `wqsc_no` varchar(100) NOT NULL,
  `sub_wqsc` varchar(100) NOT NULL,
  `trans_dt` date NOT NULL,
  `trans_id` int(11) DEFAULT NULL,
  `no_gunny` int(11) NOT NULL DEFAULT 0,
  `quantity` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `paddy_qty` decimal(15,5) NOT NULL,
  `moisture_extra` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `moisture_ext_amt` decimal(15,2) NOT NULL DEFAULT 0.00,
  `avg_wt_empty_gunny` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `gunny_cut` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `tot_price` decimal(15,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `md_block`
--
ALTER TABLE `md_block`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `md_district`
--
ALTER TABLE `md_district`
  ADD PRIMARY KEY (`district_code`);

--
-- Indexes for table `md_kms_year`
--
ALTER TABLE `md_kms_year`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `md_mill`
--
ALTER TABLE `md_mill`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `md_paddy_rate`
--
ALTER TABLE `md_paddy_rate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_society`
--
ALTER TABLE `md_society`
  ADD PRIMARY KEY (`society_code`);

--
-- Indexes for table `md_soc_mill`
--
ALTER TABLE `md_soc_mill`
  ADD PRIMARY KEY (`branch_id`,`soc_id`,`mill_id`,`kms_id`);

--
-- Indexes for table `md_users`
--
ALTER TABLE `md_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `td_paddy_qty_dates`
--
ALTER TABLE `td_paddy_qty_dates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_society_commision`
--
ALTER TABLE `td_society_commision`
  ADD PRIMARY KEY (`kms_id`,`branch_id`,`trans_cd`);

--
-- Indexes for table `td_work_order`
--
ALTER TABLE `td_work_order`
  ADD PRIMARY KEY (`order_no`,`branch_id`,`kms_year`),
  ADD UNIQUE KEY `pre_order_no` (`pre_order_no`);

--
-- Indexes for table `td_wqsc`
--
ALTER TABLE `td_wqsc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_wqsc_dtls`
--
ALTER TABLE `td_wqsc_dtls`
  ADD PRIMARY KEY (`wqsc_no`,`sub_wqsc`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `md_mill`
--
ALTER TABLE `md_mill`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=588;

--
-- AUTO_INCREMENT for table `md_paddy_rate`
--
ALTER TABLE `md_paddy_rate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `td_paddy_qty_dates`
--
ALTER TABLE `td_paddy_qty_dates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `td_work_order`
--
ALTER TABLE `td_work_order`
  MODIFY `order_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=912;

--
-- AUTO_INCREMENT for table `td_wqsc`
--
ALTER TABLE `td_wqsc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
