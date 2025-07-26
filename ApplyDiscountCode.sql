-- 4. Creating a Stored Procedure for Applying a Discount Code


DELIMITER //

CREATE PROCEDURE ApplyDiscountCode(
IN p_orderid INT,
IN p_discountcode VARCHAR(50)
)

BEGIN
DECLARE v_discount DECIMAL(10,2);
DECLARE v_totalamount DECIMAL(10,2);

SELECT discount_percentage INTO v_discount
FROM discount_codes
WHERE code = p_discountcode AND NOW() BETWEEN start_date AND end_date;

IF v_discount IS NOT NULL THEN 
SELECT total_amount INTO v_totalamount
FROM orders
WHERE id = p_orderid;

SET v_totalamount = v_totalamount - (v_totalamount * (v_discount / 100));

UPDATE orders
SET total_amount = v_totalamount
WHERE id = p_orderid;
ELSE 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid or expired discount code.';
END IF;
END //

DELIMITER ;
DROP procedure ApplyDiscountCode;

-- To check whether the discount code is applied or not 
-- First take the vailid discount code from discount table to check the status

SELECT * FROM discount_codes;

-- check if the discount code is applied so call the stored procedure

CALL ApplyDiscountCode(1,"DIWALI23");