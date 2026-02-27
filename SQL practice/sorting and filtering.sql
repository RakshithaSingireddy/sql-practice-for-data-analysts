Created SQL quries using sorting and filtering

create database Employees_db
use Employees_db
create table Employees_list(
 EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Department VARCHAR(50),
    City VARCHAR(50),
    Salary INT,
    HireDate DATE
);
INSERT INTO Employees_list (EmpID, EmpName, Department, City, Salary, HireDate) VALUES
(101, 'Rahul Mehta', 'Sales', 'Delhi', 55000, '2020-04-12'),
(102, 'Priya Sharma', 'HR', 'Mumbai', 62000, '2019-09-25'),
(103, 'Aman Singh', 'IT', 'Bengaluru', 72000, '2021-03-10'),
(104, 'Neha Patel', 'Sales', 'Delhi', 48000, '2022-01-14'),
(105, 'Karan Joshi', 'Marketing', 'Pune', 45000, '2018-07-22'),
(106, 'Divya Nair', 'IT', 'Chennai', 81000, '2019-12-11'),
(107, 'Raj Kumar', 'HR', 'Delhi', 60000, '2020-05-28'),
(108, 'Simran Kaur', 'Finance', 'Mumbai', 58000, '2021-08-03'),
(109, 'Arjun Reddy', 'IT', 'Hyderabad', 70000, '2022-02-18'),
(110, 'Anjali Das', 'Sales', 'Kolkata', 51000, '2023-01-15');
select * from Employees_List;

--Created employees working in either the ‘IT’ or ‘HR’ departments.

select * from Employees_List
where Department='HR'or Department='IT';

 --we can also write using in

 select * from Employees_List
where Department IN ('HR','IT');

--Retrived employees whose department is in ‘Sales’, ‘IT’, or ‘Finance’.

select * from Employees_List
where Department IN ('Sales','IT','Finance');

--Displayed employees whose salary is between ₹50,000 and ₹70,000

select * from Employees_List
where Salary between 50000 and 70000;

--Listed employees whose names start with the letter ‘A’.

select * from Employees_List
where EmpName like 'A%';

--Listed employees whose names contain the substring ‘an’.

select * from Employees_List
where EmpName like '%an%';

--Listed  employees who are from ‘Delhi’ or ‘Mumbai’ and earn more than ₹55,000.

select * from Employees_List
where city in ('Delhi','Mumbai')
and salary>55000;

--Displayed  all employees except those from the ‘HR’ department.

select * from Employees_List
where department not in ('HR');

--Listed  all employees hired between 2019 and 2022, ordered by HireDate (oldest first).

select * from Employees_List
where HireDate between '2019' and '2022'
order by HireDate ASC;

--
