-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2021 at 10:29 AM
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
  `room_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_name`, `max_people`, `total_current_people`, `manager_id`, `room_amount`, `createdAt`, `updatedAt`) VALUES
(1, 'p001', 8, 5, 1, 1, '2021-12-13 09:04:22', '2021-12-17 07:55:51'),
(2, 'p002', 8, 8, 1, 1.2, '2021-12-13 09:04:22', '2021-12-13 09:04:22'),
(3, 'p003', 8, 0, 2, 1.3, '2021-12-13 09:04:22', '2021-12-13 09:04:22'),
(4, 'p003', 5, 0, 1, 2000000.2, '2021-12-17 02:11:45', '2021-12-17 02:11:45'),
(5, 'p004', 6, 6, 1, 10.2, '2021-12-17 02:16:18', '2021-12-17 02:16:18'),
(6, 'p004', 6, 6, 2, 1.2, '2021-12-17 02:16:42', '2021-12-17 02:16:42'),
(7, 'p004', 6, 6, 2, 1000000.2, '2021-12-17 07:25:47', '2021-12-17 07:25:47');

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

--
-- Dumping data for table `room_bills`
--

INSERT INTO `room_bills` (`id`, `total_price`, `status`, `date_create`, `room_id`, `manager_id`, `total_service`, `createdAt`, `updatedAt`) VALUES
(13, 200000, 'paid', 2147483647, 1, 1, 200000, '2021-12-22 10:33:21', '2021-12-22 10:33:21'),
(14, 200000, 'paid', 2147483647, 1, 1, 200000, '2021-12-22 10:43:09', '2021-12-22 10:43:09');

-- --------------------------------------------------------

--
-- Table structure for table `room_bill_details`
--

CREATE TABLE `room_bill_details` (
  `id` int(11) NOT NULL,
  `service_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount_used` double NOT NULL,
  `total_price` double NOT NULL,
  `room_bill_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `room_bill_details`
--

INSERT INTO `room_bill_details` (`id`, `service_name`, `amount_used`, `total_price`, `room_bill_id`, `createdAt`, `updatedAt`) VALUES
(106, 'điệnss', 3, 198000, 13, '2021-12-22 10:33:21', '2021-12-22 10:33:21'),
(107, 'điệnss', 800, 105800, 13, '2021-12-22 10:33:21', '2021-12-22 10:33:21'),
(108, 'điệnss', 3, 198000, 14, '2021-12-22 10:43:09', '2021-12-22 10:43:09'),
(109, 'điệnss', 800, 105800, 14, '2021-12-22 10:43:09', '2021-12-22 10:43:09');

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
(1, 'điều hòa', 'ok', 1, '2021-12-17 04:44:13', '2021-12-17 04:44:13'),
(2, 'Nong lanh', 'ok', 1, '2021-12-17 04:44:13', '2021-12-17 04:44:13');

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
  `unit_price` double NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_name`, `unit_price`, `room_id`, `createdAt`, `updatedAt`) VALUES
(1, 'gửi xe', 20000, 1, '2021-12-16 03:00:06', '2021-12-16 03:00:06'),
(2, 'điện', 4500, 1, '2021-12-16 03:00:06', '2021-12-16 03:00:06'),
(3, 'nước', 30000, 1, '2021-12-16 03:00:40', '2021-12-16 03:00:40');

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
(2, 'bigha', 'sdg@gmail.com', 1639382886, 1534345, 1223584, 'bg', 1639382886, 1639382886, 1, 2, '', '2021-12-13 10:02:06', '2021-12-13 10:02:06'),
(14, 'nguyens', 'nguyenns1@gmail.com', 91386183, 1639707984443, 12236521, 'bac giang', 163970457983, 1639707983, 1, 1, '$2b$10$.9VFjO1QUTosRbGY6JUnw.5v63nyOpu/Vfz9s6ucu7tiA/7xMj1XG', '2021-12-17 09:03:49', '2021-12-17 09:03:49'),
(15, 'nguyens', 'n', 91386183, 1639707984443, 12236521, 'bac giang', 163970457983, 1639707983, 1, 1, '$2b$10$grHnV3tjcgnfyhCjz4gR5OIJnkZddwXlVWbo/0e1s3Fwg4IeUSYGm', '2021-12-20 07:59:06', '2021-12-20 07:59:06'),
(16, 'nguyens', 'nguyenns@gmail.com', 91386183, 1639707984443, 12236521, 'bac giang', 163970457983, 1639707983, 1, 1, '$2b$10$GXqnacJ.ijA/p/UYkK3HguW4g3UWYOG4h6MWBjKPkLYMvwWZjp0i2', '2021-12-22 10:13:07', '2021-12-22 10:13:07');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `room_bills`
--
ALTER TABLE `room_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `room_bill_details`
--
ALTER TABLE `room_bill_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `room_equipments`
--
ALTER TABLE `room_equipments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `room_equipment_statuses`
--
ALTER TABLE `room_equipment_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
