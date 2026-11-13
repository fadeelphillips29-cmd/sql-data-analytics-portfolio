-- Lesson: 2 - SELECT, ORDER BY, DISTINCT and LIMIT
-- Date: 2026-11-13
-- Purpose: Practice choosing columns, sorting, calculated columns, DISTINCT and LIMIT on business_db


--Karoo’s stores controller wants to know which items to chase first.

--A query for the products that sell for the most:

SELECT product_name, category, unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 3;

--Which products are below their reorder level, and by how much?

SELECT  product_name,
		units_in_stock,
		reorder_level,
		reorder_level - units_in_stock AS shortfall
FROM products
ORDER BY shortfall DESC;

--This sorts by the alias shortfall, which is allowed in ORDER BY. 
--Products with a positive shortfall are under their reorder level.
--This is the first step of the min-max inventory thinking you’ll use in your IE projects.


--Which provinces do our customers come from?
SELECT DISTINCT province
FROM customers
ORDER BY province;



--Exercise 1: List every product’s product_name, category and unit_price, 
--sorted from the cheapest to the most expensive.

SELECT product_name, category, unit_price
FROM products
ORDER BY unit_price ASC;


--Exercise 2: Find the 5 customers who have been with Karoo the longest. 
--Show company_name, city and customer_since.

SELECT company_name, city, customer_since
FROM customers
ORDER BY customer_since ASC
LIMIT 5;

--Exercise 3: all products with product_name, category and 
--a new column margin_per_unit (unit_price minus unit_cost), 
--sorted from highest to lowest margin, with only the top 3 returned.

SELECT product_name, category, unit_price - unit_cost AS margin_per_unit
FROM products
ORDER BY margin_per_unit DESC
LIMIT 3;

--list each different industry among the customers, once each, in alphabetical order.


SELECT DISTINCT industry
FROM customers
ORDER BY industry ASC;
