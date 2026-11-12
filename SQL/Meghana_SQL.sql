-- DAY-1 ( database setup )

CREATE DATABASE company_db;
USE company_db;
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);
INSERT INTO departments
(department_id, department_name, location)
VALUES
(1, 'Sales', 'Hyderabad'),
(2, 'IT', 'Bangalore'),
(3, 'HR', 'Hyderabad'),
(4, 'Finance', 'Mumbai'),
(5, 'Marketing', 'Chennai'),
(6, 'Engineering', 'Bangalore'),
(7, 'Operations', 'Pune'),
(8, 'Support', 'Hyderabad'),
(9, 'Research', 'Chennai'),
(10, 'Legal', 'Mumbai'),
(11, 'Administration', 'Pune'),
(12, 'Security', 'Bangalore'),
(13, 'Quality Assurance', 'Hyderabad'),
(14, 'Product Management', 'Chennai'),
(15, 'Design', 'Mumbai'),
(16, 'Data Analytics', 'Bangalore'),
(17, 'Procurement', 'Pune'),
(18, 'Training', 'Hyderabad'),
(19, 'Logistics', 'Chennai'),
(20, 'Customer Relations', 'Mumbai');

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    age INT,
    salary DECIMAL(10,2),
    department_id INT,
    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);

INSERT INTO employees
(employee_id, employee_name, age, salary, department_id)
VALUES
(101, 'Rahul', 25, 45000, 1),
(102, 'Priya', 27, 65000, 2),
(103, 'Kiran', 24, 55000, 1),
(104, 'Sneha', 29, 75000, 3),
(105, 'Arjun', 26, 62000, 4),
(106, 'Meghana', 23, 70000, 5),
(107, 'Rohit', 28, 85000, 6),
(108, 'Ananya', 25, 58000, 1),
(109, 'Vikram', 30, 90000, 2),
(110, 'Divya', 24, 48000, 7),
(111, 'Sanjay', 31, 72000, 8),
(112, 'Pooja', 26, 61000, 9),
(113, 'Akhil', 27, 55000, 10),
(114, 'Nisha', 23, 68000, 1),
(115, 'Varun', 29, 95000, 6),
(116, 'Swathi', 25, 52000, 3),
(117, 'Manoj', 32, 80000, 4),
(118, 'Keerthi', 24, 63000, 5),
(119, 'Ajay', 28, 47000, 7),
(120, 'Lavanya', 26, 76000, 2);

 -- DAY-2 ( Basic filtering )
 
SELECT * FROM departments;
SELECT * FROM employees;
SELECT e.* FROM employees e JOIN departments d ON e.department_id = d.department_id WHERE d.department_name = 'Sales';
SELECT * FROM employees WHERE salary > 60000;

ALTER TABLE employees ADD hire_date DATE;
UPDATE employees
SET hire_date = CASE employee_id
    WHEN 101 THEN '2019-05-10'
    WHEN 102 THEN '2020-02-15'
    WHEN 103 THEN '2021-03-20'
    WHEN 104 THEN '2018-07-12'
    WHEN 105 THEN '2022-01-05'
    WHEN 106 THEN '2020-06-18'
    WHEN 107 THEN '2019-11-25'
    WHEN 108 THEN '2021-08-14'
    WHEN 109 THEN '2023-02-10'
    WHEN 110 THEN '2020-01-15'
    WHEN 111 THEN '2017-09-09'
    WHEN 112 THEN '2022-05-22'
    WHEN 113 THEN '2019-12-01'
    WHEN 114 THEN '2021-04-11'
    WHEN 115 THEN '2023-07-19'
    WHEN 116 THEN '2020-03-25'
    WHEN 117 THEN '2018-10-30'
    WHEN 118 THEN '2022-09-17'
    WHEN 119 THEN '2021-12-05'
    WHEN 120 THEN '2024-01-10'
END;

SELECT * FROM employees WHERE hire_date > '2020-01-01';
SELECT e.* FROM employees e JOIN departments d ON e.department_id = d.department_id WHERE d.department_name IN ('Sales', 'HR');

-- DAY-3 (Sorting & limiting)


SELECT * FROM employees ORDER BY salary DESC LIMIT 5;
SELECT * FROM employees ORDER BY salary ASC LIMIT 5;
SELECT * FROM employees ORDER BY employee_name ASC;
SELECT * FROM employees ORDER BY hire_date DESC LIMIT 3;

