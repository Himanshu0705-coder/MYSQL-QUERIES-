use employees;

use sales;
show tables;
describe customers; 
describe orders;

select * from customers;
select * from orders;


select *
 from customers c join orders o
on c.CustomerID = o.CustomerID;

-- retrieve customer names along with their ordered product.
select CustomerName , Product
 from customers c join orders o
on c.CustomerID = o.CustomerID;

-- get the customer names & total sales amount for each customer.
select CustomerName , sum(amount) 
from customers c join orders o
on c.customerID = o.customerID
group by customerName;

-- find all customers who have not placed any orders
select c.customerID ,customerName , Product from customers c left join orders o 
on c.customerID = o.customerID
where o.CustomerID IS NULL;

-- list customers who have placed an order worth more than 200
select *
 from customers c join orders o 
on c.customerID = o.customerID
where Amount > 200; 

-- find the latest order date placed by each customer
select   customerName , max(orderDate)
 from customers c join orders o
on c.customerID = o.customerID
group by customerName ;

-- find how many orders each customer has placed
select customerName , count(orderID) from customers c join orders o
on c.customerID = o.customerID
group by customername;

-- get customers details along with the most expensive order they placed.
select customerName , max(amount) from customers c join orders o 
on c.customerID = o.customerID 
group by customerName;

-- find customers who have placed at least one order in March 2024
select * from customers c join orders o
on c.customerId = o.customerID
where orderDate between "2024-03-01" and "2024-03-31" ;



-- ---------------------- SELF JOIN -------------------------------------- --
-- imp. question for interview aspect

-- find name of employees and manager they report to
use employees; 
select e.first_name,e.position,e1.first_name,e1.position , e1.department
from employee e join employee e1
on e.department = e1.department
where e.position <> "Manager" and e1.position = "manager"
order by department;

-- find pair of customers from same city
use sales;
select c.customerName , c.city , c1.customerName
 from customers c join customers c1
on c.city = c1.city
where c.customerID < c1.customerID 
OR c.customerID > c1.customerID; 

-- display pair of customers where both are from India
select c.customerName , c.country , c1.customerName
from customers c join customers c1
on  c.country = c1.country
where c.customerID < c1.customerID
And c.country = "India";


