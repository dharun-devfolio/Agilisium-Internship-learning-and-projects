USE company_db;
SELECT dept_id, COUNT(*) AS employee_count
FROM employees
GROUP BY dept_id;
SELECT dept_id, AVG(salary) AS average_salary
FROM employees
GROUP BY dept_id;
SELECT dept_id, COUNT(*) AS employee_count
FROM employees
GROUP BY dept_id
HAVING COUNT(*) > 2;
SELECT dept_id, AVG(salary) AS average_salary
FROM employees
GROUP BY dept_id
HAVING AVG(salary) > 60000;
SELECT dept_id, SUM(salary) AS total_salary
FROM employees
GROUP BY dept_id;
SELECT dept_id, AVG(salary)
FROM employees
WHERE salary > 30000
GROUP BY dept_id
HAVING AVG(salary) > 50000;
