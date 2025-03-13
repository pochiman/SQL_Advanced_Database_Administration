USE mavenbearbuilders;

CREATE TABLE order_item_refunds (
	order_item_refund_id BIGINT,
    created_at DATETIME,
    order_item_id BIGINT,
    order_id BIGINT,
    refund_amount_usd DECIMAL(6, 2),
    PRIMARY KEY (order_item_refund_id),
    FOREIGN KEY (order_item_id) REFERENCES order_items(order_item_id)
);

SELECT * FROM order_item_refunds;