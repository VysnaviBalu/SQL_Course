show databases;

-- ADDED CONTRAINTS TO EXISTING TABLE - Day 3
-- UNIQUE, NOT NULL, CHECK , DEFAULT
USE VYS;

CREATE TABLE vys_products_v2 (
    pd_id INT AUTO_INCREMENT PRIMARY KEY,
    pd_name VARCHAR(20) NOT NULL,
    pd_price DECIMAL (6,2) NOT NULL,
    pd_stock INT DEFAULT 0,
    CONSTRAINT chk_vys_products_v2price CHECK(pd_price >0),
    CONSTRAINT chk_vys_products_v2_stock CHECK(pd_stock >=0)
);

SELECT * FROM vys_products_v2;

INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES ('Rice', 350.45, 100);
INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES ('Rice', 400.00, 20);
INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES ('Wheat', 210.45, 90);
INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES ('Milk', 50.45, 500);
INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES ('Pulses', 150.45, 200);
INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES ('Oats', 70.45, 1000);

ALTER TABLE vys_products_v2 
ADD CONSTRAINT UNIQUE (pd_name);

DROP TABLE vys_products_v2;

CREATE TABLE vys_products_v2 (
    pd_id INT AUTO_INCREMENT PRIMARY KEY,
    pd_name VARCHAR(20),
    pd_price DECIMAL (6,2),
    pd_stock INT DEFAULT 0,
    CONSTRAINT chk_vys_products_v2price CHECK(pd_price >0),
    CONSTRAINT chk_vys_products_v2_stock CHECK(pd_stock >=0)
);

ALTER TABLE vys_products_v2 
ADD CONSTRAINT UNIQUE (pd_name);

INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES ('Rice', 400.00, 20);
INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES ('Wheat', 210.45, 90);
INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES ('Milk', 50.45, 500);
INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES ('Pulses', 150.45, 200);
INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES ('Oats', 70.45, 1000);

ALTER TABLE vys_products_v2 
MODIFY pd_name VARCHAR(20) NOT NULL;

ALTER TABLE vys_products_v2 
MODIFY pd_price DECIMAL (6,2) NOT NULL;

INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES ('', 70.45, 1000);
INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES ('PASTA',NULL, 1000);
INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES (NULL,70.66, 1000);

SELECT * FROM vys_products_v2;
DESCRIBE vys_products_v2;

DROP TABLE vys_products_v2;

CREATE TABLE vys_products_v2 (
    pd_id INT AUTO_INCREMENT PRIMARY KEY,
    pd_name VARCHAR(20) NOT NULL,
    pd_price DECIMAL(6,2) NOT NULL,
    pd_stock INT DEFAULT 0,
    CONSTRAINT chk_vys_v2_name CHECK(pd_name != ''),
    CONSTRAINT chk_vys_v2_price CHECK(pd_price > 0),
    CONSTRAINT chk_vys_v2_stock CHECK(pd_stock >= 0)
);

-- ✅ Should PASS
INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES ('Rice', 350.45, 100);
INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES ('Wheat', 210.45, 90);
INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES ('Milk', 50.45, 500);
INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES ('Pulses', 150.45, 200);
INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES ('Oats', 70.45, 1000);

-- ❌ Should FAIL - empty string
INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES ('', 70.45, 1000);

-- ❌ Should FAIL - null name
INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES (NULL, 70.45, 1000);

-- ❌ Should FAIL - null price
INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES ('Pasta', NULL, 1000);

-- ❌ Should FAIL - negative price
INSERT INTO vys_products_v2 (pd_name, pd_price, pd_stock)
VALUES ('Pasta', -50.00, 1000);

ALTER TABLE vys_products_v2
DROP CONSTRAINT chk_vys_v2_stock;

DESCRIBE vys_products_v2;

-- PRIMARY KEY

CREATE TABLE vys_transactions (
 t_id INT PRIMARY KEY, 
 T_amount DECIMAL(7,2)
);

SELECT * FROM vys_transactions;

INSERT INTO vys_transactions
VALUES (1, 709.50); -- WORKED
INSERT INTO vys_transactions
VALUES (1, 79.50); -- ID CANNOT BE DUPLICATE IN PRIMARY KEY
INSERT INTO vys_transactions
VALUES (NULL, 9.50); -- ID CANNOT BE NULL
INSERT INTO vys_transactions
VALUES (79.50); -- COLUMN COUNT DOES NOT MATCH

-- ADD PRIMARY KEY TO EXISTING TABLE

DROP TABLE vys_transactions;

CREATE TABLE vys_transactions (
  t_id INT,
  t_amount DECIMAL(6,2)
 ); 
 
 ALTER TABLE vys_transactions
 ADD CONSTRAINT PRIMARY KEY (t_id) ;
 
