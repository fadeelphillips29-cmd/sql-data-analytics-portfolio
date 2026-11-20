# Challenge 3: Late deliveries by salesperson

**Date:** 2026-11-20
**Phase:** 1 (SQL)
**Skills used:** WHERE with a column-to-column comparison, GROUP BY, HAVING, COUNT/AVG/MAX, ROUND, ORDER BY with a tie-breaker, NULL behaviour

## Problem (in my own words)
For each salesperson (employee_id), count orders shipped after their required date, excluding cancelled orders, and show the average freight and the most recent order date for those late orders. Keep only employees with 2 or more late orders, sorted from most to fewest late orders.

## First attempt
Correct on the first run. The result was 5 employees: employee 5 with 7 late orders, employee 7 with 6, employee 6 with 5, employee 4 with 4 and employee 9 with 3.

## Feedback
- The column-to-column comparison belongs in WHERE (it filters rows); the count threshold belongs in HAVING (it filters groups).
- Orders with a NULL shipped_date drop out automatically, because NULL compared with a date is never true. I checked that no cancelled order is late (result 0), so the cancelled filter is redundant but harmless and states the intent.
- Sense-check: 7 + 6 + 5 + 4 + 3 = 25 late orders, which is below the 123 shipped orders.
- A count alone is not a fair comparison between people; a late rate (late orders / all their orders) would be better.

## Final solution
```sql
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
```

## What I learned
- Row filters go in WHERE, group filters in HAVING.
- A comparison with NULL is never true, so missing dates exclude rows silently.
- Test whether a filter changes anything by counting what it would catch.
- Counts can mislead; rates compare people fairly.

## Business use case
A sales director reviewing delivery performance by salesperson, and a starting point for an on-time-delivery KPI.
