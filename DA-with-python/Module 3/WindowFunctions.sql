-- Windows Function 

--function_name() OVER (
--    [PARTITION BY partition_expression]
--    [ORDER BY sort_expression]
--    [frame_specification]
--)


SELECT
    product_name,
    list_price,
    AVG(list_price) OVER () AS overall_avg
FROM production.products;





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

