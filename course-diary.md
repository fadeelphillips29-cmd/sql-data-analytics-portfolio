# Course Diary

A running, dated record of what I did in the course after the Step 0 setup.
The setup itself is in [environment-setup-log.md](environment-setup-log.md).

---

## 2026-11-11: Practice database built and loaded

**Phase:** 1 – SQL (preparation, before Lesson 1)

**What I did**
- Downloaded `business_db_setup.sql`, a script that builds a fictional industrial supplier's database (Karoo Industrial Supplies).
- Opened it in the pgAdmin Query Tool on `business_db` and ran it with F5.
- Saved the script and the database README in the `database/` folder of my repository.

**Result**
| Table | Rows |
|---|---|
| employees | 15 |
| customers | 42 |
| products | 26 |
| orders | 130 |
| order_items | 258 |
| sales_targets | 70 |
| production_log | 96 |

All counts matched the README. The query completed in 0.33 seconds with no errors.

**What I learned**
- A `.sql` script can build a whole database in one run: `CREATE TABLE` defines the structure and `INSERT` adds the data.
- The `DROP TABLE IF EXISTS` lines at the top let me re-run the script to reset the database. The "does not exist, skipping" notices on the first run are normal.
- The last query in the script checks the row counts. Checking results against an expected value is a habit I'll use in every lesson.

**Next:** check the certification courses, then Lesson 1 (Databases, tables, keys and relationships).
## 2026-11-11 – Lesson 1: Databases, tables, keys and relationships
- Learned: tables, rows, columns, primary and foreign keys, one-to-many, many-to-many (link table), self-reference, NULL.
- Practice: identified the keys of every table in business_db, traced customers -> orders -> order_items -> products, and explored the employees hierarchy in pgAdmin.
- Struggled with: telling a foreign key from an ordinary column, row meaning, and the direction of one-to-many. All corrected after feedback.
- Files added: sql/lessons/lesson-01-databases-tables-keys.md, sql/queries/lesson-01-exploring-tables.sql.
## 2026-11-13 – Lesson 2: SELECT, ORDER BY, DISTINCT and LIMIT
- Learned: choosing columns, sorting (ASC/DESC), DISTINCT, LIMIT, aliases and calculated columns.
- Practice: wrote my first queries on products and customers in pgAdmin and saved them as an .sql file.
- Struggled with: a column-name typo, sort direction, and the order of an AS alias. All fixed after reading the error messages and AI assistance.
- Files added: sql/lessons/lesson-02-select-basics.md, sql/queries/lesson-02-select-basics.sql.