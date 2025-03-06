-- Desactivar las comprobaciones de claves foráneas y ajustes de SQL
SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

USE testdb;

-- Insertar datos en la tabla `suppliers`
INSERT INTO suppliers (name, contact_info) VALUES
('Supplier 1', 'Contact Info 1'),
('Supplier 2', 'Contact Info 2');

-- Insertar datos en la tabla `supplier_city_destination`
INSERT INTO supplier_city_destination (city_name) VALUES
('City 1'),
('City 2');

-- Insertar datos en la tabla `supplier_venue_attraction`
INSERT INTO supplier_venue_attraction (attraction_name) VALUES
('Attraction 1'),
('Attraction 2');

-- Insertar datos en la tabla `product_type`
INSERT INTO product_type (name) VALUES
('Type 1'),
('Type 2');

-- Insertar datos en la tabla `products`
INSERT INTO products (supplier_id, supplier_product_code, short_code, name, product_type_id, short_description, long_description, week_days, reviews_average_rating, fetched_at, updated_at)
VALUES
(1, 'SPC1', 'A12345', 'Product 1', 1, 'Short Description 1', 'Long Description 1', 127, 4.2, '2025-03-05', '2025-03-06'),
(1, 'SPC2', 'B12345', 'Product 2', 1, 'Short Description 2', 'Long Description 2', 127, 4.3, '2025-03-05', '2025-03-06'),
(2, 'SPC3', 'X12345', 'Product 3', 2, 'Short Description 3', 'Long Description 3', 127, 4.1, '2025-03-05', '2025-03-06');

-- Insertar datos en la tabla `product_option`
INSERT INTO product_option (product_id, name, net_rate, recommended_retail_rate, retail_rate)
VALUES
(1, 'Adult', 100.00, 120.00, 130.00),
(2, 'Adult', 200.00, 220.00, 230.00),
(3, 'Child', 50.00, 60.00, 70.00);

-- Insertar datos en la tabla `product_media`
INSERT INTO product_media (product_id, type, url)
VALUES
(1, 'Image', 'http://example.com/image1.jpg'),
(2, 'Image', 'http://example.com/image2.jpg'),
(3, 'Video', 'http://example.com/video1.mp4');

-- Rehabilitar las comprobaciones de claves foráneas
SET foreign_key_checks = 1;