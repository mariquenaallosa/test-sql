SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE DATABASE IF NOT EXISTS testdb;
USE testdb;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `supplier_product_code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_code` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_type_id` int(11) NOT NULL DEFAULT 1,
  `short_description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `considerations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operational_days` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `week_days` int(11) DEFAULT 127,
  `open_ticket` tinyint(4) DEFAULT 0,
  `supplier_city_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_city_destination_id` int(11) DEFAULT NULL,
  `supplier_venue_attraction_id` int(11) DEFAULT NULL,
  `fully_refundable` tinyint(4) DEFAULT 0,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_supplier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `languages` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `includes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`includes`)),
  `relevance` int(11) DEFAULT 0,
  `reviews_number` int(11) DEFAULT 0,
  `reviews_average_rating` decimal(3,2) DEFAULT 0.00,
  `reviews_scores` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `safety_information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`safety_information`)),
  `retail_rate_reference_currency` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_rate_reference` decimal(10,2) DEFAULT NULL,
  `retail_rate_reference` decimal(10,2) DEFAULT NULL,
  `admission_schedule_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_point_mandatory` tinyint(4) DEFAULT NULL,
  `supplier_data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'UNPUBLISHED',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `fetched_at` date DEFAULT NULL,
  `to_be_fetched_at` date DEFAULT NULL,
  `availability_mandatory` tinyint(4) DEFAULT 0,
  `meeting_point` varchar(3072) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_tour` tinyint(4) DEFAULT 0,
  `estimated_confirmation_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_product_type_id_FK` (`product_type_id`),
  KEY `products_supplier_id_FK` (`supplier_id`),
  KEY `products_supplier_city_destination_id_FK` (`supplier_city_destination_id`),
  KEY `products_supplier_venue_attraction_id_FK` (`supplier_venue_attraction_id`),
  KEY `products_supplier_product_code_IDX` (`supplier_product_code`),
  KEY `products_relevance_IDX` (`relevance`),
  CONSTRAINT `products_product_type_id_FK` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`),
  CONSTRAINT `products_supplier_city_destination_id_FK` FOREIGN KEY (`supplier_city_destination_id`) REFERENCES `supplier_city_destination` (`id`),
  CONSTRAINT `products_supplier_id_FK` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  CONSTRAINT `products_supplier_venue_attraction_id_FK` FOREIGN KEY (`supplier_venue_attraction_id`) REFERENCES `supplier_venue_attraction` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `product_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `rate_internal_code` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate_internal_type` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_fetched` datetime DEFAULT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'adult, child, infant, 1 person, 5 people, 10 people, full-price, reduced, ...',
  `type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'DAY-BASED, TIME-BASED',
  `language` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `individual` tinyint(4) DEFAULT 1,
  `minimum_buy` int(11) DEFAULT NULL,
  `maximum_buy` int(11) DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_rate` decimal(10,2) DEFAULT 0.00,
  `recommended_retail_rate` decimal(10,2) DEFAULT 0.00,
  `retail_rate` decimal(10,2) DEFAULT 0.00,
  `age_from` int(11) DEFAULT NULL,
  `age_to` int(11) DEFAULT NULL,
  `valid_from` timestamp NULL DEFAULT NULL,
  `valid_to` timestamp NULL DEFAULT NULL,
  `restrictions` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferred` tinyint(1) DEFAULT 0,
  `comments` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_option_product_id_FK` (`product_id`),
  CONSTRAINT `product_option_product_id_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `product_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit_text` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_url` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_description` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_media_product_id_FK` (`product_id`),
  CONSTRAINT `product_media_product_id_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_info` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `supplier_city_destination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `supplier_venue_attraction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attraction_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;