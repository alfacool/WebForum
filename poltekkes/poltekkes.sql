-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2018 at 04:56 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `poltekkes`
--
CREATE DATABASE IF NOT EXISTS `poltekkes` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `poltekkes`;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `id_kat` int(8) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  PRIMARY KEY (`id_kat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kat`, `nama_kategori`, `deskripsi`) VALUES
(13, 'tes kategori', 'hanya untuk tes');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id_login` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id_login`),
  KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id_login`, `username`, `password`, `email`) VALUES
(18, 'tester', 'e10adc3949ba59abbe56e057f20f883e', 'tester@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id_post` int(8) NOT NULL AUTO_INCREMENT,
  `konten` text NOT NULL,
  `tanggal` date NOT NULL,
  `post_topik` int(8) NOT NULL,
  `post_by` varchar(50) NOT NULL,
  `link_attachment` text,
  PRIMARY KEY (`id_post`),
  KEY `post_by` (`post_by`),
  KEY `post_topik` (`post_topik`),
  KEY `post_topik_2` (`post_topik`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=113 ;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id_post`, `konten`, `tanggal`, `post_topik`, `post_by`, `link_attachment`) VALUES
(111, 'test purposes only', '2018-03-12', 50, 'tester', ''),
(112, '', '2018-03-12', 50, 'tester', 'file/tesfile.doc');

-- --------------------------------------------------------

--
-- Table structure for table `topik`
--

CREATE TABLE IF NOT EXISTS `topik` (
  `id_topik` int(8) NOT NULL AUTO_INCREMENT,
  `subyek` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `topik_kat` int(8) NOT NULL,
  `topik_by` varchar(50) NOT NULL,
  PRIMARY KEY (`id_topik`),
  KEY `topik_kat` (`topik_kat`),
  KEY `topik_by` (`topik_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `topik`
--

INSERT INTO `topik` (`id_topik`, `subyek`, `tanggal`, `topik_kat`, `topik_by`) VALUES
(50, 'hanya tes saja', '2018-03-12', 13, 'tester');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(8) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jabatan` varchar(15) NOT NULL,
  `golongan` varchar(5) NOT NULL,
  `pendidikan` text NOT NULL,
  `ijazah` varchar(5) NOT NULL,
  `kontak` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `foto` text,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `id` (`id_user`),
  KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `nip`, `tanggal_lahir`, `jabatan`, `golongan`, `pendidikan`, `ijazah`, `kontak`, `username`, `foto`) VALUES
(18, 'tester', '0123', '2018-03-01', 'tes', 'tes', 'tes', 'tes', 'tes', 'tester', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_admin`
--

CREATE TABLE IF NOT EXISTS `user_admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_admin`
--

INSERT INTO `user_admin` (`id_admin`, `username`, `password`) VALUES
(1, 'root', '21232f297a57a5a743894a0e4a801fc3');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
