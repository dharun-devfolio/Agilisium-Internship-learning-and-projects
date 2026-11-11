-- Day1 (company database setup)
CREATE DATABASE company_db;

USE company_db;

CREATE TABLE employees(
	employee_id int PRIMARY KEY,
    employee_name varchar(100),
    job_role varchar(100),
    salary int
    );
    
    INSERT INTO employees
    values(1,"Javi","Software Developer",30000),
          (2,"Kavi","HR Executive",40000),
		  (3,"Emil","Sales manager",20000),
          (4,"Louis","Network Engineer",50000),
          (5,"Peter","Cloud Engineer",20000),
          (6,"Heidi","Data scientist",30000),
          (7,"Radhi","ML Engineer",20000),
          (8,"Nithya","ML Engineer", 90000),
          (9,"prem","Cloud Engineer",40000),
          (10,"Deepak","QA Engineer",57000),
		  (11,"Arun","Data Scientist",60000),
          (12,"Nirmal","software Engineer",35000),
          (13,"Mike","Software tester",30000),
          (14,"Kavya","Python Developer",45000),
          (15,"Sanjay","Data Analyst",50000),
          (16,"Divya","HR Executive",32000),
          (17,"Vikram","Senior Developer",75000),
		  (18,"Sneha","Software Tester",38000),
          (19,"Karthik","Database Administrator",55000),
          (20,"James","Cloud Engineer",45000);
    
CREATE TABLE departments(
	DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    Budget DECIMAL(12,2)
);

INSERT INTO DEPARTMENTS
values(101, 'IT', 'Chennai', 500000),
	  (102, 'HR', 'Bangalore', 300000),
	  (103,'Finance', 'Mumbai', 450000),
      (104, 'Marketing', 'Delhi', 400000),
	  (105, 'Sales', 'Chennai', 550000),
	  (106, 'Operations', 'Hyderabad', 600000),
      (107, 'Development', 'Pune', 700000),
      (108, 'Testing', 'Chennai', 350000),
      (109, 'Support', 'Bangalore', 250000),
      (110, 'Research', 'Mumbai', 800000),
      (111, 'Security', 'Hyderabad', 500000),
      (112, 'Administration', 'Delhi', 300000),
      (113, 'Networking', 'Pune', 400000),
      (114, 'Cloud Computing', 'Chennai', 750000),
      (115, 'Data Analytics', 'Bangalore', 650000),
      (116, 'AI and ML', 'Mumbai', 900000),
      (117, 'Legal', 'Delhi', 350000),
      (118, 'Procurement', 'Hyderabad', 400000),
      (119, 'Logistics', 'Pune', 450000),
      (120, 'Quality Assurance', 'Chennai', 500000);
      
-- Day 2 (Basic filtering)
      
SELECT * FROM employees;
SELECT * FROM departments;
      
SELECT distinct Location from departments;
SELECT * FROM employees
WHERE job_role = "Cloud Engineer";

select * from departments
where Budget > 500000;

select * from employees
where employee_id =15;

select count(*) As total_employee
from employees;

select * from employees
where employee_name="louis" and job_role="Network Engineer";

select * from departments
where DepartmentName = "IT" or Budget =400000;

select * from employees
where salary not between 300000 and 400000;

select employee_id from employees
where employee_id =15;

SELECT * FROM employees
WHERE employee_id IN (1, 2, 3);

-- Day 3 (Sorting and limiting Results)

select * from departments
order by Budget;

select salary from employees
order by salary desc;

select Budget from departments
where budget > 500000
limit 3;

select salary from employees
where salary <40000
limit 2;

-- Day 4 (Aggregate Functions)

select count(salary) from employees;
select max(budget) from departments;
select min(salary) from employees;
select avg(budget) from departments;
select sum(salary) from employees;
select count(*) from employees;

-- Day 5 (Group by & having )

select DepartmentID , avg(budget) as Average_budget from departments
group by DepartmentID;

SELECT job_role, COUNT(*) AS total_employees
FROM employees
GROUP BY job_role
HAVING COUNT(*) > 1;

SELECT job_role, AVG(salary) AS avg_salary
FROM employees
GROUP BY job_role
HAVING AVG(salary) > 35000;

-- Day 6 (joins-inner join)

ALTER TABLE employees
ADD department_id INT;

UPDATE employees
SET department_id =
CASE
    WHEN LOWER(job_role) LIKE '%hr%' THEN 102
    WHEN LOWER(job_role) LIKE '%sales%' THEN 105
    WHEN LOWER(job_role) LIKE '%network%' THEN 113
    WHEN LOWER(job_role) LIKE '%cloud%' THEN 114
    WHEN LOWER(job_role) LIKE '%data%' THEN 115
    WHEN LOWER(job_role) LIKE '%ml%' THEN 116
    WHEN LOWER(job_role) LIKE '%qa%' THEN 108
    WHEN LOWER(job_role) LIKE '%tester%' THEN 108
    WHEN LOWER(job_role) LIKE '%developer%' THEN 107
    WHEN LOWER(job_role) LIKE '%engineer%' THEN 101
    WHEN LOWER(job_role) LIKE '%database%' THEN 101
END;

ALTER TABLE employees
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id)
REFERENCES departments(DepartmentID);


SELECT e.employee_name,
       e.department_id,
       d.DepartmentName
FROM employees e
INNER JOIN departments d
ON e.department_id = d.DepartmentID;

-- Day 7(join - left join )

SELECT e.employee_id,
       e.employee_name,
       e.job_role,
       d.DepartmentName
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.DepartmentID;

SELECT d.DepartmentName,
       MAX(e.salary) AS highest_salary
FROM departments d
LEFT JOIN employees e
ON d.DepartmentID = e.department_id
GROUP BY d.DepartmentID, d.DepartmentName;

-- Day 8(SubQueries)

-- Find employees earning more than the average salary
SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- Display each employee's name, salary and company average salary.
SELECT employee_name,
       salary,
       (SELECT AVG(salary)
        FROM employees) AS average_salary
FROM employees;

-- Find employees whose salary matches the salary of any Cloud Engineer.

SELECT employee_name, salary
FROM employees
WHERE salary IN (
    SELECT salary
    FROM employees
    WHERE job_role = 'Cloud Engineer'
);

-- Find employees earning more than ANY Cloud Engineer.

SELECT employee_name, salary
FROM employees
WHERE salary > ANY (
    SELECT salary
    FROM employees
    WHERE job_role = 'Cloud Engineer'
);

-- Find employees earning more than ALL Cloud Engineers.
SELECT employee_name, salary
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees
    WHERE job_role = 'Cloud Engineer'
);

-- Day 9 (Set operators)

SELECT employee_name AS name
FROM employees
UNION
SELECT DepartmentName
FROM departments;

SELECT employee_name AS name
FROM employees
UNION ALL
SELECT DepartmentName
FROM departments;

-- Find common names between employee names and department names

SELECT employee_name AS name
FROM employees
INTERSECT
SELECT DepartmentName
FROM departments;

-- Find employee salaries that do not match any department budget.

SELECT salary AS amount
FROM employees
EXCEPT
SELECT Budget
FROM departments;