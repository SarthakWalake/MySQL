
DELIMITER //
CREATE PROCEDURE ExampleProcedure(
    IN in_param INT,
    OUT out_param VARCHAR(255),
    INOUT inout_param INT
)
BEGIN
    -- Process the IN parameter
    -- This is just an example, you can perform any operations here
    SET out_param = CONCAT('Input parameter value is: ', in_param);

    -- Process the INOUT parameter
    -- This is just an example, you can perform any operations here
    SET inout_param = inout_param * 2;
END //
DELIMITER ;

SET @inout_param = 5;
CALL ExampleProcedure(2,@out_param,@inout_param);
SELECT @out_param , @inout_param;