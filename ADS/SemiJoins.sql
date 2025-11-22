-- Implement semi joins 

CREATE TABLE Employees1(
emp_id INT,
name VARCHAR(50),
depy_id INT,
salary INT
);

CREATE TABLE Departments(
dept_id INT,
dept_name VARCHAR(50)
);

INSERT INTO Employees1 VALUES
(1, 'Sarthak',10, 50000),
(2, 'Ram',10, 60000),
(3, 'Sham',20, 70000),
(4, 'Raj',20, 65000);

INSERT INTO Departments VALUES
(10, 'IT'),
(20, 'HR');

-- SEMI JOIN USING EXISTS
SELECT e.emp_id, e.name, e.depy_id
FROM Employees1 e
WHERE EXISTS (
    SELECT 1
    FROM Departments d
    WHERE e.depy_id = d.dept_id
);
