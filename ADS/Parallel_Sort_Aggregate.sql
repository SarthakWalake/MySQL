-- Implement Parallel joins sorting and Aggregates

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

-- Parallel Joins
SELECT e.emp_id, e.name, d.dept_name
FROM 
    (SELECT * FROM Employees1 ORDER BY emp_id) AS e
JOIN
    (SELECT * FROM Departments ORDER BY dept_id) AS d
ON e.depy_id = d.dept_id;

-- Sorting
SELECT * FROM
(
    SELECT * FROM Employees1 WHERE depy_id = 10 ORDER BY salary DESC
) AS IT_Emp
UNION ALL
SELECT * FROM
(
    SELECT * FROM Employees1 WHERE depy_id = 20 ORDER BY salary DESC
) AS HR_Emp;

-- Aggregates
SELECT 
    depy_id,
    AVG(salary) AS avg_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM Employees1
GROUP BY depy_id;


