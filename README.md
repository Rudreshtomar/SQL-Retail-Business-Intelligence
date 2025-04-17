# 🛍️ Retail Sales Insights Analysis 💼📊  
**Analyze. Optimize. Grow.**

---

## 📖 Project Overview

This project presents a complete end-to-end **Retail Business Intelligence** analysis using **SQL**, transforming raw transactional data into actionable insights. From cleaning missing values to identifying top-performing products, customers, and sales shifts — everything is handled with structured SQL queries.

---

## 🎯 Objectives

- 🧼 Clean raw data and handle NULLs  
- 🔍 Explore customer demographics and purchase patterns  
- 📦 Analyze category-wise sales performance  
- 🕒 Identify peak sales hours and monthly trends  
- 🧑‍💼 Highlight high-value customers  

---

## 🧰 Tech Stack

| Component       | Details                             |
|----------------|--------------------------------------|
| Language        | SQL (PostgreSQL / MySQL compatible) |
| Tools Used      | pgAdmin, DBeaver, Local DB           |
| Dataset Format  | CSV (Retail Sales Transactions)      |

---

## 📁 Project Structure

| File Name                 | Description                              |
|---------------------------|------------------------------------------|
| `Retail Sales Dataset.csv`| Cleaned retail sales dataset             |
| `SQL Queries.sql`         | SQL scripts for analysis                 |
| `README.md`               | Project summary and insights             |

---

## 🚀 SQL Highlights (Impressive Queries)

### 🧼 Data Cleaning – Remove Missing Values

```sql
DELETE FROM retail_sales
WHERE transactions_id IS NULL 
   OR sale_date IS NULL 
   OR sale_time IS NULL 
   OR customer_id IS NULL 
   OR gender IS NULL 
   OR category IS NULL 
   OR quantity IS NULL 
   OR price_per_unit IS NULL 
   OR cogs IS NULL 
   OR total_sale IS NULL;
```

---

### 📊 Total Sales by Category

```sql
SELECT category, 
       SUM(total_sale) AS Total_Sale, 
       COUNT(*) AS Total_Orders
FROM retail_sales
GROUP BY category;
```

---

### 👥 Unique Customers by Category

```sql
SELECT category,
       COUNT(DISTINCT customer_id) AS UNIQUE_CUSTOMER
FROM retail_sales
GROUP BY category;
```

---

### 🕒 Shift-Wise Sales (Morning / Afternoon / Evening)

```sql
SELECT
  CASE
    WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS Shift,
  COUNT(*) AS number_of_orders
FROM retail_sales
GROUP BY Shift;
```

---

### 🧑‍💼 Top 5 High-Spending Customers

```sql
SELECT customer_id,
       SUM(total_sale) AS Highest_Sale
FROM retail_sales
GROUP BY customer_id
ORDER BY Highest_Sale DESC
LIMIT 5;
```

---

### 📆 Monthly Average Sale (Best Month Detection)

```sql
SELECT EXTRACT(YEAR FROM sale_date) AS Year,
       EXTRACT(MONTH FROM sale_date) AS Month,
       AVG(total_sale) AS Avg_Sale
FROM retail_sales
GROUP BY Year, Month
ORDER BY Year, Avg_Sale DESC;
```

---

## 💡 Business Insights

| Area             | Insight                                                                 |
|------------------|-------------------------------------------------------------------------|
| 📦 Product Trends| Clothing & Beauty categories show the highest sales volumes             |
| 👥 Demographics   | Majority customers are aged 18–32, with females driving 'Beauty' sales  |
| 🕒 Shift Pattern  | Afternoon and Evening are peak sales shifts                             |
| 💰 Top Customers  | Top 5 customers contribute significantly to revenue                     |
| 📆 Seasonality    | November & December show highest sales — indicates festive surge       |

---

## 🧠 Skills Demonstrated

- SQL Data Cleaning using `DELETE`, `IS NULL`
- Aggregation with `SUM()`, `AVG()`, `COUNT()`
- Grouping & Filtering for customer/category analysis
- Date operations using `EXTRACT`, `TO_CHAR`
- Logical segmentation using `CASE` statements
- Business insight derivation from real-world sales data

---

## ✅ Summary

“This project simulates a real-world retail scenario where structured SQL queries help derive valuable insights from raw transactional data. It reflects my capability to clean, explore, and analyze data — ultimately driving business decisions.”

---

## 📲 Connect With Me

[![LinkedIn](https://img.shields.io/badge/LinkedIn--%230077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/rudreshtomar5/)
[![Gmail](https://img.shields.io/badge/Gmail--D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:rudreshtomar5@gmail.com)

---

© 2025 Retail Sales Insights Project | Rudresh Tomar
