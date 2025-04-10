select * from Student

select * 
from Student
where st_age > 24

select st_id,St_Fname, St_Age 
from Student
order by 3

select st_id,St_Fname, St_Age 
from Student
order by St_Address

select concat(st_fname, ' ' , st_lname)
from Student
where st_fname is not null 
	and st_lname is not null

select *
from student 
where st_age between 20 and 26
order by st_age desc

select *
from student 
where St_Address in ('cairo', 'ALEX') -- not case sensative in comparing text

select *
from Instructor
where Dept_Id not in (70, 20)
order by Dept_Id desc

select top 5 * 
from Stud_Course
where Crs_Id = 200
order by grade desc

select distinct grade 
from Stud_Course

select distinct grade, crs_id -- order & work on the whole combination 
from Stud_Course

select St_Fname + space(2) + convert(varchar(10), St_Age) as 'name & age'
from Student