INSERT INTO vys_transactions
VALUES (1, 709.50); -- WORKED
INSERT INTO vys_transactions
VALUES (1, 79.50); -- ID CANNOT BE DUPLICATE IN PRIMARY KEY
INSERT INTO vys_transactions
VALUES (NULL, 9.50); -- ID CANNOT BE NULL
INSERT INTO vys_transactions
VALUES (79.50); -- COLUMN COUNT DOES NOT MATCH
INSERT INTO vys_transactions
VALUES (2, 109.50); -- WORKED

-- PRIMARY KEY AUTO INCREMENT

DROP TABLE vys_transactions;

CREATE TABLE vys_transactions (
 t_id INT AUTO_INCREMENT PRIMARY KEY,
 t_amount DECIMAL(6,2) NOT NULL
);

DESCRIBE vys_transactions;

SELECT * FROM vys_transactions; 

INSERT INTO vys_transactions (t_amount)
VALUES (709.70);
INSERT INTO vys_transactions (t_amount)
VALUES (79.70);
INSERT INTO vys_transactions (t_amount)
VALUES (1000.70);

SELECT * FROM vys_transactions; 

-- ADD AUTO INCREMENT TO EXISTING TABLES

DROP TABLE vys_transactions;

CREATE TABLE vys_transactions (
  t_id INT,
  t_amount DECIMAL(6,2) NOT NULL
 ); 
 
 ALTER TABLE vys_transactions
 ADD CONSTRAINT PRIMARY KEY(t_id);
 
 ALTER TABLE vys_transactions
 MODIFY t_id INT AUTO_INCREMENT;
 
 SELECT * FROM vys_transactions; 
 
INSERT INTO vys_transactions (t_amount)
VALUES (709.70);
INSERT INTO vys_transactions (t_amount)
VALUES (79.70);
INSERT INTO vys_transactions (t_amount)
VALUES (1000.70);
 
-- ADD AUTO INCREMENT TO EXISTING TABLES WITH CUSTOMIZED STARTVALUE

DROP TABLE vys_transactions;

CREATE TABLE vys_transactions (
  t_id INT,
  t_amount DECIMAL(6,2) NOT NULL
 ); 
 
 ALTER TABLE vys_transactions
 ADD CONSTRAINT PRIMARY KEY(t_id);
 
 ALTER TABLE vys_transactions
 MODIFY t_id INT AUTO_INCREMENT;
 
 ALTER TABLE vys_transactions
 AUTO_INCREMENT =200;
 
INSERT INTO vys_transactions (t_amount)
VALUES (709.70);
INSERT INTO vys_transactions (t_amount)
VALUES (79.70);
INSERT INTO vys_transactions (t_amount)
VALUES (1000.70);

SELECT * FROM vys_transactions; 

-- 
USE vys;

DROP TABLE vys_customers;

CREATE TABLE vys_customers(
 c_id INT AUTO_INCREMENT PRIMARY KEY,
 c_name VARCHAR(20) NOT NULL,
 c_age INT NOT NULL
); 

DESCRIBE vys_customers;

INSERT INTO vys_customers (c_name, c_age)
VALUES
('Dad', 66),('Mom',60),('Vysh', 36), ('Devi', 35), ('Shibu', 15),('Meena', 12),('Padma', 12);

SELECT * FROM vys_customers;

-- DROP AND CREATE TRANSACTIONS TABLE TO MAP WITH CUSTOMERS

DROP TABLE vys_transactions;

CREATE TABLE vys_transactions (
 t_id INT AUTO_INCREMENT PRIMARY KEY,
 t_amount DECIMAL(6,2),
 t_c_id INT, 
  FOREIGN KEY(t_c_id) references vys_customers(c_id)
 ); 
 
DESCRIBE vys_transactions;
 
INSERT INTO vys_transactions (t_amount, t_c_id)
VALUES
(809.88, 4),(546.10,2),(139.00, 2), (788.90, 1), (1536.11, 3),(435.19, 6),(90.99, 5),(910.99, 5),(190.99, 3) ;

 SELECT * FROM vys_transactions;
 
 SELECT * FROM vys_transactions WHERE t_c_id IN (3, 5);
 
 SELECT SUM(t_amount) FROM vys_transactions WHERE t_c_id = 5;
 
 SELECT t_c_id, c_name, t_amount FROM vys_transactions 
 JOIN vys_customers
 ON vys_transactions.t_c_id = vys_customers.c_id;
 
 ALTER TABLE vys_transactions
 DROP FOREIGN KEY vys_transactions_ibfk_1;
 
ALTER TABLE vys_transactions
ADD CONSTRAINT fk_c_id
FOREIGN KEY (t_c_id) REFERENCES vys_customers(c_id);