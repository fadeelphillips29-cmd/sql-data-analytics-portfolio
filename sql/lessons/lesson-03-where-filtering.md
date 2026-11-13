# Lesson 3: WHERE, operators, NULL handling and pattern matching

**Date:** 2026-11-13
**Phase:** 1 – SQL
**Database used:** business_db (Karoo Industrial Supplies, PostgreSQL)

## Concepts learned
- `WHERE` keeps only the rows that meet a condition. Clause order is now SELECT, FROM, WHERE, ORDER BY, LIMIT.
- Comparison operators: `=`, `<>`, `<`, `>`, `<=`, `>=`.
- Text and dates go in single quotes and text is case sensitive ('Spares' is not 'spares'). Numbers have no quotes.
- `AND`, `OR`, `NOT` combine conditions. AND is evaluated before OR, so I use brackets or `IN` when mixing them.
- `BETWEEN` is inclusive of both ends. `IN (...)` tests against a list.
- `LIKE` uses `%` (any characters) and `_` (one character) and is case sensitive.
- NULL means "no value recorded". I test it with `IS NULL` / `IS NOT NULL`, never `= NULL`.
- A column alias cannot be used in WHERE because the filter runs before SELECT.

## Key syntax
```sql
SELECT company_name, industry, province
FROM customers
WHERE province IN ('Gauteng', 'Western Cape')
  AND company_name LIKE '%Group'
ORDER BY company_name;
```

## My practice work and corrections
**Exercise 1: Spares products over R1 000, most expensive first**
- First attempt: `WHERE category IN spares > 1000 ORDER BY spares ASC`, which gave a syntax error.
- Corrected: `category = 'Spares' AND unit_price > 1000 ORDER BY unit_price DESC`. Second attempt had the right filter but `ASC`; fixed to `DESC`.

**Exercise 2: customers with no phone number**
- Correct first time: `WHERE phone IS NULL`. 4 customers returned.

**Exercise 3: Gauteng or Western Cape customers whose name ends in "Group"**
- First attempt: `province = 'Gauteng' OR province = 'Western Cape' AND company_name LIKE '%Group'` returned all 9 Gauteng customers because AND is evaluated first. It also left out `industry`.
- Corrected with `province IN ('Gauteng', 'Western Cape')`. Result: 2 rows (Drakensberg Retail Group, Marula Retail Group).

**Bonus: orders from Q4 2025 that were not cancelled**
- First attempt used `NOT IN ('cancelled')`, which removed nothing (38 rows) because the data has 'Cancelled'.
- Corrected to match the capital C. Result: 36 rows.

## Mistakes I made and what I learned
- I wrote a text value without quotes and mixed up `IN` and `=`. Text needs single quotes, and a single value needs `=`.
- I used `ASC` when the question said "most to least expensive" (same slip as Lesson 2). I now underline the sort word in the question first.
- I mixed AND and OR without brackets. AND goes first, so the filter did not mean what I intended. I use `IN` or brackets.
- I filtered on `'cancelled'` when the data has `'Cancelled'`. The query ran with no error but removed nothing, so I now scan the result for what I meant to exclude.
- I left a requested column (industry) out of the SELECT. I now tick off each column from the question.

## Business use case
Filtering is how any report is narrowed to the rows that matter: late deliveries (`shipped_date > required_date`), unshipped orders (`shipped_date IS NULL`), stock below reorder level (`units_in_stock < reorder_level`), or customers in certain regions with missing contact data.