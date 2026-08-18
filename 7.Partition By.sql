
-- Patition By
  -- Data is divided in to windows of similar data
  -- these windows are visible
  -- mostly used with windows functions
  -- window function --> aggregate(sum,max ....) , rownumber,rank
  -- used with OVER clause
  use sales;

-- create a new col which will give count of 
   -- orders paced by each customer

-- solution by group by
select * from orders;
select customerID , count(orderid) from orders group by customerID;

-- solution by Partition by
select distinct customerID , count(orderID) over (partition by customerID) from orders;


-- calculate avg salary for each department using partition by
use employees;
select * from employee;
select distinct department, avg(salary) over (partition by department) from employee;


-- find the latest ordered product and date 
   -- placed by each customerid
use sales;  
select * from orders;

select * from
(select distinct customerID,orderID  ,product ,orderdate,
 max(ORDERDATE) over (partition by customerID) as latest from orders) as T
 where orderdate = latest;
 
 -- find the first order placed by each customer along with the order details.
 select * from 
 (select *, row_number() over(partition by customerID order by orderdate) as r 
 from orders) as V
 where r = 1;
 
 

-- show cumulative salary (running total) for employees     --- cummulative -- > addition in rolling  
   -- within each department ordered by joining date.
   use employees;
select department,salary ,sum(salary) over (partition by department order by date_of_joining)  from employee;