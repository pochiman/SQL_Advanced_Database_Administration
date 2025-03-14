USE thriftshop;

SELECT * FROM customer_purchases;

ALTER TABLE customer_purchases
DROP COLUMN customer_id;


ALTER TABLE customer_purchases
ADD COLUMN purchase_amount DECIMAL(10, 2) AFTER customer_purchase_id;


ALTER TABLE customer_purchases
ADD COLUMN purchased_at DATETIME AFTER inventory_id;