-- Challenge 3: Late deliveries by salesperson
-- Date: 2026-11-20
-- Purpose: Count late-shipped orders per employee (2 or more), excluding cancelled

SELECT employee_id,
       COUNT(*) AS late_orders,
       ROUND(AVG(freight), 2) AS avg_freight,
       MAX(order_date) AS latest_order
FROM orders
WHERE shipped_date > required_date
  AND status <> 'Cancelled'
GROUP BY employee_id
HAVING COUNT(*) >= 2
ORDER BY late_orders DESC, employee_id ASC;

-- Check: are any cancelled orders late? (0 = the cancelled filter is redundant but harmless)
SELECT COUNT(*) FROM orders
WHERE status = 'Cancelled' AND shipped_date > required_date;
