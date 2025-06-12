create table customer
(
customerid int,
customername varchar(20),
city varchar(30),
country varchar(30),
postalcode bigint,
constraint pk_custid primary key(customerid)
);

insert into customer(customerid, customername, city, country, postalcode)
values(1, 'Nidhi', 'Pune', 'India', 412101),
(2, 'Achal', 'Mumbai', 'India', 68853),
(3, 'Siya', 'Berlin', 'Germany', 80873),
(4, 'Riya', 'London', 'UK', 65890),
(5, 'Navya', 'Krakow', 'Poland', 57890),
(6, 'Suhit', 'Kolhapur', 'India', 416107),
(7, 'Dipti', 'Pune', 'India', 412101),
(8, 'Pankaj', 'New York', 'USA', 764738),
(9, 'Soham', 'New York', 'USA', 764738),
(10, 'Dev', 'Berlin', 'Germany', 80873),
(11, 'Parul', 'Mumbai', 'India', 68853),
(12, 'Tanvish', 'Pune', 'India', 412101);

insert into customer(customerid, customername, city, country, postalcode)
values(15, 'Shweta', '', 'USA', 764738);

insert into customer(customerid, customername, city, country)
values(14, 'Pooja', 'Krakow', 'Poland');

update customer set country = 'Norway' where customerid = 16;
update customer set city = 'Bergen' where customerid = 16;

select * from customer;

-- 1. Write a statement that will select the City column from the Customers table
select city from customer; 

-- 2. Select all the different values from the Country column in the Customers table.
select distinct country from customer;

-- 3. Select all records where the City column has the value "London
select * from customer where city = 'London';

-- 4. Use the NOT keyword to select all records where City is NOT "Berlin".
select * from customer where not city = 'Berlin';

-- 5. Select all records where the CustomerID column has the value 23.
select * from customer where customerid = 23;

-- 6. Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.
select * from customer where city = 'Berlin' and postalcode = 121110;

-- 7. Select all records where the City column has the value 'Berlin' or 'London'
select * from customer where city = 'Berlin' or 'London';

-- 8. Select all records from the Customers table, sort the result alphabetically by the column City.
select * from customer order by city;

-- 9. Select all records from the Customers table, sort the result reversed alphabetically by the column City.
select * from customer order by city desc;

-- 10. Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City
select * from customer order by country, city;

-- 11. Select all records from the Customers where the PostalCode column is empty.
select * from customer where postalcode is null;

-- 12. Select all records from the Customers where the PostalCode column is NOT empty
select * from customer where postalcode is not null;

-- 13. Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway"
update customer set city = 'Oslo' where country = 'Norway';

-- 14. Delete all the records from the Customers table where the Country value is 'Norway'
delete from customer where country = 'Norway';

-- 15. Use the MIN function to select the record with the smallest value of the Price column.
-- 16. Use an SQL function to select the record with the highest value of the Price column.
-- 17. Use the correct function to return the number of records that have the Price value set to 20
-- 18. Use an SQL function to calculate the average price of all products.

-- 19. Use an SQL function to calculate the sum of all the Price column values in the Products table
select sum(prodPrice) from products;
-- or
select sum(prodPrice) as 'Total Price' from products;

-- 20. Select all records where the value of the City column starts with the letter "a"
select * from customer where city like 'p%';

-- 21. Select all records where the value of the City column ends with the letter "a"
select * from customer where city like '%n';

-- 22. Select all records where the value of the City column contains the letter "a"
select * from customer where city like '%a%';

-- 23. Select all records where the value of the City column starts with letter "a" and ends with the letter "b"
select * from customer where city like 'p%e';

-- 24. Select all records where the value of the City column does NOT start with the letter "a"
select * from customer where city not like 'p%';

-- 25. Select all records where the second letter of the City is an "a"
select * from customer where city like '_u%';

-- 26. Select all records where the first letter of the City is an "a" or a "c" or an "s".
select * from customer where city like 'k%' or 'p%';

-- 27. Select all records where the first letter of the City starts with anything from an "a" to an "f"
select * from customer where city like '[k-w]%';

-- 28. Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".
-- select * from customer where (not city  like 'k%') and (not city like 'n%');
-- select * from customer where city not like 'n%' or city not like 'a%' or city not like 'c%';
select * from customer where (city not like 'n%') and (city not like 'p%') and (city not like 'c%');

-- 29. Use the IN operator to select all the records where the Country is either "Norway" or "France".
select * from customer where country IN ('Berlin', 'France'); 

-- 30. Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".
select * from customer where country NOT IN ('Berlin', 'France');

-- 31. Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20
select * from products where prodPrice between 10 and 20;

-- 32. Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 10 and 20.
select * from products where prodPrice not between 10 and 20;

-- 33. Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically between 'Geitost' and 'Pavlova'.
select * from products where prodName between 'Geitost' and 'Pavlova';

-- 34. When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.
select postalcode as 'Pno' from customer;

-- 35. When displaying the Customers table, refer to the table as Consumers instead of Customers.
-- 36. List the number of customers in each country.
-- 37. List the number of customers in each country, ordered by the country with the most customers first.
-- 38. Write the correct SQL statement to create a new database called testDB.
create database testDB;
-- 39. Write the correct SQL statement to delete a database named testDB
drop database testDB;
-- 40. Add a column of type DATE called Birthday in Persons table
create table person
(
personId int,
personName varchar(30)
);
alter table person add birthday varchar(20);

-- 41. Delete the column Birthday from the Persons table
alter table person drop birthday;





