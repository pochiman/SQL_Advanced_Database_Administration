USE thriftshop;

SELECT * FROM inventory;

UPDATE inventory
SET number_in_stock = 0 -- we sold out
WHERE inventory_id = 9;

UPDATE inventory
SET number_in_stock = 0 -- we sold out
WHERE inventory_id IN (1, 9);

UPDATE inventory
SET number_in_stock = 0 -- we sold out
WHERE inventory_id = 1;