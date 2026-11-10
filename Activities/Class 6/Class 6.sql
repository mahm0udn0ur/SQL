CREATE TABLE Products ( 
product_id VARCHAR(3), 
product_name VARCHAR(100), 
price NUMERIC, 
group_id VARCHAR(1));

COPY Products 
FROM '/tmp/products.csv'
DELIMITER ',' CSV HEADER ENCODING 'UTF8';

SELECT * FROM Products;

Drop table Products

--------------------------------------------

CREATE TABLE Product_groups (
group_id VARCHAR(1), 
group_name VARCHAR(20));

COPY Product_groups
FROM '/tmp/product_groups.csv'
DELIMITER ',' CSV HEADER ENCODING 'UTF8';

SELECT * FROM Product_groups;

--------------------------------------------


SELECT group_id
FROM product_groups
WHERE group_name = 'Smartphone';

SELECT product_name
FROM products
WHERE group_id = ('1');

--subquery
EXPLAIN 
SELECT product_name
FROM products
WHERE group_id = (
SELECT group_id
FROM product_groups
WHERE group_name = 'Smartphone'
);

EXPLAIN 
SELECT products.product_name, product_groups.group_name
FROM products LEFT JOIN product_groups
ON product_groups.group_id=products.group_id
WHERE group_name = 'Smartphone'

SELECT group_name, (SELECT COUNT(*) FROM products WHERE
products.group_id = product_groups.group_id) AS product_count
FROM product_groups;

SELECT product_name
FROM products
WHERE group_id IN (
SELECT group_id
FROM product_groups
WHERE group_name LIKE '%Smart%'
);

SELECT group_name, AVG(price) avg_price
FROM (
SELECT pg.group_name, p.price
FROM products AS p
JOIN product_groups AS pg ON p.group_id = pg.group_id
WHERE p.price > 500
) AS expensive_products
GROUP BY group_name;


---Table:
FROM products AS p
FROM products p
---Column:
SELECT AVG(price) AS average_price
SELECT AVG(price) average_price

SELECT COUNT(product_name) AS Product_count, group_name
FROM products LEFT JOIN product_groups
ON products.group_id=product_groups.group_id
GROUP BY (product_groups.group_name);

SELECT product_name
FROM products
WHERE group_id NOT IN (
SELECT group_id
FROM product_groups
WHERE group_name IN ('Smartphone', 'Laptop')
);

-------------------------

CREATE TABLE sales (
seller VARCHAR(50),
day DATE,
amount INT
);

INSERT INTO sales (seller, day,
amount)
VALUES
('Alice', '2024-01-01', 100),
('Alice', '2024-01-02', 150),
('Bob', '2024-01-01', 200),
('Bob', '2024-01-02', 50);

SELECT * FROM sales;

--WHAT IS THE TOTAL SALES AMOUNT
SELECT SUM(amount) AS total_sales
FROM sales;

--HM DID EACH SELLER SELL IN TOTAL
SELECT seller, SUM(amount) AS total_sales
FROM sales
GROUP BY seller;

--OVER()
SELECT seller, day, amount,
SUM(amount) OVER () AS total_sales
FROM sales;

--OVER(PARTITION BY...)
SELECT seller, day, amount,
SUM(amount) OVER (PARTITION BY SELLER) AS
total_per_seller
FROM sales;

--OVER(PARTITION BY... ORDER BY ...)
SELECT seller, day, amount,
SUM(amount) OVER (PARTITION BY seller ORDER BY day) AS
total_per_seller
FROM sales;

-- add values
INSERT INTO sales (seller, day, amount)
VALUES ('Alice', NULL, 100);

-- same OVER(PARTITION BY... ORDER BY ...) but nulls first
SELECT seller, day, amount, 
SUM(amount) OVER ( PARTITION BY seller ORDER BY day DESC NULLS FIRST
) AS total_sales_per_seller
FROM sales;

--- TO GIVE RANKS BY GROUP ID AND SORTED BY PRICE
SELECT product_name, price, group_id,
RANK() OVER (PARTITION BY group_id ORDER BY price ASC
) AS price_rank
FROM products;

SELECT product_name, group_name, price,
ROW_NUMBER() OVER (PARTITION BY group_name ORDER BY
price)
FROM products JOIN product_groups USING (group_id);

-
SELECT product_id, product_name, group_name, price,
RANK() OVER (
PARTITION BY group_name
ORDER BY price ) 
AS rank_in_group_by_price
FROM products
INNER JOIN product_groups
USING (group_id);

SELECT product_id, product_name, group_name, price,
DENSE_RANK() OVER (
PARTITION BY group_name
ORDER BY price ASC) 
AS dense_rank_in_group
FROM products
INNER JOIN product_groups
USING (group_id);

--MULTIPLE WINDOW FUNCTIONS
SELECT product_name, group_name, price,
RANK() OVER (PARTITION BY group_name ORDER BY price DESC) 
AS price_rank,
ROW_NUMBER() OVER (ORDER BY price DESC) 
AS row_num
FROM products
JOIN product_groups USING (group_id);
