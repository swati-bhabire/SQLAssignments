-- 1. Write a query to find the addresses (location_id, street_address, city,state_province, country_name) of all the departments.
 select l.location_id, l.street_address, l.city, l.state_province, c.COUNTRY_NAME
 from locations l
 join countries c on l.COUNTRY_ID = c.COUNTRY_ID
 join departments d ON l.location_id = d.location_id;
 
-- 2. Write a query to find the names (first_name, last name), department ID and name of all the employees.
select concat(e.first_name, ' ', e.last_name) as 'Name', d.DEPARTMENT_ID, d.DEPARTMENT_NAME
from employees e
join departments d
on d.DEPARTMENT_ID = e.DEPARTMENT_ID;

-- 3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London.
select concat(e.first_name, ' ', e.last_name) as 'Name', e.job_id, d.department_id, d.department_name
from employees e
join departments d ON e.department_id = d.department_id
join locations l ON d.location_id = l.location_id
where l.city = 'london';

-- 4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name).
select e.employee_id as 'Emp_Id', e.last_name as 'Employee', m.employee_id as 'Mgr_Id', concat(m.first_name, ' ', m.last_name) as 'Manager'
from employees e
join employees m
on (e.manager_id = m.employee_id);

-- 5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'.
select e.first_name, e.last_name, e.hire_date
from employees e
join employees jones on jones.last_name = 'Jones'
where e.hire_date > jones.hire_date;

-- 6. Write a query to get the department name and number of employees in thdepartment.
select d.DEPARTMENT_NAME, count(e.EMPLOYEE_ID) as num_employees
from departments d
left join employees e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
group by d.DEPARTMENT_NAME;

-- 7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
select employee_id, job_title, end_date - start_date as Days
FROM job_history
join jobs where department_id = 90;

-- 8. Write a query to display the department ID, department name and manager first name.
select d.department_id, d.department_name, d.manager_id, e.first_name
from departments d
inner join employees e
on d.manager_id = e.employee_id;

-- 9. Write a query to display the department name, manager name, and city.
select d.department_name, e.first_name, l.city
from departments d
join employees e
join locations l
on d.manager_id = e.employee_id;

-- 10. Write a query to display the job title and average salary of employees.
select j.job_title, avg(e.salary) as 'Average Salary'
from employees e
join jobs j ON e.job_id = j.job_id
group by j.job_title;

-- 11. Display job title, employee name, and the difference between salary of the employee and minimum salary for the job.
select j.job_title, e.first_name, e.salary - j.min_salary as 'Salary diff'
from employees e
join jobs j ON e.job_id = j.job_id;

-- 12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary
select jh.*
from job_history jh
join employees e on jh.employee_id = e.employee_id
where e.salary > 10000;