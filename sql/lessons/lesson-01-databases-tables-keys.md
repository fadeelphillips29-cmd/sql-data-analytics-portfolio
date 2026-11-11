# Lesson 1: Databases, tables, keys and relationships

**Date:** 2026-11-11
**Phase:** 1 – SQL
**Database used:** business_db (Karoo Industrial Supplies, PostgreSQL)

## Concepts learned
- A **database** stores related data. A **table** holds one kind of thing. A **row** is one item. A **column** is one fact about every item, with a data type.
- A **primary key (PK)** is a column that is unique for every row and never empty. It identifies one row.
- A **foreign key (FK)** holds the primary key value of a row in *another* table. It is the link between tables.
- Relationships:
  - **One-to-many**: the foreign key sits on the "many" side (one customer, many orders).
  - **Many-to-many**: needs a **link table** holding both keys (orders and products via order_items).
  - **Self-reference**: a table points at itself (employees.manager_id points to employees.employee_id).
- **NULL** means "no value recorded". It is not zero and not blank text.
- A row's meaning comes from its who / what / when columns.

## Key syntax and steps
Look at a table in pgAdmin: Schemas > public > Tables > right-click the table > View/Edit Data > First 100 Rows.

```sql
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'orders'
ORDER BY ordinal_position;
```

Test for a foreign key: *which other table has a primary key that matches this column's values?*

## Key map of business_db
| Table | Primary key | Foreign keys |
|---|---|---|
| employees | employee_id | manager_id -> employees |
| customers | customer_id | none |
| products | product_id | none |
| orders | order_id | customer_id -> customers, employee_id -> employees |
| order_items | order_item_id | order_id -> orders, product_id -> products |
| sales_targets | target_id | employee_id -> employees |
| production_log | log_id | product_id -> products |

## My practice work and corrections
**Exercise 1: keys and row meaning**
- Correct: PK of sales_targets is target_id; PK of production_log is log_id; FK of production_log is product_id; FK of sales_targets is employee_id.
- Corrected: I first named production_date and target_month as foreign keys. They are ordinary data columns because no other table has them as a key.
- Corrected row meanings:
  - sales_targets: one employee's sales target for one month.
  - production_log: one production line's run of one product in one shift on one day (planned time, downtime, units made, defects).

**Exercise 2: tracing a path**
- Product "Float Valve 25 mm" is product_id 16.
- Correct chain: order_items -> orders -> customers (read company_name at the end).
- Connecting pairs: order_items.order_id = orders.order_id, and orders.customer_id = customers.customer_id.
- Link table: order_items, because one order has many products and one product is on many orders.

**Exercise 3: employees**
- Thandi Mokoena (Managing Director) has no manager_id: she is at the top of the hierarchy.
- Direct reports of the Operations Manager (Ayesha Daniels, id 3): Imran Patel, Lerato Mahlangu, Fatima Isaacs. Johan Pretorius and Bongani Zulu report to Imran, so they are one level lower.
- employees to orders is one-to-many: each order has one employee, and one employee handles many orders.

## Mistakes I made and what I learned
- I treated date and month columns as foreign keys. A foreign key must point to another table's primary key.
- I described a row by one column instead of by its who / what / when columns.
- I skipped the orders table in a path, and called a data column (company_name) a connecting column.
- I named a column as the link table. The link table is the table that holds both keys.
- I confused "is the manager" with "reports to the manager", and I picked many-to-many because I did not check where the foreign key sits.
- I wrote a number in quotes ('16') and assumed an ID without checking the products table.

## Business use case
Before answering a business question such as "which customers bought this spare part?", I can trace which tables hold the data and how their keys connect them. This is the first step in writing any join, and it applies to ERP data such as inventory, orders and production records.