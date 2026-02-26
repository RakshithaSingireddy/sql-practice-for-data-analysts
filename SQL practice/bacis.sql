-- Basics of SQL

create database company_db
use company_db
create table Employees(
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
department VARCHAR(50),
salary INT,
hire_date DATE
);
insert into Employees values
(101,'Amit','Sharma','HR',50000,'2020-01-15'),
(102,'Riya','Kapoor','Sales',75000,'2019-03-22'),
(103,'Raj','Mehta','IT',90000,'2018-07-11'),
(104,'Neha','Verma','IT',85000,'2021-09-01'),
(105,'Arjun','Singh','Finance',60000,'2022-02-10');
select * from Employees;

-- Displayed all employess records sorted by salary

select * from Employees
order by salary ASC;

-- Employees Sorted by Department (A–Z) and Salary (High to low)

select * from Employees
order by department Asc,salary Desc;

-- Listed All Employees in the IT Department, Ordered by Hire Date (Newest First)

select * from Employees
where Department='IT'
order by hire_date DESC;

-- created sales table to track the data

use company_db
create table Sales(
 sale_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    amount INT,
    sale_date DATE
);
insert into Sales(sale_id, customer_name, amount, sale_date) values
(1, 'Aditi', 1500, '2024-08-01'),
(2, 'Rohan', 2200, '2024-08-03'),
(3, 'Aditi', 3500, '2024-09-05'),
(4, 'Meena', 2700, '2024-09-15'),
(5, 'Rohan', 4500, '2024-09-25');
select * from Sales;

-- Displayed All Sales Records Sorted by Amount (Highest to lowesr)

select * from Sales
order by amount DESC;

-- showed  All Sales Made by Customer “Aditi”

select * from Sales
where customer_name='Aditi';
