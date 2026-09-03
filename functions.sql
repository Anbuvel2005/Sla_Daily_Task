
create database func;
use func;
drop database func;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30),
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1, 'Anbu', 50000),
(2, 'Arun', 60000),
(3, 'Bala', 45000),
(4, 'Kumar', 75000),
(5, 'Ravi', 55000);

//*1.. Calculate Employee Annual Salary

Create a function get_annual_salary() that accepts an employee's monthly salary and returns the annual salary.

employees : emp_id ,emp_name ,salary

* Create the function get_annual_salary(monthly_salary)

* Calculate monthly_salary * 12

* Display employee name, monthly salary, and annual salary.*/
delimiter //

create function get_annual_salary(emp_month_sal decimal (10,2))
returns decimal(10,2)
deterministic
begin
return(
 emp_month_sal * 12
);

end
//
delimiter ;

select emp_name,salary as monthly_salary,get_annual_salary(salary) as annual_salary from employees;



/*2. Find Employee Experience

Create a function calculate_experience() that accepts the employee's joining year and returns the number of years of experience.

employees : emp_id ,emp_name joining_year

* Create a function that accepts joining_year.

* Calculate experience using the current year.

* Display employee name, joining year, and experience.*/

CREATE TABLE employees_experience (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30),
    joining_year INT
);


INSERT INTO employees_experience (emp_id, emp_name, joining_year)
VALUES
(1, 'Anbu', 2023),
(2, 'Arun', 2021),
(3, 'Bala', 2024),
(4, 'Kumar', 2020),
(5, 'Ravi', 2022),
(6, 'Siva', 2019),
(7, 'Vijay', 2025);

DELIMITER //

CREATE FUNCTION calculate_experience(emp_joining_year INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN YEAR(CURDATE()) - emp_joining_year;
END //

DELIMITER ;
SELECT 
    emp_name,
    joining_year,
    calculate_experience(joining_year) AS experience
FROM employees_experience;


-- 3

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(30),
    mark INT
);

INSERT INTO students VALUES
(1, 'Anbu', 95),
(2, 'Arun', 82),
(3, 'Bala', 70),
(4, 'Kumar', 55),
(5, 'Ravi', 40);

DELIMITER //

CREATE FUNCTION get_grade(student_mark INT)
RETURNS CHAR(1)
DETERMINISTIC
BEGIN

    IF student_mark >= 90 THEN
        RETURN 'A';
    ELSEIF student_mark >= 75 THEN
        RETURN 'B';
    ELSEIF student_mark >= 60 THEN
        RETURN 'C';
    ELSEIF student_mark >= 50 THEN
        RETURN 'D';
    ELSE
        RETURN 'F';
    END IF;

END //

DELIMITER ;

SELECT 
    student_name,
    mark,
    get_grade(mark) AS grade
FROM students;


-- 4

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(30),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(1, 'Laptop', 60000),
(2, 'Mobile', 30000),
(3, 'Tablet', 20000),
(4, 'Smart TV', 45000),
(5, 'Headphones', 5000);

DELIMITER //

CREATE FUNCTION calculate_discount(
    product_price DECIMAL(10,2),
    discount_percentage DECIMAL(5,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN

    RETURN product_price * discount_percentage / 100;

END //

DELIMITER ;

SELECT 
    product_name,
    price,
    calculate_discount(price, 10) AS discount_amount
FROM products;