-- SQL sales Retail Analysis 
create database Sql_project_p1

-- Create Table 
CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,	
    sale_date DATE, 	
    sale_time TIME,	
    customer_id INT,
    gender VARCHAR(15),	
    age INT,	
    category VARCHAR(15),	
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,	
    total_sale FLOAT
);

SELECT * from retail_sales
limit (10)


SELECT COUNT (*) FROM Retail_sales 

--Data Cleaning

SELECT * from retail_sales
WHERE transactions_id IS NULL
OR 
sale_date IS NULL
or
sale_time IS NULL
or 
customer_id IS NULL
or
gender IS NULL
or 
category IS NULL
or
quantity IS NULL
or
price_per_unit IS NULL
or 
cogs IS NULL
or
total_sale IS NULL




DELETE FROM retail_sales
WHERE transactions_id IS NULL
OR 
sale_date IS NULL
or
sale_time IS NULL
or 
customer_id IS NULL
or
gender IS NULL
or 
category IS NULL
or
quantity IS NULL
or
price_per_unit IS NULL
or 
cogs IS NULL
or
total_sale IS NULL;


--Data Exploration

-- How many sales we have?

SELECT COUNT (*) AS total_sale FROM retail_sales

-- How many unique customers we have?

SELECT COUNT(DISTINCT customer_id) AS Unique_customers FROM retail_sales;


-- How many unique categories we have?

SELECT DISTINCT category AS Unique_category FROM retail_sales;


-- Data Analysis & Business Key Problems & Answers

--Q1 Write a SQL query to retrieve all columns for sales made on '2022-11-05 

SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05'


--Q2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:

SELECT * FROM retail_sales
WHERE category = 'Clothing'
AND 
TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
AND Quantity >= '4' 
GROUP BY 1

--Q3 Write a SQL query to calculate the total sales (total_sale) for each category.:

SELECT category, 
SUM(total_sale) AS Total_Sale,
count(*) as Total_Orders
FROM retail_sales
GROUP BY category;

--Q4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT ROUND(AVG(age),2) AS Average_Age FROM retail_sales
WHERE category = 'Beauty'

--Q5 Write a SQL query to find all transactions where the total_sale is greater than 1000.:

SELECT * FROM retail_sales
WHERE total_sale > '1000'

--Q6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:

SELECT category, gender,
COUNT(*) transactions_id 
FROM retail_sales
GROUP BY 1,2
ORDER BY 1

--Q7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

SELECT 
EXTRACT(YEAR FROM sale_date) as YEAR, 
EXTRACT(MONTH FROM sale_date) as MONTH,
AVG(total_sale) as Avg_Sale
FROM retail_sales
GROUP BY 1,2 
ORDER BY 1,3 DESC

--Q8 Write a SQL query to find the top 5 customers based on the highest total sales 

SELECT  customer_id,
SUM(total_sale) AS Highest_Sale
FROM retail_sales
GROUP BY 1 
ORDER BY 2 DESC
LIMIT 5;



--Q9 Write a SQL query to find the number of unique customers who purchased items from each category.:


SELECT category,
COUNT(DISTINCT customer_id) AS UNIQUE_CUSTOMER
FROM retail_sales
GROUP BY 1


--Q10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):

SELECT
CASE
WHEN EXTRACT(HOUR FROM sale_time)< 12 THEN 'Morning'
WHEN EXTRACT(HOUR FROM sale_time)BETWEEN 12 AND 17 THEN 'Afternoon'
ELSE 'Evening'
END AS Shift,
COUNT(*) AS number_of_orders
FROM retail_sales
GROUP BY shift 


--End Of Project



























