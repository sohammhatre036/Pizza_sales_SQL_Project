# Pizza Sales Analysis using PostgreSQL
Overview:
The project aims to analyze sales data from a fictional pizza store using PostgreSQL. It involves designing a database schema to store information about customers, orders, pizzas, ingredients, and sales transactions. The data is then queried to derive insights such as total revenue, popular pizza types, customer preferences, and peak sales periods.

# Database Schema Design:
Tables include 
1. Orders
2. Order Details
3. Pizzas
4. Pizza Types
# Questions 
1. Retrieve the total number of orders placed.

	Select Count(order_id) as Total_orders_placed from orders;

	![image](https://github.com/sohammhatre036/Pizza_sales_SQL_Project/assets/131856125/28f06904-5949-4522-b857-191a8e699d6d)


2. Calculate the total revenue generated from pizza sales.

	SELECT SUM(od.quantity * p.price) AS total_revenue
	FROM order_details od
	JOIN pizzas p ON od.pizza_id = p.pizza_id;

 	![image](https://github.com/sohammhatre036/Pizza_sales_SQL_Project/assets/131856125/c06b1a72-c610-4c80-834b-2ba50ebfab31)


3. Identify the highest-priced pizza.

	SELECT p.price , pt.name 
	FROM pizzas p
	join pizza_types pt ON p.pizza_type = pt.pizza_type
	ORDER BY price DESC
	LIMIT 1;

 	![image](https://github.com/sohammhatre036/Pizza_sales_SQL_Project/assets/131856125/83bf739d-fc87-4071-acf5-b43d44d63f19)


4. Identify the most common pizza size ordered.

	SELECT size, COUNT(*) AS order_count
	FROM order_details
	JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
	GROUP BY size
	ORDER BY order_count DESC
	LIMIT 1;

 	![image](https://github.com/sohammhatre036/Pizza_sales_SQL_Project/assets/131856125/17d9b0d9-91b4-4fa5-95ff-015308771063)


6. List the top 5 most ordered pizza types along with their quantities.

	SELECT pizza_type, COUNT(*) AS total_orders
	FROM order_details
	JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
	GROUP BY pizza_type
	ORDER BY total_orders DESC
	LIMIT 5;

	![image](https://github.com/sohammhatre036/Pizza_sales_SQL_Project/assets/131856125/0a583d17-9096-473e-835d-258588ef1663)



8. Join the necessary tables to find the total quantity of each pizza category ordered.

	SELECT pizza_types.category , SUM(order_details.quantity) as Quantity
	FROM pizza_types
	JOIN pizzas ON pizza_types.pizza_type = pizzas.pizza_type
	JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
	GROUP BY category
	ORDER BY Quantity DESC;

	![image](https://github.com/sohammhatre036/Pizza_sales_SQL_Project/assets/131856125/829ece28-f596-48b6-993d-a9133f9571ac)



10. Determine the distribution of orders by hour of the day.

	SELECT EXTRACT(HOUR FROM order_time) as hours, COUNT(order_id) AS Orders 
	FROM orders
	GROUP BY hours
	ORDER BY orders DESC;

 	![image](https://github.com/sohammhatre036/Pizza_sales_SQL_Project/assets/131856125/9c635bdd-4714-4f9a-92e1-b5f20dbbff49)


12. Group the orders by date and calculate the average number of pizzas ordered per day.

	SELECT ROUND(AVG(quantity),0) 
	FROM 
	(SELECT orders.order_date , SUM(order_details.quantity) as Quantity
	FROM 
	orders 
	JOIN order_details ON orders.order_id = order_details.order_id
	GROUP BY orders.order_date) AS order_quantity;

	![image](https://github.com/sohammhatre036/Pizza_sales_SQL_Project/assets/131856125/e71ee3fb-a5f8-47f9-8787-ea2b5214c581)


14. Determine the top 3 most ordered pizza types based on revenue.

	SELECT pizza_types.name , SUM(order_details.quantity * pizzas.price) as Revenue
	FROM pizza_types
	JOIN pizzas ON pizza_types.pizza_type = pizzas.pizza_type
	JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
	GROUP BY name
	ORDER BY Revenue DESC
	LIMIT 3;

	![image](https://github.com/sohammhatre036/Pizza_sales_SQL_Project/assets/131856125/fa225fc8-a834-4b84-bce5-060f4dbf45ed)

