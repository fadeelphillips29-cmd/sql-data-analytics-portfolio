# Challenge 1: Loyalty call list

**Date:** 2026-11-15
**Phase:** 1 – SQL
**Difficulty:** Easy
**Skills used:** SELECT, WHERE, IN, comparison operators, ORDER BY
**Database:** business_db (Karoo Industrial Supplies)

## The problem
The sales manager wants a loyalty visit call list of established customers. One query should return customers that:
1. are in the Western Cape, KwaZulu-Natal or Eastern Cape,
2. are in the Hospitality, Healthcare, Food Processing or Agriculture industries,
3. have been customers since before 1 January 2023.

Show company_name, contact_name, province and customer_since, with the longest-standing customers first.

## My first attempt
```sql
SELECT company_name, contact_name, province, industry, customer_since
FROM customers
WHERE province IN ('KwaZulu-Natal', 'Western Cape', 'Eastern Cape')
  AND industry IN ('Hospitality', 'Healthcare', 'Food Processing', 'Agriculture')
  AND customer_since > '2023-01-01'
ORDER BY customer_since ASC;
```
Result: 4 rows, all from 2024. Wrong.

## Feedback
- The date test used `>` (after 2023) instead of `<` (before 2023), so I got the newest customers instead of the established ones. The query ran without an error, so I only noticed because every date in the result was after 2023.
- I selected five columns; the challenge asked for four (`industry` was extra).
- Everything else was correct: both IN lists, the AND chain and the sort direction.

## Improved solution
```sql
SELECT company_name, contact_name, province, customer_since
FROM customers
WHERE province IN ('Western Cape', 'KwaZulu-Natal', 'Eastern Cape')
  AND industry IN ('Hospitality', 'Healthcare', 'Food Processing', 'Agriculture')
  AND customer_since < '2023-01-01'
ORDER BY customer_since ASC;
```
Result: 5 rows, from Zambezi Foods (2018-01-03) to Table Bay Foods (2022-01-21).

## What I learned
- "Before" is `<` and "after" is `>`. I check one value in the result against each rule.
- Return only the columns that were asked for.
