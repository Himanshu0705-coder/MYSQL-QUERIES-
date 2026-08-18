use employees;

-- DISTINCT

select * from employee
limit 5 offset 2;

-- find info of bottom 5 employees with lowest salary
select * from employee order by salary asc limit 5;

-- find the info of top 5 employees with highest salary
select * from employee order by salary DESC limit 5;

-- find employee with the 3rd highest salary
select * from employee order by salary DESC limit 1 offset 2;

-- write a query to retrieve employee info with 3rd lowest salary in HR department
select * from employee where department = "HR" order by salary asc limit 1 offset 2;

-- write a SQL query to retrieve the unique combinations of 
    -- first_nmae and last_name from the employee table
select  distinct Concat(first_name," ",last_name) as full_name, first_name , last_name , salary  
from employee;


-- GROUP BY

-- find avg salary of each department
select department , avg(salary) 
from employee 
group by department;

-- find total salary of each department
select department , sum(salary) 
from employee 
group by department; 


-- retrive the total number of employees in each department.
select department , count(emp_id) 
from employee
group by department;

-- get highest salary for each position
select position , Max(salary)
from employee
group by position;

-- retrive the total salary expenditure for each department
select department , sum(salary)
from employee
group by department ; 

-- count the no. of employees joined in each year
select  year(date_of_joining) , count(emp_id)
from employee
group by year(date_of_joining);

-- calculate avg salary of each department where avg salary > 50000
select department , avg(salary) 
from employee
group by department
having avg(salary) > 50000;

-- find the department with more than or equal to 8 employees
select department , count(emp_id)
from employee
group by department
having count(emp_id ) >= 8;

-- find position with an avg salary greater than 50000
select position , avg(salary) 
from employee
group by position
having avg(salary) > 50000;

-- find 2nd highest department where total salary expenditure exceeds 200000
select department , sum(salary)
from employee
group by department
having sum(salary) > 200000 
order by sum(salary) desc
limit 1 offset 1;

-- find duplicate employee name  based on first_name
select first_name , count(first_name)
from employee
group by first_name
having count(first_name) > 1;

-- MULTIPLE GROUP BY -- 

-- How many employees are there in each department for each position
select department , position , count(emp_id) as Total from employee
group by department , position
order by department;

-- what is the avg salary for each department and position
select department , position , avg(salary)
from employee
group by department , position
order by department;