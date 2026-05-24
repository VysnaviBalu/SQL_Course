-- VIEW
use rk_hospitals;

SELECT * FROM employees;

CREATE VIEW employees_salary AS
SELECT emp_name, emp_salary FROM employees;

SELECT * FROM employees_salary
ORDER BY emp_salary DESC;

SELECT * FROM employees_salary
WHERE emp_salary >=200000
ORDER BY emp_salary ASC;

INSERT INTO employees (emp_name,emp_age,emp_salary,emp_jobTitle,emp_joinDate,manager_id)
VALUES ('AK',38,100000,'Visiting Doctor','2010-10-16',3);

SELECT * FROM employees_salary
ORDER BY emp_salary DESC;

DROP VIEW employees_salary;

-- CREATE VIEW WITH JOIN
CREATE VIEW employee_reports AS
SELECT 
    e.emp_id AS employee_id,
    e.emp_name AS employee,
    e.emp_jobTitle AS employee_title,
    m.emp_id AS manager_id,
    m.emp_name AS manager,
    m.emp_jobTitle AS manager_title
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

SELECT * FROM employee_reports;

/**
--------- INDEXES -------
**/ 

SELECT * FROM employees
WHERE emp_id = 5; -- 0.00051 sec Fetch time

SELECT * FROM employees 
WHERE emp_name = 'Vys'; -- 0.00051 sec Fetch time

SHOW indexes FROM employees;

CREATE INDEX name_idx
ON employees(emp_name);

SHOW INDEXES FROM employees;

SELECT * FROM employees 
WHERE emp_name = 'Vys'; -- 0.0017 sec Fetch time

ALTER TABLE employees
DROP INDEX name_idx;

-- MULTIPLE FIELD INDEXES

SELECT * FROM employees;

CREATE INDEX name_manager_idx
ON employees(emp_name, manager_id);

SHOW INDEXES FROM employees;

SELECT * FROM employess
WHERE manager_id IN (1,3); -- 0.0026 sec FETCH TIME

ALTER TABLE employees
DROP INDEX name_manager_idx;

SHOW INDEXES FROM employees;

/**
--------- SUBQUERIES -------
**/ 
SELECT emp_id, emp_name, emp_salary
FROM employees
WHERE emp_salary >=(
SELECT AVG(emp_salary)
FROM employees); -- MORE THE AVERAGE SALARY

SELECT emp_id, emp_name, emp_salary
FROM employees
WHERE emp_salary <=(
SELECT AVG(emp_salary)
FROM employees); -- LESS THE AVERAGE SALARY

SELECT emp_id, emp_name AS Subordinates
FROM employees
WHERE manager_id = (SELECT emp_id FROM employees
WHERE emp_name Like '%Anbu%');

SELECT emp_id, emp_name AS Subordinate, manager_id
FROM employees
WHERE manager_id IN (SELECT emp_id FROM employees
WHERE emp_name LIKE '%Anbu%' OR 
emp_name LIKE '%Radhi%');

SELECT emp_name FROM 
employees
WHERE manager_id IN (
SELECT manager_id
FROM employees
WHERE emp_salary >=100000);




