-- Task 1 - find customers who have placed more than 2 orders

-- Task 2 - find products order counts 

SELECT

    p.product_id,
    p.product_name,
    COUNT(oi.order_id) AS order_count

FROM production.products p
JOIN sales.order_items oi ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY order_count DESC;


select * from sales.order_items;

-- HW find total units sold out by product id  (use quantity)


-- Sub Queries 


Select * from sales.customers
where city = 'New york';

select * from sales.orders;

select * from sales.orders
where customer_id in (16, 178, 327,411,845,927,1016);  -- hardcoded cant do manually update 

-- Find oders from New York

select * from sales.orders -- outer query
where customer_id in (
    Select customer_id from sales.customers
    where city = 'New york' -- inner query - sub query 
); 


-- Products priced above the overall average

select avg(list_price) from production.products

select * from production.products
where list_price > 1520.60;

-- using subquery 

select * from production.products
where list_price > (select avg(list_price) from production.products);


select * from production.stocks;


-- find product_id, product_name 
-- where categories -- 'Mountain Bikes' 'Road Bikes'

select p.product_id,p.product_name from production.products p 
where p.category_id in 
(select c.category_id from production.categories c 
where c.category_name in ('Mountain Bikes','Road Bikes'))


-- Customers who have never placed an order

-- Customers who have never placed an order
SELECT
    customer_id,
    first_name,
    last_name
FROM sales.customers
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id
    FROM sales.orders
    WHERE customer_id IS NOT NULL
);

-- Using From 
-- 1st aggregation find count
SELECT
    staff_id,
    COUNT(order_id) AS order_count
FROM sales.orders
GROUP BY staff_id;

select * from sales.orders;

-- 2nd agregation 

select avg(order_count) AS average_order_count_per_staff
from (
SELECT
    staff_id,
    COUNT(order_id) AS order_count
FROM sales.orders
GROUP BY staff_id)
as staff_order_counts;


-- In Select 


-- Each order with the maximum item price in that order
SELECT
    order_id,
    order_date,
    (
        SELECT MAX(list_price)
        FROM sales.order_items i
        WHERE i.order_id = o.order_id
    ) AS max_item_price
FROM sales.orders o
ORDER BY order_date DESC;



select * from sales.order_items
where order_id = 1615; -- 



