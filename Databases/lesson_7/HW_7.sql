
-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
 SELECT
	DISTINCT u.id ,
	u.name
FROM
	orders o
INNER JOIN users u ON
	(o.user_id = u.id);
	

-- Выведите список товаров products и разделов catalogs, который соответствует товару
SELECT 
	p.id AS product_id,
	p.name AS product_name,
	c.id AS catalog_id,
	c.name AS catalog_name
FROM
	products AS p
JOIN
	catalogs AS c
ON 
	p.catalog_id = c.id; 
	
