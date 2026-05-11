USE retail_project;
GO

-- Total Revenue

SELECT 
    ROUND(SUM(Quantity * UnitPrice), 2) AS total_revenue
FROM online_retail;
GO


-- Total Orders

SELECT 
    COUNT(DISTINCT InvoiceNo) AS total_orders
FROM online_retail;
GO


-- Top 10 Best Selling Products

SELECT TOP 10
    Description,
    SUM(Quantity) AS total_quantity
FROM online_retail
GROUP BY Description
ORDER BY total_quantity DESC;
GO


-- Top 10 Customers by Spending

SELECT TOP 10
    CustomerID,
    ROUND(SUM(Quantity * UnitPrice), 2) AS total_spending
FROM online_retail
GROUP BY CustomerID
ORDER BY total_spending DESC;
GO


-- Monthly Revenue

SELECT 
    MONTH(InvoiceDate) AS month_number,
    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue
FROM online_retail
GROUP BY MONTH(InvoiceDate)
ORDER BY month_number;
GO


-- Revenue by Country

SELECT 
    Country,
    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue
FROM online_retail
GROUP BY Country
ORDER BY revenue DESC;
GO


-- Average Order Value

SELECT 
    ROUND(
        SUM(Quantity * UnitPrice) * 1.0 /
        COUNT(DISTINCT InvoiceNo), 2
    ) AS average_order_value
FROM online_retail;
GO


-- Most Expensive Products

SELECT TOP 10
    Description,
    MAX(UnitPrice) AS highest_price
FROM online_retail
GROUP BY Description
ORDER BY highest_price DESC;
GO
