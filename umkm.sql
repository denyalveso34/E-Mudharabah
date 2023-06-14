-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 14, 2023 at 07:34 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `umkm`
--

-- --------------------------------------------------------

--
-- Table structure for table `kemajuan_usaha_umkm`
--

CREATE TABLE `kemajuan_usaha_umkm` (
  `id` int(11) NOT NULL,
  `umkm_id` int(11) DEFAULT NULL,
  `file_kemajuan_usaha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `konsultan`
--

CREATE TABLE `konsultan` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `telepon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mitra_umkm`
--

CREATE TABLE `mitra_umkm` (
  `id` int(11) NOT NULL,
  `pemodal_id` int(11) DEFAULT NULL,
  `nama_mitra` varchar(255) DEFAULT NULL,
  `riwayat_penjualan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemodal`
--

CREATE TABLE `pemodal` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `telepon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemodalan`
--

CREATE TABLE `pemodalan` (
  `id` int(11) NOT NULL,
  `pemodal_id` int(11) DEFAULT NULL,
  `status` enum('pending','accepted','rejected') DEFAULT NULL,
  `riwayat_mutasi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemodalan_umkm`
--

CREATE TABLE `pemodalan_umkm` (
  `id` int(11) NOT NULL,
  `umkm_id` int(11) DEFAULT NULL,
  `status` enum('pending','accepted','rejected') DEFAULT NULL,
  `riwayat_mutasi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_bisnis_umkm`
--

CREATE TABLE `pengajuan_bisnis_umkm` (
  `id` int(11) NOT NULL,
  `umkm_id` int(11) DEFAULT NULL,
  `file_pengajuan_umkm` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_pemodalan`
--

CREATE TABLE `pengajuan_pemodalan` (
  `id` int(11) NOT NULL,
  `konsultan_id` int(11) DEFAULT NULL,
  `pemodal_id` int(11) DEFAULT NULL,
  `file_pengajuan_pemodalan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_umkm`
--

CREATE TABLE `pengajuan_umkm` (
  `id` int(11) NOT NULL,
  `konsultan_id` int(11) DEFAULT NULL,
  `file_pengajuan_umkm` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `perjanjian_kerjasama`
--

CREATE TABLE `perjanjian_kerjasama` (
  `id` int(11) NOT NULL,
  `konsultan_id` int(11) DEFAULT NULL,
  `umkm_id` int(11) DEFAULT NULL,
  `file_perjanjian` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `umkm_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `umkm_id` int(11) NOT NULL,
  `pemodal_id` int(11) NOT NULL,
  `konsultan_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal_transaksi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `umkm`
--

CREATE TABLE `umkm` (
  `id` int(11) NOT NULL,
  `nama_perusahaan` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `telepon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` enum('pemodal','konsultan','umkm') DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kemajuan_usaha_umkm`
--
ALTER TABLE `kemajuan_usaha_umkm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `umkm_id` (`umkm_id`);

--
-- Indexes for table `konsultan`
--
ALTER TABLE `konsultan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mitra_umkm`
--
ALTER TABLE `mitra_umkm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pemodal_id` (`pemodal_id`);

--
-- Indexes for table `pemodal`
--
ALTER TABLE `pemodal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemodalan`
--
ALTER TABLE `pemodalan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pemodal_id` (`pemodal_id`);

--
-- Indexes for table `pemodalan_umkm`
--
ALTER TABLE `pemodalan_umkm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `umkm_id` (`umkm_id`);

--
-- Indexes for table `pengajuan_bisnis_umkm`
--
ALTER TABLE `pengajuan_bisnis_umkm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `umkm_id` (`umkm_id`);

--
-- Indexes for table `pengajuan_pemodalan`
--
ALTER TABLE `pengajuan_pemodalan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `konsultan_id` (`konsultan_id`),
  ADD KEY `pemodal_id` (`pemodal_id`);

--
-- Indexes for table `pengajuan_umkm`
--
ALTER TABLE `pengajuan_umkm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `konsultan_id` (`konsultan_id`);

--
-- Indexes for table `perjanjian_kerjasama`
--
ALTER TABLE `perjanjian_kerjasama`
  ADD PRIMARY KEY (`id`),
  ADD KEY `konsultan_id` (`konsultan_id`),
  ADD KEY `umkm_id` (`umkm_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `umkm_id` (`umkm_id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `umkm_id` (`umkm_id`),
  ADD KEY `pemodal_id` (`pemodal_id`),
  ADD KEY `konsultan_id` (`konsultan_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indexes for table `umkm`
--
ALTER TABLE `umkm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kemajuan_usaha_umkm`
--
ALTER TABLE `kemajuan_usaha_umkm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `konsultan`
--
ALTER TABLE `konsultan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mitra_umkm`
--
ALTER TABLE `mitra_umkm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pemodal`
--
ALTER TABLE `pemodal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pemodalan`
--
ALTER TABLE `pemodalan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pemodalan_umkm`
--
ALTER TABLE `pemodalan_umkm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengajuan_bisnis_umkm`
--
ALTER TABLE `pengajuan_bisnis_umkm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengajuan_pemodalan`
--
ALTER TABLE `pengajuan_pemodalan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengajuan_umkm`
--
ALTER TABLE `pengajuan_umkm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perjanjian_kerjasama`
--
ALTER TABLE `perjanjian_kerjasama`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `umkm`
--
ALTER TABLE `umkm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kemajuan_usaha_umkm`
--
ALTER TABLE `kemajuan_usaha_umkm`
  ADD CONSTRAINT `kemajuan_usaha_umkm_ibfk_1` FOREIGN KEY (`umkm_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `mitra_umkm`
--
ALTER TABLE `mitra_umkm`
  ADD CONSTRAINT `mitra_umkm_ibfk_1` FOREIGN KEY (`pemodal_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `pemodalan`
--
ALTER TABLE `pemodalan`
  ADD CONSTRAINT `pemodalan_ibfk_1` FOREIGN KEY (`pemodal_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `pemodalan_umkm`
--
ALTER TABLE `pemodalan_umkm`
  ADD CONSTRAINT `pemodalan_umkm_ibfk_1` FOREIGN KEY (`umkm_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `pengajuan_bisnis_umkm`
--
ALTER TABLE `pengajuan_bisnis_umkm`
  ADD CONSTRAINT `pengajuan_bisnis_umkm_ibfk_1` FOREIGN KEY (`umkm_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `pengajuan_pemodalan`
--
ALTER TABLE `pengajuan_pemodalan`
  ADD CONSTRAINT `pengajuan_pemodalan_ibfk_1` FOREIGN KEY (`konsultan_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pengajuan_pemodalan_ibfk_2` FOREIGN KEY (`pemodal_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `pengajuan_umkm`
--
ALTER TABLE `pengajuan_umkm`
  ADD CONSTRAINT `pengajuan_umkm_ibfk_1` FOREIGN KEY (`konsultan_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `perjanjian_kerjasama`
--
ALTER TABLE `perjanjian_kerjasama`
  ADD CONSTRAINT `perjanjian_kerjasama_ibfk_1` FOREIGN KEY (`konsultan_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `perjanjian_kerjasama_ibfk_2` FOREIGN KEY (`umkm_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`umkm_id`) REFERENCES `umkm` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`umkm_id`) REFERENCES `umkm` (`id`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`pemodal_id`) REFERENCES `pemodal` (`id`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`konsultan_id`) REFERENCES `konsultan` (`id`),
  ADD CONSTRAINT `transaksi_ibfk_4` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
