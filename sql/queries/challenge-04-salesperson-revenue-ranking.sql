-- Challenge 4: Salesperson revenue ranking
-- Date: 2026-11-20
-- Purpose: Top 5 salespeople by revenue, excluding cancelled orders

SELECT
    e.first_name || ' ' || e.last_name AS salesperson,
    e.job_title,
    COUNT(DISTINCT o.order_id) AS orders_handled,
    ROUND(SUM(oi.unit_price * oi.quantity * (1 - oi.discount)), 2) AS revenue,
    ROUND(
        SUM(oi.unit_price * oi.quantity * (1 - oi.discount)) / COUNT(DISTINCT o.order_id),
        2
    ) AS avg_order_value
FROM employees AS e
INNER JOIN orders AS o
    ON o.employee_id = e.employee_id
INNER JOIN order_items AS oi
    ON oi.order_id = o.order_id
WHERE o.status <> 'Cancelled'
GROUP BY e.employee_id, e.first_name, e.last_name, e.job_title
ORDER BY revenue DESC
LIMIT 5;

-- Cross-check: total non-cancelled revenue (expected 6247560.97)
SELECT ROUND(SUM(oi.unit_price * oi.quantity * (1 - oi.discount)), 2) AS non_cancelled_revenue
FROM orders AS o
JOIN order_items AS oi ON oi.order_id = o.order_id
WHERE o.status <> 'Cancelled';

-- Data-quality look: the largest order (1023) is Shipped, so it is real revenue
SELECT order_id, status FROM orders WHERE order_id = 1023;