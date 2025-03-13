/*
1) Import Q2 order_item and refund data into the database using the following files:                                                                                                                               
-- 08.order_items_2013_Apr-June
-- 09.order_item_refunds_2013_Apr-Jun
*/
SELECT
	COUNT(*) AS count_rows,
    MAX(created_at) AS most_recent_created_at
FROM order_items; -- order_item_refunds



/*
2) Next, help update the structure of the order_items table: 

-- The company is going to start cross-selling products and will want to track whether each item 
sold is the primary item (the first one put into the user’s shopping cart) or a cross-sold item.

-- Add a binary column to the order_items table called is_primary_item
*/

ALTER TABLE order_items
ADD is_primary_item INT;

SELECT * FROM order_items;



/* 
3) Update all previous records in the order_items table, setting is_primary_item = 1 for all records.

-- Up until now, all items sold were the primary item (cross-selling is new). 

-- Confirm this change has executed successfully. 
*/ 

UPDATE order_items
SET is_primary_item = 1
WHERE order_item_id > 0; -- all records

SELECT * FROM order_items;



/*
4) Add two new products to the products table, then import the remainder of 2013 orders and refunds, 
using the product details and files shown below:
  
-- 10.order_items_2013_Jul-Dec
-- 11.order_item_refunds_2013_Jul-Dec
*/ 
SELECT * FROM products;

INSERT INTO products VALUES
(3, '2013-12-12 09:00:00', 'The Birthday Sugar Panda'),
(4, '2014-02-05 10:00:00', 'The Hudson River Mini Bear');


SELECT
	COUNT(*) AS count_rows,
    MAX(created_at) AS most_recent_created_at
FROM order_items; -- order_item_refunds



/*
5) Your CEO would like to make sure the database has a high degree of data integrity and avoid potential 
issues as more people start using the database. If you see any opportunities to ensure data integrity 
by using constrains like NON-NULL, add them to the relevant columns in the tables you have created. 
*/ 

-- products
ALTER TABLE `mavenbearbuilders`.`products` 
CHANGE COLUMN `created_at` `created_at` DATETIME NOT NULL ,
CHANGE COLUMN `product_name` `product_name` VARCHAR(50) NOT NULL ,
ADD UNIQUE INDEX `product_name_UNIQUE` (`product_name` ASC) VISIBLE;
;

-- order_items
ALTER TABLE `mavenbearbuilders`.`order_items` 
DROP FOREIGN KEY `order_items_product_id`;
ALTER TABLE `mavenbearbuilders`.`order_items` 
CHANGE COLUMN `created_at` `created_at` DATETIME NOT NULL ,
CHANGE COLUMN `order_id` `order_id` BIGINT NOT NULL ,
CHANGE COLUMN `price_usd` `price_usd` DECIMAL(6,2) NOT NULL ,
CHANGE COLUMN `cogs_usd` `cogs_usd` DECIMAL(6,2) NOT NULL ,
CHANGE COLUMN `website_session_id` `website_session_id` BIGINT NOT NULL ,
CHANGE COLUMN `product_id` `product_id` BIGINT NOT NULL ,
CHANGE COLUMN `is_primary_item` `is_primary_item` INT NOT NULL ;
ALTER TABLE `mavenbearbuilders`.`order_items` 
ADD CONSTRAINT `order_items_product_id`
  FOREIGN KEY (`product_id`)
  REFERENCES `mavenbearbuilders`.`products` (`product_id`);

-- order_item_refunds
ALTER TABLE `mavenbearbuilders`.`order_item_refunds` 
DROP FOREIGN KEY `order_item_refunds_ibfk_1`;
ALTER TABLE `mavenbearbuilders`.`order_item_refunds` 
CHANGE COLUMN `created_at` `created_at` DATETIME NOT NULL ,
CHANGE COLUMN `order_item_id` `order_item_id` BIGINT NOT NULL ,
CHANGE COLUMN `order_id` `order_id` BIGINT NOT NULL ,
CHANGE COLUMN `refund_amount_usd` `refund_amount_usd` DECIMAL(6,2) NOT NULL ,
ADD UNIQUE INDEX `order_item_id_UNIQUE` (`order_item_id` ASC) VISIBLE;
;
ALTER TABLE `mavenbearbuilders`.`order_item_refunds` 
ADD CONSTRAINT `order_item_refunds_ibfk_1`
  FOREIGN KEY (`order_item_id`)
  REFERENCES `mavenbearbuilders`.`order_items` (`order_item_id`);



/* 
6) One of the company’s board advisors is pressuring your CEO on data risks and making sure 
she has a great backup and recovery plan. Prepare a report on possible risks for data loss 
and steps the company can take to mitigate these concerns. 
*/