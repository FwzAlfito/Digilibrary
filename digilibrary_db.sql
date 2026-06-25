-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2026 at 08:40 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digilibrary_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) UNSIGNED NOT NULL,
  `book_code` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(100) NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL,
  `stock` int(4) NOT NULL,
  `cover_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `book_code`, `title`, `author`, `category_id`, `stock`, `cover_url`) VALUES
(2, 'BK-001', 'Laskar Pelangi', 'Andrea Hirata', 1, 9, 'https://m.media-amazon.com/images/S/compressed.photo.goodreads.com/books/1489732961i/1362193.jpg'),
(3, 'BK-002', 'Si Juki: Lika-Liku Anak Kos', 'Faza Ibnu Ubaidillah', 2, 0, 'https://perpustakaan.jakarta.go.id/catalog-dispusip/uploaded_files/sampul_koleksi/original/Monograf/89647.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `borrowings`
--

CREATE TABLE `borrowings` (
  `id` int(11) UNSIGNED NOT NULL,
  `loan_code` varchar(50) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `book_id` int(11) UNSIGNED NOT NULL,
  `loan_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `status` enum('Dipinjam','Dikembalikan') NOT NULL DEFAULT 'Dipinjam',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrowings`
--

INSERT INTO `borrowings` (`id`, `loan_code`, `user_id`, `book_id`, `loan_date`, `due_date`, `return_date`, `status`, `created_at`, `updated_at`) VALUES
(26, 'PJ-20260620-D7E3', 2, 2, '2026-05-20', '2026-06-27', '2026-06-20', 'Dikembalikan', '2026-06-20 08:25:38', '2026-06-20 08:26:08'),
(27, 'PJ-20260620-C4BE', 3, 2, '2026-06-20', '2026-06-27', '2026-06-20', 'Dikembalikan', '2026-06-20 08:48:04', '2026-06-20 08:48:49'),
(28, 'PJ-20260623-0F83', 2, 3, '2026-06-23', '2026-06-30', '2026-06-23', 'Dikembalikan', '2026-06-23 14:47:26', '2026-06-23 14:47:50'),
(29, 'PJ-20260623-9412', 2, 2, '2026-06-23', '2026-06-30', NULL, 'Dipinjam', '2026-06-23 14:50:18', '2026-06-23 14:50:18');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`) VALUES
(1, 'Fiksi'),
(2, 'Komik');

-- --------------------------------------------------------

--
-- Table structure for table `fine_rules`
--

CREATE TABLE `fine_rules` (
  `id` int(11) UNSIGNED NOT NULL,
  `loan_code` varchar(50) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `fine_per_day` int(11) NOT NULL,
  `amount` int(255) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Belum Dibayar',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fine_rules`
--

INSERT INTO `fine_rules` (`id`, `loan_code`, `full_name`, `fine_per_day`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(6, 'PJ-20260620-D7E3', 'Rehan Abdi Nugroho', 1000, 24000, 'Lunas', '2026-06-20 08:26:08', '2026-06-20 08:35:37');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(13, '2026-06-13-083020', 'App\\Database\\Migrations\\Users', 'default', 'App', 1781436830, 1),
(14, '2026-06-13-083027', 'App\\Database\\Migrations\\Categories', 'default', 'App', 1781436830, 1),
(15, '2026-06-13-083310', 'App\\Database\\Migrations\\Books', 'default', 'App', 1781436830, 1),
(16, '2026-06-13-083316', 'App\\Database\\Migrations\\FineRules', 'default', 'App', 1781436830, 1),
(17, '2026-06-13-083320', 'App\\Database\\Migrations\\Borrowings', 'default', 'App', 1781436830, 1),
(19, '2026-06-13-163238', 'App\\Database\\Migrations\\CreateLoansTable', 'default', 'App', 1781436830, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','member') NOT NULL DEFAULT 'member',
  `member_code` varchar(50) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `member_code`, `full_name`, `gender`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin1@digilibrary.local', '$2y$10$Nu35w4pteLfc7BDCIkDPkecjw8wsH8Y2GMfIewUbXLT7zzW6WOxwq', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'rehan1', 'rehan123@gmail.com', '$2y$10$NRwk1zv95PUv0vu5bdnz0.rDpJNnnrKtL7zI9BBP7j.pBaJM0pBHa', 'member', 'AG-001', 'Rehan Abdi Nugroho', 'Laki-laki', '08781231323', 'Kilo ', NULL, NULL),
(3, 'eben1', 'eben123@gmail.com', '$2y$10$bnuqqTD6rMwyku9Uth1ccOnyrJtKP.TcbqH7hX9uNomSuF6NDK/OW', 'member', 'AG-002', 'Enrico Eben', 'Laki-laki', '0978123712', 'Manggar', NULL, NULL),
(6, 'Fito', 'fitoo12@gmail.com', '$2y$10$3ORE9O3kmpNHuNHN86dv9eUCCn.9lU4phhi.H.1uo.CMwaJIerE02', 'member', 'AG-003', 'Fito', 'Laki-laki', '0827371231', 'Lamaru', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `book_code` (`book_code`),
  ADD KEY `books_category_id_foreign` (`category_id`);

--
-- Indexes for table `borrowings`
--
ALTER TABLE `borrowings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loans_book_id_foreign` (`book_id`),
  ADD KEY `loans_member_id_foreign` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fine_rules`
--
ALTER TABLE `fine_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `borrowings`
--
ALTER TABLE `borrowings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fine_rules`
--
ALTER TABLE `fine_rules`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `borrowings`
--
ALTER TABLE `borrowings`
  ADD CONSTRAINT `loans_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `loans_member_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
