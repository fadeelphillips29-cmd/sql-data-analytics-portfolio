# Lesson 4: Aggregate Functions

**Date:** 2026-11-16
**Phase:** 1 (SQL)

## Concepts learned
- An aggregate function collapses many rows into one answer: COUNT, SUM, AVG, MIN, MAX.
- COUNT(*) counts rows. COUNT(column) counts only rows where that column is NOT NULL. COUNT(DISTINCT column) counts unique values.
- SUM and AVG work on numbers. MIN and MAX work on numbers, text and dates.
- ROUND(value, n) tidies decimals. Use 100.0 (not 100) in percentage maths so PostgreSQL does not do integer division.
- Aggregates are not allowed in WHERE (that is what HAVING is for, Lesson 5).
- Without GROUP BY, I cannot mix an aggregate with a plain column in the same SELECT.

## Key syntax
```sql
SELECT COUNT(*)                 AS total_rows,
       COUNT(DISTINCT customer_id) AS unique_customers,
       ROUND(AVG(unit_price), 2) AS avg_price
FROM products
WHERE discontinued = false;
```
Revenue formula for our database: `quantity * unit_price * (1 - discount)` from order_items.
Downtime % = `100.0 * SUM(downtime_minutes) / SUM(planned_minutes)`.

## Practice work (final corrected versions in /sql/queries/lesson-04-aggregates.sql)
1. Product price statistics: count, min, max, average.
2. Total revenue from order_items = 6,733,846.33.
3. Line A downtime: 18,720 planned minutes, 845 downtime, 4.5%, 20 shifts with a recorded reason.
4. Bonus: first and last order date (2025-01-03 to 2025-12-26) and 33 customers who ordered.

## Mistakes and what I learned
- Looked for revenue in the wrong table and columns. Check which table holds quantity, price and discount before writing the query.
- Put an aggregate and a text column in WHERE. Filtering rows goes in WHERE; filtering on an aggregate result needs HAVING.
- Used MIN/MAX on order_id when the question asked for dates. Use the column that holds the thing being asked about.
- Left a result column without an alias, so it showed as "count". Always name calculated columns.

## Business use case
Operations reports: total revenue for a period, average order value, downtime percentage per production line, and how many customers were active in a year.