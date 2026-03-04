##Practices SQL using Aggregations and used SSMS

create database praticeworld
use praticeworld
CREATE TABLE Countries (
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(50),
    Continent VARCHAR(50),
    Region VARCHAR(50),
    Population INT,
    GNP INT,
    LifeExpectancy DECIMAL(4,1)
);
CREATE TABLE Cities (
    CityID INT PRIMARY KEY,
    CityName VARCHAR(50),
    CountryID INT,
    Population INT
    );
    CREATE TABLE Languages (
    LanguageID INT PRIMARY KEY,
    CountryID INT,
    Language VARCHAR(50),
    IsOfficial CHAR(1)
        );
 INSERT INTO Countries VALUES
(01, 'Alpha', 'Asia', 'South Asia', 1000000, 50000, 70.0),
(02, 'Beta', 'Asia', 'South Asia', 2000000, 80000, 72.0),
(03, 'Gamma', 'Europe', 'West Europe', 1500000, 90000, 80.0),
(04, 'Delta', 'Africa', 'North Africa', 1200000, 30000, 60.0);

INSERT INTO Cities VALUES
(1, 'A1', 01, 300000),
(2, 'A2', 01, 200000),
(3, 'B1', 02, 400000),
(4, 'G1', 03, 500000),
(5, 'G2', 03, 300000),
(6, 'D1', 04, 250000);

INSERT INTO Languages VALUES
(1, 01, 'Lang1', 'T'),
(2, 01, 'Lang2', 'F'),
(3, 02, 'Lang1', 'T'),
(4, 03, 'Lang3', 'T'),
(5, 04, 'Lang4', 'T');

select * from Countries
select * from Cities
select * from Languages

--Counted how many cities are there in each country

select CountryID as counties, count(*) as No_of_Cities
from Cities
group by CountryID

-- Display all continents having more than 1 countries.

select Continent, count(*) as totalcountries
from Countries
group by Continent
having count(*)>1

-- List regions whose total population exceeds 2,000,000

select Region, sum(Population)
from Countries
Group by Region
having sum(Population)>2000000

-- Find the top 2 continents by average GNP per country

select top(2) Continent, avg(GNP) as averageGNP
from countries
group by continent
order by avg(GNP) DESC 

--Found total number of official languages spoken in each continent
select * from Countries
select * from Languages

select C.Continent, count(L.Language) as Language_Spoken
from Countries C
Join Languages L
on C.CountryID=L.CountryID
where L.IsOfficial='T'
Group by C.Continent

--Found maximum and minimum GNP for each continent.
select Continent, min(GNP) as minimum_GNP, Max(GNP) as Maximum_GNP
from Countries
group by Continent

--Found the country with the highest average city population.
select top(1) C.CountryName, Avg(Ci.Population) as Average_Piopulation
from Countries C
join cities Ci
on C.CountryID=Ci.CountryID
group By C.CountryName
order by AVG(Ci.Population) DESC;


select * from Countries
select * from Cities

--Listed continents where the average city population is greater than 300,000.

Select C.Continent, avg(Ci.Population) as Average_Population
from Countries C
join Cities Ci
on C.CountryID=Ci.CountryID
group by  C.Continent
having avg(Ci.Population)>300000

--Found the total population and average life expectancy for each continent, ordered by average life expectancy descending.

select * from Countries
select * from Cities
select * from Languages

select Continent, sum(Population) as Total_Population, avg(LifeExpectancy) as Average_Expectancy
from Countries
group by continent
order by avg(LifeExpectancy) DESC;

--Found the the top 3 continents with the highest average life expectancy, but only include those where the total population is over 200 million.

select top(3) Continent, sum(Population) as Total_Population, avg(LifeExpectancy) as Average_Expectancy
from Countries
group by continent
having sum(Population)>2000000
order by avg(LifeExpectancy) DESC;
