USE retail_project;

-- Total Revenue

SELECT 
    ROUND(SUM(Quantity * UnitPrice), 2) AS total_revenue
FROM online_retail;


-- Total Orders

SELECT 
    COUNT(DISTINCT InvoiceNo) AS total_orders
FROM online_retail;


-- Top 10 Best Selling Products

SELECT 
    Description,
    SUM(Quantity) AS total_quantity
FROM online_retail
GROUP BY Description
ORDER BY total_quantity DESC
LIMIT 10;


-- Top 10 Customers by Spending

SELECT 
    CustomerID,
    ROUND(SUM(Quantity * UnitPrice), 2) AS total_spending
FROM online_retail
GROUP BY CustomerID
ORDER BY total_spending DESC
LIMIT 10;


-- Monthly Revenue

SELECT 
    MONTH(InvoiceDate) AS month_number,
    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue
FROM online_retail
GROUP BY MONTH(InvoiceDate)
ORDER BY month_number;


-- Revenue by Country

SELECT 
    Country,
    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue
FROM online_retail
GROUP BY Country
ORDER BY revenue DESC;


-- Average Order Value

SELECT 
    ROUND(
        SUM(Quantity * UnitPrice) /
        COUNT(DISTINCT InvoiceNo), 2
    ) AS average_order_value
FROM online_retail;


-- Most Expensive Products

SELECT 
    Description,
    MAX(UnitPrice) AS highest_price
FROM online_retail
GROUP BY Description
ORDER BY highest_price DESC
LIMIT 10;