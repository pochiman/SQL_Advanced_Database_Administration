SELECT
	MAX(created_at),
    COUNT(*) AS records

FROM order_items;
-- 159


SELECT
	MAX(created_at),
    COUNT(*) AS records

FROM order_item_refunds;
-- 5