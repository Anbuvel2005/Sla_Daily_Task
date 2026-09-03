use sla;
CREATE TABLE departments (dept_id INT,dept_name VARCHAR(50));
CREATE TABLE employee1 (emp_id INT,emp_name VARCHAR(50),dept_id INT,manager_id INT,salary INT);

select * from employee1;
CREATE TABLE projects (project_id INT,project_name VARCHAR(50),dept_id INT);

CREATE TABLE emp_projects (emp_id INT,project_id INT);

CREATE TABLE locations (location_id INT,dept_id INT,city VARCHAR(50));

drop table departments;
drop table employee1;
drop table projects ;
 drop table emp_projects;
drop table locations ;
-- -----------------------------------------------------------------------------

INSERT INTO departments VALUES(1, 'IT'),(2, 'HR'),(3, 'Finance'),(4, 'Sales');

INSERT INTO employee1 VALUES(1, 'Alice', 1, NULL, 80000),(2, 'Bob', 1, 1, 60000),(3, 'Charlie', 2, 1, 50000),(4, 'David', 3, 2, 70000),(5, 'Eva', NULL, 2, 45000);

INSERT INTO projects VALUES(101, 'Website', 1),(102, 'Payroll', 3),(103, 'Recruitment', 2);

INSERT INTO emp_projects VALUES(1, 101),(2, 101),(3, 103),(4, 102);

INSERT INTO locations VALUES(1, 1, 'New York'),(2, 2, 'London'),(3, 3, 'Tokyo');

-- ------------------------------------------------------------



-- 1.Get employee names with their department names.

select * from employee1;

select e.emp_name ,d.dept_name from employee1 e inner join departments d on e.dept_id = d.dept_id;

-- 2.Get all employees including those without departments.

select e.emp_id,e.emp_name,d.dept_name from employee1 e left join departments d on e.dept_id = d.dept_id;

-- 3.Get all departments even if no employees exist.

select e.emp_name,d.dept_name from employee1 e right join departments d on e.dept_id = d.dept_id;

-- 4.Find employees working on projects.

SELECT e.emp_name, p.project_name
FROM employee1 e
INNER JOIN projects p
ON e.dept_id = p.dept_id;

-- 5.Find employees NOT assigned to any project.

select e.emp_name,p.project_name from employee1 e left join projects p on e.dept_id = p.dept_id where p.dept_id is null;

-- 6.List projects with department name.
select p.project_name,d.dept_name from projects p inner join departments d on p.dept_id = d.dept_id;

-- 7.Get employee names with department and city.

select e.emp_name,d.dept_name,l.city from employee1 e inner join departments d on e.dept_id = d.dept_id inner join locations l on d.dept_id = l.dept_id;

-- 8.Get employees and their manager names (SELF JOIN).

select e.emp_name as employee_name ,m.emp_name as manager_name from employee1 e left join  employee1 m on  e.manager_id = m.emp_id;
select * from employee1;

-- 9.Find departments with no projects.

use sla;
select d.dept_name from departments d left join projects p on d.dept_id = p.dept_id where p.dept_id is null;

-- 10.Get employees earning more than their manager.

select e.emp_name as employee_name,e.salary as employee_salary,m.emp_name as manager_name,m.salary as employee_salary from employee1 e join employee1 m on e.manager_id = m.emp_id where e.salary>m.salary;

-- 11.Show department-wise employee count.

select  d.dept_name ,count(e.emp_id) as employee_count from departments d left join employee1 e on e.dept_id = d.dept_id group by d.dept_name;

-- 12.List employees with no department.

SELECT e.emp_name, d.dept_name
FROM employee1 e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;


-- 13.Get project count per department.
select d.dept_name,count(p.project_id) as project_count from projects p left join departments d on p.dept_id = d.dept_id group by d.dept_name;


-- 14.Find employees working in IT department.

select e.emp_name ,d.dept_name from employee1 e inner join departments d on e.dept_id = d.dept_id where d.dept_name = "IT";

-- 15.Get employees with their project names (if any).

select e.emp_name ,p.project_name from employee1 e left join projects p on e.dept_id = p.dept_id;

-- 16.Get departments and their locations.

select d.departments,l.city from departments d inner join locations l on d.dept_id = l.dept_id;

-- 17.Find employees working in Tokyo.

select e.emp_name,l.city from employee1 e inner join locations l on e.dept_id = l.dept_id where l.city = 'Tokyo';

-- 18.Show project name with employee count.

select p.project_name, count(e.emp_id) as employee_count from projects p left join employee1 e on p.dept_id = e.dept_id group by p.project_name;

-- 19.Find departments having more than 1 employee.

select d.dept_name ,count(e.emp_id) from departments d inner join employee1 e on d.dept_id = e.dept_id group by d.dept_name having count(e.emp_id) >1;

-- 20.Get employees and their department & project.

select e.emp_id,e.emp_name,d.dept_id,d.dept_name,p.project_id,p.project_name from employee1 e inner join departments d inner join projects p on e.dept_id =d.dept_id and e.dept_id=p.dept_id;
SELECT e.emp_id,
       e.emp_name,
       d.dept_id,
       d.dept_name,
       p.project_id,
       p.project_name
FROM employee1 e
INNER JOIN departments d
ON e.dept_id = d.dept_id
INNER JOIN projects p
ON e.dept_id = p.dept_id;

-- 21.Find employees without managers.

select e.emp_name,m.emp_name as manager_name from employee1 e left join employee1 m on e.manager_id = m.emp_id where e.manager_id is null;

-- 22.Get all possible employee–project combinations (CROSS JOIN).

SELECT *
FROM employee1 e
CROSS JOIN projects p;

-- 23.Find employees who work in same department as Alice.

select e.emp_name ,a.emp_name,e.dept_id from employee1 e join employee1 a on e.dept_id = a.dept_id where a.emp_name = 'Alice';

-- 24.FULL OUTER JOIN (Departments & Employees) – MySQL way.
SELECT d.dept_id,
       d.dept_name,
       e.emp_id,
       e.emp_name
FROM departments d
LEFT JOIN employee1 e
ON d.dept_id = e.dept_id

UNION

SELECT d.dept_id,
       d.dept_name,
       e.emp_id,
       e.emp_name
FROM departments d
RIGHT JOIN employee1 e
ON d.dept_id = e.dept_id;

-- 25.Find departments with employees but no location.

select d.dept_name,e.emp_name,l.city from employee1 e left join departments d on e.dept_id = d.dept_id left join locations l on e.dept_id = l.dept_id where l.dept_id is NULL;