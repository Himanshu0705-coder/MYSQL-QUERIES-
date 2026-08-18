🐬  **MySQL — Complete SQL Learning Guide**

A complete MySQL learning repository covering SQL fundamentals, database design, queries, joins, subqueries, aggregations, window functions, CTEs, stored procedures, triggers, indexes, and advanced SQL concepts.

📌 **About This Repository**

This repository contains my MySQL learning journey and SQL practice, organized from beginner to advanced concepts.

It is designed for:

🎓 Students learning SQL
💼 Data Analyst aspirants
📊 Data Science aspirants
👨‍💻 Software Developers
🧑‍💼 SQL Interview preparation
🏆 Coding platform practice
📚 Table of Contents
Introduction to SQL
MySQL Basics
Database & Table Operations
Data Types
SELECT Statement
Filtering Data
Sorting Data
Aggregate Functions
GROUP BY
HAVING
Joins
Subqueries
Set Operators
CASE Statement
String Functions
Date & Time Functions
NULL Handling
Constraints
Keys
DDL, DML, DQL, DCL & TCL
Views
Indexes
Window Functions
CTEs
Recursive CTE
Stored Procedures
Stored Functions
Triggers
Transactions
Normalization
ACID Properties
Indexes & Query Optimization
Common Interview Queries
Practice Resources
🟢 **1. Introduction to SQL**
What is SQL?

SQL (Structured Query Language) is used to communicate with relational databases.

SQL can be used to:

Create databases
Create tables
Insert data
Retrieve data
Update data
Delete data
Analyze data
Manage database objects
🟢 **2. MySQL Basics**
What is MySQL?

MySQL is an open-source relational database management system (RDBMS).

Check MySQL Version
SELECT VERSION();
Show Databases
SHOW DATABASES;
Create Database
CREATE DATABASE company;
Select Database
USE company;
Show Tables
SHOW TABLES;
🟢 **3. Database & Table Operations**
Create Table
CREATE TABLE employees (
    employee_id INT,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);
Insert Data
INSERT INTO employees
(employee_id, employee_name, department, salary)
VALUES
(1, 'Himanshu', 'IT', 60000);
Insert Multiple Rows
INSERT INTO employees
VALUES
(2, 'Rahul', 'HR', 45000),
(3, 'Aman', 'IT', 70000),
(4, 'Priya', 'Finance', 55000);
Update Data
UPDATE employees
SET salary = 65000
WHERE employee_id = 1;
Delete Data
DELETE FROM employees
WHERE employee_id = 1;
Drop Table
DROP TABLE employees;
Truncate Table
TRUNCATE TABLE employees;
🟢 **4. MySQL Data Types**
Numeric
INT
BIGINT
DECIMAL
FLOAT
DOUBLE
String
CHAR
VARCHAR
TEXT
Date & Time
DATE
TIME
DATETIME
TIMESTAMP
YEAR
Boolean
BOOLEAN
🟢 **5. SELECT Statement**
Select All Columns
SELECT *
FROM employees;
Select Specific Columns
SELECT employee_name, salary
FROM employees;
DISTINCT
SELECT DISTINCT department
FROM employees;
🟢 **6. Filtering Data**
WHERE
SELECT *
FROM employees
WHERE salary > 50000;
AND
SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 50000;
OR
SELECT *
FROM employees
WHERE department = 'IT'
OR department = 'HR';
NOT
SELECT *
FROM employees
WHERE NOT department = 'HR';
BETWEEN
SELECT *
FROM employees
WHERE salary BETWEEN 40000 AND 70000;
IN
SELECT *
FROM employees
WHERE department IN ('IT', 'HR', 'Finance');
LIKE
SELECT *
FROM employees
WHERE employee_name LIKE 'A%';
Wildcards
%  → zero or more characters
_  → exactly one character
🟢 **7. Sorting Data**
ASC
SELECT *
FROM employees
ORDER BY salary ASC;
DESC
SELECT *
FROM employees
ORDER BY salary DESC;
Multiple Columns
SELECT *
FROM employees
ORDER BY department ASC, salary DESC;
🟢 **8. Aggregate Functions**

Aggregate functions perform calculations on multiple rows.

