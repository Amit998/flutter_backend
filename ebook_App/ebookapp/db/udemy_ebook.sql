-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2021 at 01:27 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `udemy_ebook`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(111) NOT NULL,
  `username` varchar(111) NOT NULL,
  `email` varchar(111) NOT NULL,
  `password` varchar(111) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `username`, `email`, `password`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_author`
--

CREATE TABLE `tbl_author` (
  `id_author` int(11) NOT NULL,
  `name_author` varchar(222) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_author`
--

INSERT INTO `tbl_author` (`id_author`, `name_author`) VALUES
(1, 'Paul D. Leedy'),
(2, 'David Natroshvili'),
(3, 'Oswald Campesato'),
(4, 'Sribharath Kainkaryam'),
(5, 'Yogendra Narayan Pandey'),
(6, 'Yuxi (Hayden) Liu'),
(7, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `cat_id` int(111) NOT NULL,
  `name` varchar(111) NOT NULL,
  `photo_cat` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cat_id`, `name`, `photo_cat`, `status`) VALUES
(1, 'Programming', '1628515681_programming.jpg', 1),
(2, 'Design', '1628515735_design.jpg', 1),
(3, 'Networking', '1628515902_networking.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `id_comment` int(111) NOT NULL,
  `comment` text NOT NULL,
  `date_comment` datetime NOT NULL,
  `id_ebook` int(100) NOT NULL,
  `id_user` text NOT NULL,
  `rating` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_comment`
--

INSERT INTO `tbl_comment` (`id_comment`, `comment`, `date_comment`, `id_ebook`, `id_user`, `rating`) VALUES
(1, 'Very awesome, i like this app', '2021-07-07 23:32:23', 10, '112770626116767213812', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ebook`
--

CREATE TABLE `tbl_ebook` (
  `id_ebook` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `photo` text NOT NULL,
  `description` text NOT NULL,
  `samplebook` text NOT NULL,
  `cat_id` int(11) NOT NULL,
  `status_ebook` int(1) DEFAULT NULL,
  `date` datetime NOT NULL,
  `id_author` int(11) NOT NULL,
  `id_publisher` int(11) NOT NULL,
  `pages` int(11) NOT NULL,
  `id_language` int(222) NOT NULL,
  `freebook` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ebook`
--

INSERT INTO `tbl_ebook` (`id_ebook`, `title`, `photo`, `description`, `samplebook`, `cat_id`, `status_ebook`, `date`, `id_author`, `id_publisher`, `pages`, `id_language`, `freebook`) VALUES
(13, 'Visual Basic - Become Expert Programmer of Visual Basic from Scratch', '1628742793_visualbasic.jpg', '<p>The&nbsp;<em>Visual Basic&reg; .NET Notes for Professionals</em>&nbsp;book is compiled from&nbsp;<a href=\"https://archive.org/details/documentation-dump.7z\" target=\"_blank\">Stack Overflow Documentation</a>, the content is written by the beautiful people at Stack Overflow. Text content is released under Creative Commons BY-SA. See credits at the end of this book whom contributed to the various chapters. Images may be copyright of their respective owners unless otherwise specified</p>\r\n\r\n<p>Book created for educational purposes and is not affiliated with Visual Basic&reg; .NET group(s), company(s) nor Stack Overflow. All trademarks belong to their respective company owners</p>\r\n\r\n<p>149 pages, published on May 2018</p>\r\n', 'sample_VisualBasic_NETNotesForProfessionals.pdf', 1, 1, '2021-08-07 16:17:54', 1, 1, 23, 1, 1),
(14, 'The Complete Java Script Course 2021: From Zero to Expert', '1628742907_js.jpg', '<p>The&nbsp;<em>JavaScript&reg; Notes for Professionals</em>&nbsp;book is compiled from&nbsp;<a href=\"https://archive.org/details/documentation-dump.7z\" target=\"_blank\">Stack Overflow Documentation</a>, the content is written by the beautiful people at Stack Overflow. Text content is released under Creative Commons BY-SA. See credits at the end of this book whom contributed to the various chapters. Images may be copyright of their respective owners unless otherwise specified</p>\r\n\r\n<p>Book created for educational purposes and is not affiliated with JavaScript&reg; group(s), company(s) nor Stack Overflow. All trademarks belong to their respective company owners</p>\r\n\r\n<p>490 pages, published on June 2019</p>\r\n', 'sample_JavaScriptNotesForProfessionals.pdf', 1, 1, '2021-08-07 20:57:59', 1, 1, 400, 1, 0),
(15, 'Angular Fundamentals from Scratch and Unit Testing', '1628742989_angular.jpg', '<p>The&nbsp;<em>AngularJS Notes for Professionals</em>&nbsp;book is compiled from&nbsp;<a href=\"https://archive.org/details/documentation-dump.7z\" target=\"_blank\">Stack Overflow Documentation</a>, the content is written by the beautiful people at Stack Overflow. Text content is released under Creative Commons BY-SA. See credits at the end of this book whom contributed to the various chapters. Images may be copyright of their respective owners unless otherwise specified</p>\r\n\r\n<p>Book created for educational purposes and is not affiliated with AngularJS group(s), company(s) nor Stack Overflow. All trademarks belong to their respective company owners</p>\r\n\r\n<p>201 pages, published on May 2018</p>\r\n', 'sample_AngularJSNotesForProfessionals.pdf', 1, 1, '2021-08-09 15:08:29', 1, 1, 100, 1, 1),
(16, 'Essential TypeScript from Zero to Hero', '1628743068_typescript.jpg', '<p>The&nbsp;<em>TypeScript Notes for Professionals</em>&nbsp;book is compiled from&nbsp;<a href=\"https://archive.org/details/documentation-dump.7z\" target=\"_blank\">Stack Overflow Documentation</a>, the content is written by the beautiful people at Stack Overflow. Text content is released under Creative Commons BY-SA. See credits at the end of this book whom contributed to the various chapters. Images may be copyright of their respective owners unless otherwise specified</p>\r\n\r\n<p>Book created for educational purposes and is not affiliated with TypeScript group(s), company(s) nor Stack Overflow. All trademarks belong to their respective company owners</p>\r\n\r\n<p>97 pages, published on May 2018</p>\r\n', 'sample_TypeScriptNotesForProfessionals.pdf', 1, 0, '2021-08-09 15:10:19', 1, 1, 80, 1, 1),
(17, 'Python Programming - Full Guide to Masterclass', '1628743165_python.jpg', '<p>The&nbsp;<em>Python&reg; Notes for Professionals</em>&nbsp;book is compiled from&nbsp;<a href=\"https://archive.org/details/documentation-dump.7z\" target=\"_blank\">Stack Overflow Documentation</a>, the content is written by the beautiful people at Stack Overflow. Text content is released under Creative Commons BY-SA. See credits at the end of this book whom contributed to the various chapters. Images may be copyright of their respective owners unless otherwise specified</p>\r\n\r\n<p>Book created for educational purposes and is not affiliated with Python&reg; group(s), company(s) nor Stack Overflow. All trademarks belong to their respective company owners</p>\r\n\r\n<p>816 pages, published on June 2018</p>\r\n', 'sample_PythonNotesForProfessionals.pdf', 1, 1, '2021-08-09 15:14:45', 1, 1, 700, 1, 1),
(18, 'The Complete 2021 PHP Full Stack Web Developer Bootcamp', '1628743300_php.jpg', '<p>The&nbsp;<em>PHP Notes for Professionals</em>&nbsp;book is compiled from&nbsp;<a href=\"https://archive.org/details/documentation-dump.7z\" target=\"_blank\">Stack Overflow Documentation</a>, the content is written by the beautiful people at Stack Overflow. Text content is released under Creative Commons BY-SA. See credits at the end of this book whom contributed to the various chapters. Images may be copyright of their respective owners unless otherwise specified</p>\r\n\r\n<p>Book created for educational purposes and is not affiliated with PHP group(s), company(s) nor Stack Overflow. All trademarks belong to their respective company owners</p>\r\n\r\n<p>481 pages, published on June 2018</p>\r\n', 'sample_PHPNotesForProfessionals.pdf', 1, 1, '2021-08-09 15:15:40', 1, 1, 400, 1, 1),
(19, 'The Ultimate MySQL Bootcamp: Go from SQL Beginner to Expert', '1628743464_mysql.jpg', '<p>The&nbsp;<em>MySQL&reg; Notes for Professionals</em>&nbsp;book is compiled from&nbsp;<a href=\"https://archive.org/details/documentation-dump.7z\" target=\"_blank\">Stack Overflow Documentation</a>, the content is written by the beautiful people at Stack Overflow. Text content is released under Creative Commons BY-SA. See credits at the end of this book whom contributed to the various chapters. Images may be copyright of their respective owners unless otherwise specified</p>\r\n\r\n<p>Book created for educational purposes and is not affiliated with MySQL&reg; group(s), company(s) nor Stack Overflow. All trademarks belong to their respective company owners</p>\r\n\r\n<p>199 pages, published on May 2018</p>\r\n', 'sample_MySQLNotesForProfessionals.pdf', 1, 1, '2021-08-09 15:17:22', 1, 1, 100, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_favorites`
--

CREATE TABLE `tbl_favorites` (
  `id_favorites` int(100) NOT NULL,
  `id_fav_ebook` int(100) NOT NULL,
  `id_fav_user` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_favorites`
--

INSERT INTO `tbl_favorites` (`id_favorites`, `id_fav_ebook`, `id_fav_user`) VALUES
(1, 19, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_language`
--

CREATE TABLE `tbl_language` (
  `id_language` int(222) NOT NULL,
  `name_language` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_language`
--

INSERT INTO `tbl_language` (`id_language`, `name_language`) VALUES
(1, 'English'),
(2, 'Indonesian'),
(3, 'albania'),
(4, 'Arabic'),
(5, 'Armenia'),
(7, 'Tamil'),
(8, 'French');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_publisher`
--

CREATE TABLE `tbl_publisher` (
  `id_publisher` int(11) NOT NULL,
  `name_publisher` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_publisher`
--

INSERT INTO `tbl_publisher` (`id_publisher`, `name_publisher`) VALUES
(1, 'Springer'),
(2, 'Wiley'),
(3, 'Tech Programming'),
(4, 'Bala'),
(5, 'jvn');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ratings`
--

CREATE TABLE `tbl_ratings` (
  `id_rating` int(100) NOT NULL,
  `id_ebook` int(100) NOT NULL,
  `id_user` text NOT NULL,
  `ratings` double(1,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_setting`
--

CREATE TABLE `tbl_setting` (
  `id` int(10) NOT NULL,
  `slider` int(1) NOT NULL DEFAULT 1,
  `ads` int(1) NOT NULL DEFAULT 0,
  `startapplivemode` int(1) NOT NULL DEFAULT 0,
  `startappaccountid` varchar(100) NOT NULL,
  `androidappid` varchar(100) NOT NULL,
  `iosappid` varchar(100) NOT NULL,
  `admobreward` varchar(100) NOT NULL,
  `banner` varchar(100) NOT NULL,
  `interstisial` varchar(100) NOT NULL,
  `unitylivemode` int(1) NOT NULL DEFAULT 0,
  `unitygameid` varchar(100) NOT NULL,
  `unitybanner` varchar(100) NOT NULL,
  `unityinterstisial` varchar(100) NOT NULL,
  `unityreward` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_setting`
--

INSERT INTO `tbl_setting` (`id`, `slider`, `ads`, `startapplivemode`, `startappaccountid`, `androidappid`, `iosappid`, `admobreward`, `banner`, `interstisial`, `unitylivemode`, `unitygameid`, `unitybanner`, `unityinterstisial`, `unityreward`) VALUES
(1, 3, 1, 1, '103278217', '203045076', '203045076', 'ca-app-pub-3940256099942544/5224354917', 'ca-app-pub-3940256099942544/6300978111', 'ca-app-pub-3940256099942544/1033173712', 1, 'test', 'test', 'test', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(222) NOT NULL,
  `name_user` varchar(222) NOT NULL,
  `email_user` varchar(222) NOT NULL,
  `photo_user` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `name_user`, `email_user`, `photo_user`, `password`) VALUES
(1, 'testing', 'test@gmail.com', 'image_picker663395777355832134.jpg', 'test');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_author`
--
ALTER TABLE `tbl_author`
  ADD PRIMARY KEY (`id_author`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`id_comment`);

--
-- Indexes for table `tbl_ebook`
--
ALTER TABLE `tbl_ebook`
  ADD PRIMARY KEY (`id_ebook`);

--
-- Indexes for table `tbl_favorites`
--
ALTER TABLE `tbl_favorites`
  ADD PRIMARY KEY (`id_favorites`);

--
-- Indexes for table `tbl_language`
--
ALTER TABLE `tbl_language`
  ADD PRIMARY KEY (`id_language`);

--
-- Indexes for table `tbl_publisher`
--
ALTER TABLE `tbl_publisher`
  ADD PRIMARY KEY (`id_publisher`);

--
-- Indexes for table `tbl_ratings`
--
ALTER TABLE `tbl_ratings`
  ADD PRIMARY KEY (`id_rating`);

--
-- Indexes for table `tbl_setting`
--
ALTER TABLE `tbl_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_author`
--
ALTER TABLE `tbl_author`
  MODIFY `id_author` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `cat_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `id_comment` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_ebook`
--
ALTER TABLE `tbl_ebook`
  MODIFY `id_ebook` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_favorites`
--
ALTER TABLE `tbl_favorites`
  MODIFY `id_favorites` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_language`
--
ALTER TABLE `tbl_language`
  MODIFY `id_language` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_publisher`
--
ALTER TABLE `tbl_publisher`
  MODIFY `id_publisher` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_ratings`
--
ALTER TABLE `tbl_ratings`
  MODIFY `id_rating` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_setting`
--
ALTER TABLE `tbl_setting`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
