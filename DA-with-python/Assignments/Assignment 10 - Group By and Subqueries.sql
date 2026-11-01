-- ============================================================
--  ASSIGNMENT 10 — Group By & Subqueries
--  Database : BikeStores
--  Topics   : Aggregate functions, GROUP BY, HAVING,
--             subqueries in WHERE (IN / NOT IN / scalar),
--             subqueries in FROM (derived tables),
--             subqueries in SELECT
-- ============================================================


-- ============================================================
--  Question 1 — Aggregate Functions
--  From sales.order_items, write ONE query that returns:
--    • total number of order lines
--    • total units sold (SUM of quantity)
--    • average, minimum and maximum list_price
--  Give every column a meaningful alias.
-- ============================================================

-- Write your query below:




-- ============================================================
--  Question 2 — COUNT(*) vs COUNT(column)
--  a) How many rows are there in sales.customers?
--  b) How many customers have an email on record, and how many
--     have a phone number on record?
--  c) Using the results above, how many customers have NO phone
--     number? Confirm it with a separate query using IS NULL.
--  Add the numbers you get as comments.
-- ============================================================

-- Part a:


-- Part b:


-- Part c:




-- ============================================================
--  Question 3 — GROUP BY
--  a) Find the total units sold (SUM of quantity) for each
--     product_id in sales.order_items, highest first.
--  b) Count the number of customers in each state, highest
--     first.
--  c) Count the number of orders handled by each staff_id and
--     each order_status combination.
-- ============================================================

-- Part a:


-- Part b:


-- Part c:




-- ============================================================
--  Question 4 — GROUP BY with Joins
--  a) Show category_name and the average list_price of its
--     products (rounded to 2 decimals). Join products and
--     categories.
--  b) Show brand_name and the number of products in each brand,
--     sorted by the product count descending.
--  c) For every customer, show customer_id, first_name,
--     last_name, order_count and total_spent.
--     total_spent = SUM(quantity * list_price * (1 - discount))
--     Hint: use COUNT(DISTINCT order_id) so orders are not
--     counted once per item.
-- ============================================================

-- Part a:


-- Part b:


-- Part c:




-- ============================================================
--  Question 5 — HAVING
--  a) List the model_year values that have more than 50
--     products, with the product count.
--  b) List the customers who have placed 2 or more orders
--     (customer_id and order_count).
--  c) List the product_ids that have sold more than 100 units
--     in total.
--  d) In a comment, explain why part (a) cannot be written
--     with WHERE alone.
-- ============================================================

-- Part a:


-- Part b:


-- Part c:


-- Part d (answer as a comment):




-- ============================================================
--  Question 6 — WHERE + GROUP BY + HAVING Together
--  Using only orders placed in the year 2017, find the stores
--  (store_id) whose total revenue is above 100000.
--  Show store_id and total_revenue, highest first.
--  Hint: WHERE filters rows before grouping, HAVING filters
--  groups after grouping.
-- ============================================================

-- Write your query below:




-- ============================================================
--  Question 7 — Subquery in WHERE (IN)
--  a) Return all orders placed by customers who live in
--     'New York'. Use a subquery on sales.customers.
--  b) Return the product_id and product_name of all products
--     that belong to the categories 'Electric Bikes' or
--     'Cruisers Bicycles'. Use a subquery on categories.
--  c) Return the customers (first_name, last_name, city) who
--     have placed at least one order. Use IN with a subquery.
-- ============================================================

-- Part a:


-- Part b:


-- Part c:




-- ============================================================
--  Question 8 — Subquery in WHERE (Scalar & NOT IN)
--  a) Return all products priced ABOVE the overall average
--     list_price. Do not hardcode the average.
--  b) Return all products priced BELOW the overall average
--     list_price, and write a second query that counts how
--     many such products there are.
--  c) Return the customers who have NEVER placed an order,
--     using NOT IN.
--  d) Return the products that have never been ordered
--     (not present in sales.order_items).
--  Hint for c and d: filter out NULLs inside the subquery so
--  NOT IN works correctly.
-- ============================================================

-- Part a:


-- Part b:


-- Part c:


-- Part d:




-- ============================================================
--  Question 9 — Subquery in FROM (Derived Table)
--  a) First find the number of orders handled by each staff
--     member. Then, using that result as a derived table,
--     calculate the average, minimum and maximum order count
--     per staff member.
--  b) Using a derived table of total_spent per customer,
--     return the average total_spent across all customers.
--  Remember: a derived table needs an alias.
-- ============================================================

-- Part a:


-- Part b:




-- ============================================================
--  Question 10 — Subquery in SELECT
--  a) For each product (product_id, product_name, list_price),
--     show the total quantity sold as a column named
--     units_sold, using a correlated subquery on
--     sales.order_items.
--  b) For each order (order_id, order_date), show the number of
--     items in that order as item_count and the highest
--     list_price in that order as max_item_price.
--  c) Show the difference between each product's list_price and
--     the overall average list_price as price_difference.
-- ============================================================

-- Part a:


-- Part b:


-- Part c:




-- ============================================================
--  Question 11 — Challenge
--  Find the customers whose total_spent is higher than the
--  average total_spent of all customers.
--  Show customer_id, first_name, last_name and total_spent,
--  highest first.
--  Hint: combine GROUP BY + HAVING with a scalar subquery
--  (or a derived table) that calculates the average.
-- ============================================================

-- Write your query below:
