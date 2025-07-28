-- 7. Creating a Stored Procedure for Product Reviews

DELIMITER //

CREATE PROCEDURE AddProductReviews(
IN p_productid INT,
IN p_userid INT,
IN p_rating INT,
IN p_review TEXT
)
BEGIN 
INSERT INTO reviews(product_id,user_id,rating,review_text) VALUES
(p_productid,p_userid,p_rating,p_review);
END //
DELIMITER ;

CALL AddProductReviews(1,2,4,"Great product");

-- TO CHECK WETHER THE PRODUCT REVIEW IS ADDED OR NOT USE SELECR QUERY

SELECT * FROM reviews WHERE product_id = 1;