# Environment Setup Log (Step 0)

**Date:** 10 November 2026 (all times are South African time, UTC+2)
**Phase:** 0 – Environment, tools and GitHub setup
**Goal:** Get a working SQL, Python, Excel/Power BI and Git/GitHub environment before starting the SQL course.

---

## 1. Final environment at a glance

| Area | Tool | Version / detail | Verified by |
|---|---|---|---|
| Computer | Intel Core i7-4720HQ, 16 GB RAM, 932 GB SSD, 64-bit Windows 10 (build 19045) | NVIDIA GTX 960M + Intel HD 4600 graphics | Windows system info |
| Database | PostgreSQL | 18.6 on x86_64-windows, port 5432 | `SELECT version()` in pgAdmin |
| Database tool | pgAdmin 4 | installed with PostgreSQL | Query Tool ran a test query |
| Database created | `business_db` | empty, ready for the practice database | Created in pgAdmin |
| Language | Python | 3.14.9 (64-bit, installed for my user only) | `python --version` and test scripts |
| Editor | Visual Studio Code | with the Python and Jupyter extensions | Ran scripts in the VS Code terminal |
| Python libraries | pandas 3.1.1, matplotlib 3.11.2, openpyxl 3.1.5, SQLAlchemy 2.1.8, psycopg2-binary 2.9.13, Jupyter (notebook 7.6.5) | installed with pip | `test_setup.py` printed the versions |
| Spreadsheet | Microsoft Excel (Microsoft 365 Apps for enterprise) | Version 2608, Current Channel | File → Account |
| BI tool | Power BI Desktop | 2.157.1354.0, 64-bit, August 2026 release (Microsoft Store version) | Help → About |
| Version control | Git | 2.54.0 (Windows) | `git --version` |
| Hosting | GitHub repository `sql-data-analytics-portfolio` | public, `main` branch | Repository page |

---

## 2. Diary

### 19:40 – Reviewing the course plan and checking Claude skills (Step 0A)
- Read through the full course instructions: four reference books (IE foundations, Python, Power BI, SQL practice problems), three phases, a Git portfolio and a 20-challenge SQL phase.
- Confirmed all four books are in the project and which role each plays.
- Checked which Claude skills and plugins are available. Everything the course needs is already enabled:
  - **data plugin:** sql-queries, write-query, analyze, explore-data, validate-data, create-viz, data-visualization, build-dashboard, statistical-analysis
  - **operations plugin:** process-optimization
  - **file skills:** xlsx, docx, pptx
- Nothing needed installing.
- Agreed to get a reminder before each phase about which skills to use.

### 19:53 – Choosing the SQL tool (Step 0B)
- Shared my computer specs: i7-4720HQ, 16 GB RAM, SSD, 64-bit Windows. Comfortable for everything in this course.
- **Decision: PostgreSQL with pgAdmin** (instead of SQLite). Reasons:
  - Power BI has a built-in PostgreSQL connector.
  - Python connects easily with SQLAlchemy and psycopg2.
  - It supports everything in the curriculum (FULL JOIN, CTEs, window functions).
  - It is widely used in real jobs.

### ~20:13 – Installing PostgreSQL and pgAdmin
- Downloaded the Windows installer from the official PostgreSQL download page.
- Installed PostgreSQL Server, pgAdmin 4 and the command-line tools, with the default folders and port 5432.
- Chose **[Default locale]** when the installer asked for a locale.
- Set a password for the `postgres` superuser and kept it private (never to be committed to GitHub).

### 20:23 – First database test
- Opened pgAdmin 4, connected to the server, created a database called `business_db`.
- Opened the Query Tool and ran:
  ```sql
  SELECT version() AS server_version, current_date AS today, 2 + 2 AS answer;
  ```
- **Result:** PostgreSQL 18.6 on x86_64-windows, today's date, and `4`. No errors. ✅

### 20:27–20:40 – Installing Python (Step 0C)
- Found I had VS Code but no Python.
- The python.org page offered a new "Python install manager" and a Python 3.15.2 standalone installer. I did not use either.
- **Decision: Python 3.14.9, Windows installer (64-bit).** Reason: 3.15 was only about a month old, and libraries such as pandas and matplotlib can lag behind a brand-new Python release.
- Installer options: ticked **Add python.exe to PATH**, left **Use admin privileges when installing py.exe** unticked (so it installs for my user only).
- Installation completed successfully.

### 20:40–20:58 – VS Code extensions and Python libraries
- Installed the **Python** and **Jupyter** extensions in VS Code.
- Installed the libraries in the VS Code terminal:
  ```
  python -m pip install pandas matplotlib openpyxl sqlalchemy psycopg2-binary jupyter ipykernel
  ```
- All installed without errors. Versions are in the table above.
- pip reported that a newer version of pip (26.3) was available. Upgrading it is optional.
- Learned that libraries are installed once per Python installation, and that a `requirements.txt` file lets me reinstall them on any computer.

### 21:01–21:11 – Testing Python and the libraries
- Created a `python-setup-test` folder on the Desktop and a file `test_setup.py` containing a small pandas DataFrame, a matplotlib bar chart and an Excel export.
- **First attempt failed:** `python test_setup.py` could not find the file because the terminal was in my home folder, not the project folder. (See `mistakes-and-fixes.md`.)
- Created the folder and file properly, used `cd python-setup-test`, and re-ran it.
- **Result:** printed the table (Cutting 120, Welding 95, Assembly 140), printed `pandas 3.1.1 | matplotlib 3.11.2 | openpyxl 3.1.5`, and created `test_chart.png` and `test_output.xlsx`. ✅
- Small cosmetic issue: the x-axis labels on the chart were cut off at the bottom. Not a setup problem; will fix with a layout line in a later Python lesson.

