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