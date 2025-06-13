-- 1. Write a query to display the names (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000.
select concat(first_name, ' ', last_name) as 'Employee Name', salary from employees where salary NOT between 10000 and 15000;

-- 2. Write a query to display the names (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending alphabetical order by department ID.
select concat(first_name, ' ', last_name) as 'Employee Name', department_id from employees where department_id IN(30, 100) order by department_id asc;

-- 3. Write a query to display the names (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100.
select concat(first_name, ' ', last_name) as 'Employee Name', salary from employees where salary NOT between 10000 and 15000 AND DEPARTMENT_ID IN(30, 100);

-- 4. Write a query to display the names (first_name, last_name) and hire date for all employees who were hired in 1987.
select concat(first_name, ' ', last_name) as 'Employee Name', hire_date from employees where year(hire_date) = 1987;

-- 5. Write a query to display the first_name of all employees who have both "b" and "c" in their first name.
select first_name from employees where FIRST_NAME like '%b%' and FIRST_NAME like '%c%';

-- 6. Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000.
select last_name, job_id, salary from employees where JOB_ID IN('IT_PROG', 'SH_CLERK') AND salary NOT IN(4500, 10000, 15000);

-- 7. Write a query to display the last names of employees whose names have exactly 6 characters.
select last_name from employees where length(first_name) = 6;
select last_name from employees where last_name like '______';

-- 8. Write a query to display the last names of employees having 'e' as the third character.
select last_name from employees where last_name like '__e';

-- 9. Write a query to display the jobs/designations available in the employees table.
select distinct job_id from employees;

-- 10. Write a query to display the names (first_name, last_name), salary and PF (15% of salary) of all employees
select concat(first_name, ' ', last_name) as 'Employee Name', salary, salary * 0.15 as PF from employees;