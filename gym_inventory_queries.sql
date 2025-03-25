use gym_inventory;
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
	category ENUM('protein','vitamins','creatine','pre-workouts','post_workouts'),
    name VARCHAR(255) NOT NULL,
    purchase_price DECIMAL(10,2) NOT NULL, 
    selling_price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    added_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO products (category, name, purchase_price, selling_price, stock_quantity) VALUES
('protein', 'Whey Protein', 1500.00, 2000.00, 50),
('protein', 'Casein Protein', 1800.00, 2500.00, 30),
('protein', 'Soy Protein', 1400.00, 1900.00, 40),
('protein', 'Pea Protein', 1600.00, 2100.00, 35),
('protein', 'Egg White Protein', 1700.00, 2300.00, 25),

('vitamins', 'Multivitamin Tablets', 500.00, 800.00, 100),
('vitamins', 'Vitamin D3 Capsules', 300.00, 600.00, 75),
('vitamins', 'Vitamin C Gummies', 450.00, 700.00, 80),
('vitamins', 'Omega-3 Fish Oil', 900.00, 1300.00, 60),
('vitamins', 'Calcium + Magnesium Tablets', 600.00, 900.00, 55),

('creatine', 'Creatine Monohydrate', 1200.00, 1700.00, 40),
('creatine', 'Micronized Creatine', 1400.00, 1900.00, 35),
('creatine', 'Buffered Creatine', 1300.00, 1800.00, 45),
('creatine', 'Creatine HCL', 1500.00, 2000.00, 30),

('pre-workouts', 'Pre-Workout Energy Booster', 1600.00, 2200.00, 25),
('pre-workouts', 'Caffeine-Based Pre-Workout', 1300.00, 1800.00, 20),
('pre-workouts', 'Nitric Oxide Booster', 1400.00, 2000.00, 30),

('post_workouts', 'BCAA Powder', 1100.00, 1500.00, 45),
('post_workouts', 'Glutamine Recovery Powder', 1000.00, 1400.00, 60);

select *from products;
select id,name from products;


CREATE TABLE purchases (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    purchase_price DECIMAL(10,2) NOT NULL,
    purchase_date DATE NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO purchases (product_id, quantity, purchase_price, purchase_date) VALUES
(1, 20, 1500.00, '2024-03-01'),
(2, 15, 1800.00, '2024-03-02'),
(3, 25, 1400.00, '2024-03-03'),
(4, 18, 1600.00, '2024-03-04'),
(5, 12, 1700.00, '2024-03-05'),

(6, 30, 500.00, '2024-03-06'),
(7, 40, 300.00, '2024-03-07'),
(8, 35, 450.00, '2024-03-08'),
(9, 22, 900.00, '2024-03-09'),
(10, 28, 600.00, '2024-03-10'),

(11, 15, 1200.00, '2024-03-11'),
(12, 20, 1400.00, '2024-03-12'),
(13, 18, 1300.00, '2024-03-13'),
(14, 25, 1500.00, '2024-03-14'),

(15, 10, 1600.00, '2024-03-15'),
(16, 12, 1300.00, '2024-03-16'),
(17, 14, 1400.00, '2024-03-17'),

(18, 22, 1100.00, '2024-03-18'),
(19, 25, 1000.00, '2024-03-19');

select *from purchases;


CREATE TABLE sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    selling_price DECIMAL(10,2) NOT NULL,
    sale_date DATE NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO sales (product_id, quantity, selling_price, sale_date) VALUES
(1, 10, 2000.00, '2024-03-05'),
(2, 8, 2500.00, '2024-03-06'),
(3, 12, 1900.00, '2024-03-07'),
(4, 7, 2100.00, '2024-03-08'),
(5, 5, 2300.00, '2024-03-09'),

(6, 20, 800.00, '2024-03-10'),
(7, 25, 600.00, '2024-03-11'),
(8, 18, 700.00, '2024-03-12'),
(9, 10, 1300.00, '2024-03-13'),
(10, 15, 900.00, '2024-03-14'),

(11, 6, 1700.00, '2024-03-15'),
(12, 9, 1900.00, '2024-03-16'),
(13, 7, 1800.00, '2024-03-17'),
(14, 10, 2000.00, '2024-03-18'),

(15, 4, 2200.00, '2024-03-19'),
(16, 5, 1800.00, '2024-03-20'),
(17, 6, 2000.00, '2024-03-21'),

(18, 14, 1500.00, '2024-03-22'),
(19, 16, 1400.00, '2024-03-23');

select *from sales;
/* QUERIES */
SELECT *from products;
	# Low Stock Products (< 10 Quantity Remaining)
SELECT * FROM products WHERE stock_quantity <= 30;
	#Calculate Total Stock Value (Cost Price)
SELECT SUM(purchase_price * stock_quantity) AS total_stock_value FROM products;

	#Get Purchase History of a Specific Product
SELECT p.name, pu.quantity, pu.purchase_price, pu.purchase_date 
FROM purchases pu 
JOIN products p ON pu.product_id = p.id 
WHERE p.id = 1; 
	#Get Sales History of a Specific Product
SELECT p.name, s.quantity, s.selling_price, s.sale_date 
FROM sales s 
JOIN products p ON s.product_id = p.id 
WHERE p.id = 2;

	#Calculate Total Sales Revenue
SELECT SUM(quantity * selling_price) AS total_revenue FROM sales;

	#Find the Most Sold Product
SELECT p.name, SUM(s.quantity) AS total_sold 
FROM sales s 
JOIN products p ON s.product_id = p.id 
GROUP BY p.name 
ORDER BY total_sold DESC 
LIMIT 1;

	#Find the Least Sold Product
SELECT p.name, SUM(s.quantity) AS total_sold 
FROM sales s 
JOIN products p ON s.product_id = p.id 
GROUP BY p.name 
ORDER BY total_sold ASC 
LIMIT 1;

	#Get Total Purchases Per Product
SELECT p.name, SUM(pu.quantity) AS total_purchased 
FROM purchases pu 
JOIN products p ON pu.product_id = p.id 
GROUP BY p.name;

	#Find Out-of-Stock Products
SELECT * FROM products WHERE stock_quantity = 0;

	#Find Monthly Sales Summary
SELECT 
    DATE_FORMAT(s.sale_date, '%Y-%m') AS month, 
    SUM(s.quantity * s.selling_price) AS total_sales 
FROM sales s 
GROUP BY month 
ORDER BY month DESC;

	#Increase Prices for All Products by 5%
UPDATE products 
SET selling_price = selling_price * 1.05;

	#Reset Stock for All Products to 0
UPDATE products 
SET stock_quantity = 0;

