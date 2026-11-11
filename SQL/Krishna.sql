

--   DAY 1


DROP DATABASE IF EXISTS company_db;

CREATE DATABASE company_db;

USE company_db;

CREATE TABLE departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50) NOT NULL UNIQUE,
location VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT null,
    email VARCHAR(50) UNIQUE,
    job_title VARCHAR(50),
    salary DECIMAL(10,2) CHECK (salary>0),
    hire_date DATE NOT NULL,
    dept_id INT,
    manager_id INT,
    CONSTRAINT fk_emp_dept FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
    CONSTRAINT fk_emp_manager FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);


INSERT INTO departments (dept_id, dept_name, location) VALUES
(1, 'Sales', 'Chennai'),
(2, 'HR', 'Bangalore'),
(3, 'Engineering', 'Chennai'),
(4, 'Finance', 'Mumbai'),
(5, 'Marketing', 'Mumbai'),
(6, 'Customer Support', 'Hyderabad'),
(7, 'Data Science', 'Bangalore'),
(8, 'IT Infrastructure', 'Chennai'),
(9, 'Legal', 'Delhi'),
(10, 'Operations', 'Pune'),
(11, 'Quality Assurance', 'Chennai'),
(12, 'Product Management', 'Bangalore'),
(13, 'Research and Development', 'Hyderabad'),
(14, 'Business Development', 'Delhi'),
(15, 'Procurement', 'Pune'),
(16, 'Administration', 'Chennai'),
(17, 'Cyber Security', 'Bangalore'),
(18, 'Training and Development', 'Hyderabad'),
(19, 'Public Relations', 'Mumbai'),
(20, 'Corporate Strategy', 'Delhi');


INSERT INTO employees
(emp_id, first_name, last_name, email, job_title,
salary, hire_date, dept_id, manager_id)
VALUES
(101, 'Arjun', 'Mehta', 'arjun.mehta@company.com', 'CEO',
250000.00, '2015-04-01', NULL, NULL),
(102, 'Priya', 'Nair', 'priya.nair@company.com', 'Sales Manager',
120000.00, '2016-06-15', 1, 101),
(103, 'Rahul', 'Iyer', 'rahul.iyer@company.com', 'Sales Executive',
55000.00, '2021-03-10', 1, 102),
(104, 'Sneha', 'Reddy', 'sneha.reddy@company.com', 'Sales Executive',
62000.00, '2019-08-22', 1, 102),
(105, 'Vikram', 'Singh', 'vikram.singh@company.com', 'Senior Sales Executive',
125000.00, '2018-01-05', 1, 102),
(106, 'Kavya', 'Menon', 'kavya.menon@company.com', 'HR Manager',
95000.00, '2017-02-20', 2, 101),
(107, 'Aditya', 'Rao', 'aditya.rao@company.com', 'HR Executive',
42000.00, '2023-07-01', 2, 106),
(108, 'Meera', 'Pillai', 'meera.pillai@company.com', 'Recruiter',
48000.00, '2025-01-15', 2, 106),
(109, 'Karthik', 'Subramanian', 'karthik.subramanian@company.com', 'Engineering Manager',
160000.00, '2016-09-12', 3, 101),
(110, 'Divya', 'Krishnan', 'divya.krishnan@company.com', 'Senior Software Engineer',
135000.00, '2018-11-03', 3, 109),
(111, 'Rohan', 'Das', 'rohan.das@company.com', 'Software Engineer',
85000.00, '2021-06-14', 3, 109),
(112, 'Ananya', 'Sharma', 'ananya.sharma@company.com', 'Software Engineer',
82000.00, '2022-02-28', 3, 109),
(113, 'Siddharth', 'Jain', 'siddharth.jain@company.com', 'Junior Software Engineer',
45000.00, '2025-07-21', 3, 110),
(114, 'Lakshmi', 'Venkatesh', 'lakshmi.venkatesh@company.com', 'Finance Manager',
130000.00, '2017-05-08', 4, 101),
(115, 'Nikhil', 'Gupta', 'nikhil.gupta@company.com', 'Accountant',
58000.00, '2020-10-19', 4, 114),
(116, 'Pooja', 'Bhat', 'pooja.bhat@company.com', 'Financial Analyst',
72000.00, '2022-09-05', 4, 114),
(117, 'Arun', 'Kumar', 'arun.kumar@company.com', 'Marketing Manager',
110000.00, '2018-03-26', 5, 101),
(118, 'Ishita', 'Banerjee', 'ishita.banerjee@company.com', 'Marketing Executive',
52000.00, '2023-11-13', 5, 117),
(119, 'Manoj', 'Shetty', 'manoj.shetty@company.com', 'Content Strategist',
61000.00, '2020-04-17', 5, 117),
(120, 'Deepa', 'Raman', 'deepa.raman@company.com', 'Support Lead',
68000.00, '2019-12-02', 6, 101),
(121, 'Harish', 'Chandran', 'harish.chandran@company.com', 'Support Executive',
32000.00, '2024-06-10', 6, 120),
(122, 'Nandini', 'Joshi', 'nandini.joshi@company.com', 'Support Executive',
34000.00, '2026-02-02', 6, 120),
(123, 'Varun', 'Malhotra', 'varun.malhotra@company.com', 'Data Science Lead',
150000.00, '2019-05-13', 7, 101),
(124, 'Swathi', 'Ganesan', 'swathi.ganesan@company.com', 'Data Scientist',
98000.00, '2021-08-30', 7, 123),
(125, 'Farhan', 'Qureshi', 'farhan.qureshi@company.com', 'Data Analyst',
65000.00, '2024-12-09', 7, 123),
(126, 'Gokul', 'Raj', 'gokul.raj@company.com', 'Network Engineer',
78000.00, '2020-07-07', 8, 101),
(127, 'Bhavana', 'Murthy', 'bhavana.murthy@company.com', 'Security Analyst',
88000.00, '2022-05-16', 17, 101),
(128, 'Rajesh', 'Pandey', 'rajesh.pandey@company.com', 'Operations Manager',
105000.00, '2017-10-23', 10, 101),
(129, 'Tanvi', 'Kulkarni', 'tanvi.kulkarni@company.com', 'Product Manager',
140000.00, '2019-09-09', 12, 101),
(130, 'Suresh', 'Babu', 'suresh.babu@company.com', 'Consultant',
70000.00, '2023-03-20', NULL, 101),
(131, 'Neha', 'Kapoor', 'neha.kapoor@company.com', 'Intern',
25000.00, '2026-06-01', NULL, 109);



