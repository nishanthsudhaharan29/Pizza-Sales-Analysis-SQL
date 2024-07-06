
-- Pizza Sales Analysis

-- Total Revenue
SELECT 
ROUND(SUM(total_price),2) as 'Total Revenue'
FROM
Pizza

-- Average Order Value
SELECT 
ROUND(SUM(total_price)/COUNT(*),2) as 'Average Revenue per order'
FROM
Pizza

-- Total Pizzas Sold
SELECT 
SUM(quantity) as 'Total Pizzas Sold'
FROM
Pizza

-- Total Orders 
SELECT 
COUNT(DISTINCT order_id) as 'Total Orders Placed'
FROM
Pizza

-- Average Pizzas per Order
SELECT
SUM(quantity) / COUNT(DISTINCT order_id) as 'Average Pizzas Sold per order'
FROM
Pizza

-- Find the day of the week and create a new column

SELECT 
order_date, DATENAME(dw, order_date)
FROM
Pizza

ALTER TABLE Pizza
ADD day varchar(50)

UPDATE Pizza
SET day = DATENAME(dw, order_date)


-- Find the month and create a new column

SELECT 
order_date, DATENAME(month, order_date)
FROM
Pizza

ALTER TABLE Pizza
ADD month varchar(50)

UPDATE Pizza
SET month = DATENAME(month, order_date)

SELECT * FROM Pizza

-- Find the hour of the day and create a new column
SELECT 
order_time, DATENAME(hour,order_time)
FROM
Pizza

ALTER TABLE Pizza
Add hour int

UPDATE Pizza
SET hour = DATENAME(hour,order_time)


-- Daily Trend for Total Orders
SELECT 
day, COUNT(DISTINCT order_id) as 'Order Count'
FROM
Pizza
GROUP BY day

-- Hourly Trend for Total Orders
SELECT 
hour, COUNT(DISTINCT order_id) as 'Order Count'
FROM
Pizza
GROUP BY 
hour
ORDER BY 1

-- Monthly Trend for Total Orders
SELECT 
month, COUNT(DISTINCT order_id) as 'Order Count'
FROM
Pizza
GROUP BY 
month
ORDER BY 2 desc

-- Percentage of Sales per Pizza Category
SELECT
pizza_category,
ROUND(SUM(total_price),2) as 'Total Sales',
ROUND((SUM(total_price) / (SELECT SUM(total_price) FROM Pizza) * 100),2) AS 'Percentage Sales'
FROM
Pizza
GROUP BY 
pizza_category
Order BY 2 desc

-- Percentage of Sales by Pizza Size
SELECT
pizza_size,
ROUND(SUM(total_price),2) as 'Total Sales',
ROUND((SUM(total_price) / (SELECT SUM(total_price) FROM Pizza) * 100),2) AS 'Percentage Sales'
FROM
Pizza
GROUP BY 
pizza_size
Order BY 2 desc

-- Total Pizzas Sold per Pizza Category
SELECT 
pizza_category,
SUM(quantity) as 'Total Pizzas Sold'
FROM
Pizza
GROUP BY 
pizza_category
ORDER BY 2 desc

-- Top 5 best selling Pizzas
SELECT TOP 5
pizza_name,
SUM(quantity) as 'Total Pizzas Sold'
FROM
Pizza
GROUP BY 
pizza_name
ORDER BY 2 desc


-- Top 5 Lowesrt Selling Pizzas
SELECT TOP 5
pizza_name,
SUM(quantity) as 'Total Pizzas Sold'
FROM
Pizza
GROUP BY 
pizza_name
ORDER BY 2 


