-- Store Procedures :
-- 1. Creating a Stored Procedure for User Registration

DELIMITER //
CREATE PROCEDURE UserRegistration(
IN p_username VARCHAR(50),
IN p_password VARCHAR(50) ,
IN p_email VARCHAR(50),
IN p_address VARCHAR(50)
)
BEGIN 
INSERT INTO users(username,password,email,address)
VALUES(p_username,p_password,p_email,p_address);
END //
DELIMITER ;

CALL UserRegistration("SARTHAK_WALAKE","sarthak7424","sarthakwalake7424@gmail.com","KOLAHPUR");

SELECT * FROM users;