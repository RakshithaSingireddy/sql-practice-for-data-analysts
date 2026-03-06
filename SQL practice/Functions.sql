--practice sql using funtions--

create Database Students_db
use Students_db

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    course VARCHAR(50),
    score INT,
    attendance INT,
    join_date DATE,
    city VARCHAR(50)
);

INSERT INTO students VALUES
(1,'Amit','Data Science',85,90,'2023-06-15','Mumbai'),
(2,'Priya','Data Science',92,95,'2023-07-10','Delhi'),
(3,'Rahul','Web Dev',78,85,'2023-08-20','Mumbai'),
(4,'Sneha','Web Dev',88,80,'2023-09-05','Pune'),
(5,'Karan','AI',95,92,'2023-05-12','Chennai'),
(6,'Meera','AI',82,88,'2023-10-18','Mumbai'),
(7,'Arjun','Data Science',74,75,'2023-11-01','Bangalore'),
(8,'Neha','Web Dev',90,93,'2023-06-25','Delhi');

select * from students

-- Created a ranking of students based on score
select name, score,
dense_rank() over(order by score DESC) as Rank
from students 

-- Showed each student's score and the previous student’s score (based on score order).

select name, score,
lag(score) over(order by score DESC) as previous_students_score
from students

--Converted all student names to uppercase and extracted the month name from join_date

select upper(name) as name, datename(month,join_date) as month_name
from students

--Showed each student's name and the next student’s attendance (ordered by attendance).

select * from students

select name,attendance, 
lead(attendance) over(order by attendance) as Next_students_attendance
from students

-- Assigned students into 4 performance groups using NTILE().

SELECT name, score,
NTILE(4) OVER (ORDER BY score DESC) AS performance_group
FROM students;

--For each course, assign a row number based on attendance (highest first).

select name,course,attendance,
row_number() over(partition by course order by attendance DESC) as row_number
from students

select * from students

-- Calculated the number of days each student has been enrolled (from join_date to today).
--(Assuming current date = '2025-01-01')

select student_id,name,course,
datediff(day,join_date,'2025-01-01') as days_enrolled
from students

--Formated join_date as “Month Year” (e.g., “June 2023”).

select student_id,name,course,score,attendance,city,
datename(month,join_date) as month_of_joining,
datename(year,join_date) as year_of_joining
from students

SELECT name,
FORMAT(join_date,'MMMM yyyy') AS formatted_date
FROM students;

-- Replaced the city ‘Mumbai’ with ‘MUM’ for display purposes

SELECT name,
REPLACE(city,'Mumbai','MUM') AS city_display
FROM students;

-- For each course, find the highest score using FIRST_VALUE()

SELECT name, course, score,
FIRST_VALUE(score) OVER (PARTITION BY course ORDER BY score DESC) AS highest_score
FROM students;
