-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2021 at 11:40 AM
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
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `managers`
--

INSERT INTO `managers` (`id`, `manager_name`, `email`, `address`, `phone`, `createdAt`, `updatedAt`) VALUES
(1, 'manager_1', 'manager1@gmail.com', 'Hà nội', 2982174, '2021-12-13 09:01:38', '2021-12-13 09:01:38'),
(2, 'manager_2', 'manager2@gmail.com', 'Bắc Giang', 334279531, '2021-12-13 09:01:38', '2021-12-13 09:01:38');

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

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `title`, `content`, `status`, `room_id`, `manager_id`, `user_id`, `createdAt`, `updatedAt`) VALUES
(1, 'hỏng cửa', 'cửa bị hỏng ', 'not_fix', 1, 1, 1, '2021-12-13 09:12:15', '2021-12-13 09:12:15'),
(2, 'điều hòa hỏng', 'điều hòa k chạy,tự tắt', 'fixing', 2, 1, 1, '2021-12-13 09:12:15', '2021-12-13 09:12:15');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_people` int(11) DEFAULT NULL,
  `total_current_people` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_name`, `status`, `max_people`, `total_current_people`, `manager_id`, `createdAt`, `updatedAt`) VALUES
(1, 'p001', 'missing', 6, 5, 1, '2021-12-13 09:04:22', '2021-12-13 09:04:22'),
(2, 'p002', 'full', 8, 8, 1, '2021-12-13 09:04:22', '2021-12-13 09:04:22');

-- --------------------------------------------------------

--
-- Table structure for table `room_bills`
--

CREATE TABLE `room_bills` (
  `id` int(11) NOT NULL,
  `total_price` double NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `room_id` int(11) DEFAULT NULL,
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
  `room_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `birth_day` int(11) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `id_card` int(11) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `registration_date` int(11) DEFAULT NULL,
  `expiration_date` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `email`, `birth_day`, `phone`, `id_card`, `address`, `status`, `registration_date`, `expiration_date`, `manager_id`, `room_id`, `createdAt`, `updatedAt`) VALUES
(1, 'user_1', 'user1@gmail.com', 1639382886, 2982174, 12283569, 'Hà nội', '', 1639382886, 1639382886, 1, 1, '2021-12-13 09:07:19', '2021-12-13 09:07:19'),
(2, 'bigha', 'sdg@gmail.com', 1639382886, 1534345, 1223584, 'bg', '', 1639382886, 1639382886, 1, 2, '2021-12-13 10:02:06', '2021-12-13 10:02:06'),
(3, 'dfhdxfh', 'trhtrh@nggg', 1639382886, 1639382886, 1639382886, 'fdhdf', '', 1639382886, 1639382886, 2, 1, '2021-12-13 10:02:06', '2021-12-13 10:02:06'),
(4, 'dfhdxfh', 'fddffdfd@nggg', 1639382886, 1639382886, 1639382886, 'fdhdf', '', 1639382886, 1639382886, 2, 2, '2021-12-13 10:02:06', '2021-12-13 10:02:06');

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
  ADD KEY `room_id` (`room_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `room_bills`
--
ALTER TABLE `room_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room_bill_details`
--
ALTER TABLE `room_bill_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room_equipments`
--
ALTER TABLE `room_equipments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room_equipment_statuses`
--
ALTER TABLE `room_equipment_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  ADD CONSTRAINT `room_bills_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

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
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
