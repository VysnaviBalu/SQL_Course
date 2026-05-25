-- GROUP BY ,  HAVING ,  WINDOW FUNCTIONS & ON DELETE

use rk_hospitals;

SELECT * FROM bills;
SELECT * FROM expenses;

ALTER TABLE bills
ADD bill_date date;

UPDATE bills SET bill_date = '2025-11-23' WHERE bill_id = 1;
UPDATE bills SET bill_date = '2025-11-23' WHERE bill_id = 2;
UPDATE bills SET bill_date = '2024-10-23' WHERE bill_id = 3;
UPDATE bills SET bill_date = '2024-10-23' WHERE bill_id = 4;

INSERT INTO bills (patient_name, bill_amount, bill_date)
VALUES ('Sam', 13000, '2025-10-23');
INSERT INTO bills (patient_name, bill_amount, bill_date)
VALUES ('Sam', 10000, '2024-10-23');
INSERT INTO bills (patient_name, bill_amount, bill_date)
VALUES ('Cass', 1500, '2025-10-23');
INSERT INTO bills (patient_name, bill_amount, bill_date)
VALUES ('Dean', 15000, '2025-10-23');

-- GROUP BY
SELECT sum(bill_amount), bill_date FROM bills
GROUP BY bill_date;

-- HAVING
SELECT sum(bill_amount), bill_date FROM bills
GROUP BY bill_date
HAVING sum(bill_amount) > 20000;

SELECT AVG(bill_amount), bill_date, patient_name  FROM bills
WHERE patient_name !='Dean'
GROUP BY bill_date, patient_name;

-- ROLL UP
SELECT * FROM employees;

SELECT AVG(emp_salary) , manager_id FROM employees
GROUP BY manager_id WITH ROLLUP;

SELECT * FROM employees
ORDER BY emp_joinDate;

-- ROW NUMBER

SELECT emp_name, emp_salary,emp_joinDate,
ROW_NUMBER() OVER(ORDER BY emp_joinDate) AS "Row Number",
RANK() OVER(ORDER BY emp_joinDate) AS "Rank",
DENSE_RANK() OVER(ORDER BY emp_joinDate) AS "Dense Rank"
FROM employees;

SELECT emp_name, manager_id, emp_joinDate, 
ROW_NUMBER() OVER(PARTITION BY manager_id ORDER BY emp_joinDate) AS "Row Number"
FROM employees;

/**
-- ON DELETE
**/

SELECT * FROM bills;

ALTER TABLE bills
ADD COLUMN doctor_id INT;

UPDATE bills SET doctor_id = 1 WHERE bill_id IN ( 1, 5, 6);
UPDATE bills SET doctor_id = 2 WHERE bill_id IN ( 2,8);
UPDATE bills SET doctor_id = 3 WHERE bill_id IN (3);
UPDATE bills SET doctor_id = 4 WHERE bill_id IN (4,7);

ALTER TABLE bills
ADD CONSTRAINT fk_doctor_id 
FOREIGN KEY(doctor_id) REFERENCES employees(emp_id);

SELECT * FROM employees;

DELETE FROM employees
WHERE emp_id = 2;

-- ON DELETE SET NULL

ALTER TABLE bills
DROP CONSTRAINT fk_doctor_id;

ALTER TABLE bills
ADD CONSTRAINT fk_doctor_id 
FOREIGN KEY(doctor_id) REFERENCES employees(emp_id)
ON DELETE SET NULL;

DELETE FROM employees
WHERE emp_id = 2;

SELECT * FROM employees;
SELECT * FROM bills;

-- ON DELETE SET CASCADE

ALTER TABLE bills
DROP CONSTRAINT fk_doctor_id;

ALTER TABLE bills
ADD CONSTRAINT fk_doctor_id 
FOREIGN KEY(doctor_id) REFERENCES employees(emp_id)
ON DELETE CASCADE;

SELECT * FROM bills;

DELETE FROM employees
WHERE emp_id = 4;

SELECT * FROM employees;
SELECT * FROM bills;



