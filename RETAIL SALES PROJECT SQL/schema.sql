-- CREATE DATABASE 

CREATE DATABASE retail_sales_db;
USE retail_sales_db;



-- CREATE TABLE

CREATE TABLE retail_sales_tb
		( 
				transactions_id  INT PRIMARY KEY,
				sale_date  DATE,
				sale_time  TIME,
				customer_id  INT,
				gender  VARCHAR(10),
				age  INT,
				category  VARCHAR(50),
				quantiy  INT,
				price_per_unit  DECIMAL(10,2),
				cogs  DECIMAL(10,2),
				total_sale  DECIMAL(10,2)
		); 