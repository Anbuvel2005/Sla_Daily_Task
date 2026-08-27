CREATE DATABASE sub3;
USE sub3;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Duration INT
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    CourseID INT,
    DepartmentID INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY,
    SubjectName VARCHAR(50)
);

CREATE TABLE Marks (
    MarkID INT PRIMARY KEY,
    StudentID INT,
    SubjectID INT,
    Marks INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);

INSERT INTO Departments VALUES
(1, 'Computer Science'),
(2, 'Electronics'),
(3, 'Mechanical'),
(4, 'Civil'),
(5, 'Information Technology');

INSERT INTO Courses VALUES
(101, 'B.Sc Computer Science', 3),
(102, 'B.E Electronics', 4),
(103, 'B.E Mechanical', 4),
(104, 'B.E Civil', 4),
(105, 'B.Tech Information Technology', 4);

INSERT INTO Students VALUES
(1, 'Arun', 101, 1),
(2, 'Bala', 101, 1),
(3, 'Charan', 105, 5),
(4, 'Divya', 102, 2),
(5, 'Esha', 102, 2),
(6, 'Farhan', 103, 3),
(7, 'Gokul', 104, 4),
(8, 'Harini', 105, 5),
(9, 'Ishaan', 101, 1),
(10, 'Jaya', 102, 2);

INSERT INTO Subjects VALUES
(201, 'Database Management'),
(202, 'Java Programming'),
(203, 'Data Structures'),
(204, 'Computer Networks'),
(205, 'Operating Systems');

INSERT INTO Marks VALUES
(1, 1, 201, 85),
(2, 1, 202, 78),
(3, 1, 203, 92),
(4, 2, 201, 72),
(5, 2, 202, 88),
(6, 2, 203, 75),
(7, 3, 201, 95),
(8, 3, 202, 91),
(9, 3, 204, 89),
(10, 4, 201, 68),
(11, 4, 202, 74),
(12, 4, 203, 81),
(13, 5, 201, 90),
(14, 5, 202, 85),
(15, 5, 204, 93),
(16, 6, 201, 76),
(17, 6, 203, 82),
(18, 6, 205, 79),
(19, 7, 201, 88),
(20, 7, 204, 91),
(21, 7, 205, 84),
(22, 8, 201, 94),
(23, 8, 202, 96),
(24, 8, 203, 90),
(25, 9, 201, 79),
(26, 9, 202, 83),
(27, 9, 203, 87),
(28, 10, 201, 71),
(29, 10, 202, 77),
(30, 10, 204, 80);

SELECT s.StudentName, c.CourseName, d.DepartmentName,
       sub.SubjectName, m.Marks
FROM Students s
JOIN Courses c ON s.CourseID = c.CourseID
JOIN Departments d ON s.DepartmentID = d.DepartmentID
JOIN Marks m ON s.StudentID = m.StudentID
JOIN Subjects sub ON m.SubjectID = sub.SubjectID;


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(30),
    DepartmentID INT,
    DesignationID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Designations (
    DesignationID INT PRIMARY KEY,
    DesignationName VARCHAR(30)
);

CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY,
    EmployeeID INT,
    BasicSalary DECIMAL(10,2),
    Bonus DECIMAL(10,2),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Locations (
    LocationID INT PRIMARY KEY,
    DepartmentID INT,
    City VARCHAR(30),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Employees VALUES
(1, 'Arun', 2, 102),
(2, 'Bala', 2, 103),
(3, 'Charan', 1, 101),
(4, 'Divya', 3, 104),
(5, 'Esha', 4, 105),
(6, 'Farhan', 5, 106),
(7, 'Gokul', 2, 102),
(8, 'Harini', 4, 105);

INSERT INTO Designations VALUES
(101, 'Manager'),
(102, 'Software Engineer'),
(103, 'Senior Engineer'),
(104, 'Marketing Executive'),
(105, 'Sales Executive'),
(106, 'Accountant');

INSERT INTO Salaries VALUES
(1001, 1, 50000.00, 5000.00),
(1002, 2, 75000.00, 8000.00),
(1003, 3, 85000.00, 10000.00),
(1004, 4, 45000.00, 4000.00),
(1005, 5, 40000.00, 3500.00),
(1006, 6, 55000.00, 6000.00),
(1007, 7, 52000.00, 5000.00),
(1008, 8, 42000.00, 3000.00);

INSERT INTO Locations VALUES
(1, 1, 'Chennai'),
(2, 2, 'Bangalore'),
(3, 3, 'Mumbai'),
(4, 4, 'Delhi'),
(5, 5, 'Hyderabad');

SELECT e.EmployeeName, d.DepartmentName, des.DesignationName,
       s.BasicSalary, s.Bonus, l.City
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
JOIN Designations des ON e.DesignationID = des.DesignationID
JOIN Salaries s ON e.EmployeeID = s.EmployeeID
JOIN Locations l ON d.DepartmentID = l.DepartmentID;


CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    CategoryID INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Categories VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Food'),
(4, 'Books'),
(5, 'Furniture');

INSERT INTO Products VALUES
(101, 'Laptop', 1, 60000),
(102, 'Mobile Phone', 1, 30000),
(103, 'Headphones', 1, 2000),
(104, 'T-Shirt', 2, 1000),
(105, 'Jeans', 2, 2000),
(106, 'Pizza', 3, 500),
(107, 'Burger', 3, 250),
(108, 'Java Book', 4, 800),
(109, 'SQL Book', 4, 600),
(110, 'Office Chair', 5, 5000);

INSERT INTO Customers VALUES
(1, 'Arun', 'Chennai'),
(2, 'Bala', 'Bangalore'),
(3, 'Charan', 'Mumbai'),
(4, 'Divya', 'Delhi'),
(5, 'Esha', 'Hyderabad');

INSERT INTO Orders VALUES
(1001, 1, '2026-08-01'),
(1002, 2, '2026-08-02'),
(1003, 1, '2026-08-03'),
(1004, 3, '2026-08-04'),
(1005, 4, '2026-08-05'),
(1006, 5, '2026-08-06');

INSERT INTO OrderDetails VALUES
(1, 1001, 101, 1),
(2, 1001, 103, 2),
(3, 1002, 104, 3),
(4, 1002, 105, 1),
(5, 1003, 102, 1),
(6, 1003, 108, 2),
(7, 1004, 106, 4),
(8, 1004, 107, 2),
(9, 1005, 109, 1),
(10, 1005, 110, 1),
(11, 1006, 101, 1),
(12, 1006, 104, 2);

SELECT c.CustomerName, o.OrderDate, p.ProductName,
       cat.CategoryName, od.Quantity, p.Price
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories cat ON p.CategoryID = cat.CategoryID;


CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(50),
    Gender VARCHAR(10),
    DoctorID INT
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE Medicines (
    MedicineID INT PRIMARY KEY,
    MedicineName VARCHAR(50)
);

CREATE TABLE Prescriptions (
    PrescriptionID INT PRIMARY KEY,
    AppointmentID INT,
    MedicineID INT,
    Dosage VARCHAR(50),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID),
    FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID)
);

INSERT INTO Patients VALUES
(1, 'Rahul', 'Male', 1),
(2, 'Priya', 'Female', 2),
(3, 'Karthik', 'Male', 3),
(4, 'Anitha', 'Female', 1),
(5, 'Vijay', 'Male', 2);

INSERT INTO Doctors VALUES
(1, 'Dr. Kumar', 1),
(2, 'Dr. Priya', 2),
(3, 'Dr. Raj', 3),
(4, 'Dr. Meena', 4),
(5, 'Dr. Arjun', 5);

INSERT INTO Appointments VALUES
(1001, 1, 1, '2026-08-01'),
(1002, 2, 2, '2026-08-02'),
(1003, 3, 3, '2026-08-03'),
(1004, 4, 1, '2026-08-04'),
(1005, 5, 2, '2026-08-05');

INSERT INTO Medicines VALUES
(201, 'Paracetamol'),
(202, 'Amoxicillin'),
(203, 'Cetirizine'),
(204, 'Ibuprofen'),
(205, 'Azithromycin');

