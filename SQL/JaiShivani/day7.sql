-- SQL JOINS - LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN , NULL handling in JOINs, 
-- LEFT JOIN with WHERE, RIGHT JOIN with WHERE, FULL OUTER JOIN with WHERE, ANTI JOIN
-- JOIN with GROUP BY, JOIN with aggregate functions


-- List all departments with employees count 

SELECT d.department_id, d.department_name, COUNT(e.emp_id) AS emp_count
FROM departments d
LEFT JOIN employees e 
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY d.department_id;


-- List all employees and their departments (include employees without department) 

SELECT e.emp_id, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
ORDER BY e.emp_id;


-- 1. LEFT JOIN

-- Display all departments and the total salary paid to their employees.

SELECT d.department_name, COALESCE(SUM(e.salary),0) AS total_salary
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- Retrieve department names and employee counts, including departments with zero employees.

SELECT d.department_name, 
COUNT(e.emp_id) 
FROM departments d
LEFT JOIN employees e 
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- 2. RIGHT JOIN

-- Retrieve all departments and their employee names using RIGHT JOIN.

SELECT e.emp_name, d.department_id, d.department_name
FROM employees e
RIGHT JOIN departments d 
ON e.department_id = d.department_id;

-- Retrieve department names and employee joining dates using RIGHT JOIN.

SELECT e.emp_name,e.join_date, d.department_name
FROM employees e
RIGHT JOIN departments d 
ON e.department_id = d.department_id;

-- 3. FULL OUTER JOIN

-- Retrieve all employee names, department names and department locations using FULL OUTER JOIN.

SELECT e.emp_name, d.department_name, d.location
FROM Employees e 
FULL OUTER JOIN Departments d
ON e.department_id = d.department_id;

-- 4. NULL Handling 

-- Count the number of employees who have an assigned department.

SELECT emp_name, department_id 
FROM employees 
WHERE department_id IS NOT NULL
ORDER BY department_id;

-- 5. JOIN + GROUP BY + HAVING

-- Find departments where the average employee salary is greater than ₹60,000.

SELECT
    d.department_id,
    d.department_name,
    AVG(e.salary) AS average_salary
FROM Departments d
INNER JOIN Employees e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name
HAVING AVG(e.salary) > 60000;

-- Display department names and the highest salary in each department

SELECT
    d.department_name,
    MAX(e.salary) AS highest_salary
FROM Departments d
INNER JOIN Employees e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name;


