-- 1 order of 10 products -- 
-- total 10 rows -- sum of rows will become 1 row 

--An aggregate function collapses many rows into a single result.
use BikeStores;
select * from production.products;

select count(*) as total_products from production.products;

SELECT
    AVG(list_price) AS avg_price,
    MIN(list_price) AS cheapest,
    MAX(list_price) AS priciest,
    SUM(list_price) AS catalog_value
FROM production.products;

select count(*) from sales.customers; -- 1445
select count(phone) from sales.customers; -- 178  -- 1445 - 178 = 1267 null values

select count(*) as phone_null_count from sales.customers
where phone is null;


select 
    category_id,
    count(*) as product_count
from production.products
group by category_id;


select 
    brand_id,
    count(*) as product_count
from production.products
group by brand_id
order by count(*) desc;

-- count by a model year

select 
    model_year, 
    count(model_year) as products_count
from production.products 
group by model_year;


-- group by brand then on category 

select 
    brand_id,
    category_id,
    COUNT(*) as product_count
from production.products
group by brand_id, category_id
order by 1,2

-- Having 
-- products_count should be greater than 50 

select 
    model_year, 
    count(model_year) as products_count
from production.products 
--where model_year = 2016
group by model_year
having count(model_year) > 50;

-- task -- find customers who have placed more than 2 orders 

select 
    c.customer_id, 
    count(*) as order_count
from
    sales.customers c
inner join sales.orders o
    on c.customer_id = o.customer_id
group by c.customer_id 
having count(*) >= 2;


    -- customer_id, first_name, last_name, order_count, total_spent

    -- 1st part
     select 
        c.customer_id,
        c.first_name,
        c.last_name,
        o.order_id
    from sales.customers c
    inner join sales.orders o 
    on o.customer_id = c.customer_id;

    -- 2nd part
    select 
        c.customer_id,
        c.first_name,
        c.last_name,
        count(o.order_id) as order_count
    from sales.customers c
    inner join sales.orders o 
    on o.customer_id = c.customer_id
    group by c.customer_id, c.first_name, c.last_name
    order by count(o.order_id) desc

    -- 3rd phase 
select 
    c.customer_id,
    c.first_name,
    c.last_name,
    count( distinct o.order_id) as order_count,
    sum(oi.quantity * oi.list_price * (1 - discount)) as total_spent
from 
    sales.customers c
inner join sales.orders o 
    on o.customer_id = c.customer_id
inner join sales.order_items oi 
    on oi.order_id = o.order_id
group by 
    c.customer_id, 
    c.first_name, 
    c.last_name
order by sum(oi.quantity * oi.list_price * (1 - discount)) desc 

-- 94	Sharyn	Hopkins	2	34807.9392

-- total spent -- 
-- list_price -- price on one item (quantity * list_price)
-- dicount - 15 


select * from sales.order_items;
-- 0.20 == 20% 
-- 100 - 20 = 80
-- 100 * 0.8 = 80


-- 200 * (1 - discount) =
-- 200 * (1 - 0.20) == 200 * 0.80 ==  160