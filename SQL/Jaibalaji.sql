-- DAY1:

SELECT VERSION();

SHOW DATABASES;

CREATE DATABASE company_db;

USE company_db;

SELECT DATABASE();

USE company_db;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(50) DEFAULT 'Chennai'
);

INSERT INTO departments
(dept_id, dept_name, location)
VALUES
(1, 'IT', 'Chennai'),
(2, 'HR', 'Bangalore'),
(3, 'Sales', 'Mumbai'),
(4, 'Finance', 'Delhi'),
(5, 'Marketing', 'Hyderabad');

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    job_title VARCHAR(50),
    salary DECIMAL(10,2) CHECK (salary > 0),
    joining_date DATE,
    dept_id INT,
    status VARCHAR(20) DEFAULT 'Active',
    FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
);

SHOW TABLES;

DESCRIBE employees;

DESCRIBE departments;

INSERT INTO departments (dept_id, dept_name, location)
VALUES
(6, 'Operations', 'Pune'),
(7, 'Engineering', 'Chennai'),
(8, 'Customer Support', 'Kolkata'),
(9, 'Legal', 'Delhi'),
(10, 'Research', 'Bangalore'),
(11, 'Procurement', 'Mumbai'),
(12, 'Logistics', 'Hyderabad'),
(13, 'Quality Assurance', 'Chennai'),
(14, 'Administration', 'Pune'),
(15, 'Business Development', 'Delhi'),
(16, 'Data Analytics', 'Bangalore'),
(17, 'Product', 'Mumbai'),
(18, 'Security', 'Hyderabad'),
(19, 'Training', 'Kolkata'),
(20, 'Compliance', 'Chennai');

INSERT INTO employees
(emp_id, emp_name, email, job_title, salary, joining_date, dept_id, status)
VALUES
(1, 'Aarav Sharma', 'aarav.sharma@company.com', 'Software Engineer', 65000.00, '2022-03-14', 1, 'Active'),
(2, 'Diya Patel', 'diya.patel@company.com', 'HR Executive', 48000.00, '2021-07-05', 2, 'Active'),
(3, 'Rohan Mehta', 'rohan.mehta@company.com', 'Sales Manager', 72000.00, '2020-11-16', 3, 'Active'),
(4, 'Ananya Iyer', 'ananya.iyer@company.com', 'Accountant', 56000.00, '2023-01-09', 4, 'Active'),
(5, 'Vikram Rao', 'vikram.rao@company.com', 'Marketing Executive', 51000.00, '2022-08-22', 5, 'Active'),
(6, 'Meera Nair', 'meera.nair@company.com', 'Operations Analyst', 59000.00, '2021-04-12', 6, 'Active'),
(7, 'Kabir Singh', 'kabir.singh@company.com', 'Engineering Lead', 88000.00, '2019-06-03', 7, 'Active'),
(8, 'Ishita Das', 'ishita.das@company.com', 'Support Specialist', 45000.00, '2023-05-18', 8, 'Active'),
(9, 'Arjun Kumar', 'arjun.kumar@company.com', 'Legal Associate', 68000.00, '2020-09-28', 9, 'Active'),
(10, 'Sana Khan', 'sana.khan@company.com', 'Research Analyst', 62000.00, '2022-02-07', 10, 'Active'),
(11, 'Nikhil Joshi', 'nikhil.joshi@company.com', 'Procurement Officer', 53000.00, '2021-12-01', 11, 'Active'),
(12, 'Tara Menon', 'tara.menon@company.com', 'Logistics Coordinator', 49000.00, '2023-03-20', 12, 'Active'),
(13, 'Aditya Bose', 'aditya.bose@company.com', 'QA Engineer', 61000.00, '2022-10-10', 13, 'Active'),
(14, 'Pooja Reddy', 'pooja.reddy@company.com', 'Administrator', 47000.00, '2020-05-25', 14, 'Active'),
(15, 'Karan Gupta', 'karan.gupta@company.com', 'Business Development Executive', 57000.00, '2021-08-30', 15, 'Active'),
(16, 'Neha Verma', 'neha.verma@company.com', 'Data Analyst', 70000.00, '2019-11-11', 16, 'Active'),
(17, 'Dev Malhotra', 'dev.malhotra@company.com', 'Product Manager', 92000.00, '2018-04-16', 17, 'Active'),
(18, 'Riya Chawla', 'riya.chawla@company.com', 'Security Analyst', 64000.00, '2022-06-27', 18, 'Active'),
(19, 'Manav Kulkarni', 'manav.kulkarni@company.com', 'Trainer', 50000.00, '2023-07-03', 19, 'Active'),
(20, 'Zoya Fernandes', 'zoya.fernandes@company.com', 'Compliance Officer', 67000.00, '2020-02-17', 20, 'Active');

