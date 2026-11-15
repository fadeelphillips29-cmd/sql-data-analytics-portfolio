-- Lesson: Bridge A - Constraints and designing tables
-- Date: 2026-11-15
-- Purpose: Read the constraints in business_db and build machine downtime tables with constraints in a separate practice schema

-- Exercise 1: list the keys and unique rules in business_db
SELECT table_name, constraint_name, constraint_type
FROM information_schema.table_constraints
WHERE table_schema = 'public'
  AND constraint_type IN ('PRIMARY KEY', 'FOREIGN KEY', 'UNIQUE')
ORDER BY table_name, constraint_type;

-- Exercise 3: create the schema (run once only)
CREATE SCHEMA practice;

-- Tables that are pointed to are created first
CREATE TABLE practice.machines (
    machine_id   INTEGER PRIMARY KEY,
    machine_name VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE practice.operators (
    operator_id   INTEGER PRIMARY KEY,
    operator_name VARCHAR(60) NOT NULL
);

-- The table with the foreign keys is created last
CREATE TABLE practice.downtime_events (
    event_id     INTEGER PRIMARY KEY,
    machine_id   INTEGER NOT NULL,
    operator_id  INTEGER NOT NULL,
    start_time   TIMESTAMP NOT NULL,
    minutes_lost INTEGER NOT NULL CHECK (minutes_lost > 0),
    reason       VARCHAR(60) NOT NULL,
    CONSTRAINT fk_machine  FOREIGN KEY (machine_id)  REFERENCES practice.machines (machine_id),
    CONSTRAINT fk_operator FOREIGN KEY (operator_id) REFERENCES practice.operators (operator_id)
);

-- Check: keys and unique rules in the practice schema (expect 6 rows)
SELECT table_name, constraint_name, constraint_type
FROM information_schema.table_constraints
WHERE table_schema = 'practice'
  AND constraint_type IN ('PRIMARY KEY', 'FOREIGN KEY', 'UNIQUE')
ORDER BY table_name, constraint_type;
