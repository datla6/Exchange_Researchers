-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2016 at 03:23 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nbad3_create_db.sql`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `STUDYID` int(11) NOT NULL,
  `QUESTIONID` int(11) NOT NULL,
  `USERNAME` varchar(40) NOT NULL DEFAULT '',
  `CHOICE` varchar(40) DEFAULT NULL,
  `DATESUBMITTED` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `QUESTIONID` int(11) NOT NULL,
  `STUDYID` int(11) DEFAULT NULL,
  `QUESTION` varchar(50) DEFAULT NULL,
  `ANSWERTYPE` varchar(10) DEFAULT NULL,
  `OPTION1` varchar(40) DEFAULT NULL,
  `OPTION2` varchar(40) DEFAULT NULL,
  `OPTION3` varchar(40) DEFAULT NULL,
  `OPTION4` varchar(40) DEFAULT NULL,
  `OPTION5` varchar(40) DEFAULT NULL,
  `NOOFANSWERS` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reported`
--

CREATE TABLE `reported` (
  `QUESTIONID` int(11) NOT NULL,
  `STUDYID` int(11) NOT NULL,
  `DATE` datetime DEFAULT NULL,
  `USERNAME` varchar(40) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reported_status`
--

CREATE TABLE `reported_status` (
  `QUESTIONID` int(11) NOT NULL,
  `STUDYID` int(11) NOT NULL,
  `STATUS` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `study`
--

CREATE TABLE `study` (
  `STUDYID` int(11) NOT NULL,
  `STUDYNAME` varchar(40) DEFAULT NULL,
  `DESCRIPTION` varchar(50) DEFAULT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `DATECREATED` datetime DEFAULT NULL,
  `IMAGEURL` mediumblob,
  `REQPARTICIPANTS` int(15) DEFAULT NULL,
  `ACTPARTICIPANTS` int(15) DEFAULT NULL,
  `SSTATUS` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `USERNAME` varchar(50) NOT NULL DEFAULT '',
  `PASSWORD` varchar(50) DEFAULT NULL,
  `TYPE` varchar(50) DEFAULT NULL,
  `STUDIES` int(15) DEFAULT NULL,
  `PARTICIPATION` int(15) DEFAULT NULL,
  `COINS` int(15) DEFAULT NULL,
  `NAME` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`USERNAME`, `PASSWORD`, `TYPE`, `STUDIES`, `PARTICIPATION`, `COINS`, `NAME`) VALUES
('jaikiranduvvu@yahoo.com', 'jaikiran', 'Participant', 0, 0, 0, 'Jai Kiran');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`STUDYID`,`QUESTIONID`,`USERNAME`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`QUESTIONID`),
  ADD KEY `STUDYID` (`STUDYID`);

--
-- Indexes for table `reported`
--
ALTER TABLE `reported`
  ADD PRIMARY KEY (`STUDYID`,`QUESTIONID`,`USERNAME`),
  ADD KEY `QUESTIONID` (`QUESTIONID`);

--
-- Indexes for table `reported_status`
--
ALTER TABLE `reported_status`
  ADD PRIMARY KEY (`STUDYID`,`QUESTIONID`,`STATUS`),
  ADD KEY `QUESTIONID` (`QUESTIONID`);

--
-- Indexes for table `study`
--
ALTER TABLE `study`
  ADD PRIMARY KEY (`STUDYID`),
  ADD KEY `USERNAME` (`USERNAME`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`USERNAME`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `QUESTIONID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `study`
--
ALTER TABLE `study`
  MODIFY `STUDYID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`STUDYID`) REFERENCES `study` (`STUDYID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reported`
--
ALTER TABLE `reported`
  ADD CONSTRAINT `reported_ibfk_1` FOREIGN KEY (`QUESTIONID`) REFERENCES `question` (`QUESTIONID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reported_ibfk_2` FOREIGN KEY (`STUDYID`) REFERENCES `study` (`STUDYID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reported_status`
--
ALTER TABLE `reported_status`
  ADD CONSTRAINT `reported_status_ibfk_1` FOREIGN KEY (`QUESTIONID`) REFERENCES `reported` (`QUESTIONID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reported_status_ibfk_2` FOREIGN KEY (`STUDYID`) REFERENCES `reported` (`STUDYID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `study`
--
ALTER TABLE `study`
  ADD CONSTRAINT `study_ibfk_1` FOREIGN KEY (`USERNAME`) REFERENCES `user` (`USERNAME`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
