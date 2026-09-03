-- Create Tables
create database day6;
use day6;
CREATE TABLE Departments (

dept_id INT PRIMARY KEY,

dept_name VARCHAR(50),

location VARCHAR(50)

);

CREATE TABLE Employees (

emp_id INT PRIMARY KEY,

emp_name VARCHAR(50),

job_title VARCHAR(50),

manager_id INT,

hire_date DATE,

salary DECIMAL(10,2),

dept_id INT,

FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)

);

CREATE TABLE Projects (

project_id INT PRIMARY KEY,

project_name VARCHAR(50),

budget DECIMAL(12,2),

dept_id INT,

FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)

);

CREATE TABLE Employee_Projects (

emp_id INT,

project_id INT,

hours_worked INT,

PRIMARY KEY (emp_id, project_id),

FOREIGN KEY (emp_id) REFERENCES Employees(emp_id),

FOREIGN KEY (project_id) REFERENCES Projects(project_id)

);

INSERT INTO Departments VALUES
(10, 'HR', 'New York'),
(20, 'Engineering', 'San Francisco'),
(30, 'Marketing', 'London'),
(40, 'Sales', 'Chicago'),
(50, 'Legal', 'Toronto');

INSERT INTO Employees VALUES
(101, 'Alice Smith', 'HR Manager', NULL, '2020-01-15', 95000.00, 10),
(102, 'Bob Jones', 'Software Engineer', 105, '2021-03-22', 105000.00, 20),
(103, 'Charlie Brown', 'QA Engineer', 105, '2022-06-01', 70000.00, 20),
(104, 'David Miller', 'Marketing Specialist', 106, '2023-02-10', 65000.00, 30),
(105, 'Emma Davis', 'Engineering Director', NULL, '2019-05-12', 150000.00, 20),
(106, 'Frank Wilson', 'Marketing Director', NULL, '2018-11-20', 140000.00, 30),
(107, 'Grace Lee', 'Sales Rep', 108, '2024-01-05', 55000.00, 40),
(108, 'Henry Clark', 'Sales Manager', NULL, '2017-03-15', 115000.00, 40),
(109, 'Ivy Taylor', 'Software Engineer', 105, '2025-08-19', 98000.00, 20);

INSERT INTO Projects VALUES
(501, 'Apollo Project', 250000.00, 20),
(502, 'Zeus Initiative', 120000.00, 20),
(503, 'Global Branding', 85000.00, 30),
(504, 'CRM Migration', 150000.00, 40),
(505, 'Talent Acquisition', 30000.00, 10);

INSERT INTO Employee_Projects VALUES
(102, 501, 120),
(102, 502, 80),
(103, 501, 150),
(104, 503, 200),
(105, 501, 40),
(107, 504, 180),
(108, 504, 50),
(109, 502, 100);

select * from departments;
select * from employees;
select * from projects;
select * from employee_projects;


 

-- Q26. Find all employees who earn more than the company average salary.

select emp_name,salary from employees where salary > (select avg(salary) from employees);

-- Q27. Find employees who work in the &#39;Engineering&#39; department using a subquery (No Explicit

-- JOIN).


select emp_name,job_title from employees where dept_id = (select dept_id from departments where dept_name = 'Engineering');

-- Q28. Find the names of employees who are working on at least one project.

select emp_name  from employees where emp_id in (select emp_id from employee_projects);

-- Q29. Find the names of employees who are NOT working on any project.

select emp_name from employees where emp_id not in (select emp_id from employee_projects);

-- Q30. Find the project with the highest budget.

select project_name,budget from projects where budget =(select max(budget) from projects  );

-- Q31. Find departments that have a higher-than-average project budget allocation.

select dept_name from departments where dept_id in (select dept_id from projects group by dept_id having avg(budget)> (select avg(budget) from projects));


-- Q32. Find employees who earn more than the maximum salary of the Marketing department.


select emp_name,salary from employees where salary > (select max(salary) from employees where dept_id = 30);

-- Q33. Use a correlated subquery to find employees who earn more than the average salary of

-- their own department.

