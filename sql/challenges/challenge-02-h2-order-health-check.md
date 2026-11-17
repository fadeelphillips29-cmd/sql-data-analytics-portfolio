# Challenge 2: Second-half order performance

**Date:** 2026-11-17
**Phase:** 1 (SQL)
**Skills used:** COUNT(*) vs COUNT(column), ROUND, AVG, MAX, SUM, BETWEEN, NULL behaviour, percentage with 100.0

## Problem (in my own words)
One-row health check of orders placed 1 July to 31 December 2025, excluding cancelled orders: total orders, shipped, not yet shipped, shipped percentage, average, maximum and total freight.

## First attempt
Logic was right but the query failed with a syntax error: a trailing comma after the last column (`total_freight,`) made PostgreSQL expect another column before FROM. I also named one column `average_freight` instead of the requested `avg_freight`.

## Feedback
- Correct idea: COUNT(*) - COUNT(shipped_date) gives the unshipped orders because COUNT(column) skips NULLs.
- Sense-check: shipped + not shipped = total; percentage between 0 and 100.
- Result: 59 / 58 / 1 / 98.3 / 1352.41 / 2465.48 / 79792.41.

## Improved solution
```sql
SELECT COUNT(*) AS total_orders,
       COUNT(shipped_date) AS shipped_orders,
       COUNT(*) - COUNT(shipped_date) AS not_yet_shipped,
       ROUND(100.0 * COUNT(shipped_date) / COUNT(*), 1) AS shipped_pct,
       ROUND(AVG(freight), 2) AS avg_freight,
       MAX(freight) AS max_freight,
       ROUND(SUM(freight), 2) AS total_freight
FROM orders
WHERE order_date BETWEEN '2025-07-01' AND '2025-12-31'
  AND status <> 'Cancelled';
```

## What I learned
- The last column in a SELECT list never gets a comma.
- Use the exact column names a request asks for.
- COUNT(*) counts rows; COUNT(column) counts non-NULL values, which is a quick way to count "missing" values.
- Write the percentage as 100.0 * part / whole.

## Business use case
A weekly order-fulfilment summary for an operations manager: how many orders are shipped, what is outstanding, and how much freight costs.
