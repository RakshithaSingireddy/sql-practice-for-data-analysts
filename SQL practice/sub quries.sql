Practiced SQL using sub quries

create Database sub_quries_pracice
use sub_quries_pracice
CREATE TABLE Employee_Dataset (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id VARCHAR(5),
    salary INT
);

CREATE TABLE Department_Dataset(
    department_id VARCHAR(5) PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Sales_Dataset (
    sale_id INT PRIMARY KEY,
    emp_id INT,
    sale_amount INT,
    sale_date DATE
);
INSERT INTO Employee_Dataset VALUES
(101,'Abhishek','D01',62000),
(102,'Shubham','D01',58000),
(103,'Priya','D02',67000),
(104,'Rohit','D02',64000),
(105,'Neha','D03',72000),
(106,'Aman','D03',55000),
(107,'Ravi','D04',60000),
(108,'Sneha','D04',75000),
(109,'Kiran','D05',70000),
(110,'Tanuja','D05',65000);

INSERT INTO Department_Dataset VALUES
('D01','Sales','Mumbai'),
('D02','Marketing','Delhi'),
('D03','Finance','Pune'),
('D04','HR','Bengaluru'),
('D05','IT','Hyderabad');

INSERT INTO Sales_Dataset VALUES
(201,101,4500,'2025-01-05'),
(202,102,7800,'2025-01-10'),
(203,103,6700,'2025-01-14'),
(204,104,12000,'2025-01-20'),
(205,105,9800,'2025-02-02'),
(206,106,10500,'2025-02-05'),
(207,107,3200,'2025-02-09'),
(208,108,5100,'2025-02-15'),
(209,109,3900,'2025-02-20'),
(210,110,7200,'2025-03-01');




select*from Employee_Dataset
select *from Department_Dataset
select*from Sales_Dataset

--Basic level--

--Retrieved names of employees who earn more than the average salary of all employees.

SELECT name
FROM Employee_Dataset
WHERE salary > (
SELECT AVG(salary) FROM Employee_Dataset);

--Found employees who belong to the department with the highest average salary.

select name
from Employee_Dataset
where Department_id in (select top 1 Department_id
from Employee_Dataset
group by Department_id
order by avg(salary) DESC);

--Listed all employees who have made at least one sale.

select name
from Employee_Dataset
where emp_id in (
select emp_id from Sales_Dataset);

--Found employee with the highest sale amount.

select*from Employee_Dataset
select*from Sales_Dataset


select name
from Employee_Dataset
where emp_id =
(select top 1 emp_id
from Sales_Dataset
order by sale_amount DESC);

--Retrieved names of employees whose salaries are higher than Shubham’s salary.

select name
from Employee_Dataset
where salary>(
select salary from Employee_Dataset
where name='Shubham');

--Intermediate Level--

--Found employees who work in the same department as Abhishek.
select*from Employee_Dataset
select *from Department_Dataset

Select name
from Employee_Dataset
where Department_id = (
select Department_id
from Employee_Dataset where name='Abhishek');

--Listed departments that have at least one employee earning more than ₹60,000.


select department_name
from Department_Dataset
where Department_id in
(select department_id
from Employee_Dataset 
where salary>60000);

--Found the department name of the employee who made the highest sale.

select*from Employee_Dataset
select *from Department_Dataset
select*from Sales_Dataset

select department_name
from Department_Dataset
where department_id= (select department_id
from Employee_Dataset
where emp_id=
(select top 1 emp_id
from Sales_Dataset
order by sale_amount DESC));

--Retrieved employees who have made sales greater than the average sale amount.

select*from Employee_Dataset
select*from Sales_Dataset

select name
from Employee_Dataset
where emp_id in (select emp_id
from Sales_Dataset
where sale_amount>
(select avg(sale_amount) from Sales_Dataset));

--Found total sales made by employees who earn more than the average salary

select sum(sale_amount)
from Sales_Dataset
where emp_id in(select emp_id
from Employee_Dataset
where salary>(select avg(salary) from Employee_Dataset));

select*from Sales_Dataset
select*from Employee_Dataset

--Advanced Level--

--Found employees who have not made any sales.

select name 
from Employee_Dataset
where emp_id not in (select emp_id from Sales_Dataset);

--Listed departments where the average salary is above ₹55,000.

select*from Employee_Dataset
select *from Department_Dataset
 
select department_name
from Department_Dataset
where department_id in( select department_id from Employee_Dataset
 group by department_id
 having avg(salary)>55000);

 --Retrieved department names where the total sales exceed ₹10,000.

 select*from Employee_Dataset
select*from Sales_Dataset
select *from Department_Dataset

select department_name
from Department_Dataset
where department_id in (select E.department_id
from employee_dataset E
join Sales_Dataset S
on E.emp_id=S.emp_id
group by E.department_id
having sum(S.sale_amount)>10000);

--Found employee who has made the second-highest sale.

select*from Employee_Dataset
select*from Sales_Dataset

WITH SalesRank AS
(
    SELECT emp_id,
           DENSE_RANK() OVER (ORDER BY sale_amount DESC) AS rnk
    FROM Sales_Dataset
)
SELECT name
FROM Employee_Dataset
WHERE emp_id = (
    SELECT emp_id
    FROM SalesRank
    WHERE rnk = 2
);

--Retrieved names of employees whose salary is greater than the highest sale amount recorded.

select*from Employee_Dataset
select*from Sales_Dataset

select name
from Employee_Dataset 
where salary>(select max(sale_amount) from Sales_Dataset);
