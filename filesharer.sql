-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 01, 2015 at 07:50 AM
-- Server version: 10.0.22-MariaDB-log
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `filesharer`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `permission` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `permission`) VALUES
(1, 'Standard user', ''),
(2, 'Administrator', '{\r\n"moderator" : 1,\r\n"admin" : 1\r\n}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(64) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `joined` datetime NOT NULL,
  `group` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `salt`, `name`, `joined`, `group`) VALUES
(26, 'titi', '2476337d6a38c467c3c3c2164d7c46233814f1afac37d4751d287a6521ced29f', '?p+?)D?y\ncz??0?????M A?B?k?1', 'Titi', '2015-11-25 12:59:31', 1),
(27, 'zefir', 'b35903fa640237f4b8544cb94bba6e0bd51fe49dc7484a17857a3dade80699b5', '', 'Curko', '2015-11-25 13:00:38', 2),
(32, 'cicko', 'e2e20f3b592787d5ab98e8d1b75c95ac70e2ee32a5af84762130e7b1e2cf7843', 'n?Ya?&??$F???=B???G?\n?P?h?6', 'Cicko', '2015-11-25 16:46:55', 1),
(33, 'lambri', 'c13b96bc7b0fd6ee16c8f9bf92f4c84c3fac0c1d923b5cbba781775c31417e10', '<L?%????', 'Lambri', '2015-11-27 18:02:34', 1),
(34, 'bobo', 'b21e780b2c9ac551b6acc7d8daf3b3be4f3e60f062ccbdb9ae71381ecf329ce7', '?\r?6???;??n??????-l^g?F?', 'Bobo', '2015-11-27 20:02:37', 1),
(35, 'runi', '57b2c65fff45a9c9eb12d48a9867aae05d94680234f9d1c959572ea754ab1b52', '?????????F?Gg??O?-N??2L', 'Weyne Rooney', '2015-11-30 17:03:50', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_session`
--

CREATE TABLE `user_session` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hash` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_session`
--

INSERT INTO `user_session` (`id`, `user_id`, `hash`) VALUES
(5, 35, 'afc741217dd4c6eccf5c934683af416edc95814766646f734c84e1f9c069b638');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_session`
--
ALTER TABLE `user_session`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `user_session`
--
ALTER TABLE `user_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
