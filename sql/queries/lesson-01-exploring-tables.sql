-- Lesson: 1 - Databases, tables, keys and relationships
-- Date: 2026-11-11
-- Purpose: Explore the business_db tables and check which line items sold Float Valve 25 mm

-- 1. Find the product_id by name instead of assuming it
SELECT product_id, product_name
FROM products
WHERE product_name = 'Float Valve 25 mm';

-- 2. Line items that sold that product (product_id 16, no quotes around a number)
SELECT *
FROM order_items
WHERE product_id = 16;

-- 3. Look at the employees and their managers (NULL manager_id = top of hierarchy)
SELECT employee_id, first_name, last_name, job_title, manager_id
FROM employees;

-- 4. Column names, types and NULL rules for one table
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'orders'
ORDER BY ordinal_position;