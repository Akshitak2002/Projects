
-- Part 1: Database Design 
create database E_commerce;
use E_commerce;

CREATE TABLE Customers (
customers_id int not null , 
Name varchar(50),
email varchar(50),
city varchar(150)
);

create table Products(
product_id int not null ,
name varchar(50),
category varchar(50),
price int not null , 
stock varchar (50) );


create table Orders(
order_id int not null ,
customer_id int not null ,
order_date date , 
total_amount int);

create table Orders_details(
detail_id int not null ,
order_id int not null ,
product_id int,
quantity int,
subtotal int 
);

create table Payments
( 
pay_id int ,
order_id int not null ,
payments_date date ,
payments_method varchar(50), 
amount_paid int 
) ;

-- Part 2: Basic CRUD Operations 


insert into Customers (customers_id,Name,email,city)
values (1001 , 'Gauravdeep' , 'gaurav@gmail.com', 'Amritsar'),
(1002,'Harman' , 'harman@gmail.com' , 'Amritsar'),
(1003,'Arsh' , 'Arshdeep@gmail.com' , 'Amritsar'),
(1004,'Aditya' , 'Aditya@gmail.com' , 'Rajsthan'),
(1005,'Amardeep' , 'Amardeep@gmail.com' , 'Amritsar');

select * from Customers;

insert into Products(product_id ,name, category, price, stock)
values
(20001 , 'laptop' , 'electronis', 50000,'In Stock '),
(20002,'watch' , 'Accesories' , '12000', 'In Stock'),
(20003,'Headphones','Accesories', 25000,'Out of stock'),
(20004,'shoes','Fashion',10000,'In stock'),
(20005,'Refrigerator','Appliances' , '65000' , 'In Stock');

select * from Products;

insert into orders (order_id , customer_id ,order_date , total_amount)
values
(5001 , 1001 , '2025-01-24', 101000),
(5002  , 1002, '2025-02-01', 106000),
(5003 , 1003 , '2025-01-06', 105000),
(5004 , 1004 , '2025-02-10', 107000),
(5005 , 1005 , '2025-03-01', 108000);

select * from orders;

use E_commerce;
insert into orders_details (detail_id , order_id , product_id , quantity , subtotal)
values
(658952,5001,30001,10,100000),
(659856,5002,30002,15,200000),
(656699,5003,30003,20,300000),
(654525,5004,30004,09,400000),
(658745,5005,30005,14,500000);

select * from orders_details ;

select * from payments;
insert into payments (pay_id , order_id , payments_date ,payments_method ,amount_paid)
values
(10001,5001, '2025-07-10', 'Credit Card', 57000),
(10002 , 5002, '2025-07-12', 'UPI', 26000),
(10003 , 5003, '2025-08-01', 'Cash', 3500),
(10004, 5004, '2025-08-10', 'UPI', 2700),
(10005,5005, '2025-09-05', 'Debit Card', 1200),
(10006, 5006, '2025-09-15', 'Credit Card', 26000),
(10007, 5007, '2025-09-20', 'UPI', 3500),
(10008, 5008, '2025-10-01', 'Cash', 800),
(10009, 5009, '2025-10-05', 'Credit Card', 55000),
(10010, 5010, '2025-10-15', 'UPI', 400);

select * from E_com_payments;

-- update product stock 

select  * from products;
update products set stock='In_stock'

-- delete an order record

set sql_safe_updates= 0 

DELETE FROM orders
where order_id=5005 ;

select * from orders;

 -- Retrieve all details of customers and their orders
 
select * from customers;
select * from orders;

-- Part 3 filtering & Searching

--  List all customers from a specific city. 

select * from customers where city='Amritsar';

--  Find all products under ₹10000.

select * from products 
where price > 10000;


-- Show all orders placed in the last 3 months. 

select * from orders 
where order_date between'2025-01-24' and '2025-03-01';

-- Retrieve all products that are “Out of Stock”. 

Select * from products
 where stock = 'Out of stock' ;


-- Part 4  joins


