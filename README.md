# SQL_Course

SQL full course hands-on training — relational database fundamentals through real, runnable `.sql` files, one topic per day.

## Structure

Each file is a self-contained day of practice — schema creation, sample data, and queries, with comments marking what's being demonstrated.

| Day | File | Topics Covered |
|---|---|---|
| 1 | `sql_day1_oracle.sql` | Oracle SQL fundamentals — DDL (CREATE/ALTER/RENAME TABLE), DML (INSERT with BEGIN/END blocks, UPDATE, DELETE), column add/rename, aliasing (AS), filtering (WHERE, !=, IS NULL/IS NOT NULL), ORDER BY, IDENTITY columns, UNIQUE constraints, and Oracle date/timestamp handling (SYSDATE, SYSTIMESTAMP, CURRENT_DATE, CURRENT_TIMESTAMP) |
| 2 | `sql_day2_mysql.sql` | MySQL Workbench setup; same schema rebuilt in MySQL syntax to contrast with Oracle (`AUTO_INCREMENT` vs `IDENTITY`, `NOW()`/`CURRENT_TIMESTAMP` vs `SYSDATE`/`SYSTIMESTAMP`, `RENAME TABLE` syntax); `CHECK` constraints, `NOT NULL`, `UNIQUE`, `DEFAULT`; deliberately testing constraint violations (NULL name, negative price, duplicate unique value) to confirm they correctly fail |
| 3 | `day3_sqlcourse.sql` | Deep dive into constraints — `NOT NULL`, `UNIQUE` (added at creation vs. via `ALTER TABLE` after the fact), `CHECK` (including empty-string checks), `DEFAULT`, dropping constraints (`DROP CONSTRAINT`); `PRIMARY KEY` (at creation, added after, with `AUTO_INCREMENT`, with a custom start value via `AUTO_INCREMENT = 200`); `FOREIGN KEY` relationships (added at creation, dropped, re-added via `ALTER TABLE`); deliberate PASS/FAIL test inserts to verify each constraint actually enforces correctly |
| 4 | `day4_sqlcourse.sql`, `day4_StudentTables_JOIN.sql` | JOINS — INNER, LEFT, RIGHT — applied to the customers/transactions schema from Day 3, plus a separate student-management schema |
| 5–6 | `day5_sqlcourse.sql`, `day6_sqlcourse.sql` | Aggregate functions (COUNT, MAX, MIN, SUM, AVG) with filtering; string functions (CONCAT); pattern matching (LIKE with `%`, `_` wildcards — starts-with/ends-with/contains/exact-length/date-pattern matching); `IN`, `IS NULL`/`IS NOT NULL`; logical operators (AND, OR, NOT, BETWEEN); `GROUP BY` with multiple aggregates; `HAVING` (including using it to find duplicate rows, then deleting duplicates via a subquery keeping only `MIN(id)`); `ORDER BY` with multiple columns/mixed directions; `LIMIT`/`OFFSET`; `UNION` vs column-count mismatch errors (triggered deliberately to see the failure); self-join to model a manager/employee org hierarchy (INNER vs LEFT JOIN to include/exclude the top-level CEO with no manager) |
| 7 | `day7_sqlcourse.sql` | Views (CREATE/DROP, views over joins, verifying views auto-reflect underlying data changes); indexes (single-column and multi-column, `SHOW INDEXES`, timing query performance before/after indexing — including noticing an index made a small-table lookup *slower*, not faster); subqueries (filtering by aggregate comparison — above/below average salary, filtering by a subquery result — WHERE IN, nested subquery for "same manager as X") |
| 8 | `day8_sqlcourse.sql` | `GROUP BY` with `SUM`/`AVG` across multiple columns; `HAVING`; `WITH ROLLUP` for subtotal summary rows; window functions — `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()` (plain and with `PARTITION BY` per manager); foreign key `ON DELETE` behaviors tested by actually deleting rows and observing the result — default (blocked), `SET NULL`, and `CASCADE` |
| 9 | `day9_sqlcourse.sql` | Stored procedures, triggers (audit logging via AFTER INSERT/UPDATE/DELETE), and real interview-style SQL problems (second-highest salary, employees earning more than their manager via self-join, duplicate detection) |

## Why day-by-day files instead of one script

Keeping each day isolated makes it easy to see exactly what was learned and when, and to re-run any single day's schema/queries independently without needing the full course history set up first.

## Stack

- MySQL (primary, via MySQL Workbench)
- Oracle SQL (Day 1 intro)

## Companion Repos

- [`VDB_JavaConquest`](https://github.com/VysnaviBalu/VDB_JavaConquest) — Java fundamentals and backend practice
- [`VDB_DSAConquest`](https://github.com/VysnaviBalu/VDB_DSAConquest) — Data structures & algorithms practice
