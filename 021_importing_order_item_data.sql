CREATE SCHEMA mavenbearbuilders;

USE mavenbearbuilders;

CREATE TABLE order_items (
	order_item_id BIGINT,
	created_at DATETIME,
    order_id BIGINT,
    price_usd DECIMAL(6, 2),
    cogs_usd DECIMAL(6, 2),
    website_session_id BIGINT,
    PRIMARY KEY (order_item_id)
);

SELECT * FROM order_items;

SELECT
	MIN(created_at),
    MAX(created_at)
FROM order_items;