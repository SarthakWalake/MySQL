-- Implement Merge Join

CREATE DATABASE ads;
USE ads;

CREATE TABLE employees(
emp_id INT,
name VARCHAR(50)
);

INSERT INTO employees VALUES
(1,'Sarthak'),
(2,'Ram'),
(4,'Sham');

CREATE TABLE salaries(
emp_id INT,
salary INT
);

INSERT INTO salaries VALUES
(1,70000),
(3,55000),
(4,50000);

SELECT e.emp_id,e.name,s.salary
FROM
(SELECT * FROM employees ORDER BY emp_id) AS e
JOIN
(SELECT * FROM salaries ORDER BY emp_id) AS s
ON e.emp_id = s.emp_id;
