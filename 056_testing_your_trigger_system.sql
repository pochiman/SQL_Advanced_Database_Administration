USE mavenbearbuilders;

SELECT COUNT(*) FROM orders;
-- 10,033 records BEFORE insert
-- 12,036

SELECT MAX(created_at) FROM orders;