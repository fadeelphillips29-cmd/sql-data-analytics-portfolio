# Mistakes and Fixes

| Date | Topic | What went wrong | Why it happened | Better approach |
|---|---|---|---|---|
| 2026-11-10 | Running Python scripts | `python test_setup.py` and later `test_db.py` said "No such file or directory" | The terminal was in my home or Desktop folder, not the folder holding the script | Check the end of the prompt, and use `cd folder-name` before running a script |
| 2026-11-10 | Database connection | `password authentication failed for user "postgres"` | The password typed at the prompt did not match the one set during install; the hidden prompt shows no characters, so it was hard to tell | Retype carefully. The error itself confirmed Python, SQLAlchemy and psycopg2 were working. Never store the password in a file |
| 2026-11-10 | PowerShell | Pasted several lines, got a `>>` prompt; also typed a command and forgot to press Enter | PowerShell treats a multi-line paste as one unfinished block | Run one command at a time, press Enter, and wait for the prompt to return |
| 2026-11-10 | Python installer | The download page offered the "install manager" and a brand-new 3.15 | The default button is not the best choice for a beginner setup | Use the standalone 64-bit Windows installer, tick Add python.exe to PATH, and prefer a slightly older stable version for library support |
| 2026-11-11 | Lesson 1 | Named production_date and target_month as foreign keys | They looked like identifiers, but no other table uses them as a key | Ask: which other table has a primary key matching this column? |
| 2026-11-11 | Lesson 1 | Described production_log rows as "downtime reason codes" and sales_targets rows as per day | Used one column, not the who / what / when columns | Read all key columns: sales_targets = employee + month; production_log = line + shift + product + day |
| 2026-11-11 | Lesson 1 | Skipped orders in the path from order_items to customers; named company_name as the connecting column | Connecting columns are PK/FK pairs; company_name is the result I want | Follow each foreign key one table at a time: order_items -> orders -> customers |
| 2026-11-11 | Lesson 1 | Named order_item_id as the link table | Mixed up a column with a table | The link table is order_items; it holds both order_id and product_id |
| 2026-11-11 | Lesson 1 | Said Ayesha was her own direct report; called employees-orders many-to-many | Confused "is" with "reports to"; did not check where the FK sits | Filter on manager_id = 3; the FK on the many side (orders.employee_id) means one-to-many |
| 2026-11-11 | Lesson 1 | WHERE product_id = '16' and assumed the ID | Quoting a number is a bad habit; the ID was not checked | Look the ID up by name first and leave numbers unquoted |
| 2026-11-13 | Lesson 2 | Typed unit_name instead of unit_price | Spelling mistake in a column name | Read the error message and caret; check column names in the Object Explorer |
| 2026-11-13 | Lesson 2 | Used ORDER BY unit_price DESC when cheapest first was asked | Did not match the sort direction to the question | Use ASC for smallest first; compare the first result row with the question |
| 2026-11-13 | Lesson 2 | Wrote margin_per_unit AS unit_price - unit_cost | Put the new name before AS | The expression comes first, the alias after AS: unit_price - unit_cost AS margin_per_unit |
| 2026-11-13 | Lesson 3 | Wrote WHERE category IN spares > 1000 | No quotes on text, IN used without a list, and the price test was not attached to unit_price | category = 'Spares' AND unit_price > 1000 |
| 2026-11-13 | Lesson 3 | Used ORDER BY unit_price ASC for "most to least expensive" (repeat of Lesson 2) | Did not match sort direction to the question | Underline the sort word in the question: most/highest = DESC, cheapest/oldest = ASC |
| 2026-11-13 | Lesson 3 | province = 'Gauteng' OR province = 'Western Cape' AND name LIKE '%Group' returned all Gauteng rows | AND is evaluated before OR | Use IN ('Gauteng', 'Western Cape') or brackets |
| 2026-11-13 | Lesson 3 | Filtered status NOT IN ('cancelled') and nothing was removed | Text is case sensitive; the data has 'Cancelled' | Match the exact capitalisation and check the result for what should be excluded |
| 2026-11-13 | Lesson 3 | Left industry out of the SELECT list | Did not check each requested column | Tick off every column named in the question |
