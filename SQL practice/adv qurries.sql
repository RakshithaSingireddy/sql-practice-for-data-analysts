AVD SQL Quries##

create database AdvSQL_Assignment
use AdvSQL_Assignment

CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

create table Sales(
SalesID INT primary key,
ProductID int,
Quantity int,
SaleDate Date,
constraint fk_Product_id foreign key(ProductID) references Products (ProductID));

insert into Products values
(1, 'keyboard','Electronics',1200),
(2, 'Mouse','Elecytonics',800),
(3, 'Chair','Furniture',2500),
(4, 'Desk','Furmiture',5500);

insert into sales values
(1,1,4,'2024-01-05'),
(2,2,10,'2024-01-06'),
(3,3,2,'2024-01-10'),
(4,4,1,'2024-01-11');
select * from Products
select * from Sales

-- Write a CTE to calculate the total revenue for each product (Revenues = Price × Quantity), and return only products where  revenue > 3000.
select * from Sales;
with Prevenue as
(
select p.ProductID,p.ProductName, sum(p.price*s.Quantity) as Revenue
from Products p
join Sales S
on p.ProductID=s.ProductID
group by  p.ProductID,p.ProductName
)
select * from Prevenue
where Revenue>3000;


update Products 
set Category='Electronics'
where ProductID=2;
Go

update Products 
set Category='Furniture'
where ProductID=4;
Go

--Create a view named that shows: Category, TotalProducts, Average

CREATE VIEW
vw_CategorySummary
as
select category,
count(ProductID) as Total_products,
AVG(Price) as Average_price
from Products
group by Category; 
Go

select * from vw_CategorySummary;
Go

-- Create an updatable view containing ProductID, ProductName, and Price.pdate the price of ProductID = 1 using the view.

CREATE VIEW
vw_ProductDetails
as
select ProductID, ProductName, Price
from Products;
Go
update vw_ProductDetails
set price=1300
where ProductID=1;
Go 

select * from vw_ProductDetails;
Go

 --Create a stored procedure that accepts a category name and returns all products belonging to that category.

 create procedure dbo.Getsproductsbycategory
 @CategoryName varchar(20)
 as
 select * from Products 
 where Category=@CategoryName;
 Go

 EXEC dbo.Getsproductsbycategory @CategoryName='Electronics'
 Go

 --Create an AFTER DELETE trigger on the Products table that archives deleted product rows into a new
-- table Productarchive.The archive should store ProductID, ProductName, Category, Price, and DeletedAt,Timestamp

CREATE TABLE ProductArchive
(
    ProductID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    DeletedAt DATETIME
);
go

Create trigger trg_Product_delete
on Products
after delete
as
Begin
insert into ProductArchive (ProductID,ProductName, Category, Price, DeletedAt)
select ProductID,ProductName, Category, Price, getdate() from deleted

end;
