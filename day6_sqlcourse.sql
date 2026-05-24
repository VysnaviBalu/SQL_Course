USE rk_hospitals;

SELECT * FROM employees;

ALTER TABLE employees
ADD emp_joinDate DATE;

UPDATE employees SET emp_joinDATE =  '2008-10-05' WHERE emp_id =1;
UPDATE employees SET emp_joinDATE =  '2004-08-12' WHERE emp_id =2;
UPDATE employees SET emp_joinDATE =  '2008-05-19' WHERE emp_id =3;
UPDATE employees SET emp_joinDATE =  '2010-12-30' WHERE emp_id =4;
UPDATE employees SET emp_joinDATE =  '2016-01-09' WHERE emp_id =5;
UPDATE employees SET emp_joinDATE =  '2013-07-27' WHERE emp_id =6;
UPDATE employees SET emp_joinDATE =  '2020-03-21' WHERE emp_id =8;
UPDATE employees SET emp_joinDATE =  '2022-09-13' WHERE emp_id =9;
UPDATE employees SET emp_joinDATE =  '2024-01-11' WHERE emp_id =10;
UPDATE employees SET emp_joinDATE =  '2008-08-19' WHERE emp_id =11;
UPDATE employees SET emp_joinDATE =  '2020-05-15' WHERE emp_id =12;

-- WILD CARD
SELECT * FROM employees
WHERE emp_name LIKE '%a%';

SELECT * FROM employees
WHERE emp_joinDate like '2020%';

SELECT * FROM employees
WHERE emp_name LIKE '_eena';

-- Employees who joined in August (any year)
SELECT * FROM employees
WHERE emp_joinDate LIKE '%-08-%';

-- Names ending with 'n'
SELECT * FROM employees
WHERE emp_name LIKE '%n';

-- Names with exactly 5 characters
SELECT * FROM employees
WHERE emp_name LIKE '_____';

-- Salary containing '000' (round numbers)
SELECT emp_name, emp_salary FROM employees
WHERE emp_salary LIKE '%000%';

-- ORDER BY

SELECT * FROM employees
ORDER BY emp_name ASC;

SELECT * FROM employees
ORDER BY emp_joinDate;

SELECT * FROM employees
ORDER BY emp_joinDate DESC;

UPDATE employees SET emp_joinDATE =  '2008-10-5' WHERE emp_id =11;
UPDATE employees SET emp_joinDATE =  '2008-10-5' WHERE emp_id =3;

SELECT * FROM employees
ORDER BY emp_joinDate DESC, emp_jobTitle DESC;

SELECT * FROM employees
ORDER BY emp_salary DESC;

SELECT * FROM employees
ORDER BY emp_salary DESC, emp_joinDate ASC;

-- LIMIT
SELECT * FROM employees
ORDER BY emp_joinDatE ASC 
LIMIT 5;

SELECT * FROM employees
ORDER BY emp_salary DESC
LIMIT 3;

-- OFFSET
SELECT * FROM employees
LIMIT 1,2;

/**
------------ UNION & UNION ALL -----------
**/

USE rk_hospitals;

CREATE TABLE bills (
 bill_id INT AUTO_INCREMENT PRIMARY KEY,
 patient_name VARCHAR(30) NOT NULL,
 bill_amount INT NOT NULL
); 

DESCRIBE bills;

SELECT * FROM bills;

INSERT INTO bills (patient_name, bill_amount)
VALUES ('Sam', 17000),
 ('Dean', 30000),
 ('Mary', 1000),
 ('John', 3000);
 
 CREATE TABLE EXPENSES (
 expense_id INT AUTO_INCREMENT PRIMARY KEY,
 expense_name VARCHAR(30) NOT NULL,
 expense_amount INT NOT NULL
 );
 
 DESCRIBE expenses;
 
INSERT INTO expenses (expense_name, expense_amount)
VALUES ('Salary', 1000000),
 ('Supplies', 100000),
 ('Medicines', 300000),
 ('Electricity', 100000);
 
 SELECT * FROM expenses;
 
 -- UNION  WORKS ONLY FOR TABEL WITH SAME COLUMN NUMBERS
 SELECT * FROM bills
 UNION
 SELECT * FROM expenses; -- TABLE HAVE SAME COLUMN NUMBER
 
SELECT * FROM employees
UNION 
SELECT * FROM expenses ; -- ERROR DUE TO COLUMN NUMBER MISMATH

SELECT emp_name , emp_salary FROM employees
UNION
SELECT patient_name, bill_amount FROM bills; -- TABLE HAVE SAME COLUMN NUMBER

-- SELF JOIN

SELECT * FROM employees
ORDER BY emp_salary DESC;

ALTER TABLE employees
ADD manager_id INT;

UPDATE employees
SET manager_id = 4
WHERE emp_id  = 2;

UPDATE employees
SET manager_id = 2
WHERE emp_id IN (1, 3);

UPDATE employees
SET manager_id = 3
WHERE emp_id IN (11,8,9,10);

UPDATE employees
SET manager_id = 1
WHERE emp_id = 4;

UPDATE employees
SET manager_id = 4
WHERE emp_id IN (5,6);

SELECT 
a.emp_id as manager_id,
a.emp_name as manager_name, 
b.emp_id as employee_id,
b.emp_name as employee_name
FROM employees a
INNER JOIN employees b 
ON a.manager_id = b.emp_id;  -- WITHOUT CEO

SELECT 
a.emp_id as manager_id,
a.emp_name as manager_name, 
b.emp_id as employee_id,
b.emp_name as employee_name
FROM employees a
LEFT JOIN employees b 
ON a.manager_id = b.emp_id;  -- WITH CEO









