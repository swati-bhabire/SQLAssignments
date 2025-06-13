-- Aggregate:
SELECT * FROM testcoursedb.departments;
--  Find the total department in employee table
select count(distinct department_id) as 'Total department' from employees;

-- find the max salary
select max(salary) from employees;

-- find the min salary 
select min(salary) from employees;

--  find the total salary 
select sum(salary) as 'Total Salary' from employees;

-- find the avg salary
select avg(salary) from employees;

-- use testdb;
-- 1. Find the total employees in each department
select department_id, count(*) as 'Total Employees' from employees group by department_id;

-- 2. Find the total department in each location
select job_id, count(department_id) as 'Total Department' from employees group by job_id;

-- 3. Find the average salary according to department
select DEPARTMENT_ID, avg(salary) as 'Average Salary' from employees group by DEPARTMENT_ID;

-- 4. Find the max salary for each job id
select job_id, max(salary) as 'Max Salary' from employees group by job_id;

-- 5. Find the total salary dispursed in each department
select department_id, sum(salary) as 'Total Salary' from employees group by DEPARTMENT_ID;

-- 6. Find the total employees in each department where employees are greater than 5
select department_id, count(*) as 'Total Employee' from employees group by department_id having count(*) > 5;

-- 7. Find the total no of working employee in each job
select job_id, count(*) as 'Total Employee' from employees group by job_id;

-- 8. Find the total department in each location and it should be greater than 2
select location_id, count(department_id) as 'Total Department' from departments group by location_id having count(DEPARTMENT_ID) > 2;

-- 9. Find the max salary for each job id and department should be 60,90,100,110
select job_id, department_id, max(salary) as 'Max Salary' from employees where department_id IN(60,90,100,110) group by job_id, department_id;
