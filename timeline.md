# Learning Timeline

| Date | Phase | Topic | Status | Key takeaway |
|---|---|---|---|---|
| 2026-11-10 | 0 – Setup | Environment setup: PostgreSQL, Python, Excel/Power BI, Git/GitHub | Complete | Every tool was tested end to end, and an error that says "password authentication failed" proves the software works and only the credentials are wrong. |
| 2026-11-11 | 1 – SQL | Practice database built and loaded (7 tables, 637 rows) | Complete | A setup script rebuilds the whole database in one run, and checking row counts confirms it loaded correctly. |
| 2026-11-11 | Phase 1 – SQL | Lesson 1: Databases, tables, keys and relationships | Complete | A foreign key must point to another table's primary key; join paths run through link tables. |
| 2026-11-13 | Phase 1 – SQL | Lesson 2: SELECT, ORDER BY, DISTINCT, LIMIT | Complete | The calculation comes before AS; check sort direction against the question. |
| 2026-11-13 | Phase 1 – SQL | Lesson 3: WHERE, operators, NULL handling, pattern matching | Complete | AND is evaluated before OR; text is case sensitive; NULL needs IS NULL. |
| 2026-11-15 | Phase 1 – SQL | Challenge 1: Loyalty call list | Complete | Read comparison signs against the question: "before" is < and "after" is >. |
| 2026-11-15 | Phase 1 – SQL | Bridge A: Constraints and designing tables | Complete | Constraints are rules the database enforces; referenced tables must be created first. |
| 2026-11-16 | Phase 1 | Lesson 4: Aggregate functions | Complete | COUNT/SUM/AVG/MIN/MAX; pick the column that matches the question; aggregates never go in WHERE |
| 2026-11-17 | Phase 1 | Challenge 2: Second-half order performance | Complete | COUNT(column) skips NULLs; no comma after the last column; use the exact alias names asked for |
| 2026-11-17 | Phase 1 | Lesson 5: GROUP BY and HAVING | Complete | GROUP BY = per-group aggregates; WHERE filters rows, HAVING filters groups; HAVING repeats the formula |
| 2026-11-20 | Phase 1 | Bridge B: CREATE, INSERT, UPDATE, DELETE, ALTER | Complete | SELECT first, then UPDATE/DELETE with the same WHERE; constraints reject bad data; highlight one statement before running |
| 2026-11-20 | Phase 1 | Challenge 3: Late deliveries by salesperson | Complete | WHERE filters rows, HAVING filters groups; NULL dates drop out of comparisons; counts need rates to compare fairly |
| 2026-11-20 | Phase 1 | Lesson 6: JOINs | Complete | JOIN matches foreign key to primary key; LEFT JOIN + IS NULL finds missing rows; use consistent aliases and read the output |
| 2026-11-20 | Phase 1 | Challenge 4: Salesperson revenue ranking | Complete | Count orders with COUNT(DISTINCT) after joining items; cross-check totals; exclude cancelled orders |
| 2026-11-20 | Challenge 4 | (No error) The same long SUM expression appears twice | An alias cannot be reused in the same SELECT | Use a CTE to calculate once and reuse (Lesson 7) |
