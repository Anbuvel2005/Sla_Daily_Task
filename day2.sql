-- 1. Create a new database named schoolDB.

--
create database schoolDB;
use schoolDB;

-- 2.Create a students , customer, staff, Product ,user table do all ddl & dml opearation (each table min 5 columns)


create table students( student_id int primary key,name varchar(50),age int,   course VARCHAR(50),
    city VARCHAR(50));

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50)
);

CREATE TABLE staff (
    staff_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50)
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    quantity INT,
    category VARCHAR(50)
);

CREATE TABLE user (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    password VARCHAR(100),
    city VARCHAR(50)
);

desc students;
-- 3. Insert at least 5 records into students.
insert into students values(1001,"Anbu",21,"Ece","chennai");


insert into students values
(2, 'Rahul', 22, 'Python', 'Chennai'),
(3, 'Kumar', 20, 'Java', 'Madurai'),
(4, 'Priya', 21, 'Testing', 'Coimbatore'),
(5, 'Arun', 23, 'SQL', 'Salem');


-- Insert data into customer
INSERT INTO customer VALUES
(1, 'Ravi', 'ravi@gmail.com', '9876543210', 'Chennai'),
(2, 'Karthik', 'karthik@gmail.com', '9876543211', 'Madurai'),
(3, 'Priya', 'priya@gmail.com', '9876543212', 'Salem'),
(4, 'Divya', 'divya@gmail.com', '9876543213', 'Chennai'),
(5, 'Arun', 'arun@gmail.com', '9876543214', 'Coimbatore');


-- Insert data into staff
INSERT INTO staff VALUES
(1, 'Suresh', 'IT', 45000, 'Chennai'),
(2, 'Meena', 'HR', 40000, 'Madurai'),
(3, 'Ravi', 'Finance', 50000, 'Salem'),
(4, 'Kumar', 'IT', 48000, 'Chennai'),
(5, 'Priya', 'HR', 42000, 'Coimbatore');


-- Insert data into Product
INSERT INTO Product VALUES
(1, 'Laptop', 55000, 10, 'Electronics'),
(2, 'Mouse', 500, 50, 'Electronics'),
(3, 'Keyboard', 1000, 30, 'Electronics'),
(4, 'Notebook', 100, 100, 'Stationery'),
(5, 'Pen', 20, 200, 'Stationery');


-- Insert data into user
INSERT INTO user VALUES
(1, 'anbu', 'anbu@gmail.com', 'anbu123', 'Chennai'),
(2, 'rahul', 'rahul@gmail.com', 'rahul123', 'Madurai'),
(3, 'priya', 'priya@gmail.com', 'priya123', 'Salem'),
(4, 'arun', 'arun@gmail.com', 'arun123', 'Chennai'),
(5, 'kumar', 'kumar@gmail.com', 'kumar123', 'Coimbatore');


SELECT * FROM students;

SELECT * FROM customer;

SELECT * FROM staff;

SELECT * FROM Product;

SELECT * FROM user;

drop database schooldb;

