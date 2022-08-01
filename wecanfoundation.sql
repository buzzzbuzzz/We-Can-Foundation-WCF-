-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2019 at 04:31 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wecanfoundation`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `StaffID` varchar(6) NOT NULL,
  `StaffName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `donasi`
--

CREATE TABLE `donasi` (
  `DonasiID` varchar(6) NOT NULL,
  `NamaDonasi` varchar(50) NOT NULL,
  `TanggalDonasi` date NOT NULL,
  `Jumlah` int(10) NOT NULL,
  `KategoriDonasiID` varchar(6) NOT NULL,
  `JenisDonasiID` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `donatur`
--

CREATE TABLE `donatur` (
  `DonaturID` varchar(6) NOT NULL,
  `NamaDonatur` varchar(50) NOT NULL,
  `AlamatDonatur` text NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Notelp` int(15) NOT NULL,
  `Kota` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `jenisdonasi`
--

CREATE TABLE `jenisdonasi` (
  `JenisDonasiID` varchar(6) NOT NULL,
  `NamaJenisDonasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `jenispenerimadonasi`
--

CREATE TABLE `jenispenerimadonasi` (
  `JenisPenerimaDonasiID` varchar(6) NOT NULL,
  `NamaJenisPenerimaDonasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kategoridonasi`
--

CREATE TABLE `kategoridonasi` (
  `KategoriDonasiID` varchar(6) NOT NULL,
  `NamaKategoriDonasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `penerimadonasi`
--

CREATE TABLE `penerimadonasi` (
  `PenerimaDonasiID` varchar(6) NOT NULL,
  `NamaPenerimaDonasi` varchar(50) NOT NULL,
  `EmailPenerimaDonasi` varchar(50) NOT NULL,
  `NoTelpPenerimaDonasi` int(15) NOT NULL,
  `KotaPenerimaDonasi` varchar(50) NOT NULL,
  `JenisPenerimaDonasiID` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `receiptdonatur`
--

CREATE TABLE `receiptdonatur` (
  `ReceiptDID` varchar(6) NOT NULL,
  `DonaturID` varchar(6) NOT NULL,
  `KategoriID` varchar(6) NOT NULL,
  `JenisDonasiID` varchar(6) NOT NULL,
  `JenisPenerimaID` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `receiptpenerima`
--

CREATE TABLE `receiptpenerima` (
  `ReceiptPID` varchar(6) NOT NULL,
  `PenerimaDonasiID` varchar(6) NOT NULL,
  `JenisPenerimaID` varchar(6) NOT NULL,
  `KategoriDonasiID` varchar(6) NOT NULL,
  `JenisDonasiID` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`StaffID`);

--
-- Indexes for table `donasi`
--
ALTER TABLE `donasi`
  ADD PRIMARY KEY (`DonasiID`),
  ADD KEY `KategoriDonasiID` (`KategoriDonasiID`,`JenisDonasiID`),
  ADD KEY `JenisDonasiID` (`JenisDonasiID`);

--
-- Indexes for table `donatur`
--
ALTER TABLE `donatur`
  ADD PRIMARY KEY (`DonaturID`);

--
-- Indexes for table `jenisdonasi`
--
ALTER TABLE `jenisdonasi`
  ADD PRIMARY KEY (`JenisDonasiID`);

--
-- Indexes for table `jenispenerimadonasi`
--
ALTER TABLE `jenispenerimadonasi`
  ADD PRIMARY KEY (`JenisPenerimaDonasiID`);

--
-- Indexes for table `kategoridonasi`
--
ALTER TABLE `kategoridonasi`
  ADD PRIMARY KEY (`KategoriDonasiID`);

--
-- Indexes for table `penerimadonasi`
--
ALTER TABLE `penerimadonasi`
  ADD PRIMARY KEY (`PenerimaDonasiID`),
  ADD KEY `JenisPenerimaDonasiID` (`JenisPenerimaDonasiID`);

--
-- Indexes for table `receiptdonatur`
--
ALTER TABLE `receiptdonatur`
  ADD PRIMARY KEY (`ReceiptDID`),
  ADD KEY `DonaturID` (`DonaturID`,`KategoriID`,`JenisPenerimaID`,`JenisDonasiID`),
  ADD KEY `receiptdonatur_ibfk_2` (`JenisDonasiID`),
  ADD KEY `receiptdonatur_ibfk_3` (`JenisPenerimaID`),
  ADD KEY `KategoriID` (`KategoriID`);

--
-- Indexes for table `receiptpenerima`
--
ALTER TABLE `receiptpenerima`
  ADD PRIMARY KEY (`ReceiptPID`),
  ADD KEY `PenerimaDonasiID` (`PenerimaDonasiID`,`JenisPenerimaID`,`KategoriDonasiID`,`JenisDonasiID`),
  ADD KEY `JenisDonasiID` (`JenisDonasiID`),
  ADD KEY `JenisPenerimaID` (`JenisPenerimaID`),
  ADD KEY `KategoriDonasiID` (`KategoriDonasiID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `donasi`
--
ALTER TABLE `donasi`
  ADD CONSTRAINT `donasi_ibfk_1` FOREIGN KEY (`JenisDonasiID`) REFERENCES `jenisdonasi` (`JenisDonasiID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `donasi_ibfk_2` FOREIGN KEY (`KategoriDonasiID`) REFERENCES `kategoridonasi` (`KategoriDonasiID`) ON UPDATE CASCADE;

--
-- Constraints for table `penerimadonasi`
--
ALTER TABLE `penerimadonasi`
  ADD CONSTRAINT `penerimadonasi_ibfk_1` FOREIGN KEY (`JenisPenerimaDonasiID`) REFERENCES `jenispenerimadonasi` (`JenisPenerimaDonasiID`) ON UPDATE CASCADE;

--
-- Constraints for table `receiptdonatur`
--
ALTER TABLE `receiptdonatur`
  ADD CONSTRAINT `receiptdonatur_ibfk_1` FOREIGN KEY (`DonaturID`) REFERENCES `donatur` (`DonaturID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `receiptdonatur_ibfk_2` FOREIGN KEY (`JenisDonasiID`) REFERENCES `jenisdonasi` (`JenisDonasiID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `receiptdonatur_ibfk_3` FOREIGN KEY (`JenisPenerimaID`) REFERENCES `jenispenerimadonasi` (`JenisPenerimaDonasiID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `receiptdonatur_ibfk_4` FOREIGN KEY (`KategoriID`) REFERENCES `kategoridonasi` (`KategoriDonasiID`) ON UPDATE CASCADE;

--
-- Constraints for table `receiptpenerima`
--
ALTER TABLE `receiptpenerima`
  ADD CONSTRAINT `receiptpenerima_ibfk_1` FOREIGN KEY (`JenisDonasiID`) REFERENCES `jenisdonasi` (`JenisDonasiID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `receiptpenerima_ibfk_2` FOREIGN KEY (`JenisPenerimaID`) REFERENCES `jenispenerimadonasi` (`JenisPenerimaDonasiID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `receiptpenerima_ibfk_3` FOREIGN KEY (`KategoriDonasiID`) REFERENCES `kategoridonasi` (`KategoriDonasiID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `receiptpenerima_ibfk_4` FOREIGN KEY (`PenerimaDonasiID`) REFERENCES `penerimadonasi` (`PenerimaDonasiID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
