show databases;

CREATE DATABASE vys;

USE VYS;

CREATE TABLE vys_employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(20),
    emp_salary DECIMAL(10,2),
    emp_joiningDate DATE
);

INSERT INTO vys_employees(emp_name, emp_salary, emp_joiningDate)
VALUES ('Vysna', 6800000.00, DATE '2010-06-10');

INSERT INTO vys_employees(emp_name, emp_salary, emp_joiningDate)
VALUES ('Devi', 4800000.00, DATE '2015-09-12');

INSERT INTO vys_employees(emp_name, emp_salary, emp_joiningDate)
VALUES ('Shiv', 7800000.00, DATE '2019-05-04');


SELECT * FROM vys_employees;

SELECT * FROM vys_employees where emp_salary > '5000000.00';

SELECT * FROM vys_employees ORDER BY emp_joiningDate DESC;

RENAME TABLE vys_employees TO vys_family;

SELECT * FROM vys_employees;

SELECT * FROM vys_family;

RENAME TABLE vys_family TO vys_employees;

ALTER TABLE vys_employees ADD phonenumber VARCHAR(10);

ALTER TABLE vys_employees RENAME COLUMN phonenumber TO ph_number;

SELECT * FROM vys_employees;

UPDATE vys_employees SET ph_number = '9988776655' WHERE emp_id = 1;

UPDATE vys_employees SET ph_number = '9988776654' WHERE emp_id = 2;

UPDATE vys_employees SET ph_number = '9988776653' WHERE emp_id = 3;

ALTER TABLE vys_employees ADD emp_email VARCHAR(20);

SELECT emp_name , emp_salary FROM vys_employees;

SELECT * FROM vys_employees;

SELECT emp_id AS employee , emp_salary AS SALARY FROM vys_employees;

SELECT * FROM vys_employees where emp_id = 2;

SELECT * FROM vys_employees WHERE emp_id !=2;

SELECT * FROM vys_employees WHERE emp_name ='Devi';

SELECT emp_name, emp_salary FROM vys_employees WHERE emp_name ='Devi';

SELECT emp_name FROM vys_employees WHERE emp_salary > 5000000;

SELECT * FROM vys_employees;

UPDATE vys_employees
SET emp_email = 'devi@Testsql.com'
WHERE emp_id = 2;

SELECT * FROM vys_employees;

SELECT * FROM vys_employees WHERE emp_email is not null;

SELECT * FROM vys_employees WHERE emp_email is null;

ALTER TABLE vys_employees
ADD emp_dept VARCHAR(10);

ALTER TABLE vys_employees
ADD emp_group VARCHAR(10);

SELECT * FROM vys_employees;

SET sql_safe_updates = 0;
UPDATE vys_employees
SET emp_dept = 'Finance',  emp_group = 'Salary';

DELETE  FROM vys_employees
WHERE emp_id = 3;

-- SET autocommit = 0;
-- rollback;
-- commit;

CREATE TABLE vys_timestamps (
    dateOfJoining date,
    dateAndTime timestamp, 
    currentTime timestamp 
);


INSERT INTO vys_timestamps (dateOfJoining, dateAndTime, currentTime)
VALUES (NOW(), NOW(), NOW());

INSERT INTO vys_timestamps (dateOfJoining, dateAndTime, currentTime)
VALUES (CURRENT_DATE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO vys_timestamps (dateOfJoining, dateAndTime, currentTime)
VALUES ('2021-08-10', NOW(), NOW());

INSERT INTO vys_timestamps (dateOfJoining, dateAndTime, currentTime)
VALUES ('2022-10-01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

SELECT * FROM vys_timestamps;

DELETE FROM vys_timestamps
WHERE dateOfJoining = CURRENT_DATE;

-- ********** CONSTRAINTS 

CREATE TABLE vys_products (
    pd_id INT AUTO_INCREMENT PRIMARY KEY,
    pd_name VARCHAR(20) NOT NULL UNIQUE,
    pd_price DECIMAL (6,2) NOT NULL,
    pd_stock INT DEFAULT 0,
    CONSTRAINT chk_price CHECK(pd_price >0),
    CONSTRAINT chk_stock CHECK(pd_stock >=0)
);

INSERT INTO vys_products (pd_name, pd_price, pd_stock)
VALUES ('Rice', 350.45, 100);

INSERT INTO vys_products (pd_name, pd_price, pd_stock)
VALUES (NULL, 200.00, 30);

INSERT INTO vys_products (pd_name, pd_price, pd_stock)
VALUES ('Wheat', -50.00, 50);

INSERT INTO vys_products (pd_name, pd_price, pd_stock)
VALUES ('Rice', 400.00, 20);


INSERT INTO vys_products (pd_name, pd_price, pd_stock)
VALUES ('Wheat', 210.45, 90);
INSERT INTO vys_products (pd_name, pd_price, pd_stock)
VALUES ('Milk', 50.45, 500);
INSERT INTO vys_products (pd_name, pd_price, pd_stock)
VALUES ('Pulses', 150.45, 200);
INSERT INTO vys_products (pd_name, pd_price, pd_stock)
VALUES ('Oats', 70.45, 1000);

SELECT * FROM vys_products;
