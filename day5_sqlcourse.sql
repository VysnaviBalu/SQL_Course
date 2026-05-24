/**
------  FUNCTIONS ---------
**/
CREATE DATABASE rk_hospitals;

USE rk_hospitals;

DROP TABLE employees;

CREATE TABLE employees (
 emp_id INT AUTO_INCREMENT PRIMARY KEY,
 emp_name VARCHAR(50) NOT NULL, 
 emp_age INT NOT NULL, 
 emp_salary INT NOT NULL,
 emp_jobTitle VARCHAR(30) NOT NULL
 );
 
 DESCRIBE employees;
 
 SELECT * FROM employees;
 
INSERT INTO employees(emp_name, emp_age, emp_salary, emp_jobTitle)
 VALUES ('Radhi', 40, 225000, 'Chief Doctor');
INSERT INTO employees(emp_name, emp_age, emp_salary, emp_jobTitle)
 VALUES ('Meena', 44, 225000, 'Department Head');
INSERT INTO employees(emp_name, emp_age, emp_salary, emp_jobTitle)
 VALUES ('Madhan', 40, 200000, 'House surgeon');
INSERT INTO employees(emp_name, emp_age, emp_salary, emp_jobTitle)
 VALUES ('Anbu', 37, 200000, 'Sr.Doctor');
INSERT INTO employees(emp_name, emp_age, emp_salary, emp_jobTitle)
 VALUES ('Aish', 31, 150000, 'Doctor');
INSERT INTO employees(emp_name, emp_age, emp_salary, emp_jobTitle)
 VALUES ('Vys', 33, 150000, 'Doctor');
INSERT INTO employees(emp_name, emp_age, emp_salary, emp_jobTitle)
 VALUES ('Vys', 33, 150000, 'Doctor');
INSERT INTO employees(emp_name, emp_age, emp_salary, emp_jobTitle)
 VALUES ('Reena', 28, 75000, 'Intern');
INSERT INTO employees(emp_name, emp_age, emp_salary, emp_jobTitle)
 VALUES ('Magesh', 25, 50000, 'Intern'); 
INSERT INTO employees(emp_name, emp_age, emp_salary, emp_jobTitle)
 VALUES ('Sheela', 22, 25000, 'Intern');  
INSERT INTO employees(emp_name, emp_age, emp_salary, emp_jobTitle)
 VALUES ('Vijay', 40, 100000, 'Visiting Doctor');
INSERT INTO employees(emp_name, emp_age, emp_salary, emp_jobTitle)
 VALUES ('Arjun', 28, 1000000, 'CEO'); 

-- COUNT

SELECT COUNT(emp_name) AS 'NUMBER OF EMPLOYEES' FROM employees;

SELECT COUNT(emp_name) AS 'SENIOR EMPLOYEES' FROM employees 
WHERE emp_age >= 40;

-- MAX 
SELECT MAX(emp_salary) AS 'HIGHEST PAY' FROM employees;

SELECT MAX(emp_salary) AS 'HIGHEST PAY' FROM employees
WHERE emp_age < 30;

-- MIN
SELECT MIN(emp_age) AS 'YOUNGEST EMPLOYEE' FROM employees;

-- SUM
SELECT SUM(emp_salary) AS 'TOTAL SALARY' FROM employees;

SELECT SUM(emp_salary) AS 'TOTAL SALARY' FROM employees
WHERE emp_jobTitle = 'Intern'; 

-- AVG
SELECT AVG(emp_salarY) AS 'AVERAGE SALARY' FROM employees;

SELECT AVG(emp_age) AS 'AVERAGE AGE' FROM employees
WHERE emp_jobTitle = 'Intern';

-- CONCAT
SELECT CONCAT(emp_id,'-', emp_name) AS UserName FROM employees;

-- LIKE - pattern matching
SELECT * FROM employees
WHERE emp_name LIKE 'V%';      -- starts with V
SELECT * FROM employees
WHERE emp_name LIKE '%a';      -- ends with a
SELECT * FROM employees
WHERE emp_name LIKE '%ee%';    -- contains ee

-- IN - multiple values
SELECT * FROM employees
WHERE emp_jobTitle IN ('Doctor', 'Intern', 'CEO');

SELECT * FROM employees
WHERE emp_age IN (22, 25);

-- IS NULL / IS NOT NULL
SELECT * FROM employees
WHERE emp_name IS NOT NULL;

/**
------  LOGICAL OPERATORS  ---------
**/

-- AND
SELECT * FROM employees
WHERE emp_age >=40
AND emp_salary >= 200000;

-- OR
SELECT * FROM employees
WHERE emp_age > 40
OR emp_salary <=150000;

-- NOT
SELECT * FROM employees
WHERE NOT emp_age = 40;

-- BETWEEN
SELECT * FROM employees
WHERE emp_age BETWEEN 30 AND 40;

-- GROUP BY
SELECT emp_jobTitle, 
 COUNT(*) AS 'TOTAL EMPLOYEES',
  MAX(emp_salary) AS 'MAXIMUM SALARY',
  MIN(emp_salary) AS 'MINIMUM SALARY',
  AVG(emp_salary) AS 'AVERAGE SALARY'
  FROM employees
 GROUP BY emp_jobTitle
 ORDER BY emp_jobTitle ASC;
 
-- HAVING
SELECT emp_jobTitle, 
 COUNT(*) AS 'TOTAL EMPLOYEES',
  MAX(emp_salary) AS 'MAXIMUM SALARY',
  MIN(emp_salary) AS 'MINIMUM SALARY',
  AVG(emp_salary) AS  avg_salary
  FROM employees
 GROUP BY emp_jobTitle
 HAVING avg_salary >=225000
 ORDER BY emp_jobTitle ASC;
  
-- FIND DUPLICATES USING HAVING
SELECT emp_name, 
COUNT(*) AS count
FROM employees
GROUP BY emp_name
HAVING count > 1;

-- DELETE DUPLICATE EMPLOYEE
SET sql_safe_updates = 0;

DELETE FROM employees
WHERE emp_id NOT IN (
    SELECT * FROM (
        SELECT MIN(emp_id)
        FROM employees
        GROUP BY emp_name
    ) AS keep_these
);

SELECT * FROM employees;

 
 