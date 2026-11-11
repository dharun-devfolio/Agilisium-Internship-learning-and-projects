USE company_db;
SELECT COUNT(*) AS total_employees
FROM employees;
SELECT AVG(salary) AS average_salary
FROM employees;
SELECT
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary
FROM employees;
SELECT SUM(salary) AS total_salary_expense
FROM employees;
SELECT COUNT(*) AS sales_employee_count
FROM employees
WHERE dept_id = 1;
SELECT AVG(salary) AS average_salary
FROM employees
WHERE dept_id = 3;
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);
SELECT COUNT(*) AS employee_count
FROM employees
WHERE salary > 60000;
SELECT COUNT(dept_id) AS assigned_employees
FROM employees;
