-- Lesson: 3 - WHERE, operators, NULL handling and pattern matching
-- Date: 2026-11-13
-- Purpose: Practice filtering rows on business_db with comparison operators, IN, LIKE, BETWEEN and IS NULL


--Which orders were shipped after the date the customer required?

SELECT required_date
FROM orders
WHERE shipped_date > required_date
ORDER BY required_date DESC;

--To list unshipped orders

SELECT order_id, order_date, status 
FROM orders
WHERE shipped_date IS NULL;

--Which products are below their reorder level?

SELECT product_name, reorder_level, units_in_stock
FROM products
WHERE units_in_stock < reorder_level
	AND discontinued = FALSE
ORDER BY units_in_stock;

--EXERCISE 1:List the product_name and unit_price of all products in the category 
--'Spares' that cost more than R1 000, from most to least expensive.

SELECT product_name, unit_price, category
FROM  products
WHERE category = 'Spares'
	AND unit_price > 1000
ORDER BY unit_price DESC;

--Exercise 2: list the company_name and city of customers with no phone number on file.

SELECT company_name, city, phone
FROM customers
WHERE phone IS NULL;

--Exercise 3: list company_name, industry and province of customers in Gauteng or the 
--Western Cape whose name ends with “Group”, sorted by company_name.

SELECT company_name, industry, province
FROM customers
WHERE province IN ('Gauteng', 'Western Cape')
	  AND company_name LIKE '%Group'
ORDER BY company_name;

--orders placed from 1 October to 31 December 2025 that weren’t cancelled, 
--showing order_id, order_date and status

SELECT order_id, order_date, status
FROM orders
	WHERE order_date BETWEEN '2025-10-01' AND '2025-12-31'
	AND status NOT IN ('Cancelled');


