-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 09, 2022 at 03:20 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Music_Player`
--

-- --------------------------------------------------------

--
-- Table structure for table `Playlists`
--

CREATE TABLE `Playlists` (
  `playlistID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Playlists`
--

INSERT INTO `Playlists` (`playlistID`, `userID`, `name`) VALUES
(6, 1, 'Sinhala Songs'),
(7, 1, 'English Songs'),
(8, 1, 'Hindi Songs'),
(9, 1, 'Acoustic Songs');

-- --------------------------------------------------------

--
-- Table structure for table `playlist_videos`
--

CREATE TABLE `playlist_videos` (
  `playlistID` int(11) NOT NULL,
  `videoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `playlist_videos`
--

INSERT INTO `playlist_videos` (`playlistID`, `videoID`) VALUES
(6, 1),
(6, 2),
(7, 2),
(8, 2),
(9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `idvideo` int(11) NOT NULL,
  `vname` varchar(1000) NOT NULL,
  `description` varchar(1500) NOT NULL,
  `video` varchar(1000) NOT NULL,
  `uplodedate` varchar(250) NOT NULL,
  `category` varchar(1000) NOT NULL,
  `UserName` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`idvideo`, `vname`, `description`, `video`, `uplodedate`, `category`, `UserName`) VALUES
(1, 'cool', 'Best', './video/vid3.mp4', '2022-11-05', 'Tech', 'user1'),
(2, 'Rox', 'This Rox', './video/vid5.mp4', '2022-11-06', 'Nature', 'user2'),
(3, 'Techi', 'This is best', './video/vid2.mp4', '2022-11-06', 'Nature', 'user2'),
(4, 'How to slove 500 Error', 'This is right place you are looking now!', './video/vid1.mp4', '2022-11-07', 'Tech', 'user3'),
(5, 'Funny', 'Go gog go!', './video/vid4.mp4', '2022-11-07', 'Tech', 'user1'),
(6, 'LoL', 'Go out do go!', './video/vid6.mp4', '2022-11-07', 'Tech', 'user2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Playlists`
--
ALTER TABLE `Playlists`
  ADD PRIMARY KEY (`playlistID`);

--
-- Indexes for table `playlist_videos`
--
ALTER TABLE `playlist_videos`
  ADD PRIMARY KEY (`playlistID`,`videoID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Playlists`
--
ALTER TABLE `Playlists`
  MODIFY `playlistID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `playlist_videos`
--
ALTER TABLE `playlist_videos`
  ADD CONSTRAINT `playlist_videos_ibfk_1` FOREIGN KEY (`playlistID`) REFERENCES `Playlists` (`playlistID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
