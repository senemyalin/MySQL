create or replace view usa_customers as
select CustomerID, CustomerName, ContactName
from Customers 
where Country = "USA";

select * 
from usa_customers join orders on usa_customers.CustomerID = orders.CustomerID;

create view products_below_avg_price as
select ProductID, ProductName, Price
from Products
where Price < (select avg(price) from Products);

select * from products_below_avg_price;