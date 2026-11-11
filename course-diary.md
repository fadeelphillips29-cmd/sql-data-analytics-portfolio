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