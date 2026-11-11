use company_db;
SELECT * FROM employees;
SELECT e.*
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'Sales';
SELECT *
FROM employees
WHERE salary > 60000;
SELECT *
FROM employees
WHERE hire_date > '2020-01-01';
SELECT e.*
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'HR';
SELECT DISTINCT dept_id
FROM employees;
SELECT *
FROM employees
WHERE salary > 50000 AND salary < 90000;
SELECT *
FROM employees
WHERE NOT dept_id = 1;
SELECT *
FROM employees
WHERE dept_id IN (1, 2, 3);
