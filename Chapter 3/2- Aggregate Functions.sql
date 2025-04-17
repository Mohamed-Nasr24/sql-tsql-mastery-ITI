select * from Student

-- some uses of group by 

-- group by combination columns 
select count(*), Dept_Id, St_Address
from Student
where St_Address is not null
group by Dept_Id, St_Address


-- group by combination columns with join
select count(*), s.Dept_Id, St_Address, d.Dept_Name
from Student s
join Department d 
	on d.Dept_Id = s.Dept_Id
where St_Address is not null
group by s.Dept_Id, St_Address, d.Dept_Name


-- join + filter rows + combination grouping + filter groups + order 
select * from Instructor
alter table Instructor alter column Salary int

select count(Ins_Id) cnt_, i.Dept_Id, d.Dept_Name, sum(Salary) total
from Instructor i
join Department d
	on i.Dept_Id = d.Dept_Id
where Ins_Degree = 'Master'
group by i.Dept_Id, d.Dept_Name having sum(Salary) > 5000
order by 1 desc


-- no where with agg function -- error 
select sum(salary)
from Instructor
where count(Ins_Id) > 2


-- having without group 
-- when all selected are agg functions and filter by agg function 
-- considering all table one group 
select sum(salary) total_of_all
from Instructor
having count(Ins_Id) > 10

