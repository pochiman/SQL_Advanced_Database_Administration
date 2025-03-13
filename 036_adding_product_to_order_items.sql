USE mavenbearbuilders;

ALTER TABLE order_items
ADD COLUMN product_id BIGINT;

SELECT * FROM order_items;