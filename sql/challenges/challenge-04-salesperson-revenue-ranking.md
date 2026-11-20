# Challenge 4: Salesperson revenue ranking

**Date:** 2026-11-20
**Phase:** 1 (SQL)
**Skills used:** three-table JOIN, GROUP BY, COUNT(DISTINCT), SUM, ROUND, ORDER BY, LIMIT, WHERE to exclude cancelled orders

## Problem (in my own words)
Rank the top 5 salespeople by revenue, showing full name, job title, number of distinct orders handled, total revenue (quantity * unit_price * (1 - discount)) and average order value. Cancelled orders do not count.

## First attempt
Correct on the first run. Top 5: Megan Fourie (30 orders, 1,658,562.08), Naledi Khuma... (24 orders, 1,354,608.25), Sipho Ndlovu (28, 1,256,945.79), Kagiso Molefe (21, 1,045,995.63), Ruan Botha (11, 598,032.08).

## Feedback
- COUNT(DISTINCT o.order_id) counts each order once; COUNT(*) would count one row per item line and inflate the number (fan-out).
- GROUP BY includes the employee id, both name columns and the job title, so every non-aggregated column is covered.
- avg_order_value repeats the revenue calculation, because an alias cannot be reused inside the same SELECT.
- Checked by hand: revenue / orders matches avg_order_value for every row.
- Cross-check: non-cancelled revenue is 6,247,560.97; total revenue was 6,733,846.33, so the cancelled orders hold 486,285.36.
- Order 1023 (445,710.00) has status Shipped, so it is real revenue, though it deserves a data-quality question.

## Final solution
```sql
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
```

## What I learned
- Joining orders to order_items creates several rows per order, so count orders with COUNT(DISTINCT).
- Rank by revenue and by order size can tell different stories (Ruan Botha has few, large orders).
- Always cross-check a total after a multi-table join and ask whether cancelled orders should count.
- The repeated SUM expression is long; a CTE (Lesson 7) will let me calculate it once.

## Business use case
A sales director's year-end ranking of salespeople, and a base for performance bonuses or target reviews.
