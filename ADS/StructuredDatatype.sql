-- Implement Structured Data type or ORDBMS operations

CREATE TABLE Customer(
cust_id INT PRIMARY KEY,
cust_name VARCHAR(50),
address JSON
);

INSERT INTO Customer VALUES
(1,'Sarthak',
'{"house_no":101, "city":"Kolhapur","pincode":416001}'),
(2,'Ram',
'{"house_no":202,"city":"Pune","pincode":411001}');

SELECT cust_id,cust_name,
address->'$.house_no' AS house_no,
address->'$.city' AS city,
address->'$.pincode' AS pincode
FROM Customer;