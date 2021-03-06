-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2022 at 11:26 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `domitory`
--

-- --------------------------------------------------------

--
-- Table structure for table `managers`
--

CREATE TABLE `managers` (
  `id` int(11) NOT NULL,
  `manager_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `managers`
--

INSERT INTO `managers` (`id`, `manager_name`, `email`, `address`, `phone`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'manager_1', 'm', 'Hà nội', 2982174, '$2b$10$grHnV3tjcgnfyhCjz4gR5OIJnkZddwXlVWbo/0e1s3Fwg4IeUSYGm', '2021-12-13 09:01:38', '2021-12-13 09:01:38'),
(2, 'manager_2', 'manager2@gmail.com', 'Bắc Giang', 334279531, '', '2021-12-13 09:01:38', '2021-12-13 09:01:38');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_create` int(11) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `title`, `content`, `status`, `date_create`, `room_id`, `manager_id`, `user_id`, `createdAt`, `updatedAt`) VALUES
(13, 'hỏng cửa', 'của bị gãy', 'fixed', 1640855511, 1, 1, 24, '2021-12-30 10:11:09', '2022-01-05 03:45:34');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `max_people` int(11) DEFAULT NULL,
  `total_current_people` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `room_amount` double NOT NULL,
  `date_create_bill` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_name`, `max_people`, `total_current_people`, `manager_id`, `room_amount`, `date_create_bill`, `createdAt`, `updatedAt`) VALUES
(1, 'p001', 8, 5, 1, 1500000, 1641293754, '2021-12-13 09:04:22', '2022-01-04 10:55:55'),
(63, 'p002', 5, 0, 1, 1000000, 1638767614, '2022-01-05 05:13:35', '2022-01-05 05:13:35'),
(64, 'p003', 5, 0, 1, 1500000, 1638781631, '2022-01-05 09:07:13', '2022-01-05 09:07:13'),
(65, 'p004', 6, 1, 1, 400000, 1638781779, '2022-01-05 09:09:41', '2022-01-05 09:09:41');

-- --------------------------------------------------------

--
-- Table structure for table `room_bills`
--

CREATE TABLE `room_bills` (
  `id` int(11) NOT NULL,
  `total_price` double NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_create` int(11) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `manager_id` int(11) NOT NULL,
  `total_service` double NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room_bill_details`
--

CREATE TABLE `room_bill_details` (
  `id` int(11) NOT NULL,
  `service_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `number_start` int(11) NOT NULL,
  `number_end` int(11) NOT NULL,
  `amount_used` double NOT NULL,
  `total_price` double NOT NULL,
  `room_bill_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room_equipments`
--

