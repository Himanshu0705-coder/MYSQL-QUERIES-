-- -------- Co-related Sub-Queries -------------
use sales;

-- for each customername , list their most recent orderdate.
select customername,
(select max(orderdate) from orders o where o.customerid = c.customerid)
from customers c;

-- for each customerid list their most recent order with orderdate , product
select  customerid , orderdate , product from orders o where 
orderdate = (select max(orderdate) from orders o1 where o1.customerID = o.customerID);