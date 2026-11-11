USE company_db;
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;
SELECT *
FROM employees
ORDER BY salary ASC
LIMIT 5;
SELECT *
FROM employees
ORDER BY hire_date DESC
LIMIT 3;
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;
