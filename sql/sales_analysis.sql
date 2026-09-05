-- Sales Performance Analysis
-- Dataset: sales_data_cleaned.csv

-- 1. Total revenue, cost and profit
SELECT
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Cost), 2) AS Total_Cost,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales_data;

-- 2. Monthly revenue and profit
SELECT
    EXTRACT(YEAR FROM Order_Date) AS Year,
    EXTRACT(MONTH FROM Order_Date) AS Month,
    ROUND(SUM(Revenue), 2) AS Revenue,
    ROUND(SUM(Profit), 2) AS Profit
FROM sales_data
GROUP BY EXTRACT(YEAR FROM Order_Date), EXTRACT(MONTH FROM Order_Date)
ORDER BY Year, Month;

-- 3. Regional performance
SELECT
    Region,
    ROUND(SUM(Revenue), 2) AS Revenue,
    ROUND(SUM(Profit), 2) AS Profit,
    SUM(Quantity) AS Units_Sold
FROM sales_data
GROUP BY Region
ORDER BY Revenue DESC;

-- 4. Category performance
SELECT
    Category,
    ROUND(SUM(Revenue), 2) AS Revenue,
    ROUND(SUM(Profit), 2) AS Profit,
    SUM(Quantity) AS Units_Sold
FROM sales_data
GROUP BY Category
ORDER BY Revenue DESC;

-- 5. Top 10 products by revenue
SELECT
    Product,
    ROUND(SUM(Revenue), 2) AS Revenue,
    ROUND(SUM(Profit), 2) AS Profit,
    SUM(Quantity) AS Units_Sold
FROM sales_data
GROUP BY Product
ORDER BY Revenue DESC
LIMIT 10;

-- 6. Customer contribution
SELECT
    Customer_ID,
    ROUND(SUM(Revenue), 2) AS Revenue,
    ROUND(SUM(Profit), 2) AS Profit,
    COUNT(*) AS Orders
FROM sales_data
GROUP BY Customer_ID
ORDER BY Revenue DESC
LIMIT 20;
