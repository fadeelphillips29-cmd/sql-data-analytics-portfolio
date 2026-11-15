# Bridge A: Constraints and designing tables

**Date:** 2026-11-15
**Phase:** 1 – SQL (certificate preparation)
**Database used:** business_db (reading constraints) and a separate `practice` schema (new tables)

## Concepts learned
- A constraint is a rule the database enforces automatically so bad data cannot get in.
- The five common constraints:
  - `PRIMARY KEY`: unique and never empty; identifies one row.
  - `FOREIGN KEY`: the value must exist as a primary key in another table.
  - `NOT NULL`: the column cannot be empty.
  - `UNIQUE`: no two rows may share the value; it can also cover a combination of columns.
  - `CHECK`: the value must pass a test, e.g. `minutes_lost > 0`.
- Designing tables from a business description:
  1. Things become tables.
  2. Facts become columns.
  3. Every table gets a primary key.
  4. The foreign key goes on the "many" side.
  5. A many-to-many relationship needs a link table.
- Tables that others point to must be created first, because the foreign key checks that the referenced table exists.

## Key syntax
```sql
CREATE TABLE practice.downtime_events (
    event_id     INTEGER PRIMARY KEY,
    machine_id   INTEGER NOT NULL,
    minutes_lost INTEGER NOT NULL CHECK (minutes_lost > 0),
    CONSTRAINT fk_machine FOREIGN KEY (machine_id) REFERENCES practice.machines (machine_id)
);
```

List the constraints in a schema:
```sql
SELECT table_name, constraint_name, constraint_type
FROM information_schema.table_constraints
WHERE table_schema = 'public'
  AND constraint_type IN ('PRIMARY KEY', 'FOREIGN KEY', 'UNIQUE')
ORDER BY table_name, constraint_type;
```

## My practice work and corrections
**Exercise 1: read the rules in business_db**
- `sales_targets` has the only UNIQUE constraint. It covers employee_id plus target_month: one target per employee per month.
- `orders` has two foreign keys: employee_id points to employees, customer_id points to customers.
- I first gave the constraint names without saying how many there were or what they point to; I completed it after feedback.

**Exercise 2: design the machine downtime tables**
- Tables: machines, operators, downtime_events. downtime_events holds the foreign keys machine_id and operator_id (the "many" side).
- After review I added `UNIQUE` on machine_name and a `CHECK` that minutes_lost is greater than 0.
- machines and operators are linked many-to-many through downtime_events.

**Exercise 3: create the tables**
- Created the `practice` schema and the three tables with primary keys, two named foreign keys, NOT NULL columns, UNIQUE and CHECK. Confirmed 6 key constraints with the constraint query.

**Bonus:** downtime_events cannot be created before machines because its foreign key must point at a table that already exists.

## Mistakes I made and what I learned
- I answered only part of a question (named the constraints but not the count or target tables). I now re-read the question and answer every part.
- My first design left out UNIQUE and CHECK rules. I now ask for each column: can a row legitimately exist without it, and can two rows share it?
- Primary key columns are NOT NULL automatically.

## Business use case
Good constraints keep shop-floor and sales data trustworthy: a downtime event cannot be logged for a machine that does not exist, minutes lost cannot be zero or negative, and duplicate machine names are rejected. This is the foundation of any reliable inventory, maintenance or production database.
