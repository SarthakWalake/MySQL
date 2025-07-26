-- 5. Creating a Stored Procedure for Retrieving Order Details

DELIMITER //

CREATE PROCEDURE GetOrderDetails(
IN p_orderid INT 
)
BEGIN

SELECT o.id,o.order_date,o.shipping_address,o.total_amount,
oi.order_id,oi.item_id,oi.quantity,p.price 
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.item_id = p.id
WHERE p.id = p_orderid;
END //
DELIMITER ; 

-- GET THE ORDER DETAILS BY CALLING THE STORED PROECUDRE
CALL GetOrderDetails(2);