select emp_name,salary,dept_id from employees e where salary > (select  avg(salary) from employees where dept_id = e.dept_id);

-- Q34. Find the names of departments that actually have employees assigned to them using

-- EXISTS.

SELECT dept_name
FROM departments d
WHERE EXISTS (
    SELECT emp_id
    FROM employees e
    WHERE e.dept_id = d.dept_id
);

-- Q35. Find departments that do not have any projects registered using NOT EXISTS.

select dept_name from departments d where not exists (select project_id from projects p where p.dept_id = d.dept_id);

-- Q36. Select employee names alongside a column showing the total company payroll (Scalar

-- Subquery).

SELECT emp_name, salary,
       (SELECT SUM(salary) FROM employees) AS total_payroll
FROM employees;


-- Q37. Find the oldest employee(s) based on hire date.

select emp_name from employees where hire_date = (select min( hire_date) from employees);

-- Q38. Find the second highest salary in the company.

select max(salary) from employees where salary < (select max(salary) from employees);

-- Q39. Find projects that have a budget greater than all projects managed by the Sales

-- department combined.

SELECT project_name, budget
FROM projects
WHERE budget > (
    SELECT MAX(budget)
    FROM projects
    WHERE dept_id = 20
);

-- Q40. List all employees whose manager works in a different department.     

SELECT emp_name
FROM employees e
WHERE dept_id <> (
    SELECT dept_id
    FROM employees m
    WHERE m.emp_id = e.manager_id
);

-- Q41. Find the name of the department that has the highest number of employees.


select dept_name from departments  where dept_id = (select dept_id  from employees group by dept_id order by count(emp_id) desc limit 1);

-- Q42. Find employees who work on the project with the longest hours logged.

select emp_name from employees where emp_id = (select emp_id from employee_projects group by emp_id order by max(hours_worked) desc limit 1);

 -- Q43. Find departments located in cities starting with &#39;New&#39; or &#39;San&#39; using a subquery.

select dept_name,location from departments where location in(select location from departments where location like 'New%' or location like 'san%');

-- Q44. Fetch employees whose salary is higher than the salary of any employee hired in 2024.

SELECT emp_name, salary
FROM employees
WHERE salary > ANY (
    SELECT salary
    FROM employees
    WHERE hire_date BETWEEN '2024-01-01' AND '2024-12-31'
   
);


-- Q45. Find the names of managers who supervise at least 2 employees.


select emp_name from employees where emp_id in (select manager_id from employees where manager_id is not null group by manager_id having count(*)>= 2);

-- Q46. Get the project names whose budget is lower than the average project budget across the

-- company.

select project_name from projects where budget < (select avg(budget) from projects);

-- Q47. List employee names who are the only ones working on their specific project.


SELECT emp_name
FROM employees e
WHERE 1 = (
    SELECT COUNT(*)
    FROM employees e2
   where  e2.project_id = e.project_id
);


SELECT e.emp_name
FROM employees e
JOIN employee_projects ep
    ON e.emp_id = ep.emp_id
WHERE ep.project_id IN (
    SELECT project_id
    FROM employee_projects
    GROUP BY project_id
    HAVING COUNT(*) = 1
);


-- Q48. Display each employee&#39;s name, salary, and the difference between their salary and their

-- department&#39;s average salary using a subquery in the SELECT clause.

SELECT emp_name,
       salary,
       salary - (
           SELECT AVG(e2.salary)
           FROM employees e2
           WHERE e2.dept_id = e.dept_id
       ) AS salary_difference
FROM employees e;

SELECT dept_name
FROM departments
WHERE dept_id IN (
    SELECT dept_id
    FROM employees
    GROUP BY dept_id
    HAVING SUM(salary) <= ALL (
        SELECT SUM(salary)
        FROM employees
        GROUP BY dept_id
    )
);
SELECT project_name
FROM projects
WHERE project_id IN (
    SELECT ep.project_id
    FROM employee_projects ep
    JOIN employees e
        ON ep.emp_id = e.emp_id
    WHERE e.dept_id = (
        SELECT dept_id
        FROM departments
        WHERE dept_name = 'Engineering'
    )
);