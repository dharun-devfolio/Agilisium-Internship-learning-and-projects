-- DAY - 1

CREATE DATABASE company_db;

USE company_db;

SHOW DATABASES;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    job_title VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

INSERT INTO departments VALUES
(1, 'Sales', 'Chennai'),
(2, 'HR', 'Bangalore'),
(3, 'IT', 'Hyderabad'),
(4, 'Finance', 'Chennai'),
(5, 'Marketing', 'Mumbai'),
(6, 'Operations', 'Pune'),
(7, 'Research', 'Delhi'),
(8, 'Development', 'Chennai'),
(9, 'Testing', 'Bangalore'),
(10, 'Support', 'Hyderabad'),
(11, 'Legal', 'Mumbai'),
(12, 'Admin', 'Pune'),
(13, 'Security', 'Delhi'),
(14, 'Training', 'Chennai'),
(15, 'Quality', 'Bangalore'),
(16, 'Analytics', 'Hyderabad'),
(17, 'Design', 'Mumbai'),
(18, 'Procurement', 'Pune'),
(19, 'Logistics', 'Delhi'),
(20, 'Compliance', 'Chennai');

INSERT INTO employees VALUES
(101, 'Arun', 'Software Engineer', 75000, '2021-05-10', 3),
(102, 'Priya', 'HR Executive', 45000, '2022-03-15', 2),
(103, 'Karthik', 'Sales Executive', 55000, '2019-07-20', 1),
(104, 'Divya', 'Data Analyst', 85000, '2023-01-12', 16),
(105, 'Rahul', 'Accountant', 60000, '2020-11-05', 4),
(106, 'Sneha', 'Marketing Executive', 48000, '2021-08-18', 5),
(107, 'Vijay', 'Software Developer', 90000, '2024-02-10', 8),
(108, 'Anitha', 'Sales Manager', 95000, '2018-04-25', 1),
(109, 'Suresh', 'HR Manager', 80000, '2020-06-14', 2),
(110, 'Meena', 'QA Engineer', 65000, '2022-09-01', 9),
(111, 'Ajay', 'Support Engineer', 42000, '2019-12-11', 10),
(112, 'Kavya', 'Business Analyst', 72000, '2023-06-22', 16),
(113, 'Ramesh', 'Operations Manager', 88000, '2021-02-17', 6),
(114, 'Pooja', 'Developer', 68000, '2020-01-15', 3),
(115, 'Manoj', 'Sales Executive', 58000, '2024-05-19', 1),
(116, 'Swathi', 'Finance Analyst', 62000, '2022-12-08', 4),
(117, 'Deepak', 'Tester', 50000, '2019-03-27', 9),
(118, 'Nisha', 'HR Executive', 52000, '2023-11-30', 2),
(119, 'Gokul', 'Software Engineer', 78000, '2025-01-10', 8),
(120, 'Harini', 'Marketing Manager', 92000, '2021-07-07', 5);

SHOW TABLES;
DESC employees;
DESC departments;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT COUNT(*) FROM employees;
SELECT COUNT(*) FROM departments;

-- DAY - 2

use company_db;

-- 1. Display all employees
SELECT * FROM employees;

-- 2. Display employees from Sales department
SELECT *
FROM employees
WHERE department_id = 1;

-- 3. Employees with salary greater than 60,000
SELECT *
FROM employees
WHERE salary > 60000;

-- 4. Employees hired after 2020-01-01
SELECT *
FROM employees
WHERE hire_date > '2020-01-01';

-- 5. Employees from Sales or HR departments
SELECT *
FROM employees
WHERE department_id IN (1, 2);

-- DAY - 3

-- Task 1: Display all employees sorted by salary (ascending)
SELECT *
FROM employees
ORDER BY salary ASC;

-- Task 2: Display all employees sorted by salary (descending)
SELECT *
FROM employees
ORDER BY salary DESC;

-- Task 3: Find the top 5 highest-paid employees
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- Task 4: Find the bottom 5 lowest-paid employees
SELECT *
FROM employees
ORDER BY salary ASC
LIMIT 5;

-- Task 5: Sort employees alphabetically by name (A to Z)
SELECT *
FROM employees
ORDER BY employee_name ASC;

-- Task 6: Find the top 3 recently hired employees
SELECT *
FROM employees
ORDER BY hire_date DESC
LIMIT 3;


-- DAY - 4
USE company_db;

SELECT count(employee_id) as total_employees FROM employees;

SELECT max(salary) as highest_salary FROM employees;

SELECT min(salary) as lowest_salary FROM employees;

SELECT avg(salary) as avg_salary FROM employees;

-- DAY - 5
-- Task 1: Find the number of employees in each department
SELECT department_id, COUNT(*) AS total_employees
FROM employees
GROUP BY department_id;

