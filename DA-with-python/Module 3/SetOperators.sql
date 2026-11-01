-- Set Operators 

-- U = [1,2,3,4,5,6,7]	
-- a = [1,2,3]
-- b = [2,5,6,7]

-- Union 
-- a U b - [1,2,3,5,6,7]

-- Intersection 
-- a | b - [2] 


-- Syntax

--query_1
--UNION -- removes duplicate
--query_2

-- number of columns should be same 

select first_name, last_name from sales.customers -- 1445 
Union 
select first_name, last_name from sales.staffs; -- 10 

-- after union -- 1454  (1445 + 10 = 1455) 

-- Task -- Find that duplicate name 

-- union all 
select first_name, last_name from sales.customers -- 1445 
Union all
select first_name, last_name from sales.staffs; -- 10 

-- Error 
select first_name, last_name, city from sales.customers -- 1445 
Union 
select first_name, last_name from sales.staffs; -- 10 


-- Include Null column 
select first_name, last_name, city from sales.customers -- 1445 
Union 
select first_name, last_name, 'karachi' from sales.staffs; -- 10 



-- Intersection 
-- Syntax 

--query_1
--INTERSECT
--query_2

SELECT
    city
FROM
    sales.customers
INTERSECT
SELECT
    city
FROM
    sales.stores
ORDER BY
    city;


select first_name, last_name from sales.customers
intersect 
select first_name, last_name from sales.staffs;

select first_name, last_name,
    count(*) as duplicate_count
from sales.customers
group by first_name, last_name
having count(*) > 1;

select * from sales.customers
where first_name = 'Justina' and last_name = 'Jenkins';
