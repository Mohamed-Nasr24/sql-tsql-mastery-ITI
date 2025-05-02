
select SUSER_name()

-------- select into >> DDL --------
-- copy and paste the selected data into another (server/DB/Schema)

-- pasting data to another DB
select * into company_sd.dbo.student_copy
from hr.student 

select *
from Company_SD.dbo.student_copy

-- pasting some data to another schema 
select top 5 * into older_student
from hr.student 
order by st_age desc

select * 
from older_student


-------- insert based on select >> DML --------

-- creating new empty table from existing one
select st_id, st_fname into young_stud
from hr.student
where st_id is NULL

-- inserting the selected data to new table 
insert into young_stud
select st_id, st_fname from hr.student
where st_age < (select avg(st_age) from hr.student)

select * from young_stud



