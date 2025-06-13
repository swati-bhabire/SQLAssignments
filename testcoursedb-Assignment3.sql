-- 1. Find the empid, firstname, lastname and salary of employee
select employee_id, first_name, last_name from employees;

-- 2. Find the employees in deptid 60
select * from employees where department_id = 60;

-- 3. Find the employees with salary greater than 1000
select * from employees where salary > 1000;

-- 4. Find the employees whose manager id is not given
select * from employees where MANAGER_ID is null;

-- 5. find the department whose manaer_id is 0
select department_id from employees where MANAGER_ID = 0;

-- 6. Find the employees with salary in range 5000 to 10000
select * from employees where salary between 5000 and 10000;

-- 7. Find the employees who works in deparment 10,20 or50
select * from employees where DEPARTMENT_ID IN(10, 20, 50);

-- 8.Find the employees who work in department 80 and 60  and has salary above 15000
select * from employees where DEPARTMENT_ID IN(80, 60) and salary > 15000;

-- Like Clause
-- 1. show the employee names starting with vowels
select first_name from employees where left(first_name,1) in ('a','e','i','o','u');

-- 2. show the employee names ending with vowels
select first_name from employees where right(first_name,1) in ('a','e','i','o','u');

-- 3. show the department names having exactly 5 characters
select department_name from departments where length(department_name) = 5;
select department_name from departments where department_name like '_____';

-- 4. show the employee names starting with a and having min 2 characters
select first_name from employees where first_name like 'a%' having LENGTH(first_name) >= 2;

-- 5. show the employees names that start with a and end with r
select first_name from employees where FIRST_NAME like 'a%' and FIRST_NAME like '%r';

-- Update and Delete
-- 1. Increase the salary of all employees by 10%
update employees set salary = salary * 1.10;

-- 2. Increase the salary of employees by 1000 who works in department 60
update employees set salary = salary + 1000 where department_id = 60;

-- 3. Delete the employees working in 60 department -- Ensure to rollback this
delete from employees where department_id = 60;
