USE mavenbearbuilders;

ALTER TABLE `mavenbearbuilders`.`order_items` 
ADD INDEX `order_items_product_id_idx` (`product_id` ASC) VISIBLE;
;
ALTER TABLE `mavenbearbuilders`.`order_items` 
ADD CONSTRAINT `order_items_product_id`
  FOREIGN KEY (`product_id`)
  REFERENCES `mavenbearbuilders`.`products` (`product_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;