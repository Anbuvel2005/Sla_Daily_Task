create database storage1;
use storage1;

drop database storage1;


CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    RegistrationDate DATE
);

-- 1: Create a stored procedure to add a new customer.

delimiter //
create procedure addCustomer(_customerid int, _FirstName VARCHAR(50),
    _LastName VARCHAR(50),
    _Email VARCHAR(100),
    _Phone VARCHAR(15),
    _Address VARCHAR(255),
    _City VARCHAR(50),
    _RegistrationDate DATE)
begin
insert into customer values (_customerid , _FirstName ,
    _LastName ,
    _Email ,
    _Phone,
    _Address ,
    _City ,
    _RegistrationDate );
end

//
delimiter ;

call addCustomer (1001,'Anbu','vel','anbuvelecetech@gmail.com',6381471504,'Abc house','chennai','2026-08-20');
call addCustomer (1002,'vel','murugan','anbuveltech@gmail.com',8110810576,'def house','bangalore','2026-08-21');
call addCustomer (1003,'maran','vetri','anbuvtech@gmail.com',7639054215,'ghi house','mumbai','2026-08-25');

-- 2: Create a stored procedure to retrieve customer details by CustomerID.
delimiter //
create procedure retrive(in _customerid int)
begin

select * from customer where customerid = _customerid ;
end

// delimiter ;

call retrive(1001);


-- 3: Create a stored procedure to update a customer's email and phone number.

delimiter //
create procedure updCustomers(in _email varchar(30),in _phone_no varchar(10))

begin

update customer set email = _email ,phone = _phone_no;

end
//
delimiter ;

drop procedure updCustomers;
call updCustomers('anbu8@gmail.com','6381471504');

-- 4: Create a stored procedure to get all customers from a specific city.
delimiter //
create procedure getCustomers(in _city varchar(30))
begin

select * from customer where city = _city;
end

//
 delimiter ;
  drop procedure getCustomers;
 
 call getCustomers('chennai');
 
 -- 5: Create a stored procedure to delete a customer by CustomerID.
 
 delimiter //
create procedure delCustomers(in _customerid int)
begin

delete from customer where customerid = _customerid;
end

//
 delimiter ;
 drop procedure delCustomers;
 
 call delCustomers(1002);
 

 
 
  -- show
 delimiter //
create procedure callCustomers()
begin

select * from customer;
end

//
 delimiter ;
 
 call callCustomers();


-- 6: Create a stored procedure to list customers registered within a given date range.
-- 6: Create a stored procedure to list customers
-- registered within a given date range.

DELIMITER //

CREATE PROCEDURE GetCustomersByDateRange(
    IN start_date DATE,
    IN end_date DATE
)
BEGIN
    SELECT *
    FROM Customer
    WHERE RegistrationDate BETWEEN start_date AND end_date;
END //

DELIMITER ;

CALL GetCustomersByDateRange('2026-01-01', '2026-08-29');

-- 7: Search customers by partial FirstName or LastName

DELIMITER //

CREATE PROCEDURE SearchCustomers(IN search_name VARCHAR(50))
BEGIN
    SELECT *
    FROM Customer
    WHERE FirstName LIKE CONCAT('%', search_name, '%')
       OR LastName LIKE CONCAT('%', search_name, '%');
END //

DELIMITER ;

CALL SearchCustomers('anbu');


-- 8: Update a customer's entire address

DELIMITER //

CREATE PROCEDURE UpdateCustomerAddress(
    IN _CustomerID INT,
    IN _Address VARCHAR(255)
)
BEGIN
    UPDATE Customer
    SET Address = _Address
    WHERE CustomerID = _CustomerID;
END //

DELIMITER ;

CALL UpdateCustomerAddress(1, 'Chennai, Tamil Nadu');


-- 9: Return the total number of customers

DELIMITER //

CREATE PROCEDURE TotalCustomers()
BEGIN
    SELECT COUNT(*) AS TotalCustomers
    FROM Customer;
END //

DELIMITER ;

CALL TotalCustomers();


-- 10: Retrieve customers who have not provided an email address

DELIMITER //

CREATE PROCEDURE CustomersWithoutEmail()
BEGIN
    SELECT *
    FROM Customer
    WHERE Email IS NULL OR Email = '';
END //

DELIMITER ;

CALL CustomersWithoutEmail();