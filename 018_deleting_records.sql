USE thriftshop;

SELECT * FROM inventory;

SELECT @@autocommit;

SET autocommit = 1;
-- 1, 0
-- ON, OFF


DELETE FROM inventory
WHERE inventory_id = 7;

ROLLBACK;

COMMIT;