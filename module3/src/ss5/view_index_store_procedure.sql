drop database if exists view_index_sp;
create database view_index_sp;
use view_index_sp;
create table products(
id int primary key auto_increment,
productCode int ,
productName varchar(45),
productPrice double,
productAmount int ,
productDescription tinytext ,
productStatus bit 
); 

insert into view_index_sp.products(productCode, productName, productPrice,productAmount,productDescription, productStatus ) 
values 
(1, 'Cà ',16495,5,'chín',1),
(2, 'Táo',6884,5,'chín',1),
(3, 'Xoài',22,5,'chín',1),
(4, 'Cam',10000,5,'chín',1);

CREATE UNIQUE INDEX unique_index_products ON products(product_code); 

CREATE INDEX composite_index_products ON products(product_name,product_price);

EXPLAIN SELECT * FROM products;

CREATE VIEW product_view AS SELECT product_code, product_name, product_price, product_status FROM products;

CREATE OR REPLACE VIEW product_view AS SELECT product_code, product_name, product_price, product_status FROM products WHERE product_name = "nước";

DROP VIEW product_view;

delimiter //
CREATE PROCEDURE sp_product()
BEGIN
SELECT * FROM products; 
END //
delimiter ; 

CALL sp_product();

delimiter //
CREATE PROCEDURE sp_product_add()
BEGIN
ALTER TABLE products ADD COLUMN address VARCHAR(25);
SELECT * FROM products;
END //
delimiter ; 

CALL sp_product_add;

delimiter //
CREATE PROCEDURE sp_product_edit()
BEGIN
SET SQL_SAFE_UPDATES = 0;
UPDATE products SET product_name = "Vinh" WHERE id = 1;
SELECT * FROM products;
END //
delimiter ; 

CALL sp_product_edit;

delimiter //
CREATE PROCEDURE sp_product_delete()
BEGIN
delete from products where id = 1;
SELECT * FROM products;
END //
delimiter ; 

CALL sp_product_delete;