-- DAY-4 (Aggregate Functions )

SELECT COUNT(*) AS total_employees FROM employees;
SELECT AVG(salary) AS average_salary FROM employees;
SELECT MIN(salary) AS minimum_salary, MAX(salary) AS maximum_salary FROM employees;
SELECT SUM(salary) AS total_salary_expense FROM employees;

-- DAY-5 (GROUP ANALYSIS)

SELECT department_id, COUNT(*) AS total_employees FROM employees GROUP BY department_id;
SELECT department_id, AVG(salary) AS average_salary FROM employees GROUP BY department_id;
SELECT department_id, COUNT(*) AS total_employees FROM employees GROUP BY department_id HAVING COUNT(*) > 2;
SELECT department_id,AVG(salary) AS average_salary FROM employees GROUP BY department_id HAVING AVG(salary) > 60000;

-- DAY-6 ( Emp & dept info using Joins )

ALTER TABLE employees ADD job_title VARCHAR(100), ADD manager_id INT;
UPDATE employees 
SET 
    job_title = CASE employee_id
        WHEN 101 THEN 'Sales Manager'
        WHEN 102 THEN 'Software Engineer'
        WHEN 103 THEN 'Sales Executive'
        WHEN 104 THEN 'HR Manager'
        WHEN 105 THEN 'Accountant'
        WHEN 106 THEN 'Marketing Executive'
        WHEN 107 THEN 'Engineering Manager'
        WHEN 108 THEN 'Sales Executive'
        WHEN 109 THEN 'Senior Developer'
        WHEN 110 THEN 'Operations Executive'
        WHEN 111 THEN 'Support Engineer'
        WHEN 112 THEN 'Research Analyst'
        WHEN 113 THEN 'Legal Advisor'
        WHEN 114 THEN 'HR Executive'
        WHEN 115 THEN 'Senior Engineer'
        WHEN 116 THEN 'HR Executive'
        WHEN 117 THEN 'Finance Manager'
        WHEN 118 THEN 'Marketing Analyst'
        WHEN 119 THEN 'Logistics Executive'
        WHEN 120 THEN 'Data Analyst'
    END,
    manager_id = CASE employee_id
        WHEN 101 THEN NULL
        WHEN 102 THEN 101
        WHEN 103 THEN 101
        WHEN 104 THEN 102
        WHEN 105 THEN 102
        WHEN 106 THEN 104
        WHEN 107 THEN 104
        WHEN 108 THEN 103
        WHEN 109 THEN 107
        WHEN 110 THEN 103
        WHEN 111 THEN 109
        WHEN 112 THEN 109
        WHEN 113 THEN 105
        WHEN 114 THEN 104
        WHEN 115 THEN 107
        WHEN 116 THEN 103
        WHEN 117 THEN 105
        WHEN 118 THEN 106
        WHEN 119 THEN 110
        WHEN 120 THEN 107
    END
WHERE
    employee_id BETWEEN 101 AND 120;


# Employee name, job title and department name using INNER JOIN
SELECT
    e.employee_name,
    e.job_title,
    d.department_name
FROM employees e INNER JOIN departments d ON e.department_id = d.department_id;

# Employees with their manager name (Self JOIN)
SELECT
    e.employee_name AS employee_name,
    e.job_title AS employee_job,
    m.employee_name AS manager_name
FROM employees e INNER JOIN employees m ON e.manager_id = m.employee_id;


-- DAY-7 ( LEFT JOIN, RIGHT JOIN & FULL OUTER JOIN )

# List all departments with employee count (including departments with no employees)
SELECT
    d.department_id,
    d.department_name,
    COUNT(e.employee_id) AS total_employees
FROM departments d LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

# List all employees and their department (include employees without department)
SELECT
    e.employee_id,
    e.employee_name,
    d.department_name
FROM employees e LEFT JOIN departments d ON e.department_id = d.department_id;


-- DAY 8 – (Subqueries)


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
    

-- DAY-10 (String Functions)

#Display employee names in UPPERCASE
SELECT employee_name, UPPER(employee_name) AS uppercase_name FROM employees;

# Extract the first 3 characters of each job title
SELECT job_title, SUBSTRING(job_title, 1, 3) AS short_job_title FROM employees;

# Remove spaces from department names
SELECT department_name, TRIM(department_name) AS clean_department_name FROM departments;


-- DAY-11 (Date & Time Functions )
