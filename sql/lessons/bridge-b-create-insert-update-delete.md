# Bridge B: Creating tables and changing data

**Date:** 2026-11-20
**Phase:** 1 (SQL), bridge lesson for SQL and Relational Databases 101

## Concepts learned
- DDL changes structure (CREATE TABLE, ALTER TABLE, DROP TABLE); DML changes rows (INSERT, UPDATE, DELETE). SELECT only reads.
- INSERT lists columns then values in the same order; several rows can go in one statement.
- DEFAULT fills a value when a column is left out. NULL means "unknown", not zero.
- UPDATE and DELETE without WHERE affect every row. Always run a SELECT with the same WHERE first and compare the row count.
- A comparison with NULL is never true, so `hours_spent > 1` skips rows with NULL hours.
- Constraints (CHECK, NOT NULL, primary key) reject bad rows, and a rejected statement inserts nothing.
- pgAdmin commits automatically, so changes are permanent; highlight only the statement to run.

## Key syntax
```sql
CREATE TABLE practice.maintenance_jobs (
    job_id INTEGER PRIMARY KEY,
    machine_name VARCHAR(60) NOT NULL,
    hours_spent NUMERIC(5,1) CHECK (hours_spent >= 0),
    status VARCHAR(20) NOT NULL DEFAULT 'Open'
);
INSERT INTO practice.maintenance_jobs (job_id, machine_name) VALUES (1, 'Press 1');
UPDATE practice.maintenance_jobs SET status = 'Closed' WHERE job_id = 1;
DELETE FROM practice.maintenance_jobs WHERE job_id = 1;
ALTER TABLE practice.maintenance_jobs ADD COLUMN technician VARCHAR(40);
```

## Practice work (final versions in /sql/queries/bridge-b-create-insert-update-delete.sql)
1. Created practice.maintenance_jobs with a primary key, NOT NULL columns, a CHECK on hours and a default status.
2. Inserted five jobs using the DEFAULT keyword and a NULL for unknown hours.
3. Ran a SELECT first, then updated jobs with more than 1 hour to Closed (UPDATE 4), then deleted job 103 (DELETE 1).
4. Tried a negative-hours job: rejected by the CHECK constraint (SQL state 23514). Added a technician column; existing rows show NULL.

## Mistakes and what I learned
- Ran the whole script instead of highlighting one statement, so CREATE TABLE failed with "already exists" and the rest did not run.
- Pasted lesson example lines without understanding they were illustrations only (one was a DROP).

## Business use case
Maintaining operational records at work: logging maintenance jobs, correcting records, removing duplicates safely, and relying on constraints to keep data clean.
