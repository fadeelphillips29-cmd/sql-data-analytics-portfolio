-- Challenge: 1 - Loyalty call list
-- Date: 2026-11-15
-- Purpose: Established customers in coastal/eastern provinces and selected industries, longest-standing first

SELECT company_name, contact_name, province, customer_since
FROM customers
WHERE province IN ('Western Cape', 'KwaZulu-Natal', 'Eastern Cape')
  AND industry IN ('Hospitality', 'Healthcare', 'Food Processing', 'Agriculture')
  AND customer_since < '2023-01-01'
ORDER BY customer_since ASC;
