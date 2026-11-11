-- GROUP BY, HAVING clause, Aggregate functions with GROUP BY 
-- Filtering grouped results, WHERE vs HAVING, Aggregate functions with conditions

-- Number of employees in each department

SELECT department_id, COUNT(emp_id) 
FROM employees 
GROUP BY department_id;

-- Average salary of each department

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id;

-- Department with more than 2 employees

SELECT department_id, COUNT(emp_id) 
FROM employees
GROUP BY department_id
HAVING COUNT(emp_id) > 2;

-- Departments with average salary > 60000

SELECT department_id, AVG(salary) AS avg_sal
FROM employees 
GROUP BY department_id
HAVING AVG(salary) > 60000;

--------------------------------------------------------------------------------------------------------------------------------

-- 1. GROUP BY 

--Calculate the total salary paid for each department.

SELECT department_id, SUM(salary) AS total_salary
FROM employees 
GROUP BY department_id;

-- Find the minimum salary in each department.

SELECT department_id, MIN(salary) AS minimum_salary
FROM employees 
GROUP BY department_id;

-- Count the number of employees hired in each year.

SELECT YEAR(join_date) AS hire_year, COUNT(*) FROM employees
GROUP BY YEAR(join_date) 
ORDER BY hire_year ASC; 

-- 2. HAVING clause

-- Find departments where the maximum salary is greater than ₹80,000.

SELECT department_id, MAX(salary) 
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 80000;

-- Find departments where the difference between maximum and minimum salary is greater than ₹40,000.

SELECT department_id, (MAX(salary) - MIN(salary)) AS difference
FROM employees
GROUP BY department_id
HAVING (MAX(salary) - MIN(salary)) > 40000;

-- 3. WHERE + GROUP BY + HAVING

-- Calculate total salary expenditure for each department, considering only employees who joined before January 1, 2022.

SELECT department_id, SUM(salary) AS total_salary
FROM employees
WHERE join_date < '2022-01-01' 
GROUP BY department_id;

-- 4. GROUP BY with JOIN 

-- Find the department with the highest average salary.

SELECT TOP 1 department_id, AVG(salary) AS aavg_salary
FROM employees
GROUP BY department_id
ORDER BY AVG(salary) DESC;

