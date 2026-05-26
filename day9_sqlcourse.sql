-- STORED PROCEDURES , LEET CODE PROBLEMS & TRIGGER

USE rk_hospitals;

SELECT * FROM employees;

-- STORED PROCEDURE

DELIMITER $$
CREATE PROCEDURE get_employees_id ()
BEGIN
  SELECT * FROM employees;
END $$
DELIMITER ;

call get_employees();

-- PROCEDURE WITH INPUT PARAMETERS

DELIMITER $$
CREATE PROCEDURE GetEmployeeByAge(IN p_age INT)
BEGIN
    SELECT emp_id, emp_name, emp_jobTitle
    FROM employees
    WHERE emp_age >= p_age;
END$$
DELIMITER ;

call GetEmployeeByAge(30);

DROP PROCEDURE IF EXISTS GetEmployeeByAge;

-- COMBINE TWO TABLES LEET CODE
 
 CREATE TABLE person (
  personID INT AUTO_INCREMENT PRIMARY KEY,
  firstName VARCHAR(20),
  lastName VARCHAR(20)
 );
 
 CREATE TABLE address(
  addressID INT AUTO_INCREMENT PRIMARY KEY,
  personID INT,
  city VARCHAR(20),
  state VARCHAR(20)
 );
 
 ALTER TABLE address
 ADD CONSTRAINT fk_personID
 FOREIGN KEY(personID) REFERENCES person(personID)
 ON DELETE CASCADE
 ON UPDATE CASCADE;
 
 SELECT a.personID, a.firstName, a.lastName,
 b.city, b.state 
 FROM person a 
 LEFT JOIN address b
 ON a.personID = b.personID
 ORDER BY a.personID asc;
 
 -- EMPLOYEES EARNING MORE THAN MANAGER LEET CODE
  CREATE TABLE employee (
  emp_id INT AUTO_INCREMENT PRIMARY KEY,
  emp_name VARCHAR(20) NOT NULL,
  emp_salary INT NOT NULL,
  manager_id INT
  );
  
  -- SELF JOIN
  SELECT e.emp_id as employee_id,
  e.emp_name as employee_name,
  e.emp_salary as employee_salary,
  m.emp_id as manager_id,
  m.emp_name as manager_name,
  m.emp_salary as manager_salary
  FROM employee e
  JOIN employee m
  ON m.manager_id = e.emp_id
  WHERE e.emp_salary > m.emp_salary
  ORDER BY e.emp_salary DESC;
  
-- DUPLICATE EMAILS LEET CODE

CREATE TABLE personnel (
 person_id INT AUTO_INCREMENT PRIMARY KEY,
 person_email VARCHAR(20) NOT NULL,
 CONSTRAINT chk_email_lowercase 
        CHECK (person_email = LOWER(person_email))
 );
 
 SELECT person_email, count(*) as 'Occurences' 
 FROM personnel
 GROUP BY person_email
 HAVING count(person_email) > 1
 ORDER BY person_email ;
 
-- CUSTOMERS WHO NEVER ORDERS LEET CODE
CREATE TABLE customers (
 cust_id INT AUTO_INCREMENT PRIMARY KEY,
 cust_name VARCHAR(20) NOT NULL
 );
 
 CREATE TABLE orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
   CONSTRAINT fk_cust_id FOREIGN KEY(customer_id) REFERENCES customers(cust_id)
  ); 

SELECT cust_id, cust_name FROM customers
WHERE cust_id NOT IN (
SELECT customer_id FROM ORDERS);  

SELECT c.cust_id, c.cust_name 
FROM customers c
LEFT JOIN orders o
ON c.cust_id = o.customer_id 
WHERE o.customer_id IS NULL;

-- SECOND HIGHEST SALARY LEET CODE, IF NOT SECOND HIGEST SALARY RETURN NULL

CREATE TABLE employees (
 emp_id INT AUTO_INCREMENT PRIMARY KEY,
 emp_salary INT NOT NULL
);

SELECT (
SELECT DISTINCT(emp_salary) 
FROM employees
ORDER BY emp_salary DESC
LIMIT 1 OFFSET 1)
AS SECOND_HIGEST;

-- CREATE AUDIT LOG TABLE

CREATE TABLE employees_audit (
 audit_id INT AUTO_INCREMENT PRIMARY KEY,
 action VARCHAR(20) NOT NULL,  -- INSERT , UPDATE, DELETE
 emp_id INT, 
 emp_name VARCHAR(50),
 emp_age INT, 
 emp_salary INT,
 emp_jobTitle VARCHAR(30), 
 emp_joinDate DATE,
 manager_id INT,
 changed_by VARCHAR(30), -- Who did it
 changed_at DATETIME DEFAULT NOW() -- When it happened
);

-- INSERT TRIGGER

 DELIMITER $$
 CREATE TRIGGER trg_insert_employees
 AFTER INSERT ON employees
 FOR EACH ROW
 BEGIN
  INSERT INTO employees_audit
   (action, emp_id, emp_name, emp_age, emp_salary, emp_jobTitle, emp_joinDate, manager_id, changed_by)
   VALUES 
   ('INSERT', NEW.emp_id, NEW.emp_name, NEW.emp_age, NEW.emp_salary, NEW.emp_jobTitle, NEW.emp_joinDate, NEW.manager_id,
   USER());
 END $$
 DELIMITER ;
 
-- UPDATE TRIGGER

DELIMITER $$
CREATE TRIGGER trg_update_employees
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
 INSERT INTO employees_audit
  (action, emp_id,emp_name, emp_age, emp_salary, emp_jobTitle, emp_joinDate, manager_id, changed_by)
 VALUES
  ('UPDATE', NEW.emp_id, NEW.emp_name, NEW.emp_age, NEW.emp_salary, NEW.emp_jobTitle, NEW.emp_joinDate,
   NEW.manager_id, USER());
END $$
DELIMITER ;

-- DELETE TRIGGER 

DELIMITER $$
CREATE TRIGGER trg_delete_employees
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
 INSERT INTO employees_audit
  (action, emp_id, emp_name, emp_age, emp_salary, emp_jobTitle, emp_joinDate, manager_id, changed_by)
 VALUES
  ('DELETE', OLD.emp_id, OLD.emp_name, OLD.emp_age, OLD.emp_salary, OLD.emp_jobTitle, OLD.emp_joinDate, 
   OLD.manager_id, USER());
END $$
DELIMITER ;   

-- INSERT INTO EMPLOYEES TABLE

INSERT INTO employees
  (emp_name, emp_age, emp_salary, emp_jobTitle, emp_joinDate, manager_id)
 VALUES
  ('Kino', 22, 30000, 'Intern', '2024-10-20',1);
  
-- UPDATE EMPLOYEES TABLE

UPDATE employees SET emp_salary = '200000'WHERE emp_id = 5;  

-- DELETE EMPLOYEES TABLE

SELECT * FROM employees;

DELETE FROM employees
WHERE emp_id = 13;

-- VIEW THE AUDIT LOG TABLE

SELECT * FROM employees_audit;

-- BEFORE TRIGGER TO SET VALUES 

DELIMITER $$
CREATE TRIGGER before_insert_employee
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
 SET NEW.manager_id = IFNULL(NEW.manager_id, 1);
END $$
DELIMITER ;

INSERT INTO employees
  (emp_name, emp_age, emp_salary, emp_jobTitle, emp_joinDate)
 VALUES
  ('Biscuit', 22, 30000, 'Intern', '2024-09-20');
 
 
  

   




 
  