select c.name as customer_name , p.name as Product_name ,
od.quantity,
o.order_id,
o.order_date
from customers c 
join orders o 
	 on c.customers_id = o.customer_id
join orders_details od
	on o.order_id= od.order_id
join products p
	on od.product_id= p.product_id
order by c.name, o.order_id,p.name
;
    

select * from orders_details;
select * from orders;
Select * from customers;
select * from products;
select * from payments;

SELECT 
    c.name AS CustomerName,
    p.name AS ProductName,
    pay.payments_method AS PaymentMethod,
    od.quantity,
    od.subtotal
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
JOIN Payments pay ON o.order_id = pay.order_id;

     
select * from customers;
select * from products;
SELECT 
    p.name AS ProductName,
    c.name AS CustomerName
FROM products p
LEFT JOIN orders_details od ON p.product_id = od.product_id
LEFT JOIN orders o ON od.order_id = o.order_id
LEFT JOIN customers c ON o.customers_id = c.customers_id ;



-- union 

SELECT Name AS All_Names FROM customers
UNION
SELECT name FROM products;

SELECT order_id FROM orders
UNION
SELECT order_id FROM payments;

-- case expression 
-- (a)
SELECT name, price,
CASE
    WHEN price < 500 THEN 'Budget'
    WHEN price BETWEEN 500 AND 2000 THEN 'Standard'
    ELSE 'Premium'
END AS Price_Category
FROM Products;


-- (b)
SELECT name, stock,
CASE
    WHEN stock > 0 THEN 'In Stock'
    ELSE 'Out of Stock'
END AS Stock_Status
FROM Products;

-- (c) 
SELECT c.name,
CASE
    WHEN SUM(o.total_amount) > 1200 then 'gold'
    WHEN SUM(o.total_amount) BETWEEN 5000 AND 10000 THEN 'Silver'
    ELSE 'Bronze'
END AS Customer_Category
FROM customers c
JOIN orders o ON c.customers_id = o.customer_id
GROUP BY c.name;

select * from payments;
select * from customers;
select * from products;
select * from orders_details;




-- String  functions 
 -- Display customer names in uppercase . 
 
select upper(name)
from customers;

--  Display customer names in lowercase. 
 
select lower(name)
from customers;

-- Extract the first three characters of product names. 

select name, left(name,3) As first_Three_Characters  
from 
products;

 -- Concatenate customer name and city. 
  
select name,city, concat(name," from ",city) as Name_and_City
from 
customers;
select * from customers;

--  Format email IDs to show only username part (before @).

select email , left (email, 6 )as user_name from customers;
 
-- Subquries

 -- (a) Find customers who placed more than 3 orders. 
select * from customers;
select * from orders_details;

SELECT c.Name
FROM customers c 
WHERE c.customers_id IN 
(
    SELECT customers_id  FROM orders GROUP BY customers_id having COUNT(order_id)>3
);

select  * from products;
SELECT * FROM products WHERE price = (SELECT
 MAX(price)

 FROM products);

select * from orders_details;
SELECT * FROM products
WHERE product_id NOT IN 
(SELECT product_id FROM orders_details);


select * from customers;

SELECT c.Name
FROM customers c
WHERE c.customers_id IN
 (
    SELECT o.customer_id FROM orders o
    JOIN payments p ON o.order_id = p.order_id
    WHERE o.total_amount = p.amount_paid
);

-- windows function 

select * from customers;
select * from payments;
select * from orders_details;

SELECT c.Name, SUM(o.total_amount) AS Total_Spending,
RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS Rank_Position
FROM customers c
JOIN orders o ON c.customers_id= o.customer_id
GROUP BY c.Name;

SELECT order_id, ROW_NUMBER() OVER (ORDER BY order_date) AS RowNum
FROM orders;

SELECT customer_id, order_id, SUM(total_amount) OVER (PARTITION BY customer_id) AS Cumulative_Spending
FROM orders;

SELECT category, name, price, AVG(price) OVER (PARTITION BY category) AS Avg_Category_Price
FROM products;