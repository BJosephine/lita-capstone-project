create database LITA_PROJECT

Select * from [dbo].[LITA Capstone Dataset CSV]

---Total Sales for each product category---
SELECT Product,
SUM(Quantity) as SALES
FROM [LITA Capstone Dataset CSV]
GROUP BY Product;

---Number of Sales transaction in each Region---
Select Region,
COUNT(Quantity) AS num_sales_transactions
FROM
 [LITA Capstone Dataset CSV]
GROUP BY
 Region

 ---Number of highest selling product by Total sales value---
SELECT Product,
SUM(Total_sales) as SALES
FROM [LITA Capstone Dataset CSV]
GROUP BY Product
ORDER BY Product ASC;

---Total revenue for each product---
SELECT Product,
SUM(Total_sales) as SALES
FROM [LITA Capstone Dataset CSV]
GROUP BY Product
ORDER BY Product ASC;

---monthly sales total for the current year---
SELECT Month,
SUM(Total_sales) as MONTHLY_SALES
FROM [dbo].[LITA Capstone Dataset CSV]
GROUP BY Month;

---Top 5 customers by total purchase amount---
SELECT TOP 5
Customer_id,
SUM(Total_Sales) as TOP_CUSTOMERS
FROM [dbo].[LITA Capstone Dataset CSV]
GROUP BY Customer_Id
ORDER BY Customer_Id DESC;

---Percentage of Total sales contributed by each region---
SELECT Region,
SUM(Total_sales) AS Regional_Sales,
(SUM(Total_Sales)/ (SELECT SUM(Total_sales) FROM [dbo].[LITA Capstone Dataset CSV])) * 100
AS Percentage_Regional_Sales
FROM [dbo].[LITA Capstone Dataset CSV]
GROUP BY Region;

---Identify products with no sales last quarter---
SELECT Product,
SUM(Total_sales) AS Sales
FROM [dbo].[LITA Capstone Dataset CSV]
GROUP BY Product;

SELECT Product,
SUM(Quantity) as SALES
FROM [LITA Capstone Dataset CSV]
GROUP BY Product
Where BY Product=NULL;
