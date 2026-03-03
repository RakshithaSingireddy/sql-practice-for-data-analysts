practices SQL quries using join

create database company_details
use company_details
create table customers(
 CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(100)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount INT
);
CREATE TABLE Payments (
    PaymentID VARCHAR(10) PRIMARY KEY,
    CustomerID INT,
    PaymentDate DATE,
    Amount INT
);
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    ManagerID INT
);
INSERT INTO Customers VALUES
(1, 'John Smith', 'New York'),
(2, 'Mary Johnson', 'Chicago'),
(3, 'Peter Adams', 'Los Angeles'),
(4, 'Robert White', 'Houston'),
(5, 'Nancy Miller', 'Miami');
INSERT INTO Orders VALUES
(101, 1, '2024-10-01', 250),
(102, 2, '2024-10-05', 300),
(103, 1, '2024-10-07', 150),
(104, 3, '2024-10-10', 450),
(105, 6, '2024-10-12', 400);  
INSERT INTO Payments values
('P001', 1, '2024-10-02', 250),
('P002', 2, '2024-10-06', 300),
('P003', 3, '2024-10-11', 450),
('P004', 4, '2024-10-15', 200);
INSERT INTO Employees VALUES
(1, 'Alex Green', NULL),
(2, 'Brian Lee', 1),
(3, 'Carol Ray', 1),
(4, 'Eva Smith', 2),
(5, 'David Kim', 2);
select*from Customers;
select*from Orders;
select*from Payments;
select*from Employees;

--Retrieved all customers who have placed at least one order.

select C.CustomerID, C.CustomerName, O.OrderID
from  customers C
join Orders O
ON C.CustomerID=O.CustomerID

--Retrieved all customers and their orders, including customers who have not placed any orders.

select C.customerID, C.CustomerName, O.OrderID
from  customers C
left join Orders O
ON C.CustomerID=O.CustomerID

--Retrieved all orders and their corresponding customers, including orders placed by unknown customers

select C.customerID, C.CustomerName, c.City, o.orderID
from  customers C
right join Orders O
ON C.CustomerID=O.CustomerID

--DIsplayed all customers and orders, whether matched or not

select C.customerID, C.CustomerName, c.City, o.orderID, o.orderdate, o.Amount
from  customers C
full outer join Orders O
ON C.CustomerID= O.CustomerID

--Displayed customers who have not placed any orders.

select C.customerID, C.CustomerName, O.OrderID,  c.City,o.orderdate, o.Amount
from  customers C
left join Orders O
ON C.CustomerID=O.CustomerID
where o.orderID is null

--Retrieved customers who made payments but did not place any orders.

select C.customerID, C.CustomerName, p.paymentID, p.paymentDate, p.Amount, o.orderID, o.orderDate
from  customers C
right join payments p
on c.customerID= p.customerID
left join orders o
on c.customerID=o.customerID
where o.orderID is null

--generated a list of all possible combinations between Customers and Order

select C.CustomerID, C.CustomerName, c.City
from  customers C
cross join Orders O
 
--Retrieved all customers along with order and payment amounts in one table.

SELECT C.CustomerID, C.CustomerName,
       O.OrderID, O.OrderDate,
       P.PaymentID, P.PaymentDate, P.Amount
FROM Customers C
LEFT JOIN Orders O
    ON C.CustomerID = O.CustomerID
LEFT JOIN Payments P
    ON C.CustomerID = P.CustomerID;

--Retrieved  all customers who have both placed orders and made payments

SELECT*
FROM Customers C
INNER JOIN Orders O
ON C.CustomerID = O.CustomerID
INNER JOIN Payments P
ON C.CustomerID = P.CustomerID;
