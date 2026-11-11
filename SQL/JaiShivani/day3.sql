-- ORDER BY - ASC, DESC, TOP, FETCH 

-- Top 5 highest paid employees

SELECT TOP 5 * FROM employees
ORDER BY salary DESC;

-- Bottom 5 lowest paid employees 

SELECT TOP 5 * FROM employees
ORDER BY salary ASC; 

-- Employees sorted by name 

SELECT * FROM employees 
ORDER BY emp_name; 

-- Top 3 employees hired most recently 

SELECT TOP 3 * FROM employees 
ORDER BY join_date DESC;

---------------------------------------------------------------------------------------------------------------

-- 1. ORDER BY 

-- Display employee names and salaries, sorting salaries from highest to lowest. 
-- If salaries are equal, sort names alphabetically.

SELECT emp_name, salary FROM employees 
ORDER BY salary DESC, emp_name ASC;

-- Sort employees by department_id in ascending order and join_date in descending order.

SELECT * FROM employees
ORDER BY department_id ASC, join_date DESC;

-- 2. TOP 

-- Display only the first 10 employees when sorted by employee ID in descending order.

SELECT TOP 10 * FROM employees
ORDER BY emp_id DESC;

-- Find the 7 employees with the highest salaries and display only their names and salaries.

SELECT TOP 7 emp_name, salary FROM employees 
ORDER BY salary DESC; 

--3. OFFSET

-- Retrieve the employees ranked 6th to 10th based on joining date, newest first.

SELECT * FROM employees
ORDER BY join_date DESC
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY;

-- Skip the 5 lowest-paid employees and retrieve the next 5 employees based on salary.

SELECT * FROM employees 
ORDER BY salary ASC 
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY; 