### 21:15–21:22 – Connecting Python to PostgreSQL
- Created `test_db.py`, which uses SQLAlchemy and pandas to run `SELECT version()` against `business_db`.
- The password is typed at a prompt rather than stored in the file, so it can never reach the public repository.
- **Attempt 1:** wrong folder again (same cause as above).
- **Attempt 2:** the hidden password prompt showed no characters as I typed, which was confusing. Switched temporarily to a visible `input()` prompt.
- **Attempt 3:** `password authentication failed for user "postgres"`. This error proved that Python, SQLAlchemy and psycopg2 were all working and reaching the server, and that only the password was wrong.
- **Attempt 4:** re-ran with the correct password. **Result:** the table with PostgreSQL 18.6 and today's date (2026-11-10). ✅

### 21:25–21:37 – Excel and Power BI (Step 0D)
- **Excel:** Microsoft 365 Apps for enterprise, through my university account. Pivot tables, charts and Power Query are all included. An "Account Error" banner appeared on the Account page; a later check showed it gone and the subscription active.
- **Windows check:** Windows 10, build 19045, 64-bit.
- **Power BI Desktop** was already installed. From Help → About and the diagnostic report: version 2.157.1354.0, 64-bit, August 2026, Microsoft Store version, .NET (CLR) 4.8 or later, WebView2 runtime present. I confirmed these against Microsoft's published minimum requirements (Windows 10 or later, .NET 4.7.2 or later, WebView2). All met. ✅
- No separate PostgreSQL driver is needed: Power BI Desktop has included the Npgsql provider since December 2019.
- **Connection test:** Home → Get data → Excel workbook → `test_output.xlsx`. In the Data view, **Sheet1** loaded with 3 rows (Cutting 120, Welding 95, Assembly 140), and `units` was recognised as a number. ✅

### 21:40–22:09 – Git and GitHub (Step 0E)
- Confirmed Git is installed: `git version 2.54.0.windows.1`.
- Set my Git identity once with `git config --global user.name` and `user.email`. Checked the name back.
- Created the GitHub repository **sql-data-analytics-portfolio**: public, with a README and the Python `.gitignore` template, no license.
- Cloned it to `C:\dev\sql-data-analytics-portfolio` (a short folder outside OneDrive, since synced folders can cause Git problems) and opened it in VS Code. Trusted the folder when VS Code asked.
- Created the portfolio structure with PowerShell:
  ```
  /sql/lessons  /sql/queries  /sql/challenges
  /database     /python       /powerbi       /projects
  timeline.md   mistakes-and-fixes.md   requirements.txt
  ```
  Each empty folder got a `.gitkeep` placeholder, because Git does not store empty folders.
- `requirements.txt` lists: pandas, matplotlib, openpyxl, sqlalchemy, psycopg2-binary, jupyter.
- Ran `git status`, `git add .`, `git commit`, `git push`.
- **Commit `a38de6a`:** "Set up portfolio folder structure and requirements", 10 files changed. A harmless warning appeared about line endings (LF to CRLF on Windows).
- **Result:** the repository page on GitHub shows all new folders and files, with 2 commits in total. ✅

### 22:12 – Using the Claude skills (Step 0F)
- Skills are used by asking in the chat in plain English. Nothing is installed on my laptop.
- Naming a skill ("Use the sql-queries skill to review this query") makes sure it is used, but I do not have to name one.
- I can ask "Which skill did you just use?" at any time.
- Claude works in its own cloud workspace and cannot reach the database on my laptop, so for reviews I paste my query and its result, or attach an exported CSV or Excel file.

---

## 3. Decisions and reasons

| Decision | Reason |
|---|---|
| PostgreSQL over SQLite | Native Power BI connector, easy Python connection, full SQL feature set, used in industry |
| Python 3.14.9 over 3.15.2 | 3.15 was brand new; libraries can lag behind new Python releases |
| Standalone Python installer over "install manager" | Simpler, includes the Add-to-PATH option |
| Install for my user only (no admin) | Fewer permission problems later |
| Password typed at a prompt, never saved in code | The repository is public; secrets must never be committed |
| Repository cloned to `C:\dev` | Avoids OneDrive syncing problems with Git |
| `requirements.txt` in the repository | One command reinstalls every library on a new computer |

---

## 4. Problems met and how they were solved

Full detail is in [`mistakes-and-fixes.md`](mistakes-and-fixes.md). In short:

1. Running a script from the wrong folder (twice).
2. Not seeing characters while typing a hidden password.
3. Wrong password for the database.
4. Pasting several lines into PowerShell at once, or typing a command without pressing Enter.

---

## 5. What I learned

- The terminal runs commands in its *current folder*. Always check the prompt, and use `cd` to move into the right folder.
- A connection error that says "password authentication failed" is good news about everything else: the software was installed correctly and reached the server.
- Passwords belong in prompts or environment settings, never in files that go to GitHub.
- A commit is a labelled snapshot of my work; a push uploads it to GitHub. I will commit after every lesson with a clear message.
- Git ignores empty folders, so placeholder files such as `.gitkeep` keep the structure visible.

---

## 6. Status and next step

**Step 0 is complete.** All tools were tested, and the repository is live.
**Next:** build the practice business database in PostgreSQL, then start Lesson 1 (Databases, tables, keys and relationships).
