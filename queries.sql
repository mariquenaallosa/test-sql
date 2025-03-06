-- 1. Obtener los valores “id”, "name", "short_description" y "long_description" de los productos 
--    cuyo 'shortCode' sea diferente a 'X12345'.
SELECT id, name, short_description, long_description
FROM products
WHERE short_code <> 'X12345';

-- 2. Obtener la cantidad de productos para el proveedor con `supplier_id` igual a 1
--    que hayan sido actualizados el día de hoy.
SELECT COUNT(*)
FROM products
WHERE supplier_id = 1
  AND DATE(updated_at) = CURDATE();

-- 3. Obtener los valores únicos de "duration" de los productos cuya calificación promedio de reseñas
--    esté entre 4.0 y 4.5, y que tengan al menos una opción de producto con el nombre 'Adult'.
SELECT DISTINCT p.duration
FROM products p
JOIN product_option po ON p.id = po.product_id
WHERE p.reviews_average_rating BETWEEN 4.0 AND 4.5
  AND po.name = 'Adult';

-- 4. Obtener la última fecha en la que se actualizó la información de los productos de cada proveedor
--    usando el campo `fetched_at` para determinar la última actualización de cada proveedor.
SELECT supplier_id, MAX(fetched_at) AS last_fetched_at
FROM products
GROUP BY supplier_id;