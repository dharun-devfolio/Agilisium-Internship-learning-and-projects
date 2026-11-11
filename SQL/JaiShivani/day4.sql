/* AGGREGATE FUNCTIONS

COUNT(), SUM(), AVG(), MIN(), MAX(), Basic arithmetic calculations
*/ 

-- Total employees in the company 

SELECT COUNT(*) AS Total_employees
FROM employees; 

-- AVERAGE Salary of all employees

SELECT AVG(salary) AS avg_salary
FROM employees; 

-- Minimum and Maximum Salary 

SELECT MIN(salary) AS Max_sal, MAX(salary) AS Min_sal 
FROM employees;

-- Total salary expenses of the company

SELECT SUM(salary) AS total_expenses
FROM employees;

------------------------------------------------------------------------------------------------------------------------------

-- 1. COUNT() 

-- Count the total number of employees working in the IT department.

SELECT COUNT(*) FROM employees
WHERE department_id = 1;

-- Find the total number of job titles in the company.

SELECT COUNT(job_title) FROM employees;

-- Count how many employees earn more than ₹60,000.

SELECT COUNT(*) FROM employees 
WHERE salary > 60000;

-- 2. SUM()

-- Calculate the total salary paid to IT employees.

SELECT SUM(salary) FROM employees
WHERE department_id = 1; 

-- Calculate the total salary paid to employees who joined before January 1, 2021.

SELECT SUM(salary) FROM employees
WHERE join_date < '2021-01-01';

-- 3. AVG()

-- Find the average salary of employees earning more than ₹50,000.

SELECT AVG(salary) FROM employees
WHERE salary > 50000;

-- Find the average salary of employees whose job title contains the word 'Executive'.

SELECT AVG(salary) FROM employees 
WHERE job_title LIKE '%Executive%';

--4. MIN() and MAX()

-- Retrieve the earliest joining date in the company.

SELECT MIN(join_date) FROM employees; 

-- Find the most recent joining date among IT employees

SELECT MIN(join_date) FROM employees
WHERE department_id = 1; 

