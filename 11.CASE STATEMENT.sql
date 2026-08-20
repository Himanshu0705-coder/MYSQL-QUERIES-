
-- write a query to display each order with a new column AmountCategory:
-- Low if Amount <200
-- medium id amount between 200 and 350
-- high if amount >350

use sales;
select * ,
Case
    when amount > 350 then "High"
    when amount between 200 and 350 then "medium"
    when amount < 200 then "low"
end as AmountCategory
from orders;

-- write a query to show  each customer along with a new column -- orderstatus :
     -- "Active Customer" if they have placed at least 1 order
     -- "Inactive Customer" if they have not place any order
     
     
select c.CustomerID , CustomerName, 
CASE 
   when orderID is not NUll then "Active Customer"
   else "Inactive Customer"
   end as ORDERSTATUS
 from customers c left join orders o
on c.customerID = o.customerID ;