INSERT INTO Prescriptions VALUES
(1, 1001, 201, '500mg - Twice a day'),
(2, 1001, 203, '10mg - Once a day'),
(3, 1002, 202, '500mg - Three times a day'),
(4, 1003, 204, '400mg - Twice a day'),
(5, 1004, 201, '500mg - Once a day'),
(6, 1005, 205, '250mg - Twice a day');

SELECT p.PatientName, d.DoctorName, dept.DepartmentName,
       a.AppointmentDate, m.MedicineName, pr.Dosage
FROM Patients p
JOIN Appointments a ON p.PatientID = a.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
JOIN Departments dept ON d.DepartmentID = dept.DepartmentID
JOIN Prescriptions pr ON a.AppointmentID = pr.AppointmentID
JOIN Medicines m ON pr.MedicineID = m.MedicineID;


CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT,
    AssignedDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

CREATE TABLE Managers (
    ManagerID INT PRIMARY KEY,
    ManagerName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Projects VALUES
(101, 'Banking Application', 1),
(102, 'E-Commerce Website', 2),
(103, 'Mechanical Design', 3),
(104, 'Construction Project', 4),
(105, 'IT Support System', 5);

INSERT INTO EmployeeProjects VALUES
(1, 102, '2026-08-01'),
(2, 102, '2026-08-02'),
(3, 101, '2026-08-03'),
(4, 103, '2026-08-04'),
(5, 104, '2026-08-05'),
(6, 105, '2026-08-06'),
(7, 102, '2026-08-07'),
(8, 104, '2026-08-08');

INSERT INTO Managers VALUES
(1, 'Ramesh', 1),
(2, 'Suresh', 2),
(3, 'Kumar', 3),
(4, 'Rajesh', 4),
(5, 'Mohan', 5);

SELECT e.EmployeeName, d.DepartmentName, p.ProjectName,
       ep.AssignedDate, m.ManagerName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
JOIN Projects p ON ep.ProjectID = p.ProjectID
JOIN Managers m ON d.DepartmentID = m.DepartmentID;


CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    CourseID INT
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY,
    SubjectName VARCHAR(50)
);

CREATE TABLE Marks (
    MarkID INT PRIMARY KEY,
    StudentID INT,
    SubjectID INT,
    Marks INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);

INSERT INTO Courses VALUES
(101, 'Computer Science'),
(102, 'Electronics'),
(103, 'Mechanical');

INSERT INTO Students VALUES
(1, 'Arun', 101),
(2, 'Bala', 101),
(3, 'Charan', 102),
(4, 'Divya', 102),
(5, 'Esha', 103);

INSERT INTO Subjects VALUES
(201, 'Java'),
(202, 'SQL'),
(203, 'Python');

INSERT INTO Marks VALUES
(1, 1, 201, 85),
(2, 2, 201, 65),
(3, 3, 202, 90),
(4, 4, 202, 70),
(5, 5, 203, 95);

SELECT StudentName, Marks
FROM Students s
JOIN Marks m
ON s.StudentID = m.StudentID
WHERE Marks > (
    SELECT AVG(Marks)
    FROM Marks
);


-- TASK 2 – EMPLOYEE SALARY

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY,
    EmployeeID INT,
    BasicSalary DECIMAL(10,2),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Designations (
    DesignationID INT PRIMARY KEY,
    DesignationName VARCHAR(50)
);

CREATE TABLE EmployeeDesignations (
    EmployeeID INT,
    DesignationID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (DesignationID) REFERENCES Designations(DesignationID)
);

INSERT INTO Departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');

INSERT INTO Employees VALUES
(1, 'Arun', 1),
(2, 'Bala', 1),
(3, 'Charan', 2),
(4, 'Divya', 2),
(5, 'Esha', 3);

INSERT INTO Salaries VALUES
(101, 1, 50000),
(102, 2, 75000),
(103, 3, 45000),
(104, 4, 60000),
(105, 5, 85000);

INSERT INTO Designations VALUES
(201, 'Developer'),
(202, 'Tester'),
(203, 'Manager');

INSERT INTO EmployeeDesignations VALUES
(1, 201),
(2, 201),
(3, 202),
(4, 202),
(5, 203);