-- Task 2: Find the average salary of each department
SELECT department_id, AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;

-- Task 3: Find the total salary expense of each department
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;

-- Task 4: Find departments having more than 2 employees
SELECT department_id, COUNT(*) AS total_employees
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 2;

-- Task 5: Find departments where average salary is greater than 60,000
SELECT department_id, AVG(salary) AS average_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 60000;

-- Task 6: Find the highest salary in each department
SELECT department_id, MAX(salary) AS highest_salary
FROM employees
GROUP BY department_id;

-- Task 7: Display departments having at least 2 employees
SELECT department_id, COUNT(*) AS total_employees
FROM employees
GROUP BY department_id
HAVING COUNT(*) >= 2;

-- DAY - 6
-- Task 1: Display employee names with department names
SELECT
    e.employee_name,
    d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

-- Task 2: Display employee ID, name and department name
SELECT
    e.employee_id,
    e.employee_name,
    d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

-- Task 3: Display employee name, salary and department name
SELECT
    e.employee_name,
    e.salary,
    d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

-- Task 4: Find employees working in the IT department
SELECT
    e.employee_name,
    d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'IT';

-- Task 5: Find employees earning more than 60,000 with their department names
SELECT
    e.employee_name,
    e.salary,
    d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE e.salary > 60000;

-- Task 6: Display employees sorted by department name
SELECT
    e.employee_name,
    d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
ORDER BY d.department_name ASC;

-- Task 7: Find the number of employees in each department using JOIN
SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees
FROM departments d
INNER JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

-- Task 8: Find the average salary of each department
SELECT
    d.department_name,
    AVG(e.salary) AS average_salary
FROM departments d
INNER JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

-- DAY - 7
-- Task 1: Display all employees with their department names using LEFT JOIN
SELECT
    e.employee_id,
    e.employee_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

-- Task 2: Display all departments with their employees
SELECT
    d.department_id,
    d.department_name,
    e.employee_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id;

-- Task 3: Find departments that have no employees
SELECT
    d.department_id,
    d.department_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

-- Task 4: Display all departments and matching employees using RIGHT JOIN
SELECT
    d.department_id,
    d.department_name,
    e.employee_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;

-- Task 5: Find employees who don't have a matching department
SELECT
    e.employee_id,
    e.employee_name,
    e.department_id
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

-- DAY - 8

# Employees with salary greater than the average salary
SELECT * FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

# Employees who earn more than their manager
SELECT
    e.employee_id,
    e.employee_name,
    e.salary,
    m.employee_name AS manager_name,
    m.salary AS manager_salary
FROM employees e JOIN employees m ON e.manager_id = m.employee_id WHERE e.salary > m.salary;

# Departments where total salary is greater than 200000
SELECT * FROM departments
WHERE department_id IN (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING SUM(salary) > 200000
);

-- DAY-9 (Set Operations)

#Get a list of all job titles from employees and managers using UNION

SELECT job_title FROM employees
UNION
SELECT m.job_title FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id;

#Use INTERSECT to find common departments between two result sets (intersect is not supported so i used join)

SELECT DISTINCT d.department_name FROM departments d
JOIN employees e
    ON d.department_id = e.department_id
JOIN employees m
    ON d.department_id = m.department_id
JOIN employees reporting
    ON reporting.manager_id = m.employee_id;

-- DAY - 10
use company_db;
-- Task 1: Convert all employee names into uppercase
SELECT
    employee_name,
    UPPER(employee_name) AS uppercase_name
FROM employees;


-- Task 2: Convert employee names into lowercase
SELECT
    employee_name,
    LOWER(employee_name) AS lowercase_name
FROM employees;


-- Task 3: Find the length of each employee name
SELECT
    employee_name,
    LENGTH(employee_name) AS name_length
FROM employees;


-- Task 4: Combine employee name and job title
SELECT
    CONCAT(employee_name, ' - ', job_title) AS employee_details
FROM employees;


-- Task 6: Extract the first three characters using LEFT()
SELECT
    employee_name,
    LEFT(employee_name, 3) AS first_three
FROM employees;


-- Task 7: Extract the last three characters using RIGHT()
SELECT
    employee_name,
    RIGHT(employee_name, 3) AS last_three
FROM employees;


-- Task 8: Remove unnecessary spaces using TRIM()
SELECT
    TRIM('   Dharun   ') AS clean_name;


-- Task 9: Replace Engineer with Developer in job titles
SELECT
    job_title,
    REPLACE(job_title, 'Engineer', 'Developer') AS updated_title
FROM employees;


-- Task 10: Reverse employee names
SELECT
    employee_name,
    REVERSE(employee_name) AS reversed_name
FROM employees;