SELECT COUNT(*) 
FROM departments;

SELECT COUNT(*)
FROM employees;

SELECT *
FROM departments;

SELECT *
FROM employees;

--   DAY 2


SELECT *
FROM employees;

SELECT emp_id AS id,
first_name AS first,
last_name AS last,
job_title AS title,
email
FROM employees;

SELECT dept_id 
FROM departments 
WHERE dept_name = 'Sales';

SELECT emp_id, first_name, last_name, job_title, salary
FROM employees
where dept_id = 1;

SELECT emp_id, first_name, job_title, salary
FROM employees
WHERE salary > 60000;

SELECT emp_id, first_name, job_title, hire_date
FROM employees
WHERE hire_date > '2020-01-01';

SELECT dept_id, dept_name
FROM departments
WHERE dept_name IN ('Sales', 'HR');

SELECT emp_id, first_name, job_title, dept_id
FROM employees
WHERE dept_id IN (1, 2);

SELECT emp_id, first_name, job_title, dept_id
FROM employees
WHERE dept_id = 1 OR dept_id = 2;


--   DAY 3


-- Top 5 highest paid employees
SELECT emp_id, first_name, last_name, job_title, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- Bottom 5 lowest paid employees
SELECT emp_id, first_name, last_name, job_title, salary
FROM employees
ORDER BY salary ASC
LIMIT 5;

-- Employees sorted by name (A to Z)
SELECT emp_id, first_name, last_name, job_title
FROM employees
ORDER BY first_name ASC, last_name ASC;

-- Top 3 employees hired most recently
SELECT emp_id, first_name, job_title, hire_date
FROM employees
ORDER BY hire_date DESC
LIMIT 3;



--   DAY 4


-- Total employees in the company
SELECT COUNT(*) AS total_employees
FROM employees;

-- Average salary of all employees
SELECT ROUND(AVG(salary), 2) AS average_salary
FROM employees;

-- Minimum and maximum salary
SELECT MIN(salary) AS minimum_salary, MAX(salary) AS maximum_salary
FROM employees;

-- Total salary expense of the company
SELECT SUM(salary) AS monthly_expense, SUM(salary) * 12 AS annual_expense
FROM employees;



--   DAY 5


-- Number of employees in each department
SELECT dept_id, COUNT(*) AS employee_count
FROM employees
WHERE dept_id IS NOT NULL
GROUP BY dept_id
ORDER BY employee_count DESC;

-- Average salary for each department
SELECT dept_id, ROUND(AVG(salary), 2) AS avg_salary
FROM employees
WHERE dept_id IS NOT NULL
GROUP BY dept_id
ORDER BY avg_salary DESC;

-- Departments with more than 2 employees
SELECT dept_id, COUNT(*) AS employee_count
FROM employees
WHERE dept_id IS NOT NULL
GROUP BY dept_id
HAVING COUNT(*) > 2
ORDER BY employee_count DESC;

-- Departments with average salary > 60000
SELECT dept_id, ROUND(AVG(salary), 2) AS avg_salary
FROM employees
WHERE dept_id IS NOT NULL
GROUP BY dept_id
HAVING AVG(salary) > 60000
ORDER BY avg_salary DESC;



--   DAY 6


-- Employee name, job title and department name using INNER JOIN
SELECT e.emp_id, e.first_name, e.last_name, e.job_title, d.dept_name
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id
ORDER BY d.dept_name, e.first_name;

-- Employees with their manager name (self join on employees table)
SELECT e.emp_id, e.first_name AS employee, e.job_title, m.first_name AS manager
FROM employees e
INNER JOIN employees m ON e.manager_id = m.emp_id
ORDER BY e.emp_id;



--   DAY 7


-- List all departments with employee count (include departments with no employees)
SELECT d.dept_id, d.dept_name, COUNT(e.emp_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON e.dept_id = d.dept_id
GROUP BY d.dept_id, d.dept_name
ORDER BY employee_count DESC;

-- List all employees and their department (include employees without department)
SELECT e.emp_id, e.first_name, e.last_name, e.job_title, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
ORDER BY e.emp_id;



--   DAY 8


-- Employees with salary greater than the average salary
SELECT emp_id, first_name, job_title, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;

-- Employees who earn more than their manager
SELECT e.emp_id, e.first_name, e.job_title, e.salary
FROM employees e
WHERE e.salary > (SELECT m.salary FROM employees m WHERE m.emp_id = e.manager_id);

-- Departments where total salary is greater than 200000
SELECT dept_id, dept_name
FROM departments
WHERE dept_id IN (SELECT dept_id FROM employees GROUP BY dept_id HAVING SUM(salary) > 200000);
