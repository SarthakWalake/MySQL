-- Implement vertical and horizontal fragmentation in distributed DBMS

CREATE TABLE Employee2 (
    emp_id     INT,
    emp_name   VARCHAR(50),
    dept       VARCHAR(50),
    city       VARCHAR(50),
    salary     INT
);


INSERT INTO Employee2 VALUES
(1, 'Sarthak', 'IT', 'Pune', 50000),
(2, 'Ram',   'IT', 'Mumbai', 60000),
(3, 'Aditya',   'HR', 'Delhi', 70000),
(4, 'Sham',    'HR', 'Pune', 65000);


-- Horizontal Fragmentation

CREATE TABLE Employee_Pune AS
SELECT * FROM Employee2
WHERE city = 'Pune';

CREATE TABLE Employee_Others AS
SELECT * FROM Employee2
WHERE city <> 'Pune';

SELECT * FROM Employee_Pune;
SELECT * FROM Employee_Others;

-- Vertical Fragmentation

CREATE TABLE Emp_Info AS
SELECT emp_id, emp_name, dept
FROM Employee2;

CREATE TABLE Emp_Finance AS
SELECT emp_id, city, salary
FROM Employee2;

SELECT * FROM Emp_Info;
SELECT * FROM Emp_Finance;




