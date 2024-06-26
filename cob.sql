-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2024 at 07:55 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cob`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `bankID` int(200) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jabatan` varchar(15) NOT NULL,
  `nama_bank` varchar(15) NOT NULL,
  `no_rek` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`bankID`, `nama`, `jabatan`, `nama_bank`, `no_rek`) VALUES
(2, 'indra syafrizal', 'Manager', 'bca', '66363636');

-- --------------------------------------------------------

--
-- Table structure for table `fjabatan`
--

CREATE TABLE `fjabatan` (
  `Jabatan` varchar(30) NOT NULL,
  `Gaji_Pokok` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fjabatan`
--

INSERT INTO `fjabatan` (`Jabatan`, `Gaji_Pokok`) VALUES
('Financial', 90000000);

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `karyawanID` int(5) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jabatan` varchar(30) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jk` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `noHP` varchar(12) DEFAULT NULL,
  `gp` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`karyawanID`, `nama`, `jabatan`, `tgl_lahir`, `jk`, `alamat`, `noHP`, `gp`) VALUES
(222, 'dddddddd', 'Financial', '2024-05-04', 'Laki-Laki', 'dddddddddd', '222222222222', 90000000);

-- --------------------------------------------------------

--
-- Table structure for table `lembur`
--

CREATE TABLE `lembur` (
  `lemburID` int(5) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jabatan` varchar(15) NOT NULL,
  `jml_jam` int(3) NOT NULL,
  `total` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lembur`
--

INSERT INTO `lembur` (`lemburID`, `nama`, `jabatan`, `jml_jam`, `total`) VALUES
(2, 'indra syafrizal', '', 10, 1000000);

-- --------------------------------------------------------

--
-- Table structure for table `penggajian`
--

CREATE TABLE `penggajian` (
  `gajiID` int(5) NOT NULL,
  `tgl` date NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jabatan` varchar(15) NOT NULL,
  `gapok` int(10) NOT NULL,
  `gaji_lembur` int(10) NOT NULL,
  `potongan` int(10) NOT NULL,
  `gaji_bersih` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penggajian`
--

INSERT INTO `penggajian` (`gajiID`, `tgl`, `nama`, `jabatan`, `gapok`, `gaji_lembur`, `potongan`, `gaji_bersih`) VALUES
(2, '2024-04-05', 'indra syafrizal', 'Manager', 5000000, 400000, 100000, 5300000);

-- --------------------------------------------------------

--
-- Table structure for table `potongan`
--

CREATE TABLE `potongan` (
  `potonganID` int(100) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jabatan` varchar(15) NOT NULL,
  `ketidakhadiran` int(5) NOT NULL,
  `potongan` int(15) NOT NULL,
  `total` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `potongan`
--

INSERT INTO `potongan` (`potonganID`, `nama`, `jabatan`, `ketidakhadiran`, `potongan`, `total`) VALUES
(2, 'indra syafrizal', 'Manager', 1, 100000, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `rekap_absen`
--

CREATE TABLE `rekap_absen` (
  `absenID` int(200) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jabatan` varchar(15) NOT NULL,
  `bulan` varchar(50) NOT NULL,
  `hadir` int(2) NOT NULL,
  `ketidakhadiran` int(2) NOT NULL,
  `Potongan` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rekap_absen`
--

INSERT INTO `rekap_absen` (`absenID`, `nama`, `jabatan`, `bulan`, `hadir`, `ketidakhadiran`, `Potongan`) VALUES
(2, 'indra syafrizal', '', 'JANUARI', 28, 3, 300000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `noID` int(3) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`noID`, `username`, `password`) VALUES
(2, 'admin', 'admin'),
(4, 'reiner', 'admin1'),
(12, 'putra', 'null'),
(13, 'rein', 'null');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`bankID`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`karyawanID`);

--
-- Indexes for table `lembur`
--
ALTER TABLE `lembur`
  ADD PRIMARY KEY (`lemburID`);

--
-- Indexes for table `penggajian`
--
ALTER TABLE `penggajian`
  ADD PRIMARY KEY (`gajiID`);

--
-- Indexes for table `potongan`
--
ALTER TABLE `potongan`
  ADD PRIMARY KEY (`potonganID`);

--
-- Indexes for table `rekap_absen`
--
ALTER TABLE `rekap_absen`
  ADD PRIMARY KEY (`absenID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`noID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `bankID` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `karyawanID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6777;

--
-- AUTO_INCREMENT for table `lembur`
--
ALTER TABLE `lembur`
  MODIFY `lemburID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `penggajian`
--
ALTER TABLE `penggajian`
  MODIFY `gajiID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `potongan`
--
ALTER TABLE `potongan`
  MODIFY `potonganID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rekap_absen`
--
ALTER TABLE `rekap_absen`
  MODIFY `absenID` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3334;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `noID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
