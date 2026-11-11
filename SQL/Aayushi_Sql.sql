Create Database Company_db;
USE Company_db;

CREATE TABLE employees (
employee_id INT Primary key ,
employee_name VARCHAR(50) Not Null ,
salary decimal (10,2) ,
department_name Varchar(50)
);

Alter table employees 
drop column department_name ;

Alter table employees
Add column department_id INT ;

CREATE TABLE departments (
department_id INT Primary key ,
department_name VARCHAR(50) 
);

INSERT INTO employees
(employee_id, employee_name, salary, department_id)
VALUES
(101, 'James Wilson', 50000, 1),
(102, 'Emily Johnson', 65000, 2),
(103, 'Michael Brown', 75000, 3),
(104, 'Sophia Davis', 45000, 4),
(105, 'William Miller', 60000, 5),
(106, 'Olivia Taylor', 80000, 2),
(107, 'Benjamin Clark', 55000, 1),
(108, 'Charlotte Lewis', 90000, 3),
(109, 'Daniel Walker', 48000, 4),
(110, 'Amelia Hall', 70000, 5),
(111, 'Alexander Young', 85000, 3),
(112, 'Isabella Allen', 52000, 1),
(113, 'Henry Scott', 62000, 2),
(114, 'Mia Green', 58000, 4),
(115, 'Sebastian Adams', 95000, 3),
(116, 'Evelyn Baker', 67000, 5),
(117, 'Matthew Nelson', 43000, 1),
(118, 'Harper Carter', 72000, 2),
(119, 'Joseph Mitchell', 56000, 4),
(120, 'Abigail Perez', 88000, 5);

INSERT INTO departments
(department_id, department_name)
VALUES
(1, 'Human Resources'),
(2, 'Sales'),
(3, 'Information Technology'),
(4, 'Finance'),
(5, 'Marketing');

Select * 
From employees;

SELECT * 
FROM departments;

-- DAY 2

Select* 
from employees
where department_id = 2;

Select*
from employees 
where salary > 60000;

select*
from employees
where department_id IN (1,2);

ALTER TABLE employees
ADD hire_date DATE;
UPDATE employees
SET hire_date = CASE employee_id
    WHEN 101 THEN '2019-05-10'
    WHEN 102 THEN '2020-08-15'
    WHEN 103 THEN '2021-03-20'
    WHEN 104 THEN '2022-01-12'
    WHEN 105 THEN '2023-06-05'
    WHEN 106 THEN '2018-11-25'
    WHEN 107 THEN '2024-02-10'
    WHEN 108 THEN '2021-09-18'
    WHEN 109 THEN '2020-04-22'
    WHEN 110 THEN '2023-12-01'
    WHEN 111 THEN '2019-07-14'
    WHEN 112 THEN '2022-10-30'
    WHEN 113 THEN '2024-05-16'
    WHEN 114 THEN '2021-02-08'
    WHEN 115 THEN '2018-03-11'
    WHEN 116 THEN '2023-08-19'
    WHEN 117 THEN '2020-12-05'
    WHEN 118 THEN '2022-06-21'
    WHEN 119 THEN '2024-01-09'
    WHEN 120 THEN '2019-10-17'
END
WHERE employee_id BETWEEN 101 AND 120;

select* 
from employees;

-- DAY 3
 
Select * 
from employees
order by salary desc
limit 5;

Select *
from employees 
order by salary Asc
limit 5;

Select*
from employees
order by employee_name Asc;

Select* 
from employees
order by hire_date desc
limit 3;

-- DAY 4

Select count(employee_id) as total_employees
from employees;

Select Avg(salary) as Avg_salary
from employees;

Select Max(salary), Min(salary)
from employees;

Select Sum(salary) as total_salary
from employees;

-- DAY 5

select count(employee_id) as total_employees , department_id
from employees
group by department_id;

select Avg(salary) as avg_salary , department_id
from employees
group by department_id;

select count(employee_id) as Total_employees, department_id
from employees
group by department_id
having count(employee_id) > 2;

select avg(salary) as avg_salary, department_id
from employees
group by department_id
having avg(salary) > 60000;

-- DAY 6 

ALTER TABLE employees 
ADD COLUMN job_title VARCHAR(100);

UPDATE employees 
SET job_title = 'Data Analyst' 
WHERE employee_id BETWEEN 101 AND 105;

UPDATE employees 
SET job_title = 'Software Engineer' 
WHERE employee_id BETWEEN 106 AND 110;

UPDATE employees 
SET job_title = 'HR Manager' 
WHERE employee_id BETWEEN 111 AND 115;

UPDATE employees 
SET job_title = 'Sales Executive' 
WHERE employee_id BETWEEN 116 AND 120;

select * 
from employees;

Select e.employee_name, e.job_title, d.department_name
from employees e
inner join departments d
on e.department_id = d.department_id;

ALTER TABLE employees 
ADD COLUMN manager_name VARCHAR(100);

ALTER TABLE employees DROP COLUMN manager_name;

ALTER TABLE employees ADD COLUMN manager_id INT;

update employees
set manager_id = '101'
where employee_id between 101 and 105;

update employees
set manager_id = '120'
where employee_id between 106 and 110;

update employees
set manager_id = '103'
where employee_id between 111 and 115;

update employees
set manager_id = '114'
where employee_id between 116 and 120;

SELECT 
    e.employee_name AS Employee_name, 
    m.employee_name AS Manager_name
FROM employees e 
 Left join employees m 
  ON e.manager_id = m.employee_id;
  
-- DAY 7 

SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e 
  ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- DAY 8
SELECT employee_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT e.employee_name AS employee_name, e.salary AS employee_salary, 
       m.employee_name AS manager_name, m.salary AS manager_salary
FROM employees e
JOIN employees m 
  ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;

SELECT d.department_name, SUM(e.salary) AS total_salary
FROM departments d
JOIN employees e 
  ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING SUM(e.salary) > 200000;

