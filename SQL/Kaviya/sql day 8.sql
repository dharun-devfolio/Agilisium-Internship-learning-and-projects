USE company_db;
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
SELECT
    emp_name,
    salary,
    manager_id
FROM employees
WHERE salary > (
    SELECT salary
    FROM employees AS manager
    WHERE manager.emp_id = employees.manager_id
);
SELECT
    dept_id,
    SUM(salary) AS total_salary
FROM employees
WHERE dept_id IN (
    SELECT dept_id
    FROM employees
    GROUP BY dept_id
    HAVING SUM(salary) > 200000
)
GROUP BY dept_id;