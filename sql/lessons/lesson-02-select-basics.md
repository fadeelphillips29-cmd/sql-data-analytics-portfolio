# Lesson 2: SELECT, ORDER BY, DISTINCT and LIMIT

**Date:** 2026-11-13
**Phase:** 1 – SQL
**Database used:** business_db (Karoo Industrial Supplies, PostgreSQL)

## Concepts learned
- `SELECT` chooses the columns to show and `FROM` chooses the table. `SELECT *` shows every column, which is fine for a first look but not for saved queries.
- `ORDER BY` sorts the result. The default is ascending (`ASC`); `DESC` reverses it. A second column breaks ties.
- `DISTINCT` returns each different value once. With several columns, it removes repeats of the whole combination.
- `LIMIT n` returns only the first n rows. It only means something together with `ORDER BY`.
- `AS` gives a column a new name: `<expression> AS <new_name>`. Read it as "called".
- A column can be a calculation, for example `unit_price - unit_cost`.
- The clauses must be written in this order: SELECT, FROM, ORDER BY, LIMIT.

## Key syntax
```sql
SELECT product_name, unit_price - unit_cost AS margin_per_unit
FROM products
ORDER BY margin_per_unit DESC
LIMIT 3;
```

## My practice work and corrections
**Exercise 1: all products sorted from cheapest to most expensive**
- First attempt used `ORDER BY unit_price DESC`, which put the most expensive product first.
- Corrected to `ASC`. The Float Valve 25 mm (R420) is now first.

**Exercise 2: the 5 longest-standing customers**
- Correct first time: `ORDER BY customer_since ASC LIMIT 5`. The oldest date comes first, so Zambezi Foods (2018-01-03) is first.

**Exercise 3: top 3 products by margin per unit**
- First attempt wrote the alias before `AS`: `margin_per_unit AS unit_price - unit_cost`, which gave a syntax error.
- Corrected to `unit_price - unit_cost AS margin_per_unit`. The top product is the Cooling Tower CT-1000 with a margin of R41 500.

**Bonus: each different industry**
- `SELECT DISTINCT industry FROM customers ORDER BY industry ASC;` returned 10 industries from 42 customers.

## Mistakes I made and what I learned
- I typed `unit_name` instead of `unit_price`. The error "column does not exist" means a spelling mistake in a column name. I now read the error message and the caret (^), and I expand the table in the Object Explorer to check column names.
- I used `DESC` where the question needed ascending order. After running a query, I compare the first rows of the result with the question.
- I put the alias before `AS`. The calculation comes first and the new name second.
- I saved my .sql file in sql/lessons instead of sql/queries. Exercise files belong in sql/queries.

## Business use case
A stores controller can list the most expensive stock items, find products with the biggest margin per unit, or check how far each product is below its reorder level (`reorder_level - units_in_stock AS shortfall`). A sales manager can list a customer's industries or the longest-standing accounts. These are the quick first questions asked of any database.