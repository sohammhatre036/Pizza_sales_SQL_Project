# Pizza Sales 
# Questions 
1. Retrieve the total number of orders placed.

Select Count(order_id) as Total_orders_placed from orders;

![image](https://github.com/sohammhatre036/Pizza_sales_SQL_Project/assets/131856125/28f06904-5949-4522-b857-191a8e699d6d)


-- Calculate the total revenue generated from pizza sales.

SELECT SUM(od.quantity * p.price) AS total_revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id;

-- Identify the highest-priced pizza.

SELECT p.price , pt.name 
FROM pizzas p
join pizza_types pt ON p.pizza_type = pt.pizza_type
ORDER BY price DESC
LIMIT 1;

--Identify the most common pizza size ordered.

SELECT size, COUNT(*) AS order_count
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
GROUP BY size
ORDER BY order_count DESC
LIMIT 1;

-- List the top 5 most ordered pizza types along with their quantities.

SELECT pizza_type, COUNT(*) AS total_orders
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_type
ORDER BY total_orders DESC
LIMIT 5;


-- Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT pizza_types.category , SUM(order_details.quantity) as Quantity
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type = pizzas.pizza_type
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY category
ORDER BY Quantity DESC;



-- Determine the distribution of orders by hour of the day.

SELECT EXTRACT(HOUR FROM order_time) as hours, COUNT(order_id) AS Orders 
FROM orders
GROUP BY hours
ORDER BY orders DESC;

-- Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT ROUND(AVG(quantity),0) 
	FROM 
	(SELECT orders.order_date , SUM(order_details.quantity) as Quantity
	FROM 
	orders 
	JOIN order_details ON orders.order_id = order_details.order_id
	GROUP BY orders.order_date) AS order_quantity;

-- Determine the top 3 most ordered pizza types based on revenue.

SELECT pizza_types.name , SUM(order_details.quantity * pizzas.price) as Revenue
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type = pizzas.pizza_type
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY name
ORDER BY Revenue DESC
LIMIT 3;
