-- 1. Create a Student table with:

-- StudentID,StudentName,Email,Age,Address

-- Make StudentID the Primary Key & make Email a Unique Key.

use sla;

create table student(StudentID int,StudentName varchar(30),Email varchar(30),age int,address varchar(50));

alter table student add constraint pk_stu primary key(StudentID);

desc student;


-- 2. Create an Employee table with:

-- EmployeeID,EmployeeName,Desg,Salary,Email,Phone

-- Set EmployeeID as the Primary Key.

-- Set both Email and Phone as Unique Keys.


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(30),
    Desg VARCHAR(30),
    Salary INT,
    Email VARCHAR(50),
    Phone VARCHAR(15)
);

drop table Employees;
INSERT INTO Employees
VALUES
(1001, 'Anbu', 'dev', 100000, 'anbuvelecetech@gmail.com', '6381471504'),
(1002, 'Arun', 'tester', 50000, 'arun@gmail.com', '9876543210'),
(1003, 'Kumar', 'dev', 80000, 'kumar@gmail.com', '9123456780'),
(1004, 'Ravi', 'manager', 120000, 'ravi@gmail.com', '9000000001'),
(1005, 'Vijay', 'dev', 90000, 'vijay@gmail.com', '8888888888');

alter table employees add constraint uk_employees unique key (email,phone);
desc employees;


-- 3. Create a Product table with:

-- ProductID,ProductName,ProductCode,ProdDescription,Price

-- Make ProductID the Primary Key & Make ProductCode a Unique Key.

-- Insert 5 products and try inserting a duplicate ProductCode.

create table Product(productID int ,ProductName varchar(30),ProductCode int,ProdDescription varchar(100),price int);

alter table product add constraint product_key primary key(productID);

alter table product add constraint product_key unique key(ProductCode);

insert into product values(1001,'mobile',123,"good to use",20000);
insert into product values(1002,'AC',125,"good  use",20000);
insert into product values(1003,'washing machine',1234," use",30000);
insert into product values(1004,'inverter',523,"super to use",40000);
insert into product values(1005,'mobile',323,"please !good  to use",50000);

-- 4. Create a Course table with:

-- CourseID,CourseName,CourseCode,Duration,CourseFee

-- Set CourseID as the Primary Key & Set CourseCode as a Unique Key.

-- Try inserting two courses with the same CourseCode.

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    CourseCode VARCHAR(20) UNIQUE,
    Duration VARCHAR(20),
    CourseFee INT
);

INSERT INTO Course
VALUES
(101, 'Java Full Stack', 'JFS101', '6 Months', 50000),
(102, 'Python Full Stack', 'PFS102', '6 Months', 45000),
(103, 'Web Development', 'WEB103', '4 Months', 30000);

SELECT * FROM Course;
INSERT INTO Course
VALUES (104, 'Advanced Java', 'JFS101', '3 Months', 25000);

-- 5. Create a Users table with:

-- UserID,Username,Email,Password

-- Make UserID the Primary Key & Make both Username and Email Unique Keys.

-- Insert sample users and test duplicate Username and Email values.

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(30) UNIQUE,
    Email VARCHAR(50) UNIQUE,
    Password VARCHAR(30)
);
INSERT INTO Users
VALUES
(1, 'Anbu', 'anbu@gmail.com', 'anbu123'),
(2, 'Arun', 'arun@gmail.com', 'arun123'),
(3, 'Kumar', 'kumar@gmail.com', 'kumar123');

SELECT * FROM Users;

INSERT INTO Users
VALUES (5, 'Anbu5', 'anbu@gmail.com', 'test123');