-------------------------  joins -------------------------
-- cross join  >> multi of crossed tables >> used for testing to get large number of rows
select count(*) from Student
select count(*) from Department

select count(*) --, st_fname, dept_name
from Student 
cross join Department

-- inner join == equi join
-- used to get common rows in tables <<equi join>>
select St_Id, Crs_Name
from Course c, Stud_Course s
where s.Crs_Id = c.Crs_Id -- equi join 

select St_Fname, Dept_Name , Dept_Desc
from Student s
inner join Department d -- inner join 
	on s.Dept_Id = d.Dept_Id

select St_Fname, Dept_Name , Dept_Desc
from Student s
inner join Department d -- inner join 
	on s.Dept_Id = d.Dept_Id and s.st_age > 24 -- write conditions after on // no need for where

---- outer join
-- left join >> select all rows in left table and match from the right table 
select st_fname, Dept_Name
from Student s
left join Department d
	on s.Dept_Id = d.Dept_Id

-- right join 
-- right join >> select all rows in right table and match from the left table 
select st_fname, Dept_Name
from Student s
right join Department d
	on s.Dept_Id = d.Dept_Id

-- self join 
-- 
select 
	distinct(s1.St_Id), 
	concat(s1.St_Fname, ' ', s1.St_Lname) as 'full name',
	s1.St_Age
from Student s1 -- PK >> parent 
join student s2 -- FK >> chiled 
	on s1.St_Id = s2.St_super

select s2.St_Fname as 'Employee', s1.St_Fname as 'MGR'
from Student s1 -- PK >> parent 
join Student s2 -- FK >> chiled 
	on s1.St_Id = s2.St_super

-- multi joins 
select st.St_Id, st.St_Fname, stc.Crs_Id, crs.Crs_Name, t.Top_Name, stc.Grade
from Student st 
inner join Stud_Course stc
	on st.St_Id = stc.St_Id
left join Course crs
	on crs.Crs_Id = stc.Crs_Id
left join Topic t
	on t.Top_Id = crs.Top_Id

