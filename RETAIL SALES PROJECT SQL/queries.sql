/*
=================================================
==================
Retail Sales Data Analysis usong SQL 
=================================================
=================*/

USE retail_sales_db;

-- 1. BASIC BUSINESS METRICS


-- TOTAL REVENUE GENRATED

SELECT
SUM(total_sale) AS total_revenue
FROM retail_sales_tb;


-- TOTAL NUMBER OF TRANSACTIONS 

SELECT 
COUNT(*) AS total_transactions
FROM retail_sales_tb;


-- TOTAL NUMBER OF QUANTITY SOLD

SELECT 
SUM(quantiy) AS total_sold 
FROM retail_sales_tb;


-- AVERAGE ORDER VALUE
SELECT 
AVG(total_sale) AS avg_order_val
FROM retail_sales_tb;


-- 2. TIME BASED ANALYSIS


-- MONTHLY REVENUE TREND

SELECT 
DATE_FORMAT(sale_date, '%Y-%m') AS month,
SUM(total_sale) AS monthly_revenue
FROM retail_sales_tb
GROUP BY month
ORDER  BY MONTH;


-- SALES BY DAY OF WEEK

SELECT   
DAYNAME(sale_date) AS day_of_week,
SUM(total_sale) AS revenue 
FROM retail_sales_tb
GROUP BY day_of_week
ORDER BY revenue DESC;


-- PEAK SALES HOURS

SELECT
HOUR(sale_time) AS sale_hour,
SUM(total_sale) AS revenue
FROM retail_sales_tb
GROUP BY sale_hour
ORDER BY revenue DESC; 


-- 3. CATEGORY ANALYSIS


-- REVENUE BY CATEGORY

SELECT 
category,
SUM(total_sale) AS revenue
FROM retail_sales_tb
GROUP BY category
ORDER BY revenue DESC;


-- TOTAL QUANTITY SOLD BY CATEGORY

SELECT 
category,
SUM(quantiy) AS total_quantity
FROM retail_sales_tb
GROUP BY category
ORDER BY total_quantity DESC;


-- AVERAGE ORDER VALUE BY CATEGORY

SELECT 
category,
AVG(total_sale) AS avg_order_val
FROM retail_sales_tb
GROUP BY category
ORDER BY avg_order_val DESC;


-- 4. CUSTOMER INSIGHTS


-- TOP 10 CUSTOMERS BY TOTAL SPENDING

SELECT
customer_id, 
SUM(total_sale) AS spending
FROM retail_sales_tb
GROUP BY customer_id
ORDER BY spending DESC 
LIMIT 10;


-- AVERAGE SPENDING PER CUSTOMER

SELECT 
AVG(customer_total) AS avg_per_customer
FROM(
SELECT
customer_id,
SUM(total_sale) AS customer_total
from retail_sales_tb
GROUP BY customer_id
) sub;


-- 5. PROFIT ANALYSIS


-- TOTAL PROFIT

SELECT 
SUM(total_sale - cogs) AS total_profit
FROM retail_sales_tb;


-- PROFIT BY CATEGORY

SELECT  
category,
SUM(total_sale - cogs) AS profit
FROM retail_sales_tb
GROUP BY category
ORDER BY profit DESC;


-- 6. WINDOW FUNCTION ANALYSIS


-- RANK CATEGORIES BY TOTAL REVENUE

SELECT 
category,
SUM(total_sale) AS revenue,
RANK() OVER (ORDER BY SUM(total_sale)DESC) 
AS revenue_rank
FROM retail_sales_tb
GROUP BY category; 