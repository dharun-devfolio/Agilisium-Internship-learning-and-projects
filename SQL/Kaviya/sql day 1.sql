CREATE DATABASE company_db;
use company_db;
SHOW DATABASES;
SELECT DATABASE();
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    job_title VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    dept_id INT,
    manager_id INT,

    FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);
INSERT INTO departments (dept_id, dept_name, location)
VALUES
(1, 'Sales', 'Chennai'),
(2, 'HR', 'Bangalore'),
(3, 'IT', 'Hyderabad'),
(4, 'Finance', 'Chennai'),
(5, 'Marketing', 'Mumbai'),
(6, 'Research', 'Bangalore'),
(7, 'Production', 'Coimbatore'),
(8, 'Quality Control', 'Chennai'),
(9, 'Clinical Research', 'Hyderabad'),
(10, 'Regulatory Affairs', 'Bangalore'),
(11, 'Legal', 'Mumbai'),
(12, 'Procurement', 'Chennai'),
(13, 'Customer Support', 'Pune'),
(14, 'Administration', 'Coimbatore'),
(15, 'Logistics', 'Mumbai'),
(16, 'Biotechnology', 'Bangalore'),
(17, 'Medical Writing', 'Hyderabad'),
(18, 'Data Analytics', 'Chennai'),
(19, 'Training', 'Pune'),
(20, 'Operations', 'Coimbatore');
SELECT * FROM departments;
INSERT INTO employees
(emp_id, emp_name, job_title, salary, hire_date, dept_id, manager_id)
VALUES
(1, 'Arun', 'CEO', 150000, '2015-01-10', 3, NULL),
(2, 'Priya', 'HR Manager', 85000, '2017-03-15', 2, 1),
(3, 'Karthik', 'Sales Manager', 90000, '2018-06-20', 1, 1),
(4, 'Divya', 'Finance Manager', 95000, '2016-08-12', 4, 1),
(5, 'Rahul', 'Software Engineer', 65000, '2021-02-10', 3, 1),
(6, 'Sneha', 'HR Executive', 45000, '2022-05-18', 2, 2),
(7, 'Vikram', 'Sales Executive', 55000, '2020-11-25', 1, 3),
(8, 'Anitha', 'Accountant', 50000, '2019-07-14', 4, 4),
(9, 'Suresh', 'Marketing Executive', 48000, '2023-01-05', 5, 3),
(10, 'Meena', 'Research Associate', 70000, '2021-09-16', 6, 1),
(11, 'Ravi', 'Production Manager', 80000, '2019-04-22', 7, 1),
(12, 'Kavya', 'Quality Analyst', 42000, '2024-02-12', 8, 11),
(13, 'Ajay', 'Clinical Research Associate', 62000, '2022-08-30', 9, 1),
(14, 'Nisha', 'Regulatory Associate', 58000, '2023-06-19', 10, 2),
(15, 'Manoj', 'Sales Executive', 38000, '2024-05-10', 1, 3),
(16, 'Pooja', 'Data Analyst', 75000, '2020-03-11', 3, 1),
(17, 'Deepak', 'Medical Writer', 68000, '2021-12-01', 17, 2),
(18, 'Swathi', 'Biotechnologist', 52000, '2022-10-15', 16, 1),
(19, 'Gokul', 'Customer Support Executive', 30000, '2025-01-20', 13, 2),
(20, 'Harini', 'Trainee', 25000, '2025-06-01', NULL, 2);
SELECT * FROM employees;
SELECT COUNT(*) AS total_employees
FROM employees;
SELECT COUNT(*) AS total_departments
FROM departments;
DESCRIBE employees;
DESCRIBE departments;

