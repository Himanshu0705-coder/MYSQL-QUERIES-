use employees;

-- Aggregate Functions (SUM , MIN , MAX , COUNT , AVG)

-- Q. Find count of employees in IT dept
select Count(emp_id) from employee where department = "IT";

-- Q. Find count of managers in IT dept
select count(*) from employee where department = "IT" and position like "%manager";
-- Q. Find max salary in marketing dept
select Max(salary) from employee where department = "Marketing";
-- Q. find total salary of trainee in HR dept
select Sum(salary) from employee where department = "HR" and position like "%trainee";

-- Q. what is the salary disparity between managers 
select (max(salary)-min(salary))  from employee where position like "%manager%";

-- Q. find employees with salary > than average salary
select Avg(salary) from employee ; 


-- Mathematical Functions
    -- MOD (remainder) or %
	-- ROUND (removes decimals wrto specified digits)
    
select mod(1,5) as remainder;

select Round(456.51);

-- TEXT FUnctions
     -- CHAR_LENGTH / * LENGTH (same as char length)
     -- CONCAT
     -- LCASE/UCASE     ----> Oldest version ANSI
     -- * LOWER / UPPER  -----> newer version (recommended)
     -- REPLACE       (data,old char to be replaced, new char)
     -- LEFT           (extract substring from left side of a string)
     -- MID           (extract substring from a string)
     -- SUBSTR            (extract substring from a string)
     -- REVERSE      
     -- TRIM , LTRIM , RTRIM
     -- POSITION          (gives index of a substring from string)
     -- * LOCATE         ( gives index of a substring from string)
     
-- Q. give fullname(first_name + last_name) of employees in Upper case
select upper(concat(first_name," ",last_name)) as fullname from employee;

-- Q. find length of email id in HR department 
        -- having the longest emailid
	select MAX(length(email)) from employee where department = "HR";
    
    -- Q. find character before "@" in email_id 
    select left(email,LOCATE("@",email)-1) from employee;
    
    -- Q. find character after "@" in email_id 
    SELECT RIGHT(email, LENGTH(email) - LOCATE('@', email)) AS domain
FROM employee;

   -- Q. find character after "@" and before "." in email id
  
     
     
-- DATE Functions
     -- CURDATE , CURTIME
     -- DATEDIFF
     -- DAYOFWEEK
     -- WEEKDAY
     -- DAY / MONTH / YEAR
     -- DAYNAME , MONTHNAME
     
-- Q. find employees joined between 2024 and 2026
     select * from employee where date_of_joining between "2024-01-01 " and "2026-12-31"   ; 
     -- OR
     select * from employee where year(date_of_joining) between 2024 and 2026;
     
-- Q. Find how long have employees been in this company wrto year in terms of exp
    select year(curdate()) - year(date_of_joining) as exp from employee;
    -- OR
    select abs(round(DATEDIFF(date_of_joining,curdate()) / 365)) from employee;
    
-- Q. Find employeess who have joined in the month of "january"
    select * from employee where monthname(date_of_joining) = "january";
    
-- Q. Find count of Employees joined on weekends
select first_name,date_of_joining,dayname(date_of_joining)
from employee 
where dayofweek(date_of_joining) not in (1,7);

-- Q. Find count of employee joined on weekdays
select first_name,date_of_joining,dayname(date_of_joining) 
from employee
where dayofweek(date_of_joining) in (1,7);

-- Q. Find employee joined at the end of month from 25th to 30th for every month
  select first_name,date_of_joining,monthname(date_of_joining)
  from employee
  where day(date_of_joining) between 25 and 30  ;
     
     
  