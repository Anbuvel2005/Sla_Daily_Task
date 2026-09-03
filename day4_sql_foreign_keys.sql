-- 6. Create Customer and Orders table

--  Customer Table :CustomerID(pk),CustomerName,Phone

--  Orders Table :OrderID(pk),CustomerID(fk),OrderDate,Amount,OrderStatus

-- Add CustomerID as a Foreign Key in Orders,Add a CHECK constraint to ensure Amount > 0.

--  Set the default OrderStatus as 'Pending'.


use sla;

create table customers(customerId int Primary key,customerName varchar(15),phone varchar(10));
create table `Order`(OrderId int Primary key,customerId int,OrderDate date,Amount int,OrderStatus varchar(30));

alter table `order` add constraint fk_key foreign key(CustomerId) references customers(customerId);
alter table `order` add constraint ch_key check(amount>0);

alter table `order` alter column  orderstatus set default  'pending';


-- 
-- 7. Hospital and Doctor

-- Doctor Table : DoctorID(pk),DoctorName,Specialization

-- Patient Table:PatientID(pk),PatientName,Age,DoctorID(fk),Status

-- Add DoctorID as a Foreign Key in Patient.Add a CHECK constraint to ensure Age > 0.

-- Set the default Status as 'Active'.

drop table doctor;
drop table patient;

create table doctor(DoctorID int primary key,Doctorname varchar(30),specialization varchar(30));
create table Patient(PatientID int primary key,Patientname varchar(30),Age int,DocterID int,status varchar(30), foreign key(DocterID) references Doctor(DoctorID));
ALTER TABLE Patient
ADD CONSTRAINT chk_age
CHECK (Age > 0);

alter table  Patient alter column status set default  'Active';
desc patient;
select * from doctor;
select * from patient;

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(30),
    Phone VARCHAR(10)
);

CREATE TABLE Account (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(30),
    Balance INT,
    AccountStatus VARCHAR(30)
);

ALTER TABLE Account
ADD CONSTRAINT fk_account_customer
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);

ALTER TABLE Account
ADD CONSTRAINT chk_balance
CHECK (Balance >= 0);

ALTER TABLE Account
MODIFY AccountStatus VARCHAR(30) DEFAULT 'Active';


CREATE TABLE Publisher (
    PublisherID INT PRIMARY KEY,
    PublisherName VARCHAR(30),
    City VARCHAR(30)
);

CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    BookName VARCHAR(30),
    PublisherID INT,
    Price INT,
    AvailableCopies INT
);

ALTER TABLE Book
ADD CONSTRAINT fk_book_publisher
FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID);

ALTER TABLE Book
ADD CONSTRAINT chk_price
CHECK (Price > 0);

ALTER TABLE Book
MODIFY AvailableCopies INT DEFAULT 1;

CREATE TABLE Teacher (
    TeacherID INT PRIMARY KEY,
    TeacherName VARCHAR(30),
    Experience INT
);

CREATE TABLE Subject (
    SubjectID INT PRIMARY KEY,
    SubjectName VARCHAR(30),
    TeacherID INT,
    SubjectStatus VARCHAR(30)
);

ALTER TABLE Subject
ADD CONSTRAINT fk_subject_teacher
FOREIGN KEY (TeacherID) REFERENCES Teacher(TeacherID);

ALTER TABLE Teacher
ADD CONSTRAINT chk_experience
CHECK (Experience >= 0);

ALTER TABLE Subject
MODIFY SubjectStatus VARCHAR(30) DEFAULT 'Available';