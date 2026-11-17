-- Challenge 2: Second-half order performance
-- Date: 2026-11-17
-- Purpose: One-row health check of non-cancelled orders, Jul-Dec 2025

SELECT 
	COUNT (*) AS total_orders,
	COUNT(shipped_date) AS shipped_orders,
	COUNT(*) - COUNT(shipped_date) AS not_yet_shipped,
	ROUND(COUNT(shipped_date)*100.0 / COUNT(*), 1) AS shipped_pct,
	ROUND(AVG(freight), 2) AS avg_freight,
	MAX(freight) AS max_freight,
	ROUND(SUM(freight), 2) AS total_freight
FROM orders
WHERE order_date BETWEEN '2025-07-01' AND '2025-12-31'
AND status <> 'Cancelled';

