-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 15, 2024 at 06:06 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bankbridatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `karyawan_id` int NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `gaji` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`karyawan_id`, `nama`, `jabatan`, `gaji`) VALUES
(1, 'Ezi Pradana', 'Manager', 15000000.00),
(2, 'Michael Gilbert', 'Supervisor', 10000000.00),
(3, 'Ahmad Dani', 'Staff', 7500000.00),
(4, 'Lestari', 'Staff', 7500000.00),
(5, 'Parjono', 'Staff', 5000000.00);

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE `nasabah` (
  `nasabah_id` int NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nasabah`
--

INSERT INTO `nasabah` (`nasabah_id`, `nama`, `alamat`, `tanggal_lahir`) VALUES
(1, 'Ahmad Arvi', 'Boyolali', '2003-01-01'),
(2, 'Sakti Pratama', 'Karanganyar', '2004-02-15'),
(3, 'Egi Dian', 'Lampung', '2002-03-30'),
(4, 'Hamka Nanda', 'Bogor', '2001-04-20'),
(5, 'Gifar Gozi', 'Pontianak', '1999-07-10');

-- --------------------------------------------------------

--
-- Table structure for table `nasabah_detail`
--

CREATE TABLE `nasabah_detail` (
  `nasabah_id` int NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nomor_telepon` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nasabah_detail`
--

INSERT INTO `nasabah_detail` (`nasabah_id`, `email`, `nomor_telepon`) VALUES
(1, 'ahmadravi@gmail.com', '08123421789'),
(2, 'saktipratama@gmail.com', '08129736543'),
(3, 'egidian@gmail.com', '08132347890'),
(4, 'hamkananda@gmail.com', '08191265432'),
(5, 'gifargozi@gmail.com', '08145108901');

-- --------------------------------------------------------

--
-- Table structure for table `nasabah_produk`
--

CREATE TABLE `nasabah_produk` (
  `nasabah_id` int NOT NULL,
  `produk_id` int NOT NULL,
  `tanggal_berlangganan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nasabah_produk`
--

INSERT INTO `nasabah_produk` (`nasabah_id`, `produk_id`, `tanggal_berlangganan`) VALUES
(1, 1, '2023-01-07'),
(2, 2, '2022-08-02'),
(3, 3, '2022-03-03'),
(4, 4, '2020-04-08'),
(5, 5, '2019-05-05');

-- --------------------------------------------------------

--
-- Table structure for table `pinjaman`
--

CREATE TABLE `pinjaman` (
  `pinjaman_id` int NOT NULL,
  `nasabah_id` int DEFAULT NULL,
  `jumlah` decimal(15,2) DEFAULT NULL,
  `tanggal_pengajuan` date DEFAULT NULL,
  `tanggal_disetujui` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pinjaman`
--

INSERT INTO `pinjaman` (`pinjaman_id`, `nasabah_id`, `jumlah`, `tanggal_pengajuan`, `tanggal_disetujui`) VALUES
(1, 1, 5000000.00, '2024-01-01', '2024-01-05'),
(2, 2, 10000000.00, '2024-02-01', '2024-02-07'),
(3, 3, 7500000.00, '2024-03-01', '2024-03-08'),
(4, 4, 15000000.00, '2024-04-01', '2024-04-10'),
(5, 5, 12500000.00, '2024-05-01', '2024-05-12');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `produk_id` int NOT NULL,
  `nama_produk` varchar(100) DEFAULT NULL,
  `jenis_produk` enum('tabungan','deposito','kredit') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`produk_id`, `nama_produk`, `jenis_produk`) VALUES
(1, 'Tabungan Berjangka', 'tabungan'),
(2, 'Deposito Plus', 'deposito'),
(3, 'Kredit Mikro', 'kredit'),
(4, 'Tabungan Anak', 'tabungan'),
(5, 'Deposito Premium', 'deposito');

-- --------------------------------------------------------

--
-- Table structure for table `rekening`
--

CREATE TABLE `rekening` (
  `rekening_id` int NOT NULL,
  `nasabah_id` int DEFAULT NULL,
  `nomor_rekening` varchar(20) DEFAULT NULL,
  `saldo` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rekening`
--

INSERT INTO `rekening` (`rekening_id`, `nasabah_id`, `nomor_rekening`, `saldo`) VALUES
(1, 1, '1234567890', 1000000.00),
(2, 2, '0987654321', 2000000.00),
(3, 3, '1122334455', 1500000.00),
(4, 4, '5566778899', 3000000.00),
(5, 5, '9988776655', 2500000.00);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `transaksi_id` int NOT NULL,
  `rekening_id` int DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL,
  `jumlah` decimal(15,2) DEFAULT NULL,
  `tipe_transaksi` enum('debit','kredit') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`transaksi_id`, `rekening_id`, `tanggal_transaksi`, `jumlah`, `tipe_transaksi`) VALUES
(1, 1, '2024-03-01', 500000.00, 'debit'),
(2, 2, '2024-02-05', 1000000.00, 'kredit'),
(3, 3, '2024-03-09', 750000.00, 'debit'),
(4, 4, '2024-04-11', 1500000.00, 'kredit'),
(5, 5, '2024-08-23', 1250000.00, 'debit');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`karyawan_id`);

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`nasabah_id`);

--
-- Indexes for table `nasabah_detail`
--
ALTER TABLE `nasabah_detail`
  ADD PRIMARY KEY (`nasabah_id`);

--
-- Indexes for table `nasabah_produk`
--
ALTER TABLE `nasabah_produk`
  ADD PRIMARY KEY (`nasabah_id`,`produk_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indexes for table `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD PRIMARY KEY (`pinjaman_id`),
  ADD KEY `nasabah_id` (`nasabah_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`produk_id`);

--
-- Indexes for table `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`rekening_id`),
  ADD UNIQUE KEY `nomor_rekening` (`nomor_rekening`),
  ADD KEY `nasabah_id` (`nasabah_id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`transaksi_id`),
  ADD KEY `rekening_id` (`rekening_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `karyawan_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nasabah`
--
ALTER TABLE `nasabah`
  MODIFY `nasabah_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pinjaman`
--
ALTER TABLE `pinjaman`
  MODIFY `pinjaman_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `produk_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rekening`
--
ALTER TABLE `rekening`
  MODIFY `rekening_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `transaksi_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nasabah_detail`
--
ALTER TABLE `nasabah_detail`
  ADD CONSTRAINT `nasabah_detail_ibfk_1` FOREIGN KEY (`nasabah_id`) REFERENCES `nasabah` (`nasabah_id`);

--
-- Constraints for table `nasabah_produk`
--
ALTER TABLE `nasabah_produk`
  ADD CONSTRAINT `nasabah_produk_ibfk_1` FOREIGN KEY (`nasabah_id`) REFERENCES `nasabah` (`nasabah_id`),
  ADD CONSTRAINT `nasabah_produk_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`produk_id`);

--
-- Constraints for table `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD CONSTRAINT `pinjaman_ibfk_1` FOREIGN KEY (`nasabah_id`) REFERENCES `nasabah` (`nasabah_id`);

--
-- Constraints for table `rekening`
--
ALTER TABLE `rekening`
  ADD CONSTRAINT `rekening_ibfk_1` FOREIGN KEY (`nasabah_id`) REFERENCES `nasabah` (`nasabah_id`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`rekening_id`) REFERENCES `rekening` (`rekening_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
