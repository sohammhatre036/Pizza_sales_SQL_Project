-- SCHEMA: pizza

-- DROP SCHEMA IF EXISTS pizza ;

CREATE SCHEMA IF NOT EXISTS pizza
    AUTHORIZATION postgres;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    date DATE NOT NULL,
    time TIME NOT NULL
);

COPY orders FROM 'D:\SQL PROJECT\pizza_sales\orders.csv' DELIMITER ',' CSV HEADER;


select * from orders;


CREATE TABLE order_details (
    order_details_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    pizza_id VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


COPY order_details FROM 'D:\SQL PROJECT\pizza_sales\order_details.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE pizzas (
    pizza_id VARCHAR(255) PRIMARY KEY,
    pizza_type VARCHAR(255) NOT NULL,
    size VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

COPY pizzas FROM 'D:\SQL PROJECT\pizza_sales\pizzas.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE pizza_types (
    pizza_type VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL,
    ingredients VARCHAR(500) NOT NULL
);

COPY pizza_types FROM 'D:\SQL PROJECT\pizza_sales\pizza_types.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');










