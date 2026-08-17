create database day2;
use day2;

-- 1. Create a table orders (id, product_name, quantity, price).

create table orders(id int primary key,product_name varchar(30),quantity varchar(10),price int);

-- 2. Insert 5 orders with different values.

insert into orders values(1001,"biriyani","1kg",2000);
insert into orders values(1002,"fried rice","2kg",3000);
insert into orders values(1003,"dosa","3kg",4000);
insert into orders values(1004,"brinjal","4kg",5000);
insert into orders values(1005,"icecream","5kg",6000);
select * from orders;

-- 3. Select all orders where quantity > 2.

select * from orders where quantity > "2kg";

-- 4. Select orders where price is between 100 and 500.

select * from orders where price between 100 and 500;
-- 5. Fetch orders with product_name starting with 'A'.

select * from orders where product_name like "B%";


-- APPLY ALL OPERATORS USING ANY 2 TABLES

-- TABLE 1: ORDERS
CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    product_id NUMBER,
    quantity NUMBER,
    price NUMBER
);


INSERT INTO orders VALUES (1, 101, 3, 150);
INSERT INTO orders VALUES (2, 102, 5, 80);
INSERT INTO orders VALUES (3, 103, 2, 300);
INSERT INTO orders VALUES (4, 104, 4, 200);
INSERT INTO orders VALUES (5, 105, 1, 500);

-- TABLE 2: PRODUCTS
CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(50),
    category VARCHAR2(30)
);


INSERT INTO products VALUES (101, 'Apple', 'Fruit');
INSERT INTO products VALUES (102, 'Banana', 'Fruit');
INSERT INTO products VALUES (103, 'Avocado', 'Fruit');
INSERT INTO products VALUES (104, 'Orange', 'Fruit');
INSERT INTO products VALUES (105, 'Mango', 'Fruit');

COMMIT;


-- 1. EQUAL (=)
SELECT * FROM orders
WHERE price = 200;


-- 2. NOT EQUAL (<>)
SELECT * FROM orders
WHERE price <> 200;


-- 3. GREATER THAN (>)
SELECT * FROM orders
WHERE quantity > 2;


-- 4. LESS THAN (<)
SELECT * FROM orders
WHERE quantity < 3;


-- 5. GREATER THAN OR EQUAL (>=)
SELECT * FROM orders
WHERE price >= 300;


-- 6. LESS THAN OR EQUAL (<=)
SELECT * FROM orders
WHERE quantity <= 2;


-- 7. BETWEEN
SELECT * FROM orders
WHERE price BETWEEN 100 AND 500;


-- 8. AND
SELECT * FROM orders
WHERE quantity > 2 AND price > 100;


-- 9. OR
SELECT * FROM orders
WHERE quantity > 4 OR price > 400;


-- 10. NOT
SELECT * FROM orders
WHERE NOT price = 200;


-- 11. IN
SELECT * FROM products
WHERE product_name IN ('Apple', 'Mango', 'Orange');


-- 12. NOT IN
SELECT * FROM products
WHERE product_name NOT IN ('Apple', 'Mango');


-- 13. LIKE
SELECT * FROM products
WHERE product_name LIKE 'A%';


-- 14. IS NULL
SELECT * FROM orders
WHERE price IS NULL;


-- 15. IS NOT NULL
SELECT * FROM orders
WHERE price IS NOT NULL;


-- 16. ARITHMETIC OPERATORS (+, -, *, /)
SELECT order_id,
       quantity,
       price,
       quantity * price AS total_amount,
       price + 50 AS increased_price,
       price - 20 AS reduced_price,
       price / 2 AS half_price
FROM orders;


-- 17. USING BOTH TABLES
SELECT p.product_name,
       p.category,
       o.quantity,
       o.price,
       o.quantity * o.price AS total_amount
FROM products p
JOIN orders o
ON p.product_id = o.product_id
WHERE o.quantity > 2
AND o.price BETWEEN 100 AND 500;


-- 18. PRODUCT NAME STARTING WITH 'A'
SELECT p.product_name,
       o.quantity,
       o.price
FROM products p
JOIN orders o
ON p.product_id = o.product_id
WHERE p.product_name LIKE 'A%';