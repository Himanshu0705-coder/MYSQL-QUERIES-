    -- to create a database
create database employees;
    -- to show all the databases
show databases ;
    -- to select a particular database 
use employees;
    -- to show all tables in a database
show Tables; 
    -- create a table in the database 
create table employee(id int , 
                     name varchar(25) , 
                     department varchar(15) ,
                     salary decimal ,
                     DOJ date ,
                     email varchar(50));
 
     
 describe employee;  --  it show us the meta data of a table (some information for the particular table)

 -- to select all the data from a table 
 -- "*" is basically used for the select all the data from the table
select * from employee ;
     -- to insert the data into a database
insert into employee(id ,name, department,salary,DOJ,email) values (1,"Himanshu","IT","25000","2025-07-12","panchalhimanshu0507@gmail.com");
insert into employee(id , department,salary,DOJ,email) values (1,"IT","25000","2025-07-12","panchalhimanshu0507@gmail.com");
insert into employee values(2,"Aastha","IT","35000","2025-12-30","gargaastha811@gmail.com");

insert into employee values(3,"Devansh","IT","25000","2025-12-06","devanshpanchal@gmail.com"),
						   (4,"Shivam","IT","25000","2025-12-06","devanshpanchal@gmail.com");
 
 select name , DOJ from employee;
 
 -- to delete the table and database permanently
 drop database employees;
 drop table employee;
 
  -- to select some particular column from the database 
 select first_name,last_name,salary from employee;
 
  -- where clause is used for select a particular department or other domain (implement a condition in the database)
  
  select * from employee where department = "IT";
   -- here we use alias for rename the data, "as" is a alias
   
   -- numerical query to imcrement 5000 in the old_salary
  select first_name,salary as old_salary ,salary+5000 as new_salary from employee;
   -- numerical query to imcrement 10% in the old_salary
   -- 1st method
  select first_name,
  salary as old_salary ,
  salary+(salary*10)/100  as new_salary 
  from employee;
  
  -- 2nd method
     select first_name,
     salary as old_salary ,
     salary*1.10  as new_salary 
     from employee;
     
     -- find employees where salary is in old no.
     select * from employee where salary % 2 = 1; 
     
     -- find employee where salary >50000
     select * from employee where salary > 50000;
     
     -- retrive info of employees where position is manager and dept is HR
     select * from employee where position = "Manager" AND department ="HR";
     
     -- find employee info where position is manger and deplt is not IT
     select * from employee where position = "Manager" AND department<>"IT";
     
     -- find employee info where position is manger and department is either IT or HR
     select * from employee where (position = "Manager") AND (department = "IT" OR department = "HR");
     
     -- find employee info where position is manger and department is not from IT and HR 
     select * from employee where (position = "Manager") AND NOT( department = "IT" OR department = "HR");  -- 1st method
     select * from employee where (position = "Manager") AND ( department != "IT" AND department != "HR");  -- 2nd method
    
    -- IN operator  ( used to replace more OR conditions with IN)
    select * from employee where (position = "Manager") AND department in ("IT","HR");
    
    select * from employee where (position = "Manager") AND department not in ("IT","HR");
    
    -- find employee info where salary greater than 40K and smaller than 60K
    select * from employee where (salary >= 40000 ) AND (salary <= 60000);  -- 1st method
    select * from employee where salary between 40000 and 60000;  -- 2nd method
    
    -- list employees names who has joined between "2020-01-01" and "2022-12-31"
    select first_name,date_of_joining from employee where date_of_joining between "2020-01-01" and "2022-12-31";
    
    -- write a query to find employees who are either in the "HR" department or have a salary between 30000 and 60000.
    select * from employee where department = "HR" OR (salary between 30000 and 60000); 
    
    use employees;
    select * from employee;
    
    -- LIKE Operator 
    -- % 
    -- write a query to give name and positions of all the managers of our company 
    select first_name , last_name, position from employee where position LIKE "%manager";  
    
    -- _ 
    -- Give the name of all the employees whose name matches the pattern --> Rahul,Rahel,rahil
    select first_name , last_name, position from employee where first_name LIKE "rah_l";
    -- Give the name of all the employees whose name matches the pattern --> piyush,piyash,piyesh
    select first_name , last_name, position from employee where first_name LIKE "piy_sh";
    -- find the employes whose first name is start with the letter "A" and whose salary is above 50000.
    select first_name , last_name, position,salary from employee where first_name LIKE "A%" and salary > 50000;
    
    
    -- Functions
    -- Aggregate functions  
         -- SUM , COUNT , MAX , MIN , AVERAGE
		-- find count of employees in IT dept
     select COUNT(emp_id) from employee where department="IT";
    -- find count of managers in IT dept
     select COUNT(emp_id) from employee where department="IT" and position like "%manager";
     -- find MAX salary in Marketing dept
     select MAX(salary) from employee where department="Marketing";
     -- find total salary salary of trainee on HR dept
     select SUM(salary) from employee where position="trainee" and department="HR";
     -- find the salary disparity between manager 
     select MAX(salary)-MIN(salary) from employee where position like "%manager";
     
     
     -- find employees with salary > average salary  -- not do this questions here ... 
     select first_name from employee where Salary > Avg(salary);
     
     
     -- MAthemetical funtions 
        -- ROUND 
        select round(4.5242,0);
        select round(4.45767,2);
        -- MOD
        select MOD(1,5) as remainder;
        select abs(-45);  -- abs -> absolute .. it always give us the positive values

-- Text function

-- give fullname(first_name + last_name) of employees in upper case   
select upper(concat(first_name," ",last_name)) as fullname from employee; 
    -- find length of email id in hr department having the longest emailid
    select max(length(email)) from employee where department="HR";
    
    -- find characters before @ in email id
    select left(email,locate("@", email)-1) from employee;
	
    -- find charaacter after @ in email id
  
    -- find character after @ and before "." in email id
    
    
    -- find employees joined between 2024 and 2026
    select * from employee where date_of_joining between "2024-01-01" and "2026-12-31";  -- 1st method
    select * from employee where YEAR(date_of_joining) between 2024 and 2026; -- 2nd method
    
    -- find how long have employees been in this company wrto year in term of experience
     select abs(round(datediff(date_of_joining,curdate())/365)) from employee;  -- 1st method
     select year(curdate())- year(date_of_joining) as exp from employee;  -- 2nd method
     
     -- find count of employee joined on weekend  
     select first_name, date_of_joining , dayname(date_of_joining) from employee where dayofweek(date_of_joining) in (1,7);
     
     select count(first_name) from employee where dayofweek(date_of_joining) in (1,7);
     
     