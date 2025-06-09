create database inventorydb;
use inventorydb;

create table products(
product_id int primary key,
product_name varchar(100),
category varchar(50),
unit_price decimal(10,2),
reorder_level int
);

create table suppliers(
supplier_id int primary key,
supplier_name varchar(100),
contact_number varchar(15),
email varchar(100),
address text
);

create table stock_in(
stock_in_id int primary key,
product_id int,
supplier_id int,
quantity int,
date_received date,
foreign key (product_id) references products(product_id),
foreign key (supplier_id) references suppliers(supplier_id)
);

create table stock_out(
stock_out_id int primary key,
product_id int,
quantity int,
date_issued date,
foreign key (product_id) references products(product_id)
);

CREATE TABLE Inventory (
    product_id INT PRIMARY KEY,
    available_quantity INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Products VALUES
(10, 'Laptop', 'Electronics', 60000.00, 10),
(20, 'Mouse', 'Accessories', 500.00, 25),
(30, 'Keyboard', 'Accessories', 700.00, 15),
(40, 'Monitor', 'Electronics', 15000.00, 5),
(50, 'USB Cable', 'Accessories', 150.00, 30);

INSERT INTO Suppliers VALUES
(1, 'Tech Distributors', '9876543210', 'tech@distributors.com', 'New Delhi'),
(2, 'Gadget World', '8765432109', 'info@gadgetworld.com', 'Mumbai'),
(3, 'Digital Hub', '7890123456', 'contact@digitalhub.com', 'Bangalore');

INSERT INTO Stock_In VALUES
(1, 10, 1, 50, '2025-06-01'),
(2, 20, 2, 100, '2025-06-02'),
(3, 30, 3, 70, '2025-06-03'),
(4, 40, 1, 20, '2025-06-04'),
(5, 50, 2, 200, '2025-06-05');

INSERT INTO Stock_Out VALUES
(1, 10, 10, '2025-06-06'),
(2, 20, 30, '2025-06-06'),
(3, 30, 20, '2025-06-07'),
(4, 40, 5, '2025-06-07'),
(5, 50, 50, '2025-06-08');

INSERT INTO Inventory VALUES
(10, 40), -- 50 in - 10 out
(20, 70),
(30, 50),
(40, 15),
(50, 150);

select p.product_name, i.available_quantity from inventory i
join products p on p.product_id = i.product_id;

select product_id, sum(quantity) as total_received
from stock_in 
group by product_id;

select product_id, sum(quantity) as total_issued
from stock_out
group by product_id;

SELECT product_name, available_quantity
FROM Inventory
JOIN Products ON Inventory.product_id = Products.product_id
WHERE available_quantity <= reorder_level;

show tables;



