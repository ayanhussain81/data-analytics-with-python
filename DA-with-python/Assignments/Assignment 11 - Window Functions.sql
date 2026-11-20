-- ============================================================
--  ASSIGNMENT 11 — Window Functions
--  Database : BikeStores
--  Topics   : OVER(), PARTITION BY, ROW_NUMBER, RANK,
--             DENSE_RANK, LAG, LEAD, running totals,
--             window functions with CTEs
-- ============================================================


-- ============================================================
--  Question 1 — Aggregate as a Window Function
--  a) Return product_name, list_price and the overall average
--     list_price of all products as a column named overall_avg
--     (use AVG with an empty OVER()).
--  b) Extend the query to add price_difference, i.e. each
--     product's list_price minus overall_avg.
--  c) Explain in a comment how this differs from using
--     GROUP BY with AVG.
-- ============================================================

-- Part a:


-- Part b:


-- Part c (answer as a comment):




-- ============================================================
--  Question 2 — PARTITION BY
--  a) Return product_name, category_id, list_price and the
--     average list_price of that product's category as
--     category_avg_price (rounded to 2 decimals).
--  b) Return product_name, brand_id, list_price and the
--     MAX list_price within the brand as brand_max_price.
--  c) Return order_id, item_id, product_id, quantity and the
--     total quantity of the whole order as order_total_qty
--     (from sales.order_items).
-- ============================================================

-- Part a:


-- Part b:


-- Part c:




-- ============================================================
--  Question 3 — ROW_NUMBER
--  a) Assign a sequential number to every customer ordered by
--     last_name, then first_name. Show row_num, first_name,
--     last_name and city.
--  b) Restart the numbering for each city (PARTITION BY city),
--     ordered by first_name.
--  c) For each category_id, number the products from the most
--     expensive to the cheapest. Show category_id,
--     product_name, list_price and row_num.
-- ============================================================

-- Part a:


-- Part b:


-- Part c:




-- ============================================================
--  Question 4 — Top N per Group
--  a) Return the 3 most expensive products of EACH category.
--     Show category_id, product_name, list_price.
--     Hint: use ROW_NUMBER inside a CTE or derived table, then
--     filter on it in the outer query (window functions cannot
--     be used directly in WHERE).
--  b) Return the most recent order of EACH customer.
--     Show customer_id, order_id and order_date.
-- ============================================================

-- Part a:


-- Part b:




-- ============================================================
--  Question 5 — RANK vs DENSE_RANK
--  a) Rank all products by list_price (highest first) using
--     both RANK() and DENSE_RANK() in the same query. Show
--     product_name, list_price, price_rank and dense_price_rank.
--  b) Do the same ranking, but restart it inside each brand_id
--     (PARTITION BY brand_id).
--  c) Explain in a comment what happens to the numbers after
--     a tie with RANK and with DENSE_RANK. Point to a row from
--     your own result as an example.
-- ============================================================

-- Part a:


-- Part b:


-- Part c (answer as a comment):




-- ============================================================
--  Question 6 — Ranking with Aggregates
--  Calculate the total revenue of each customer
--  (SUM(quantity * list_price * (1 - discount))) and rank the
--  customers from the highest spender to the lowest using
--  DENSE_RANK. Show customer_id, total_spent and spend_rank.
--  Hint: aggregate in a CTE first, then apply the window
--  function in the next step.
-- ============================================================

-- Write your query below:




-- ============================================================
--  Question 7 — LAG
--  For the brand 'Electra' in the year 2018, calculate the net
--  sales per month (SUM(quantity * list_price * (1 - discount))).
--  Then use LAG to show:
--    month, net_sales, previous_month_sales and the percentage
--    change versus the previous month.
--  Hint: a CTE for the monthly sales, a second step for LAG.
-- ============================================================

-- Write your query below:




-- ============================================================
--  Question 8 — LEAD
--  a) For each customer, show order_id, order_date and the
--     order_date of their NEXT order as next_order_date.
--  b) Add a column days_to_next_order using DATEDIFF.
--     Orders with no next order should show NULL.
--  c) Repeat part (a) but use the third argument of LEAD to
--     replace NULL with '2099-12-31'.
-- ============================================================

-- Part a:


-- Part b:


-- Part c:




-- ============================================================
--  Question 9 — Running Total
--  a) Show each order's order_id, order_date and its total
--     order value, together with a running total of the order
--     value ordered by order_date, order_id.
--     Hint: SUM(...) OVER (ORDER BY order_date, order_id).
--  b) Restart the running total for every store_id
--     (PARTITION BY store_id).
-- ============================================================

-- Part a:


-- Part b:




-- ============================================================
--  Question 10 — Challenge
--  Build a report for the year 2017 with one row per month:
--    month, total_sales, previous_month_sales,
--    sales_change (in %), and sales_rank
--    (rank of the month by total_sales, highest first).
--  Use a CTE for the monthly totals and combine LAG with
--  RANK in the final SELECT.
-- ============================================================

-- Write your query below:
