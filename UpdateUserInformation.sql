-- 3. Creating a Stored Procedure for Updating User Information

DELIMITER //

CREATE PROCEDURE UpdateUserInformation(
IN p_id INT,
IN p_username VARCHAR(50),
IN p_email VARCHAR(50)
)
BEGIN
UPDATE users 
SET username = p_username , email = p_email
WHERE id = p_id;
END //
DELIMITER ;

CALL UpdateUserInformation(24,"SARTHAK_L WALAKE","sarthak715@gmail.com") 

-- To Check wether the Data is updated or not .
-- USE SELECT QUERY TO SEE THE DATA

SELECT * FROM users;