Function	Purpose
COUNT()	Count rows
SUM()	Calculate total
AVG()	Calculate average
MIN()	Find minimum
MAX()	Find maximum
COUNT
SELECT COUNT(*)
FROM employees;
SUM
SELECT SUM(salary)
FROM employees;
AVG
SELECT AVG(salary)
FROM employees;
MIN
SELECT MIN(salary)
FROM employees;
MAX
SELECT MAX(salary)
FROM employees;
🟢 **9. GROUP BY**

GROUP BY groups rows having the same value.

Department-wise Employee Count
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;
Department-wise Average Salary
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;
🟢 **10. HAVING**

HAVING filters grouped results.

SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;
WHERE vs HAVING
WHERE	HAVING
Filters rows	Filters groups
Used before GROUP BY	Used after GROUP BY
Cannot normally use aggregate conditions	Used with aggregate conditions
🟢 **11. JOINS**

Joins combine data from multiple tables.

INNER JOIN

Returns matching records.

SELECT
    e.employee_name,
    d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;
LEFT JOIN

Returns all records from the left table.

SELECT
    e.employee_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;
RIGHT JOIN

Returns all records from the right table.

SELECT
    e.employee_name,
    d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;
CROSS JOIN

Returns every possible combination.

SELECT *
FROM employees
CROSS JOIN departments;
SELF JOIN

A table joins with itself.

SELECT
    e.employee_name AS employee,
    m.employee_name AS manager
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id;
Join Summary
INNER JOIN  → Matching records
LEFT JOIN   → All left + matching right
RIGHT JOIN  → All right + matching left
CROSS JOIN  → Every combination
SELF JOIN   → Table joined with itself
🟢 **12. Subqueries**

A subquery is a query inside another query.

Employees earning above average salary
SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
Highest Salary
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);
Second Highest Salary
SELECT MAX(salary)
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);
Correlated Subquery
SELECT e.employee_name, e.salary, e.department
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department = e.department
);
🟢 **13. Set Operators**
UNION

Combines results and removes duplicates.

SELECT city FROM customers
UNION
SELECT city FROM suppliers;
UNION ALL

Keeps duplicates.

SELECT city FROM customers
UNION ALL
SELECT city FROM suppliers;
🟢 **14. CASE Statement**

Used for conditional logic.

SELECT
    employee_name,
    salary,
    CASE
        WHEN salary >= 70000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;
🟢 **15. String Functions**
CONCAT
SELECT CONCAT(first_name, ' ', last_name)
FROM employees;
UPPER
SELECT UPPER(employee_name)
FROM employees;
LOWER
SELECT LOWER(employee_name)
FROM employees;
LENGTH
SELECT LENGTH(employee_name)
FROM employees;
SUBSTRING
SELECT SUBSTRING(employee_name, 1, 3)
FROM employees;
TRIM
SELECT TRIM(employee_name)
FROM employees;
REPLACE
SELECT REPLACE(employee_name, 'a', 'A')
FROM employees;
🟢 **16. Date & Time Functions**
Current Date
SELECT CURDATE();
Current Time
SELECT CURTIME();
Current Date & Time
SELECT NOW();
Extract Year
SELECT YEAR(order_date)
FROM orders;
Extract Month
SELECT MONTH(order_date)
FROM orders;
Date Difference
SELECT DATEDIFF(end_date, start_date)
FROM projects;
Last 3 Months
SELECT *
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL 3 MONTH;
🟢 **17. NULL Handling**
Find NULL values
SELECT *
FROM employees
WHERE manager_id IS NULL;
Find NOT NULL
SELECT *
FROM employees
WHERE manager_id IS NOT NULL;
COALESCE

Returns the first non-NULL value.

SELECT
    employee_name,
    COALESCE(phone_number, 'Not Available') AS phone
FROM employees;
🟢 **18. Constraints**

Constraints enforce rules on table data.

PRIMARY KEY
FOREIGN KEY
NOT NULL
UNIQUE
CHECK
DEFAULT
Example
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2) CHECK (salary > 0),
    department_id INT,
    status VARCHAR(20) DEFAULT 'Active'
);
🟢 **19. Keys**
Primary Key

Uniquely identifies each row.

employee_id INT PRIMARY KEY
Foreign Key

Creates a relationship between tables.

