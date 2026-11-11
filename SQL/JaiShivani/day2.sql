-- SELECT,	DISTINCT, WHERE Clause, Comparison Operators, Logical Operators, IN operator 

-- All employees

SELECT * FROM employees; 

-- Employees from 'Sales' department

/*step 1 - find the dapartment_id 
SELECT department_id
FROM departments
WHERE department_name = 'Sales';*/

SELECT * FROM 
employees WHERE department_id = 4; 

-- Salary > 60000

SELECT * FROM 
employees WHERE salary > 60000; 

-- Employees hired after 2020-01-01

SELECT * FROM employees
WHERE join_date > '2020-01-01';

-- Employees from 'Sales' or 'HR' department 

SELECT * FROM employees
WHERE department_id = 2 OR department_id = 4; 

--------------------------------------------------------------------------------------------------------------

-- 1. SELECT AND DISTINCT 

-- Display employee names, salaries and department IDs, sorted in no particular order.

SELECT emp_name, salary, department_id 
FROM employees;

-- Display all unique job titles from the employees table.

SELECT DISTINCT job_title
FROM employees;
 
-- Find all unique joining dates from the employees table.

SELECT DISTINCT join_date 
FROM employees;

-- 2. WHERE AND COMPARISON OPERATORS

-- Retrieve employees whose department ID is greater than 2.

SELECT * FROM employees 
WHERE department_id > 2; 

-- Find employees whose salary is between ₹45,000 and ₹70,000 using comparison operators.

SELECT * FROM employees 
WHERE salary BETWEEN 45000 AND 70000;

-- Find employees who joined on or after January 1, 2022.

SELECT * FROM employees 
WHERE join_date >= '2022-01-01';

-- 3. AND, NOT, and OR 

-- Find employees earning more than ₹50,000 AND working in the IT department.

SELECT * FROM employees 
WHERE salary > 50000 AND department_id = 1; 

-- Retrieve employees who work in Sales OR earn more than ₹80,000.

SELECT * FROM employees 
WHERE department_id = 4 OR salary > 80000;

-- Find employees who are NOT working in IT AND whose salary is greater than ₹50,000. 

SELECT * FROM employees 
WHERE salary > 50000 AND NOT department_id = 1;

-- 4. IN and NOT IN 

-- Find employees belonging to departments 1, 3 and 4 using IN.

SELECT * FROM employees 
WHERE department_id IN(1,3,4); 

-- Find employees who do not belong to departments 2 and 4 using NOT IN.

SELECT * FROM employees 
WHERE department_id NOT IN(2,4);

-- Retrieve employees who joined in the years 2020, 2021 or 2023 using IN with dates.

SELECT * FROM employees 
WHERE YEAR(join_date) IN (2020,2021,2023);

