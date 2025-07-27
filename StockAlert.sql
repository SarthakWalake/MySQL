-- 6. Creating a Stored Procedure for Low Stock Alerts

DELIMITER //

CREATE PROCEDURE StockAlert(
IN p_stock int
)
BEGIN
SELECT id,name,stock
FROM products
WHERE stock < p_stock;
END //
DELIMITER ;

CALL StockAlert(70);