-- JOINS
USE VYS;

SELECT * FROM vys_transactions;

SELECT * FROM vys_customers;

-- INNER JOIN
SELECT * FROM vys_transactions t
INNER JOIN vys_customers c
ON t.t_c_id = c.c_id;

SELECT c.c_id, c.c_name, t.t_id, t.t_amount FROM vys_transactions t
INNER JOIN vys_customers c
ON t.t_c_id = c.c_id;

-- LEFT JOIN
SELECT * FROM vys_transactions t
LEFT JOIN vys_customers c
ON t.t_c_id = c.c_id;

SELECT c.c_id, c.c_name, t.t_id, t.t_amount FROM vys_transactions t
LEFT JOIN vys_customers c
ON t.t_c_id = c.c_id;

-- RIGHT JOIN
SELECT * FROM vys_transactions t
RIGHT JOIN vys_customers c
ON t.t_c_id = c.c_id;

SELECT c.c_id, c.c_name, t.t_id, t.t_amount FROM vys_transactions t
RIGHT JOIN vys_customers c
ON t.t_c_id = c.c_id;