CREATE TABLE `room_equipments` (
  `id` int(11) NOT NULL,
  `room_equipment_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `room_equipments`
--

INSERT INTO `room_equipments` (`id`, `room_equipment_name`, `status`, `room_id`, `createdAt`, `updatedAt`) VALUES
(3, 'điều hòa', 'ok', 1, '2022-01-05 05:44:45', '2022-01-05 05:44:45'),
(5, 'dieu hoa', 'ok', 63, '2022-01-05 07:22:27', '2022-01-05 07:22:27'),
(6, 'nong lanh', 'ok', 1, '2022-01-05 09:30:59', '2022-01-05 09:30:59'),
(7, 'máy giặt', 'ok', 1, '2022-01-05 09:55:52', '2022-01-05 09:55:52'),
(8, 'nong lanh', 'hong', 65, '2022-01-05 10:10:21', '2022-01-05 10:10:21'),
(9, 'may giat', 'ok', 65, '2022-01-05 10:12:13', '2022-01-05 10:12:13'),
(10, 'diẹn', 'k', 63, '2022-01-05 10:13:03', '2022-01-05 10:13:03');

-- --------------------------------------------------------

--
-- Table structure for table `room_equipment_statuses`
--

CREATE TABLE `room_equipment_statuses` (
  `id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `room_equipment_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `service_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `number_start` int(11) NOT NULL,
  `unit_price` double NOT NULL,
  `unit` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_name`, `number_start`, `unit_price`, `unit`, `room_id`, `createdAt`, `updatedAt`) VALUES
(108, 'điện', 0, 4500, 'kw/h', 63, '2022-01-05 05:13:56', '2022-01-05 05:13:56'),
(109, 'nước', 0, 20000, 'đ/m3', 63, '2022-01-05 05:13:56', '2022-01-05 05:13:56'),
(110, 'Internet', 0, 90000, '', 63, '2022-01-05 05:13:56', '2022-01-05 05:13:56'),
(111, 'điện', 0, 5000, 'kw/h', 64, '2022-01-05 09:07:31', '2022-01-05 09:07:31'),
(112, 'nước', 0, 21000, 'đ/m3', 64, '2022-01-05 09:07:31', '2022-01-05 09:07:31'),
(113, 'Internet', 0, 50000, '', 64, '2022-01-05 09:07:31', '2022-01-05 09:07:31'),
(114, 'Vệ sinh', 0, 10000, '', 64, '2022-01-05 09:07:31', '2022-01-05 09:07:31'),
(115, 'điện', 0, 1234, 'kw/h', 65, '2022-01-05 09:09:54', '2022-01-05 09:09:54'),
(116, 'nước', 0, 30000, 'đ/m3', 65, '2022-01-05 09:09:54', '2022-01-05 09:09:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `birth_day` bigint(20) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `id_card` bigint(20) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `registration_date` bigint(20) DEFAULT NULL,
  `expiration_date` bigint(20) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `email`, `birth_day`, `phone`, `id_card`, `address`, `registration_date`, `expiration_date`, `manager_id`, `room_id`, `password`, `createdAt`, `updatedAt`) VALUES
(24, 'nguyenns', 'nguyenns@gmail.com', 91386183, 1639707984443, 12236521, 'bac giang', 1640853710, 1646413200, 1, 1, '$2b$10$fL7Zf0tyaspHTc4J2/opYustQmrXiuIBo95vXUknZnv6On5KgwYuK', '2021-12-30 08:42:08', '2022-01-05 03:30:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `managers`
--
ALTER TABLE `managers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `manager_id` (`manager_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Indexes for table `room_bills`
--
ALTER TABLE `room_bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `table1_id_refs` (`manager_id`);

--
-- Indexes for table `room_bill_details`
--
ALTER TABLE `room_bill_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_bill_id` (`room_bill_id`);

--
-- Indexes for table `room_equipments`
--
ALTER TABLE `room_equipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `room_equipment_statuses`
--
ALTER TABLE `room_equipment_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_equipment_id` (`room_equipment_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manager_id` (`manager_id`),
  ADD KEY `room_id` (`room_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `managers`
--
ALTER TABLE `managers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `room_bills`
--
ALTER TABLE `room_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `room_bill_details`
--
ALTER TABLE `room_bill_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `room_equipments`
--
ALTER TABLE `room_equipments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `room_equipment_statuses`
--
ALTER TABLE `room_equipment_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `room_bills`
--
ALTER TABLE `room_bills`
  ADD CONSTRAINT `room_bills_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `table1_id_refs` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`id`);

--
-- Constraints for table `room_bill_details`
--
ALTER TABLE `room_bill_details`
  ADD CONSTRAINT `room_bill_details_ibfk_1` FOREIGN KEY (`room_bill_id`) REFERENCES `room_bills` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `room_equipments`
--
ALTER TABLE `room_equipments`
  ADD CONSTRAINT `room_equipments_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `room_equipment_statuses`
--
ALTER TABLE `room_equipment_statuses`
  ADD CONSTRAINT `room_equipment_statuses_ibfk_1` FOREIGN KEY (`room_equipment_id`) REFERENCES `room_equipments` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
