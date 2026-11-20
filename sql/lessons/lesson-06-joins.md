# Lesson 6: JOINs

**Date:** 2026-11-20
**Phase:** 1 (SQL)

## Concepts learned
- A JOIN matches rows from two tables where a foreign key equals a primary key (orders.customer_id = customers.customer_id).
- Table aliases (c, o, e) shorten queries; columns that exist in both tables must be prefixed or SQL reports them as ambiguous.
- INNER JOIN keeps only matching rows; LEFT JOIN keeps all rows from the left table with NULLs where there is no match; RIGHT is the mirror of LEFT; FULL keeps everything from both.
- Finding "missing" things: LEFT JOIN, then WHERE right_table.key IS NULL.
- A self-join uses the same table twice with two aliases (employee e and manager m).
- Joins combine with GROUP BY, and every non-aggregated column must be in the GROUP BY.
- Always ask what one row of the joined result represents (fan-out can inflate totals).

## Key syntax
```sql
SELECT c.company_name, COUNT(*) AS total_orders
FROM customers AS c
INNER JOIN orders AS o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.company_name;

-- customers with no orders
SELECT c.company_name
FROM customers AS c
LEFT JOIN orders AS o ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL;
```

## Practice work (final versions in /sql/queries/lesson-06-joins.sql)
1. Orders with customer and salesperson names (first 10 orders).
2. Customers who never ordered: 9 customers (42 total, 33 ordered).
3. Employees with their managers via a self-join; one person has no manager, 15 rows in total.
4. Bonus: top 5 customers by revenue across three tables; the grand total of all revenue (6,733,846.33) matches my Lesson 4 total.

## Mistakes and what I learned
- Wrote the table name employee instead of employees, which gave "relation does not exist".
- Used an empty string '' instead of ' ' (a space), so names ran together.
- Swapped the aliases (customers AS o, orders AS c), which gave "column does not exist"; an alias must be used consistently.
- A query can run without errors and still look wrong, so read the output.

## Business use case
Turning ids into readable reports (orders with customer and salesperson names), finding customers or products with no activity, building an organisation chart, and calculating revenue per customer.
