-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 14, 2020 at 06:59 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `class_id` int(20) NOT NULL,
  `class_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`class_id`, `class_name`) VALUES
(1, 'first'),
(2, 'second'),
(3, 'third'),
(4, 'fourth'),
(5, 'fifth');

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `day_id` int(20) NOT NULL,
  `day` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`day_id`, `day`) VALUES
(1, 'monday'),
(2, 'tuesday'),
(3, 'wednesday'),
(4, 'thursday'),
(5, 'friday');

-- --------------------------------------------------------

--
-- Table structure for table `hour`
--

CREATE TABLE `hour` (
  `hour_id` int(20) NOT NULL,
  `time` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hour`
--

INSERT INTO `hour` (`hour_id`, `time`) VALUES
(1, '8-9'),
(2, '9-10'),
(3, '10-11'),
(4, '11-12'),
(5, '1-2');

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `parent_id` int(20) NOT NULL,
  `mother_name` varchar(30) NOT NULL,
  `father_name` varchar(40) NOT NULL,
  `guardian` varchar(40) NOT NULL,
  `phone_no` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`parent_id`, `mother_name`, `father_name`, `guardian`, `phone_no`) VALUES
(1, 'kamali', 'bala', '', '8455622482'),
(2, 'vinitha', 'abinesh', '', '12357890'),
(3, 'nila', 'magesh', '', '3654545544'),
(4, 'priya', 'deepak', '', '646874685'),
(5, 'gracy', 'raja', '', '565646874');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `section_id` int(20) NOT NULL,
  `sections` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`section_id`, `sections`) VALUES
(1, 'a'),
(2, 'b'),
(3, 'c');

-- --------------------------------------------------------

--
-- Table structure for table `staff_assign`
--

CREATE TABLE `staff_assign` (
  `id` int(20) NOT NULL,
  `tt_id` int(30) NOT NULL,
  `teacher_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff_assign`
--

INSERT INTO `staff_assign` (`id`, `tt_id`, `teacher_id`) VALUES
(1, 1, 1),
(2, 1, 4),
(3, 2, 2),
(4, 3, 3),
(5, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `stud_id` int(20) NOT NULL,
  `stud_name` varchar(30) NOT NULL,
  `class_id` int(20) NOT NULL,
  `section_id` int(20) NOT NULL,
  `dob` date NOT NULL,
  `parent_id` int(40) NOT NULL,
  `phone_no` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`stud_id`, `stud_name`, `class_id`, `section_id`, `dob`, `parent_id`, `phone_no`) VALUES
(1, 'raja', 5, 1, '2020-09-02', 4, '8455622482'),
(2, 'kiran', 5, 1, '2020-09-22', 1, '12357890'),
(3, 'ponraj', 5, 1, '2020-09-27', 2, '3654545544'),
(4, 'udhay', 5, 1, '2020-09-12', 3, '5785757868'),
(5, 'josh', 5, 1, '1996-09-21', 5, '9790958784'),
(6, 'sds', 1, 1, '1996-12-20', 1, '1121212121'),
(7, 'mark', 1, 2, '1996-09-21', 3, '1234567980');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(20) NOT NULL,
  `subject_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_id`, `subject_name`) VALUES
(1, 'tamil'),
(2, 'english'),
(3, 'maths'),
(4, 'science'),
(5, 'social');

-- --------------------------------------------------------

--
-- Table structure for table `subject_staff`
--

CREATE TABLE `subject_staff` (
  `id` int(20) NOT NULL,
  `teacher_id` int(30) NOT NULL,
  `subject_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject_staff`
--

INSERT INTO `subject_staff` (`id`, `teacher_id`, `subject_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacher_id` int(20) NOT NULL,
  `teacher_name` varchar(30) NOT NULL,
  `mobile_no` varchar(40) NOT NULL,
  `doj` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacher_id`, `teacher_name`, `mobile_no`, `doj`) VALUES
(1, 'anitha', '1234556780', '2020-04-15'),
(2, 'poornima', '4527866245', '2020-01-21'),
(3, 'priya', '2432868547', '2020-06-18'),
(4, 'meenakshi', '52367862512', '2019-08-17'),
(5, 'santhi', '77752428523', '2019-02-15');

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `tt_id` int(20) NOT NULL,
  `day_id` int(30) NOT NULL,
  `subject_id` int(20) NOT NULL,
  `hour` int(40) NOT NULL,
  `class_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`tt_id`, `day_id`, `subject_id`, `hour`, `class_id`) VALUES
(1, 1, 1, 1, 5),
(2, 1, 2, 2, 5),
(3, 1, 3, 3, 3),
(4, 1, 4, 5, 1),
(6, 5, 5, 4, 5),
(7, 1, 1, 1, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`day_id`);

--
-- Indexes for table `hour`
--
ALTER TABLE `hour`
  ADD PRIMARY KEY (`hour_id`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`parent_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `staff_assign`
--
ALTER TABLE `staff_assign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tt` (`tt_id`),
  ADD KEY `staff` (`teacher_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`stud_id`),
  ADD KEY `class` (`class_id`),
  ADD KEY `parent` (`parent_id`),
  ADD KEY `section` (`section_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `subject_staff`
--
ALTER TABLE `subject_staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teacher_id` (`teacher_id`),
  ADD KEY `teacher` (`teacher_id`),
  ADD KEY `subject` (`subject_id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacher_id`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`tt_id`),
  ADD KEY `day` (`day_id`),
  ADD KEY `sub` (`subject_id`),
  ADD KEY `hour` (`hour`),
  ADD KEY `classid` (`class_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `staff_assign`
--
ALTER TABLE `staff_assign`
  ADD CONSTRAINT `staff` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`),
  ADD CONSTRAINT `tt` FOREIGN KEY (`tt_id`) REFERENCES `timetable` (`tt_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  ADD CONSTRAINT `parent` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`parent_id`),
  ADD CONSTRAINT `section` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`);

--
-- Constraints for table `subject_staff`
--
ALTER TABLE `subject_staff`
  ADD CONSTRAINT `subject` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`),
  ADD CONSTRAINT `teacher` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`);

--
-- Constraints for table `timetable`
--
ALTER TABLE `timetable`
  ADD CONSTRAINT `classid` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  ADD CONSTRAINT `day` FOREIGN KEY (`day_id`) REFERENCES `days` (`day_id`),
  ADD CONSTRAINT `hour` FOREIGN KEY (`hour`) REFERENCES `hour` (`hour_id`),
  ADD CONSTRAINT `sub` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
