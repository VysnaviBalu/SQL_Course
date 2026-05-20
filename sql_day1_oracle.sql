CREATE TABLE vys_employees (
    emp_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    emp_name varchar(20),
    emp_salary decimal(10,2),
    emp_joiningDate date
);


BEGIN
INSERT INTO vys_employees(emp_name, emp_salary, emp_joiningDate)
VALUES ('Vysna', 6800000.00, DATE '2010-06-10');

INSERT INTO vys_employees(emp_name, emp_salary, emp_joiningDate)
VALUES ('Devi', 4800000.00, DATE '2015-09-12');

INSERT INTO vys_employees(emp_name, emp_salary, emp_joiningDate)
VALUES ('Shiv', 7800000.00, DATE '2019-05-04');
END;

SELECT * FROM vys_employees;

SELECT * FROM vys_employees where emp_salary > '5000000.00';

SELECT * FROM vys_employees ORDER BY emp_joiningDate DESC;

RENAME vys_employees TO vys_family;

SELECT * FROM vys_employees;

SELECT * FROM vys_family;

RENAME vys_family TO vys_employees;

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

BEGIN
INSERT INTO vys_timestamps (dateOfJoining, dateAndTime, currentTime )
VALUES (SYSDATE, SYSTIMESTAMP, SYSTIMESTAMP);
INSERT INTO vys_timestamps (dateOfJoining, dateAndTime, currentTime )
VALUES (CURRENT_DATE, CURRENT_TIMESTAMP, SYSTIMESTAMP);
END;

SELECT * FROM vys_timestamps;

BEGIN
INSERT INTO vys_timestamps (dateOfJoining, dateAndTime, currentTime )
VALUES (DATE '2021-08-10', SYSTIMESTAMP, SYSTIMESTAMP);
INSERT INTO vys_timestamps (dateOfJoining, dateAndTime, currentTime )
VALUES (DATE '2022-10-01', CURRENT_TIMESTAMP, SYSTIMESTAMP);
END;

DELETE FROM vys_timestamps
WHERE TRUNC(dateOfJoining) = TRUNC(SYSDATE);

CREATE TABLE vys_products (
    pd_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    pd_name VARCHAR(20) UNIQUE,
    pd_price DECIMAL(5,2)
);

INSERT INTO vys_products(pd_name, pd_price)
VALUES ('Rice', 350.45);
INSERT INTO vys_products(pd_name, pd_price)
VALUES ('Rice', 300.10);

BEGIN 
INSERT INTO vys_products(pd_name, pd_price)
VALUES ('Wheat', 200.45);
INSERT INTO vys_products(pd_name, pd_price)
VALUES ('Pulses', 100.10);
END;