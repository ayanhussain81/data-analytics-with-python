-- Windows Function 

--function_name() OVER (
--    [PARTITION BY partition_expression]
--    [ORDER BY sort_expression]
--)


SELECT
    product_name,
    list_price,
    AVG(list_price) OVER () AS overall_avg
FROM production.products;


SELECT
    product_name,
    list_price,
    category_id,
    AVG(list_price) OVER (partition by category_id ) AS overall_avg
FROM production.products;


-- 1 - 287.78
-- 2 - 682 




--ROW_NUMBER() OVER (
--    [PARTITION BY partition_expression]
--    ORDER BY sort_expression
--)


SELECT
    ROW_NUMBER() OVER (ORDER BY first_name) AS row_num,
    first_name,
    last_name,
    city
FROM sales.customers;



SELECT
    ROW_NUMBER() OVER (ORDER BY first_name) AS row_num,
    first_name,
    last_name,
    city
FROM sales.customers;


SELECT
    ROW_NUMBER() OVER (PARTITION BY city
        ORDER BY first_name) AS row_num,
    first_name,
    last_name,
    city
FROM sales.customers;

select 
    product_name,category_id,
    model_year,
    ROW_NUMBER() over(partition by category_id 
        order by product_name) as row_num
from production.products;


SELECT
	product_id,
	product_name,
	list_price,
	RANK () OVER ( 
		ORDER BY list_price DESC
	) price_rank,
    DENSE_RANK () OVER ( 
		ORDER BY list_price DESC
	) dense_price_rank 
FROM
	production.products;


SELECT product_id, product_name,  brand_id,list_price,
    RANK () OVER(PARTITION BY brand_id ORDER BY list_price) rank_by_brand,
    DENSE_RANK () OVER(PARTITION BY brand_id ORDER BY list_price ) rank_by_brand
FROM production.products



-- Lead & Lag

--LAG(return_value ,offset [,default]) 
--OVER (
--    [PARTITION BY partition_expression, ... ]
--    ORDER BY sort_expression [ASC | DESC], ...
--)



with vw_netsales_brands AS (
	SELECT 
		c.brand_name, 
		MONTH(o.order_date) month, 
		CONVERT(DEC(10, 2), SUM((i.list_price * i.quantity) * (1 - i.discount))) AS net_sales
	FROM sales.orders AS o
		INNER JOIN sales.order_items AS i ON i.order_id = o.order_id
		INNER JOIN production.products AS p ON p.product_id = i.product_id
		INNER JOIN production.brands AS c ON c.brand_id = p.brand_id
    WHERE 
		year(o.order_date) = 2018 and c.brand_name = 'Electra'
	GROUP BY c.brand_name, 
			MONTH(o.order_date)
),
cte_lag as (
SELECT 
    brand_name,
	month,
	net_sales,
	LAG(net_sales,1) OVER (
		ORDER BY month
	) previous_month_sales
FROM 
	vw_netsales_brands
  )

select 
    brand_name,
	month,
	net_sales,
    previous_month_sales,
    FORMAT(
		(net_sales - previous_month_sales)  / previous_month_sales,
		'P'
	) vs_previous_month
from 
    cte_lag;




with vw_netsales_brands AS (
	SELECT 
		c.brand_name, 
		MONTH(o.order_date) month, 
		CONVERT(DEC(10, 2), SUM((i.list_price * i.quantity) * (1 - i.discount))) AS net_sales
	FROM sales.orders AS o
		INNER JOIN sales.order_items AS i ON i.order_id = o.order_id
		INNER JOIN production.products AS p ON p.product_id = i.product_id
		INNER JOIN production.brands AS c ON c.brand_id = p.brand_id
    WHERE 
		year(o.order_date) = 2018 and c.brand_name = 'Electra'
	GROUP BY c.brand_name, 
			MONTH(o.order_date)
)
SELECT 
	month,
	net_sales,
	LEAD(net_sales,1) OVER (
		ORDER BY month
	) next_month_sales
FROM 
	vw_netsales_brands;

-- learn Views by yourself