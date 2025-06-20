create database hospital;
drop table admissions;

create table patients 
(
patient_id int primary key,
first_name varchar(30),
last_name varchar(30),
gender char(1),
birth_date date,
city varchar(30),
province_id char(2),
allergies varchar(80),
height decimal,
weight decimal
);

insert into patients(patient_id, first_name, last_name, gender, birth_date, city, province_id, allergies, height, weight)
values(1, 'Jaya', 'Magdum', 'F', '1990-03-10', 'Pune', 'O', 'Dust', 160, 58),
(2, 'Niraj', 'Joshi', 'M', '1987-05-22', 'Pune', 'L', 'milk', 165, 65),
(3, 'Suhit', 'Lad', 'M', '1995-08-14', 'Mumbai', 'S', 'Pet', 158, 67),
(4, 'Nidhi', 'Patil', 'F', '1999-02-28', 'Nashik', 'T', 'Dust', 163, 55),
(5, 'Achal', 'Sathe', 'M', '1998-10-10', 'Kolhapur', 'G', null, 166, 62),
(6, 'Pruthvi', 'Khade', 'M', '1997-03-10', 'Mumbai', 'A', 'Detergent', 168, 72),
(7, 'Riya', 'Patil', 'F', '1999-03-10', 'Kolhapur', 'R', null, 159, 60),
(8, 'Tanvish', 'Khare', 'M', '1995-11-23', 'Nashik', 'Y', null, 160, 61),
(9, 'Ovi', 'Wagh', 'F', '1993-12-12', 'Pune', 'E', 'Dust', 158, 60),
(10, 'Ojas', 'Kelkar', 'M', '1999-07-11', 'Pune', 'P', null, 168, 64);


create table doctors
(
doctor_id int primary key,
first_name varchar(30),
last_name varchar(30),
specialty varchar(25)
);

insert into doctors(doctor_id, first_name, last_name, specialty)
values(101, 'Girija', 'Wagh', 'Gynecologist'),
(102, 'Sankalp', 'Gode', 'Psychiatrist'),
(103, 'Sonal', 'Sakhrape', 'Paediatrician'),
(104, 'Mayur', 'Patil', 'Neurologist'),
(105, 'Supriya', 'Kavthekar', 'Paediatrician'),
(106, 'Milind', 'More', 'Dermatologist'),
(107, 'Pankaj', 'Tiwari', 'ENT'),
(108, 'Riya', 'Joshi', 'Psychiatrist'),
(109, 'Nidhi', 'Khade', 'Pathology'),
(110, 'Achal', 'Arora', 'Dentist');

create table admissions
(
patient_id int,
admission_date date,
discharge_date date,
diagnosis varchar(50),
attending_doctor_id int
);

insert into admissions(patient_id, admission_date, discharge_date, diagnosis, attending_doctor_id)
values(1, '2024-12-15', '2024-12-21', 'Flu', '111'),
(3, '2025-01-05', '2025-01-15', 'Chest injury', '104'),
(8, '2025-01-12', '2025-01-17', 'Pregnancy', '101'),
(5, '2025-02-4', '2025-02-12', 'Hypertension', '108'),
(7, '2025-02-18', '2025-02-20', 'Flu', '111'),
(9, '2025-04-22', '2025-05-05', 'Fracture', '103'),
(2, '2025-05-27', '2024-06-02', 'Flu', '111');

-- 1.	Show the first name, last name and gender of patients who’s gender is ‘M’
select concat(first_name, ' ', last_name) as 'Name', gender from patients where gender = 'M';

-- 2.	Show the first name & last name of patients who does not have any allergies
select concat(first_name, ' ', last_name) as 'Name' from patients where allergies is null;

-- 3.	Show the patients details that start with letter ‘C’
select first_name from patients where first_name like 'o%';

-- 4.	Show the patients details that height range 100 to 200
select first_name from patients where height between 155 and 160;

-- 5.	Update the patient table for the allergies column. Replace ‘NKA’ where allergies is null
update patients set allergies='NKA' where allergies is null;

-- 6.	Show how many patients have birth year is 2020
select count(patient_id) as 'Total Patient' from patients where year(birth_date) = 2020;

-- 7.	Show the patients details who have greatest height
select * from patients where height = (select max(height) from patients);

-- 8.	Show the total amount of male patients and the total amount of female patients in the patients table.
select gender, count(*) as 'Total Patients' from patients group by gender;

-- 9.	Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.
select concat(first_name, ' ', last_name) as 'Name', allergies from patients where allergies in('Dust', 'Pet') order by allergies, first_name, last_name;

-- 10.	Show first_name, last_name, and the total number of admissions attended for each doctor Every admission has been attended by a doctor.
select d.first_name, d.last_name, count(a.patient_id) as 'Total admissions' 
from doctors d
inner join admissions a 
on d.doctor_id = a.attending_doctor_id
group by d.doctor_id, d.first_name, d.last_name;

-- 11.	For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.
select concat(p.first_name, ' ', p.last_name) as 'Patient Name', a.diagnosis, concat(d.first_name, ' ', d.last_name) as 'Doctor Name'
from admissions a
inner join patients p on p.patient_id = a.patient_id
inner join doctors d on a.attending_doctor_id = d.doctor_id;
