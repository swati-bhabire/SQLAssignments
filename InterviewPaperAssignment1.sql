use sqlassignments;

create table students
(
sid int primary key,
name varchar(30),
city varchar(30)
);

insert into students(sid, name, city)
values(1, 'Ram', 'Pune'),
(2, 'Sham', 'Mumbai'),
(3, 'Sita', 'Pune'),
(4, 'Gita', 'Nashik');

create table subjects
(
subid int primary key,
subname varchar(30),
maxmarks int,
passing int
);

insert into subjects(subid, subname, maxmarks, passing)
values(1, 'Maths', 100, 40),
(2, 'English', 100, 40),
(3, 'Marathi', 50, 15),
(4, 'Hindi', 50, 15);

create table exam
(
sid int,
subid int,
marks int
);

insert into exam(sid, subid, marks)
values(1, 1, 100),
(1, 2, 85),
(1, 3, 40),
(1, 4, 45),
(2, 1, 35),
(2, 2, 55),
(2, 3, 25),
(3, 1, 95),
(3, 2, 87),
(3, 3, 45),
(3, 4, 42);

-- a. Insert a new student (Sid=5, Name = Ramesh, City = Hyderabad) into the Students table
insert into students(sid, name, city)
values(5, 'Ramesh', 'Hyderabad');

-- b. Change City of SID = 4 (Gita) to Sangli
update students set city = 'Sangli' where sid = 4;

-- c. Return list of all Students with columns Sid, Name and city
select * from students;

-- d. Return list containing columns SID, Name, SubName, Marks, MaxMarks, Percentage
select st.sid, st.name, s.subname, e.marks, s.maxmarks, concat(e.marks/s.maxmarks * 100) as 'Percentage'
from students st
inner join exam e
inner join subjects s
on e.subid = s.subid;

-- e. Return list containing columns SID, Name, SubName, Marks, MaxMarks, Pass (return "P" if student has passed, "F" if student has failed)

-- f. Return list containing columns SID, Name, SubName of students who were absent for the exam
select st.sid, st.name, s.subname
from students st
inner join exam e
join subjects s
on st.sid = e.sid
where st.sid <> e.sid;

-- g. Return subject list with name of just the student who came first in that subject along with his/her marks. Subld, SubName, Name, Marks, MaxMarks
select st.name, s. subid, s.subname, e.marks, s.maxmarks
from students st
left join exam e
on st.sid = e.sid
left join subjects s
on e.subid = s.subid
where e.marks > 60;

-- h. Return Subject list with count of students who attempted the exam and count of students who passed the exam - Subld, SubName AttemptCount, PassCount
select s.subid, s.subname, count(*) as 'AttemptCount'
from exam e
join subjects s
join students st
on st.sid = e.sid and s.subid = e.subid
group by e.subid, s.subname
order by s.subid;

-- i. Return Total Percentage of students with columns SID, Name, Total Marks, Total MaxMarks, Percentage
select st.sid, st.name, sum(marks) as 'Total marks', sum(s.maxmarks) as 'Total MaxMarks', (sum(marks)*100)/sum(s.maxmarks) as 'Percentage'
from students st
inner join  exam e 
join subjects s
on e.sid=st.sid and s.subid=e.subid
group by e.sid;

-- j. How would you generate an output showing the list of all students in the first column and list of subjects as columns with the marks obtained by each student
-- populated in the appropriate cell?
select st.name, s.subname
from students st
join subjects s
order by s.subname; 
 