SELECT EmployeeName, BasicSalary
FROM Employees e
JOIN Salaries s
ON e.EmployeeID = s.EmployeeID
WHERE BasicSalary > (
    SELECT AVG(BasicSalary)
    FROM Salaries
);


-- TASK 3 – PRODUCT AND CATEGORY

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    CategoryID INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Categories VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books');

INSERT INTO Products VALUES
(101, 'Laptop', 1, 60000),
(102, 'Mobile', 1, 30000),
(103, 'Headphones', 1, 2000),
(104, 'Shirt', 2, 1500),
(105, 'Jeans', 2, 2500),
(106, 'Java Book', 3, 800),
(107, 'SQL Book', 3, 1200);

INSERT INTO Customers VALUES
(1, 'Arun'),
(2, 'Bala'),
(3, 'Charan');

INSERT INTO Orders VALUES
(1001, 1),
(1002, 2),
(1003, 3);

INSERT INTO OrderDetails VALUES
(1, 1001, 101, 1),
(2, 1002, 104, 2),
(3, 1003, 106, 1);

SELECT ProductName, Price, CategoryID
FROM Products p
WHERE Price > (
    SELECT AVG(Price)
    FROM Products p2
    WHERE p.CategoryID = p2.CategoryID
);


-- TASK 4 – DEPARTMENT AND EMPLOYEES

CREATE TABLE Employees2 (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2)
);

CREATE TABLE Departments2 (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments2(DepartmentID)
);

CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees2(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

INSERT INTO Departments2 VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');

INSERT INTO Employees2 VALUES
(1, 'Arun', 1, 50000),
(2, 'Bala', 1, 70000),
(3, 'Charan', 1, 60000),
(4, 'Divya', 2, 45000),
(5, 'Esha', 2, 65000),
(6, 'Farhan', 3, 80000);

INSERT INTO Projects VALUES
(101, 'Website', 1),
(102, 'Recruitment', 2),
(103, 'Banking', 3);

INSERT INTO EmployeeProjects VALUES
(1, 101),
(2, 101),
(3, 101),
(4, 102),
(5, 102),
(6, 103);

SELECT EmployeeName, Salary, DepartmentID
FROM Employees2 e
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees2 e2
    WHERE e.DepartmentID = e2.DepartmentID
);


-- TASK 5 – CUSTOMERS AND ORDERS

CREATE TABLE Customers2 (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Orders2 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers2(CustomerID)
);

CREATE TABLE OrderDetails2 (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders2(OrderID)
);

CREATE TABLE Products2 (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Categories2 (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

INSERT INTO Customers2 VALUES
(1, 'Arun', 'Chennai'),
(2, 'Bala', 'Bangalore'),
(3, 'Charan', 'Mumbai'),
(4, 'Divya', 'Delhi'),
(5, 'Esha', 'Hyderabad');

INSERT INTO Orders2 VALUES
(1001, 1, '2026-08-01'),
(1002, 1, '2026-08-02'),
(1003, 1, '2026-08-03'),
(1004, 2, '2026-08-04'),
(1005, 2, '2026-08-05'),
(1006, 3, '2026-08-06'),
(1007, 4, '2026-08-07');

INSERT INTO Products2 VALUES
(101, 'Laptop', 60000),
(102, 'Mobile', 30000),
(103, 'Headphones', 2000);

INSERT INTO Categories2 VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books');

INSERT INTO OrderDetails2 VALUES
(1, 1001, 101, 1),
(2, 1002, 102, 1),
(3, 1003, 103, 2),
(4, 1004, 101, 1),
(5, 1005, 102, 1),
(6, 1006, 103, 1),
(7, 1007, 101, 1);

SELECT CustomerID, CustomerName, TotalOrders
FROM (
    SELECT 
        c.CustomerID,
        c.CustomerName,
        COUNT(o.OrderID) AS TotalOrders
    FROM Customers2 c
    JOIN Orders2 o
    ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID, c.CustomerName
) x
WHERE TotalOrders > (
    SELECT AVG(OrderCount)
    FROM (
        SELECT COUNT(OrderID) AS OrderCount
        FROM Orders2
        GROUP BY CustomerID
    ) 
);