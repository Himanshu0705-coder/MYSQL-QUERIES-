use employees;

-- Arithmetic Operator ( + , - , * , / , ^ , %)

-- Q. Write a query to increase salary of all employees by 10%  
 -- and display column first_name , old_salary , new salary
select first_name , salary as Old_salary , (salary + salary * 10/100) as new_Salary from employee;

-- Q. find the salary where salary is in old numbers 
select * from employee where salary % 2 = 1;


-- Comparision Operator ( < , > , <= , >= , <> or !=)
-- Q. find salary with employees salary > 50000
select * from employee where salary > 50000;

-- Q. find first_name, salary of employees where salary are in odd numbers
select first_name , salary  from employee where salary % 2 = 1;

-- Logical Operators ( AND , OR , NOT)

-- Q. retrive info of employees where position is 
    -- manager and dept is HR ?
select * from employee where position like "%Manager%" AND department = "HR";

-- Q. find employee info where position is manager and dept is not IT
select * from employee where position = "Manager" and department <> "IT"; 

-- Q. find the employee info where position is manager and dept is either IT or HR 
select * from employee where position = "manager" and (department = "HR" OR department = "IT");

-- Q. find employee info where position is manager and dept is not from IT and HR
select * from employee where position = "manager" and Department Not in ("IT" , "HR");

-- Q. List employees name who has joined between "2020-01-01" and "2022-12-31"
Select * from employee where date_of_joining Between "2020-01-01" AND "2022-12-31";

-- Q. Write a query to find employees who are either in the 
-- "HR" department or have a salary between 30000 and 60000.
select * from employee where Department = "HR" OR (Salary between 30000 AND 60000);

-- Q. find employee info where salary is greater than 40K and smaller than 60K
select * from employee where salary >40000 AND salary < 60000;

-- Q. Give name and position of all managers in my company
select * from employee where position like "%manager%";

-- Q. give names of all the employees whose name match the pattern -- > rahul,rahil,rahel etc.
select * from employee where first_name like "rah_l";

-- Q. give names of all the employees whose name match the pattern -- > piyush,piynsh,piyash etc.
select * from employee where first_name like "piy_sh";

-- Q. Find employee whose first name starts with the letter "A" and whose salary is above 50000;
select * from employee where first_name like "A%" and salary > 50000;