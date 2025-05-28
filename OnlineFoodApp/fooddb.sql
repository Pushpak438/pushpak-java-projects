
CREATE DATABASE fooddb;
USE fooddb;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50)
);

CREATE TABLE menu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100),
    price DECIMAL(10,2)
);

INSERT INTO menu (item_name, price) VALUES
('Pizza', 8.99),
('Burger', 5.49),
('Pasta', 6.99);
