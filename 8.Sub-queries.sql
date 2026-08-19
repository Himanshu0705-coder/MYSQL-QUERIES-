
-- ---------- simple SUB-QUERIES ------------------------------

use sales;
-- find  customers names who have placed an order worth more than 300.
select * from customers where customerId in 
(select customerID from orders where amount > 300);

-- list the names of customer who order a 'Smartphone'
select * from customers where customerID in
(select customerID from orders where product = 'Smartphone');

-- retrive customers who haven't placed any orders
select * from customers where CustomerID not in
(select customerID from orders);

-- find customer from 'USA' who placed ordered after '2024-02-01'
select * from customers where country= "USA" and customerID in 
(select customerID from orders where OrderDate > '2024-02-01');


-- ###   Aggregate SubQueries --------------

-- list customers who placed more than one order
select * from customers where CustomerID in(
select customerID  from orders 
group by customerID having count(orderID)>1);

-- retrieve customername who placed orders above the average order amount
select * from customers where customerid in(
select customerID from orders 
where amount > (select avg(amount) from orders));

-- display the customer id , product , order amount of the most expensive order
select customerid , product, amount as order_amount from orders
where amount = (select MAX(amount) from orders);

-- find orders details of customers whose ordered amount is 
   -- greater than All orders placed by customer 1 .
   select * from orders where amount > (
   select max(amount) from orders 
   where customerID = 1) ;
   
    -- 2nd method 
    select * from orders where Amount > ALL(
    select amount from orders where customerID = 1);