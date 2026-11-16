-- Lesson 4: Aggregate Functions
-- Date: 2026-11-16
-- Purpose: COUNT, SUM, AVG, MIN, MAX, ROUND on business_db

-- 1. Product price statistics
-- 2. Total revenue
SELECT ROUND(SUM(quantity * unit_price * (1 - discount)), 2) AS total_revenue
FROM order_items;

-- 3. Line A downtime
SELECT SUM(planned_minutes) AS planned,
       SUM(downtime_minutes) AS downtime,
       ROUND(100.0 * SUM(downtime_minutes) / SUM(planned_minutes), 1) AS downtime_pct,
       COUNT(downtime_reason) AS shifts_with_reason
FROM production_log
WHERE line_name = 'Line A';

-- 4. Bonus: first/last order and customers who ordered
SELECT MIN(order_date) AS first_order,
       MAX(order_date) AS last_order,
       COUNT(DISTINCT customer_id) AS customers_who_ordered
FROM orders;
