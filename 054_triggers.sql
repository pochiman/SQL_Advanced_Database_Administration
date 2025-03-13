USE mavenbearbuilders;

CREATE TRIGGER insert_new_orders
AFTER INSERT ON order_items
FOR EACH ROW

REPLACE INTO orders
SELECT
	order_id,
    MIN(created_at) AS created_at,
    MIN(website_session_id) AS website_session_id,
    SUM(CASE
		WHEN is_primary_item = 1 THEN product_id
        ELSE NULL
        END) AS primary_product_id,
	COUNT(order_item_id) AS items_purchased,
    SUM(price_usd) AS price_usd,
    SUM(cogs_usd) AS cogs_usd
FROM order_items
WHERE order_id = new.order_id
GROUP BY 1
ORDER BY 1;