SELECT COUNT(*) AS department_count FROM departments;

SELECT COUNT(*) AS employee_count FROM employees;

-- DAY 2:

-- 1. SELECT
SELECT *
FROM employees;

-- 2. DISTINCT
SELECT DISTINCT dept_id
FROM employees;

-- 3. WHERE
SELECT e.*
FROM employees AS e
JOIN departments AS d ON e.dept_id = d.dept_id
WHERE d.dept_name = 'Sales';

-- 4. Comparison operator (>)
SELECT emp_id, emp_name, job_title, salary
FROM employees
WHERE salary > 60000;

-- 5. Comparison operator (>)
SELECT emp_id, emp_name, joining_date
FROM employees
WHERE joining_date > '2020-01-01';

-- 6. Logical operator OR
SELECT e.*
FROM employees AS e
JOIN departments AS d ON e.dept_id = d.dept_id
WHERE d.dept_name = 'Sales' OR d.dept_name = 'HR';

-- 7. IN
SELECT e.*
FROM employees AS e
JOIN departments AS d ON e.dept_id = d.dept_id
WHERE d.dept_name IN ('Sales', 'HR');

-- 8. AND
SELECT e.emp_id, e.emp_name, e.salary, d.dept_name
FROM employees AS e
JOIN departments AS d ON e.dept_id = d.dept_id
WHERE d.dept_name = 'Sales' AND e.salary > 60000;

-- 9. NOT
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees AS e
JOIN departments AS d ON e.dept_id = d.dept_id
WHERE NOT d.dept_name = 'Sales';

-- DAY 3:

-- 1. Top 5 highest-paid employees
SELECT emp_id, emp_name, job_title, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- 2. Bottom 5 lowest-paid employees
SELECT emp_id, emp_name, job_title, salary
FROM employees
ORDER BY salary ASC
LIMIT 5;

-- 3. Employees sorted by name (A to Z)
SELECT emp_id, emp_name, job_title, salary
FROM employees
ORDER BY emp_name ASC;

-- 4. Top 3 employees hired most recently
SELECT emp_id, emp_name, job_title, joining_date
FROM employees
ORDER BY joining_date DESC
LIMIT 3;

-- DAY 4:

-- 1. Total number of employees (COUNT)
SELECT COUNT(*) AS total_employees
FROM employees;

-- 2. Average salary of all employees (AVG)
SELECT ROUND(AVG(salary), 2) AS average_salary
FROM employees;

-- 3. Minimum and maximum salary (MIN and MAX)
SELECT MIN(salary) AS minimum_salary,
       MAX(salary) AS maximum_salary
FROM employees;

-- 4. Total salary expense of the company (SUM)
SELECT SUM(salary) AS total_salary_expense
FROM employees;

-- DAY 5:

-- 1. Number of employees in each department
SELECT d.dept_id, d.dept_name, COUNT(e.emp_id) AS employee_count
FROM departments AS d
LEFT JOIN employees AS e ON e.dept_id = d.dept_id
GROUP BY d.dept_id, d.dept_name
ORDER BY d.dept_name;

-- 2. Average salary for each department
SELECT d.dept_id, d.dept_name, ROUND(AVG(e.salary), 2) AS average_salary
FROM departments AS d
JOIN employees AS e ON e.dept_id = d.dept_id
GROUP BY d.dept_id, d.dept_name
ORDER BY d.dept_name;

-- 3. Departments with more than 2 employees
SELECT d.dept_id, d.dept_name, COUNT(e.emp_id) AS employee_count
FROM departments AS d
JOIN employees AS e ON e.dept_id = d.dept_id
GROUP BY d.dept_id, d.dept_name
HAVING COUNT(e.emp_id) > 2
ORDER BY employee_count DESC;

-- 4. Departments with average salary greater than 60000
SELECT d.dept_id, d.dept_name, ROUND(AVG(e.salary), 2) AS average_salary
FROM departments AS d
JOIN employees AS e ON e.dept_id = d.dept_id
GROUP BY d.dept_id, d.dept_name
HAVING AVG(e.salary) > 60000
ORDER BY average_salary DESC;

