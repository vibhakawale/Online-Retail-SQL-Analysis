USE retail_project;

SELECT * 
FROM online_retail;

-- Total Revenue
SELECT 
	SUM(CAST(price AS BIGINT)) AS Total_Revenue
FROM online_retail;

--Average House Price
SELECT
	AVG(CAST(price AS BIGINT)) AS avg_price
FROM online_retail;

-- Top 10 most expensive houses
SELECT TOP 10
	price,
	area, 
	bedrooms,
	bathrooms,
	stories
FROM online_retail
ORDER BY price DESC;

-- Average Price by Furnishing Status
SELECT
	furnishingstatus,
	AVG(CAST(price AS BIGINT)) AS avg_price
FROM online_retail
GROUP BY furnishingstatus
ORDER BY avg_price DESC;

-- Average price by number of bedrooms
SELECT 
	bedrooms,
	AVG(CAST(price AS BIGINT)) AS avg_price
FROM online_retail
GROUP BY bedrooms
ORDER BY bedrooms;

-- Houses with Air Conditioning
SELECT *
FROM online_retail
WHERE airconditioning = 1;

-- Houses with Parking More Than 2
SELECT *
FROM online_retail
WHERE parking >= 2;

-- Average Area by Furnishing Status
SELECT 
	furnishingstatus,
	AVG(area) AS avg_area
FROM online_retail
GROUP BY furnishingstatus
ORDER BY avg_area DESC;

-- Top 5 Largest Houses
SELECT TOP 5
	area,
    price,
    bedrooms,
    bathrooms,
	stories
FROM online_retail
ORDER BY area DESC;

-- Average Price Based on Main Road Access
SELECT 
	CASE 
		WHEN mainroad = 1 THEN 'Yes'
		ELSE 'No'
	END AS mainroad_available,
	AVG(CAST(price AS BIGINT)) AS avg_price
FROM online_retail 
GROUP BY mainroad;

-- Average Price Based on Basement
SELECT 
    CASE 
		WHEN basement= 1 THEN 'Yes'
		ELSE 'No'
	END AS basement_available,
    AVG(CAST(price AS BIGINT)) AS avg_price
FROM online_retail
GROUP BY basement;

-- Fully Furnished Houses Count
SELECT 
	furnishingstatus,
	COUNT(furnishingstatus) AS count
FROM online_retail
WHERE furnishingstatus = 'furnished'
GROUP BY furnishingstatus;

-- Average Parking Spaces
SELECT 
	ROUND(AVG(CAST(parking AS DECIMAL)), 2) AS avg_parking
FROM online_retail;
