-- Bridge B: CREATE, INSERT, UPDATE, DELETE, ALTER
-- Date: 2026-11-20
-- Purpose: Build and change data in the practice schema (not the public tables)

-- 1. Create the table
CREATE TABLE practice.maintenance_jobs (
    job_id       INTEGER PRIMARY KEY,
    machine_name VARCHAR(60) NOT NULL,
    job_type     VARCHAR(30) NOT NULL,
    hours_spent  NUMERIC(5,1) CHECK (hours_spent >= 0),
    status       VARCHAR(20) NOT NULL DEFAULT 'Open'
);

-- 2. Insert jobs (DEFAULT uses the column default; NULL = unknown hours)
INSERT INTO practice.maintenance_jobs (job_id, machine_name, job_type, hours_spent, status)
VALUES
    (101, 'CNC Mill Alpha', 'Repair', 4.5, 'In Progress'),
    (102, 'Hydraulic Press B2', 'Lubrication', 0.5, DEFAULT),
    (103, 'Conveyor Belt North', 'Inspection', NULL, DEFAULT),
    (104, 'Packaging Robot X1', 'Calibration', 2.0, 'Open'),
    (105, 'Air Compressor Main', 'Filter Replacement', 1.2, DEFAULT);

-- 3a. Check first, then update
SELECT * FROM practice.maintenance_jobs WHERE hours_spent > 1;
UPDATE practice.maintenance_jobs SET status = 'Closed' WHERE hours_spent > 1;

-- 3b. Check first, then delete
SELECT * FROM practice.maintenance_jobs WHERE job_id = 103;
DELETE FROM practice.maintenance_jobs WHERE job_id = 103;

-- 4. Constraint test (this INSERT is expected to FAIL: CHECK hours_spent >= 0)
-- INSERT INTO practice.maintenance_jobs (job_id, machine_name, job_type, hours_spent)
-- VALUES (106, 'Test Machine', 'Inspection', -2);

-- 5. Add a column
ALTER TABLE practice.maintenance_jobs ADD COLUMN technician VARCHAR(40);
SELECT * FROM practice.maintenance_jobs ORDER BY job_id;