FOREIGN KEY (department_id)
REFERENCES departments(department_id);
Candidate Key

A column that can potentially become a primary key.

Composite Key

A key consisting of multiple columns.

PRIMARY KEY (employee_id, project_id)
🟢 **20. SQL Command Categories**
DDL — Data Definition Language

Used to define database structure.

CREATE
ALTER
DROP
TRUNCATE
DML — Data Manipulation Language

Used to modify data.

INSERT
UPDATE
DELETE
DQL — Data Query Language
SELECT
DCL — Data Control Language
GRANT
REVOKE
TCL — Transaction Control Language
COMMIT
ROLLBACK
SAVEPOINT
🟢 **21. Views**

A view is a virtual table based on a SQL query.

Create View
CREATE VIEW high_salary_employees AS
SELECT employee_id, employee_name, salary
FROM employees
WHERE salary > 70000;
Use View
SELECT *
FROM high_salary_employees;
Drop View
DROP VIEW high_salary_employees;
🟢 **22. Indexes**

Indexes improve data retrieval performance.

Create Index
CREATE INDEX idx_employee_name
ON employees(employee_name);
Composite Index
CREATE INDEX idx_department_salary
ON employees(department_id, salary);
Drop Index
DROP INDEX idx_employee_name
ON employees;
Important

Indexes can make SELECT queries faster but may increase the cost of:

INSERT
UPDATE
DELETE

because indexes also need to be maintained.

🔥 **23. Window Functions**

Window functions perform calculations across related rows without collapsing them.

ROW_NUMBER()
SELECT
    employee_name,
    department,
    salary,
    ROW_NUMBER() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS row_num
FROM employees;
RANK()
SELECT
    employee_name,
    salary,
    RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;
DENSE_RANK()
SELECT
    employee_name,
    salary,
    DENSE_RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;
RANK vs DENSE_RANK vs ROW_NUMBER
Function	Handles Ties	Skips Rank
ROW_NUMBER()	No	No
RANK()	Yes	Yes
DENSE_RANK()	Yes	No
🔥 **24. Common Window Functions**
LAG()

Access previous row.

SELECT
    employee_name,
    salary,
    LAG(salary) OVER (
        ORDER BY salary
    ) AS previous_salary
FROM employees;
LEAD()

Access next row.

SELECT
    employee_name,
    salary,
    LEAD(salary) OVER (
        ORDER BY salary
    ) AS next_salary
FROM employees;
Running Total
SELECT
    order_date,
    amount,
    SUM(amount) OVER (
        ORDER BY order_date
    ) AS running_total
FROM orders;
Department-wise Ranking
SELECT
    employee_name,
    department,
    salary,
    DENSE_RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;
🔥 **25. Common Table Expressions (CTE)**

CTEs make complex queries easier to read.

WITH high_salary AS (
    SELECT *
    FROM employees
    WHERE salary > 60000
)
SELECT *
FROM high_salary;
Multiple CTEs
WITH employee_count AS (
    SELECT department, COUNT(*) AS total_employees
    FROM employees
    GROUP BY department
),
avg_salary AS (
    SELECT department, AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
)
SELECT *
FROM employee_count
JOIN avg_salary
ON employee_count.department = avg_salary.department;
🔥 **26. Recursive CTE**

Useful for hierarchical data.

WITH RECURSIVE employee_hierarchy AS (
    SELECT
        employee_id,
        employee_name,
        manager_id,
        1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.employee_id,
        e.employee_name,
        e.manager_id,
        eh.level + 1
    FROM employees e
    JOIN employee_hierarchy eh
        ON e.manager_id = eh.employee_id
)
SELECT *
FROM employee_hierarchy;
🔥 **27. Stored Procedures**

A stored procedure is a reusable collection of SQL statements.

DELIMITER //

CREATE PROCEDURE GetEmployees()
BEGIN
    SELECT *
    FROM employees;
END //

DELIMITER ;
Execute
CALL GetEmployees();
🔥 **28. Stored Functions**

Functions return a value.

DELIMITER //

