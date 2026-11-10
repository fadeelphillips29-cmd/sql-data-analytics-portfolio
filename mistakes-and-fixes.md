# Mistakes and Fixes

| Date | Topic | What went wrong | Why it happened | Better approach |
|---|---|---|---|---|
| 2026-11-10 | Running Python scripts | `python test_setup.py` and later `test_db.py` said "No such file or directory" | The terminal was in my home or Desktop folder, not the folder holding the script | Check the end of the prompt, and use `cd folder-name` before running a script |
| 2026-11-10 | Database connection | `password authentication failed for user "postgres"` | The password typed at the prompt did not match the one set during install; the hidden prompt shows no characters, so it was hard to tell | Retype carefully. The error itself confirmed Python, SQLAlchemy and psycopg2 were working. Never store the password in a file |
| 2026-11-10 | PowerShell | Pasted several lines, got a `>>` prompt; also typed a command and forgot to press Enter | PowerShell treats a multi-line paste as one unfinished block | Run one command at a time, press Enter, and wait for the prompt to return |
| 2026-11-10 | Python installer | The download page offered the "install manager" and a brand-new 3.15 | The default button is not the best choice for a beginner setup | Use the standalone 64-bit Windows installer, tick Add python.exe to PATH, and prefer a slightly older stable version for library support |