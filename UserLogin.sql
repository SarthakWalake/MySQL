-- 2. Creating a Stored Procedure for User Login

DELIMITER //
CREATE PROCEDURE UserLogin(
IN p_username VARCHAR(50),
IN p_password VARCHAR(50)
)
BEGIN
SELECT id,username,email
FROM users
WHERE username = p_username;
END //

DELIMITER ;

CALL UserLogin("SARTHAK_WALAKE","sarthak7424");