CREATE FUNCTION CalculateBonus(salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
RETURN salary * 0.10 //

DELIMITER ;

Use:

SELECT
    employee_name,
    CalculateBonus(salary) AS bonus
FROM employees;
🔥 **29. Triggers**

A trigger automatically executes when a specified database event occurs.

BEFORE INSERT
DELIMITER //

CREATE TRIGGER before_employee_insert
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    SET NEW.employee_name = UPPER(NEW.employee_name);
END //

DELIMITER ;

Triggers can be created for:

BEFORE INSERT
AFTER INSERT
BEFORE UPDATE
AFTER UPDATE
BEFORE DELETE
AFTER DELETE
🔥 **30. Transactions**

Transactions allow multiple SQL operations to be treated as one unit.

START TRANSACTION;

UPDATE accounts
SET balance = balance - 500
WHERE account_id = 1;

UPDATE accounts
SET balance = balance + 500
WHERE account_id = 2;

COMMIT;
Rollback
ROLLBACK;
Savepoint
SAVEPOINT transfer_point;
🔥 **31. Normalization**

Normalization organizes data to reduce redundancy.

1NF
Atomic values
No repeating groups
2NF
Must be in 1NF
No partial dependency
3NF
Must be in 2NF
No transitive dependency
BCNF

A stronger version of 3NF.

Main Goal
Reduce data redundancy
+
Improve data integrity
+
Improve database structure
🔥 **32. ACID Properties**

Transactions follow four major properties.

Property	Meaning
Atomicity	All operations succeed or all fail
Consistency	Database remains valid
Isolation	Transactions don't improperly interfere
Durability	Committed changes persist
🔥 **33. Query Optimization**
EXPLAIN

Use EXPLAIN to understand how MySQL executes a query.

EXPLAIN
SELECT *
FROM employees
WHERE department_id = 10;
Optimization Techniques
Use appropriate indexes
Avoid unnecessary columns
Prefer SELECT column1, column2 over SELECT *
Filter data early
Avoid unnecessary subqueries
Use appropriate joins
Analyze execution plans
Avoid functions on indexed columns when possible
Use pagination for large result sets
🔥 **34. Common SQL Interview Questions**
1. Find second-highest salary
SELECT MAX(salary)
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);
2. Find second-highest salary in each department
SELECT department, employee_name, salary
FROM (
    SELECT
        department,
        employee_name,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS rnk
    FROM employees
) t
WHERE rnk = 2;
3. Employees earning above average salary
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
4. Find duplicate records
SELECT email, COUNT(*) AS total
FROM employees
GROUP BY email
HAVING COUNT(*) > 1;
5. Find employees without a department
SELECT e.*
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id IS NULL;
6. Find employees who have not had an order in the last 3 months
SELECT e.employee_id, e.employee_name
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.employee_id = e.employee_id
      AND o.order_date >= CURRENT_DATE - INTERVAL 3 MONTH
);
7. Find highest salary in each department
SELECT department, MAX(salary) AS highest_salary
FROM employees
GROUP BY department;
8. Find employees with the highest salary in each department
SELECT employee_name, department, salary
FROM (
    SELECT
        employee_name,
        department,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS rnk
    FROM employees
) t
WHERE rnk = 1;
9. Find employees whose salary is greater than their department average
SELECT employee_name, department, salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees e2
    WHERE e2.department = e.department
);
10. Find departments having more than 5 employees
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;
🧠 **SQL Query Execution Order**

One of the most important concepts for SQL interviews:

FROM
JOIN
WHERE
GROUP BY
HAVING
SELECT
DISTINCT
ORDER BY
LIMIT

Remember:

FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT

🎯 **SQL Learning Roadmap**
                    MYSQL
                       │
        ┌──────────────┴──────────────┐
        │                             │
      BASIC                       INTERMEDIATE
        │                             │
 SELECT / WHERE                 JOINS
 INSERT / UPDATE                SUBQUERIES
 DELETE                         GROUP BY
 ORDER BY                       HAVING
 Functions                      CASE
        │                             │
        └──────────────┬──────────────┘
                       │
                    ADVANCED
                       │
              Window Functions
                       │
                      CTE
                       │
                Stored Procedures
                       │
                    Triggers
                       │
                    Indexes
                       │
                 Optimization

🚀 **Goal**

The goal of this repository is to build strong SQL fundamentals and develop the ability to solve real-world data analysis and SQL interview problems.

**Learn → Practice → Solve Problems → Build Projects → Prepare for Interviews**
