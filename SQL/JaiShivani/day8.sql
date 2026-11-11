-- Subquery, Subquery in WHERE, with IN, with ANY, with ALL


-- Employees with salary greater than average salary

SELECT emp_id, emp_name, department_id, salary
FROM employees 
WHERE salary > ( SELECT AVG(salary) FROM employees);

-- Employees who earn more than their manager 

SELECT
    e.emp_id, e.emp_name, e.salary, e.manager_id
FROM Employees e
WHERE e.salary > (
SELECT m.salary
FROM Employees m
WHERE m.emp_id = e.manager_id
);

-- Departments where total salary is greater than 200000

SELECT department_id, department_name
FROM Departments
WHERE department_id IN (
SELECT department_id
FROM Employees
GROUP BY department_id
HAVING SUM(salary) > 200000
);

-- 1. SUBQUERY IN WHERE

-- Find employees earning the second-highest salary using a subquery.

SELECT * FROM employees 
WHERE salary = (
SELECT MAX(salary) FROM employees 
WHERE salary < (SELECT MAX(salary)
FROM employees));

-- Find employees whose salary equals the maximum salary in the Finance department.

SELECT * FROM employees 
WHERE salary = (
SELECT MAX(salary) FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees 
WHERE department_id = 3));

-- 2. SUBQUERY with IN and NOT IN

-- Find employees belonging to departments where at least 4 employees earn more than ₹50,000.

SELECT * FROM Employees
WHERE department_id IN (
SELECT department_id
FROM Employees
WHERE salary > 50000
GROUP BY department_id
HAVING COUNT(*) >= 4
);

-- Find employees who do not belong to departments managed by someone earning more than or equal to ₹85,000.

SELECT * FROM Employees
WHERE department_id NOT IN (
SELECT department_id
FROM Employees
WHERE manager_id IS NULL
AND salary >= 85000
);  

-- 3. SUBQUERY  with ANY and ALL

-- Find employees earning more than ANY employee in the Finance department.

SELECT * FROM Employees
WHERE salary > ANY (
SELECT e.salary
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'Finance'
);

-- Find employees earning less than ALL employees in the Sales department.

SELECT * FROM employees 
WHERE salary < ALL (
SELECT e.salary
FROM employees e 
INNER JOIN departments d 
ON e.department_id = d.department_id
WHERE d.department_name = 'Sales' );


