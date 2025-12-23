--                                                       Assignment
--                                                  Filtering and Sorting


create database filtering_sorting
use filtering_sorting

create table Employees (
 EmpID int primary key,
 EmpName varchar(50),
 Department varchar(20),
 City varchar(20),
 Salary int,
 HireDate date
 );
 
 insert into Employees 
 values 
      (101,'Rahul Mehta','Sales','Delhi',55000,'2020-04-12'),
      (102,'Priya Sharma','HR','Mumbai',62000,'2019-09-25'),
      (103,'Aman Singh','IT','Bengaluru',72000,'2021-03-10'),
      (104,'Neha Patel','Sales','Delhi',48000,'2022-01-14'),
      (105,'Karan Joshi','Marketing','Pune',45000,'2018-07-22'),
      (106,'Divya Nair','IT','Chennai',81000,'2019-12-11'),
      (107,'Raj Kumar','HR','Delhi',60000,'2020-05-28'),
      (108,'Simran Kaur','Finance','Mumbai',58000,'2021-08-03'),
      (109,'Arjun Reddy','IT','Hyderabad',70000,'2022-02-18'),
      (110,'Anjali Das','Sales','Kolkata',51000,'2023-01-15')
      ;
 select * from employees;
 
 
 
-- Question 1 : Show employees working in either the ‘IT’ or ‘HR’ departments
-- Ans: 

select EmpName, Department
from employees
where department = 'IT' or department = 'HR'
order by department;

-- Question 2 : Retrieve employees whose department is in ‘Sales’, ‘IT’, or ‘Finance’.
-- Ans:

select EmpName, Department
from employees
where department in ('Sales','IT','Finance')
order by department;

-- Question 3 : Display employees whose salary is between ₹50,000 and ₹70,000.
-- Ans:

select EmpName, Salary
from Employees
where salary between 50000 and 70000
order by salary;

-- Question 4 : List employees whose names start with the letter ‘A’.
-- Ans:

select EmpName 
from employees
where EmpName like 'A%';

-- Question 5 : Find employees whose names contain the substring ‘an’.
-- Ans:

select EmpName 
from employees
where EmpName like '%an%';

-- Question 6 : Show employees who are from ‘Delhi’ or ‘Mumbai’ and earn more than ₹55,000.
-- Ans:

select EmpName, City, Salary
from employees
where City in ('Delhi','Mumbai') AND Salary > 55000;

-- Question 7 : Display all employees except those from the ‘HR’ department.
-- Ans:

select EmpName, Department
from employees
where Department not in ('HR')
order by Department;

-- Question 8 : Get all employees hired between 2019 and 2022, ordered by HireDate (oldest first).
-- Ans:

Select EmpName, HireDate
from employees
where Year(HireDate) Between '2019' and '2022'
order by HireDate asc; 