-- DAY 6:

-- 1. Employee name, job title, and department name
SELECT e.emp_name,
       e.job_title,
       d.dept_name
FROM employees AS e
INNER JOIN departments AS d
    ON e.dept_id = d.dept_id
ORDER BY e.emp_name;

-- 2. Self-join
ALTER TABLE employees
    ADD COLUMN manager_id INT NULL,
    ADD CONSTRAINT fk_employee_manager
        FOREIGN KEY (manager_id) REFERENCES employees(emp_id);

UPDATE employees SET manager_id = 1 WHERE emp_id IN (3, 4, 5, 6, 7);
UPDATE employees SET manager_id = 2 WHERE emp_id IN (8, 9, 10, 11, 12);
UPDATE employees SET manager_id = 7 WHERE emp_id IN (13, 14, 15, 16, 17);
UPDATE employees SET manager_id = 10 WHERE emp_id IN (18, 19, 20);

-- INNER JOIN 
SELECT e.emp_name AS employee_name,
       e.job_title AS employee_job_title,
       m.emp_name AS manager_name
FROM employees AS e
INNER JOIN employees AS m
    ON e.manager_id = m.emp_id
ORDER BY m.emp_name, e.emp_name;

-- LEFT JOIN 
SELECT e.emp_name AS employee_name,
       m.emp_name AS manager_name
FROM employees AS e
LEFT JOIN employees AS m
    ON e.manager_id = m.emp_id
ORDER BY e.emp_name;

-- DAY 7:

-- 1. All departments with employee counts, including departments with no employees
SELECT d.dept_id,
       d.dept_name,
       COUNT(e.emp_id) AS employee_count
FROM departments AS d
LEFT JOIN employees AS e
    ON e.dept_id = d.dept_id
GROUP BY d.dept_id, d.dept_name
ORDER BY d.dept_name;

-- 2. All employees and their department, including employees without a department
-- LEFT JOIN 
SELECT e.emp_id,
       e.emp_name,
       e.job_title,
       d.dept_name
FROM employees AS e
LEFT JOIN departments AS d
    ON e.dept_id = d.dept_id
ORDER BY e.emp_name;

-- 3. RIGHT JOIN 
SELECT d.dept_id,
       d.dept_name,
       e.emp_id,
       e.emp_name
FROM employees AS e
RIGHT JOIN departments AS d
    ON e.dept_id = d.dept_id
ORDER BY d.dept_name, e.emp_name;

-- 4. FULL OUTER JOIN 
SELECT d.dept_id,
       d.dept_name,
       e.emp_id,
       e.emp_name
FROM departments AS d
LEFT JOIN employees AS e
    ON e.dept_id = d.dept_id

UNION

SELECT d.dept_id,
       d.dept_name,
       e.emp_id,
       e.emp_name
FROM departments AS d
RIGHT JOIN employees AS e
    ON e.dept_id = d.dept_id
ORDER BY dept_name, emp_name;

-- DAY 8:

-- 1. Employees whose salary is greater than the company average
SELECT emp_id, emp_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;

-- 2. Employees who earn more than their manager (correlated subquery)
SELECT e.emp_id, e.emp_name, e.salary, e.manager_id
FROM employees AS e
WHERE e.manager_id IS NOT NULL
  AND e.salary > (
      SELECT m.salary
      FROM employees AS m
      WHERE m.emp_id = e.manager_id
  )
ORDER BY e.salary DESC;

-- 3. Departments where total salary is greater than 200000
SELECT d.dept_id, d.dept_name
FROM departments AS d
WHERE (
    SELECT SUM(e.salary)
    FROM employees AS e
    WHERE e.dept_id = d.dept_id
) > 200000
ORDER BY d.dept_name;

-- 4. IN
SELECT emp_id, emp_name, dept_id
FROM employees
WHERE dept_id IN (
    SELECT dept_id
    FROM departments
    WHERE location = 'Chennai'
);

-- 5. ANY
SELECT emp_id, emp_name, salary
FROM employees
WHERE salary > ANY (
    SELECT salary
    FROM employees
    WHERE dept_id = 2
);

-- 6. ALL
SELECT emp_id, emp_name, salary
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees
    WHERE dept_id = 2
);

-- 7. Subquery in SELECT
SELECT emp_name,
       salary,
       (SELECT ROUND(AVG(salary), 2) FROM employees) AS company_average_salary
FROM employees
ORDER BY emp_name;