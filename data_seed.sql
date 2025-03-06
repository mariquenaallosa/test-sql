-- Desactivar las comprobaciones de claves foráneas y ajustes de SQL
SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

-- Usar la base de datos testdb
USE testdb;

-- Insertar datos en la tabla 'suppliers'
INSERT INTO `suppliers` (`name`, `contact_info`) VALUES
  ('Supplier A', 'contact@supplierA.com'),
  ('Supplier B', 'contact@supplierB.com');

-- Insertar datos en la tabla 'supplier_city_destination'
INSERT INTO `supplier_city_destination` (`city_name`) VALUES
  ('New York'),
  ('Los Angeles');

-- Insertar datos en la tabla 'supplier_venue_attraction'
INSERT INTO `supplier_venue_attraction` (`attraction_name`) VALUES
  ('Central Park'),
  ('Hollywood Walk of Fame');

-- Insertar datos en la tabla 'product_type'
INSERT INTO `product_type` (`name`) VALUES
  ('Tour'),
  ('Ticket');

-- Insertar datos en la tabla 'products'
INSERT INTO `products` (
  `supplier_id`, 
  `supplier_product_code`, 
  `name`, 
  `product_type_id`, 
  `short_description`, 
  `long_description`, 
  `considerations`, 
  `operational_days`, 
  `week_days`, 
  `status`, 
  `created_at`
) VALUES
  (1, 'A123', 'City Tour in New York', 1, 'Short description for NY Tour', 'Long description for NY Tour', 'No special considerations', 'Monday to Friday', 127, 'PUBLISHED', NOW()),
  (2, 'B456', 'Hollywood Movie Tour', 1, 'Short description for Hollywood Tour', 'Long description for Hollywood Tour', 'No special considerations', 'Saturday and Sunday', 63, 'PUBLISHED', NOW());

-- Insertar datos en la tabla 'product_option'
INSERT INTO `product_option` (
  `product_id`, 
  `rate_internal_code`, 
  `rate_internal_type`, 
  `name`, 
  `product`, 
  `type`, 
  `currency`, 
  `net_rate`, 
  `recommended_retail_rate`, 
  `retail_rate`, 
  `preferred`, 
  `created_at`
) VALUES
  (1, 'A123-1', 'Adult', 'Standard Ticket', 'adult', 'DAY-BASED', 'USD', 100.00, 150.00, 150.00, 1, NOW()),
  (2, 'B456-1', 'Adult', 'VIP Ticket', 'adult', 'TIME-BASED', 'USD', 200.00, 250.00, 250.00, 1, NOW());

-- Insertar datos en la tabla 'product_media'
INSERT INTO `product_media` (
  `product_id`, 
  `type`, 
  `url`, 
  `credit_text`, 
  `status`, 
  `created_at`
) VALUES
  (1, 'image', 'https://example.com/ny-tour.jpg', 'Image credit: Photographer A', 'ACTIVE', NOW()),
  (2, 'image', 'https://example.com/hollywood-tour.jpg', 'Image credit: Photographer B', 'ACTIVE', NOW());

-- Rehabilitar las comprobaciones de claves foráneas
SET foreign_key_checks = 1;