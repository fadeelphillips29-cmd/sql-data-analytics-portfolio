# Lesson 5: GROUP BY and HAVING

**Date:** 2026-11-17
**Phase:** 1 (SQL)

## Concepts learned
- GROUP BY splits rows into groups; the aggregate then runs once per group ("per customer", "per line", "per status").
- Every column in SELECT must be in the GROUP BY or inside an aggregate.
- WHERE filters rows before grouping; HAVING filters groups after aggregation. Aggregates are only allowed in HAVING.
- Order of work: FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY. Because of this, HAVING must repeat the calculation, while ORDER BY can use the alias.
- Group counts should add up to the table's row count; a quick sanity check.
- When values tie in a sort, add a second ORDER BY column so the output is predictable.

## Key syntax
```sql
SELECT status, COUNT(*) AS total_orders
FROM orders
WHERE order_date >= '2025-01-01'     -- filter rows
GROUP BY status
HAVING COUNT(*) >= 5                 -- filter groups
ORDER BY total_orders DESC, status;
```

## Practice work (final versions in /sql/queries/lesson-05-group-by-having.sql)
1. Customers per province: 9 provinces, 42 customers in total (Gauteng 9).
2. Order status summary with 5 or more orders per status: Shipped 123 (avg freight 1371.82), Cancelled 6 (899.18). One status with fewer than 5 orders was removed by HAVING.
3. Downtime by line, above 4%: Line C 6.7%, Line B 5.9%, Line A 4.5%. Used NULLIF to avoid dividing by zero.
4. Bonus: top 5 orders above 50000 revenue; order 1023 is highest at 445,710.00.

## Mistakes and what I learned
- No real errors this lesson. Improvements: add a tie-breaker to ORDER BY; avoid unnecessary ::numeric casts when the column is already numeric.
- HAVING cannot use the alias, so the formula is repeated.

## Business use case
Per-line downtime reports for OEE analysis, order status summaries for operations, and identifying the highest-value orders or customers for account management.