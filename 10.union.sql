
use employees;

-- find names & salary of all employees where 
     -- month is jan & dec and is sorted based on month
select First_name , salary , date_of_joining from employee where month(date_of_joining) = 1
union
select First_name , salary , date_of_joining from employee where month(date_of_joining) = 12;

