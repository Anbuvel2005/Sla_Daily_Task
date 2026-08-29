create database trigger1;
use trigger1;

CREATE TABLE Products (product_id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(100),price DECIMAL(10, 2),
stock_quantity INT,status VARCHAR(20) DEFAULT 'Available');

CREATE TABLE Inventory_Audit (audit_id INT PRIMARY KEY AUTO_INCREMENT,product_id INT,action_type VARCHAR(50),
    old_value VARCHAR(100),new_value VARCHAR(100),changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
select * from products;
select * from Inventory_Audit;
-- 1. Prevent Negative Stock Question: Create a trigger to prevent the stock_quantity from being updated to a value less than 0.


delimiter //
create trigger preventNeg
before update on products
for each row
begin
if new.stock_quantity <0 then
signal sqlstate '45000'
set Message_Text = 'stock quantity cannot be negative';

end if ;
end 
//
delimiter ;


insert into products values(1,'lap',20000,20,'delivered');

update products
set stock_quantity = -5
where product_id = 1;


-- 2. Audit Price Changes Question: Log whenever a product price is updated into the Inventory_Audit table.
drop trigger logTrigger;
delimiter //
create trigger logTrigger
before update on products
for each row
begin
if new.price <> old.price then
insert into Inventory_Audit(product_id ,action_type,
    old_value ,new_value ,changed_at )
    values(New.product_id,'price change',old.price,new.price,changed_at);
    end if;
    end
    
    //
    delimiter ;
    select * from inventory_audit;
    UPDATE Products
SET price = 500.00
WHERE product_id = 1;


-- 3. Auto-Update Status to 'Out of Stock'Question: If stock reaches 0, automatically change the status to 'Out of Stock'.
delimiter //
create trigger statustrigger
before update on products
for each row
begin
if new.stock_quantity = 0 then

set new.status = 'out of stock'  ;
end if ;
end

//
delimiter ;

UPDATE Products
SET stock_quantity = 0
WHERE product_id = 1;


-- 4. Enforce Uppercase Product Names Question: Ensure all product names are stored in uppercase upon insertion.

delimiter //
create trigger UpperTrigger
before insert on products
for each row
begin
set new.name = upper(new.name) ;



end

//
delimiter ;
drop trigger UpperTrigger;

INSERT INTO Products (name, price, stock_quantity)
VALUES ('iphone charger', 500.00, 10);

-- 5. Log New Product Additions Question: Record a log entry whenever a new product is added to the system.
DELIMITER //

CREATE TRIGGER log_insert_trigger
AFTER INSERT ON Products
FOR EACH ROW
BEGIN
    INSERT INTO Inventory_Audit
    (product_id, action_type, old_value, new_value)
    VALUES
    (NEW.product_id, 'New Product Added', NULL, NEW.name);
END //

DELIMITER ;

INSERT INTO Products (name, price, stock_quantity)
VALUES ('Laptop', 50000, 10);

SELECT * FROM Inventory_Audit;








-- 6. Prevent Deletion of Active Products Question: Stop users from deleting a product if the stock_quantity is greater than 0.
DELIMITER //

CREATE TRIGGER stop_del_trigger
before delete ON Products
FOR EACH ROW
BEGIN
  if stock_quantity > 1 then
  signal sqlstate '45000'
  set message_text = 'stop delete';
  end if ;
END 
//

DELIMITER ;

delete from products where stock_quantity > 1;

-- 7. Track Deleted Products Question: When a product is deleted, save its ID and name in the audit table.
drop trigger audit_del_trigger;
DELIMITER //
create trigger audit_del_trigger
after delete ON Products
FOR EACH ROW
BEGIN

insert into inventory_audit (product_id,old_value)
values(old.product_id,old.name);

END 
//

DELIMITER ;


-- Test
DELETE FROM Products
WHERE product_id = 1;

-- 8. Minimum Price Enforcement
-- Prevent products from having a price lower than 1.00

DELIMITER //

CREATE TRIGGER minimum_price_insert
BEFORE INSERT ON Products
FOR EACH ROW
BEGIN
    IF NEW.price < 1.00 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Product price cannot be lower than 1.00';
    END IF;
END //

CREATE TRIGGER minimum_price_update
BEFORE UPDATE ON Products
FOR EACH ROW
BEGIN
    IF NEW.price < 1.00 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Product price cannot be lower than 1.00';
    END IF;
END //


-- 9. Record Stock Replenishment
-- Log when stock_quantity increases

CREATE TRIGGER stock_replenishment
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    IF NEW.stock_quantity > OLD.stock_quantity THEN
        INSERT INTO Inventory_Audit
        (product_id, action_type, old_value, new_value)
        VALUES
        (NEW.product_id, 'Stock Replenished',
         OLD.stock_quantity, NEW.stock_quantity);
    END IF;
END //


-- 10. Prevent Weekend Price Drops
-- Block price updates on Saturday and Sunday

CREATE TRIGGER prevent_weekend_price_drop
BEFORE UPDATE ON Products
FOR EACH ROW
BEGIN
    IF DAYOFWEEK(CURDATE()) IN (1, 7)
       AND NEW.price < OLD.price THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Price drops are not allowed on weekends';
    END IF;
END //

DELIMITER ;



-- Question 8
INSERT INTO Products (name, price, stock_quantity)
VALUES ('Pen', 0.50, 10);

-- Question 9
UPDATE Products
SET stock_quantity = 20
WHERE product_id = 1;

-- Question 10
UPDATE Products
SET price = 50
WHERE product_id = 1;
