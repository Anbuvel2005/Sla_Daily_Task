----------------------------------
create database ctefunc;
use ctefunc;


create table employees(emp_id int primary key,emp_name varchar(30) ,department varchar(30) ,salary decimal (10,2));
INSERT INTO employees (emp_id, emp_name, department, salary)
VALUES
(1, 'Anbu', 'IT', 75000.00),
(2, 'Arun', 'HR', 55000.00),
(3, 'Bala', 'IT', 80000.00),
(4, 'Kumar', 'Finance', 65000.00),
(5, 'Ravi', 'HR', 50000.00),
(6, 'Siva', 'IT', 70000.00),
(7, 'Vijay', 'Finance', 90000.00),
(8, 'Raj', 'HR', 60000.00),
(9, 'Mani', 'IT', 85000.00),
(10, 'Karthik', 'Finance', 72000.00);


/*1. Find Employees with Salary Greater Than Average

Table: employees : emp_id , emp_name , department , salary

Create a CTE named avg_salary that calculates the average salary of all employees.

Then display employees whose salary is greater than the average salary.
---------*/
with avg_salary as
(select avg(salary) as average_salary from employees )

select emp_name,department,salary from employees where salary > (select average_salary from avg_salary);

/*2. Calculate Department-Wise Average Salary

Using the employees table above

Create a CTE named dept_salary that calculates the average salary for each department.

Display:department,average_salary*/

with dept_salary as
(select department,  avg(salary) as avg_salary from employees group by department)

select department,avg_salary from dept_salary;


/*3. Find Students Who Scored Above Average

Table: students:student_id , student_name , course , mark

Create a CTE named average_mark to calculate the average mark.

Then display students whose marks are greater than the average mark.

Expected columns:student_name,course,mark*/

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(30),
    course VARCHAR(30),
    mark INT
);


INSERT INTO students (student_id, student_name, course, mark)
VALUES
(1, 'Anbu', 'Java', 85),
(2, 'Arun', 'Java', 72),
(3, 'Bala', 'Python', 90),
(4, 'Kumar', 'Python', 78),
(5, 'Ravi', 'Java', 95),
(6, 'Siva', 'Python', 88),
(7, 'Vijay', 'SQL', 76),
(8, 'Raj', 'SQL', 92),
(9, 'Mani', 'Java', 68),
(10, 'Karthik', 'SQL', 84);

with average_marks 
as
(select avg(mark) as avg_mark from students )

select student_name ,mark from students where mark > (select avg_mark from average_marks);


/*4. Find High-Priced Products

Table: products:product_id , product_name , category , price

Create a CTE named product_data.

Inside the CTE, calculate: product_name,category,price

Then display products whose price is greater than ₹20,000.

*/
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2)
);

INSERT INTO products (product_id, product_name, category, price)
VALUES
(1, 'Laptop', 'Electronics', 65000.00),
(2, 'Mobile', 'Electronics', 25000.00),
(3, 'Headphones', 'Electronics', 5000.00),
(4, 'Smart TV', 'Electronics', 45000.00),
(5, 'Refrigerator', 'Home Appliances', 35000.00),
(6, 'Washing Machine', 'Home Appliances', 18000.00),
(7, 'Tablet', 'Electronics', 22000.00),
(8, 'Office Chair', 'Furniture', 12000.00),
(9, 'Air Conditioner', 'Home Appliances', 40000.00),
(10, 'Keyboard', 'Electronics', 2500.00);

/* 4. Find High-Priced Products */

WITH product_data AS (
    SELECT 
        product_name,
        category,
        price
    FROM products
)
SELECT 
    product_name,
    category,
    price
FROM product_data
WHERE price > 20000;








/*5. Calculate Employee Bonus

Using the employees table:

Create a CTE named employee_bonus.

Calculate a 10% bonus for every employee.

The CTE should contain:emp_id,emp_name,salary,bonus

Then display the employee name, salary, bonus, and total salary.*/

WITH employee_bonus AS (
    SELECT 
        emp_id,
        emp_name,
        salary,
        salary * 0.10 AS bonus
    FROM employees
)
SELECT 
    emp_name,
    salary,
    bonus,
    salary + bonus AS total_salary
FROM employee_bonus;