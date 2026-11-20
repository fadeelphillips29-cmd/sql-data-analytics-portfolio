-- Lesson 5: GROUP BY and HAVING
-- Date: 2026-11-17
-- Purpose: Per-group summaries and filtering groups with HAVING on business_db

-- 1. Customers per province
SELECT province, COUNT(*) AS total_customers
FROM customers
GROUP BY province
ORDER BY total_customers DESC, province;

-- 2. Order status summary (statuses with 5+ orders)
SELECT status,
       COUNT(*) AS total_orders,
       ROUND(AVG(freight), 2) AS avg_freight
FROM orders
GROUP BY status
HAVING COUNT(*) >= 5
ORDER BY total_orders DESC;

-- 3. Downtime by line, lines above 4%
SELECT line_name,
       SUM(planned_minutes) AS total_planned_minutes,
       SUM(downtime_minutes) AS total_downtime_minutes,
       ROUND(100.0 * SUM(downtime_minutes) / NULLIF(SUM(planned_minutes), 0), 1) AS downtime_pct
FROM production_log
GROUP BY line_name
HAVING 100.0 * SUM(downtime_minutes) / NULLIF(SUM(planned_minutes), 0) > 4
ORDER BY downtime_pct DESC;

-- 4. Bonus: top 5 orders above 50000 revenue
SELECT order_id,
       ROUND(SUM(quantity * unit_price * (1 - COALESCE(discount, 0))), 2) AS order_revenue
FROM order_items
GROUP BY order_id
HAVING SUM(quantity * unit_price * (1 - COALESCE(discount, 0))) > 50000
ORDER BY order_revenue DESC
LIMIT 5;
