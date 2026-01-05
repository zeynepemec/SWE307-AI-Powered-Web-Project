-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 05 Oca 2026, 03:56:19
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `bebek_takip_sistemi`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `nutrition_logs`
--

CREATE TABLE `nutrition_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `food_type` varchar(50) NOT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `entry_time` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `nutrition_logs`
--

INSERT INTO `nutrition_logs` (`id`, `user_id`, `food_type`, `amount`, `note`, `entry_time`) VALUES
(2, 1, 'Anne Sütü', '150', '.', '2025-12-26 02:49:00'),
(3, 1, 'Anne Sütü', '150', '.', '2025-12-26 02:50:33'),
(4, 1, 'Anne Sütü', '150', '.', '2025-12-26 02:52:22'),
(6, 9, 'Su', '120', '', '2026-01-01 23:35:10');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tahmin_rehberi`
--

CREATE TABLE `tahmin_rehberi` (
  `id` int(11) NOT NULL,
  `min_ay` int(11) DEFAULT NULL,
  `max_ay` int(11) DEFAULT NULL,
  `min_ates` decimal(3,1) DEFAULT NULL,
  `max_ates` decimal(3,1) DEFAULT NULL,
  `durum_adi` varchar(100) DEFAULT NULL,
  `tavsiye_notu` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `tahmin_rehberi`
--

INSERT INTO `tahmin_rehberi` (`id`, `min_ay`, `max_ay`, `min_ates`, `max_ates`, `durum_adi`, `tavsiye_notu`) VALUES
(3, 0, 36, 38.5, 41.0, 'Yüksek Ateş (Kritik)', 'Ateş seviyesi tehlikeli sınırda! Lütfen vakit kaybetmeden bir çocuk doktoruna danışın.');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `parent_firstname` varchar(50) NOT NULL,
  `parent_lastname` varchar(50) NOT NULL,
  `parent_email` varchar(100) NOT NULL,
  `parent_birthdate` date DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `baby_name` varchar(50) NOT NULL,
  `baby_gender` enum('Kız','Erkek') NOT NULL,
  `baby_birthdate` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `parent_firstname`, `parent_lastname`, `parent_email`, `parent_birthdate`, `password`, `baby_name`, `baby_gender`, `baby_birthdate`, `created_at`) VALUES
(1, 'Zeynep', 'Emeç', 'zeynepemec7@gmail.com', NULL, '$2y$10$iOPDk2yn7HFLb8Wrzqe6Bez5lcY7c8aAUJWlDhfuclXGUbbZ1p6wm', 'Ece', 'Kız', '2004-06-08', '2025-12-24 19:55:28'),
(9, 'fatma', 'emeç', 'fatma@gmail.com', '1981-07-15', '$2y$10$2jXLFQVShENJRMPvcV1Dluyj.qVlHIRkVn//.fR0FlxP29WgWQ16.', 'Zeynep', 'Kız', '0200-11-16', '2026-01-01 20:34:14');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vaccine_status`
--

CREATE TABLE `vaccine_status` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vaccine_name` varchar(100) NOT NULL,
  `is_done` tinyint(1) DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `vaccine_status`
--

INSERT INTO `vaccine_status` (`id`, `user_id`, `vaccine_name`, `is_done`, `updated_at`) VALUES
(1, 1, 'Hepatit B (1. Doz)', 1, '2025-12-24 20:01:01'),
(2, 1, 'Hepatit B (2. Doz)', 1, '2025-12-24 22:53:01'),
(3, 1, 'BCG, Karma Aşı, KPA', 1, '2025-12-25 08:47:05'),
(4, 1, 'Karma Aşı 2, KPA 2', 1, '2025-12-31 12:14:27'),
(5, 1, 'Hepatit B 3, Karma 3, OPA', 0, '2025-12-25 20:58:56'),
(6, 1, 'KPA Pekiştirme', 0, '2025-12-25 20:58:56'),
(7, 1, 'Hepatit A (2. Doz)', 0, '2025-12-24 22:53:04'),
(8, 1, 'KKK, Su Çiçeği', 0, '2025-12-25 20:58:53'),
(11, 9, 'Hepatit B (2. Doz)', 1, '2026-01-01 20:34:56'),
(12, 9, 'Hepatit B (1. Doz)', 1, '2026-01-01 20:34:58');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `nutrition_logs`
--
ALTER TABLE `nutrition_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Tablo için indeksler `tahmin_rehberi`
--
ALTER TABLE `tahmin_rehberi`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parent_email` (`parent_email`);

--
-- Tablo için indeksler `vaccine_status`
--
ALTER TABLE `vaccine_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `nutrition_logs`
--
ALTER TABLE `nutrition_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `tahmin_rehberi`
--
ALTER TABLE `tahmin_rehberi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `vaccine_status`
--
ALTER TABLE `vaccine_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `nutrition_logs`
--
ALTER TABLE `nutrition_logs`
  ADD CONSTRAINT `nutrition_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `vaccine_status`
--
ALTER TABLE `vaccine_status`
  ADD CONSTRAINT `vaccine_status_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
