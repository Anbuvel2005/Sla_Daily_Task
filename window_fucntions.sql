create database windowfunc;
use windowfunc;


CREATE TABLE students1 (id INT,class VARCHAR(10),name VARCHAR(50),marks INT);

INSERT INTO students1 VALUES(1, 'A', 'John', 85),(2, 'A', 'Sara', 92),(3, 'A', 'Mike', 78),(4, 'B', 'Anna', 88),(5, 'B', 'Tom', 90);

select * from students1;
select * from exam1;
select * from  employees11;
select * from orders ;

CREATE TABLE exam1 (student VARCHAR(50),subject VARCHAR(20),score INT);

INSERT INTO exam1 VALUES('Alice', 'Math', 90),('Bob', 'Math', 90),('Charlie', 'Math', 85),('David', 'Science', 88),('Eva', 'Science', 88);



CREATE TABLE employees11 (emp_name VARCHAR(50),department VARCHAR(20),salary INT);

INSERT INTO employees11 VALUES('Alex', 'IT', 7000),('Brian', 'IT', 7000),('Chris', 'IT', 6500),('Diana', 'HR', 6000),('Eva', 'HR', 5800);



CREATE TABLE orders (order_id INT,order_date DATE, amount INT);

INSERT INTO orders VALUES(1, '2024-01-01', 100),(2, '2024-01-02', 200),(3, '2024-01-03', 150),(4, '2024-01-04', 300);



CREATE TABLE monthly_sales (month VARCHAR(10), sales INT);

INSERT INTO monthly_sales VALUES('Jan', 5000),('Feb', 6000),('Mar', 5500),('Apr', 7000);

-- 1. Assign a unique row number to students in each class based on highest marks.

select class,marks,
row_number() over (partition by class order by marks desc) as row_num
from students1;

 -- 2.Rank students in each class based on marks (with gaps).
 
 select class,marks,
 rank() over (partition by class order by marks) as rank_of_the_students
 from students1;
 
 -- 3. Rank students in each class based on marks (without gaps).
 
 select class,marks,
 dense_rank() over (partition by class order by marks) as stud_rank
 from students1;


-- 4. Display average marks of each class along with every student.

select class,name,
marks,avg(marks) over (partition by class) as avg_marks
from students1;


-- 5. Show the highest marks scored in each class for every student.
select class,name,marks,
max(marks) over (partition by class) as higest_mark_in_class
from students1;

-- 6. Assign row numbers to students per subject based on score.
select subject,student,score,
row_number() over (partition by subject order by score desc) as row_num_students
from exam1;

-- 7. Rank students per subject (with gaps)

SELECT 
    subject,
    student,
    score,
    RANK() OVER (
        PARTITION BY subject 
        ORDER BY score DESC
    ) AS student_rank
FROM exam1;

-- 8. Rank students per subject (without gaps).
select subject,student,
dense_rank() over (partition by subject order by score desc) as student_rank
from exam1;

-- 9. Show total number of students appearing in each subject.

select distinct subject,
count(*) over(partition by subject) as number_of_students
from exam1;

-- 10. Display the minimum score for each subject.

select
 distinct subject,
min(score) over (partition by subject) as min_score
from exam1;

-- 11. Assign row numbers to employees per department by salary.

select emp_name,
department,salary,
row_number() over (partition by department order by salary desc) as employee_row_num
from employees11;

-- 12. Rank employees per department based on salary.

select emp_name,
department,salary,
rank() over (partition by department order by salary desc) as emp_rank
from employees11;


-- 13. Rank employees per department without gaps.

select emp_name,
department,salary,
dense_rank() over (partition by department order by salary desc) as emp_rank
from employees11;

-- 14. Show total salary paid in each department.

select distinct department,
sum(salary) over (partition by department) as total_salary
from employees11;

-- 15. Display average salary of each department.
select distinct department,
avg(salary) over (partition by department) as total_salary
from employees11;


-- 16. Assign row numbers based on order date.


select order_id,order_date,amount,
row_number() over(order by order_date desc) as order_num
from orders;

-- 17. Calculate running total of order amounts.

SELECT 
    order_id,
    order_date,
    amount,
    SUM(amount) OVER (
        ORDER BY order_date
    ) AS running_total
FROM orders;

-- 18. Calculate moving average of last 2 orders.

SELECT 
    order_id,
    order_date,
    amount,
    AVG(amount) OVER (
        ORDER BY order_date, order_id
        ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
    ) AS moving_avg
FROM orders;

SELECT 
    order_id,
    order_date,
    amount,
    MAX(amount) OVER (
        ORDER BY order_date, order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS max_amount_till_now
FROM orders;

SELECT 
    order_id,
    order_date,
    amount,
    COUNT(*) OVER () AS total_orders
FROM orders;

SELECT 
    order_id,
    order_date,
    amount,
    ROW_NUMBER() OVER (
        ORDER BY MONTH(order_date)
    ) AS row_num
FROM orders;

WITH monthly_sales AS (
    SELECT 
        DATE_FORMAT(order_date, '%Y-%m') AS month,
        SUM(amount) AS total_sales
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT 
    month,
    total_sales,
    LAG(total_sales) OVER (
        ORDER BY month
    ) AS previous_month_sales
FROM monthly_sales;


WITH monthly_sales AS (
    SELECT 
        DATE_FORMAT(order_date, '%Y-%m') AS month,
        SUM(amount) AS total_sales
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT 
    month,
    total_sales,
    LAG(total_sales) OVER (
        ORDER BY month
    ) AS previous_month_sales
FROM monthly_sales;

WITH monthly_sales AS (
    SELECT 
        DATE_FORMAT(order_date, '%Y-%m') AS month,
        SUM(amount) AS total_sales
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT 
    month,
    total_sales,
    LEAD(total_sales) OVER (
        ORDER BY month
    ) AS next_month_sales
FROM monthly_sales;

WITH monthly_sales AS (
    SELECT 
        DATE_FORMAT(order_date, '%Y-%m') AS month,
        SUM(amount) AS total_sales
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT 
    month,
    total_sales,
    total_sales - LAG(total_sales) OVER (
        ORDER BY month
    ) AS difference_from_previous
FROM monthly_sales;

WITH monthly_sales AS (
    SELECT 
        DATE_FORMAT(order_date, '%Y-%m') AS month,
        SUM(amount) AS total_sales
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT 
    month,
    total_sales,
    SUM(total_sales) OVER (
        ORDER BY month
    ) AS cumulative_sales
FROM monthly_sales;

WITH monthly_sales AS (
    SELECT 
        DATE_FORMAT(order_date, '%Y-%m') AS month,
        SUM(amount) AS total_sales
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT 
    month,
    total_sales,
    SUM(total_sales) OVER (
        ORDER BY month
    ) AS cumulative_sales
FROM monthly_sales;