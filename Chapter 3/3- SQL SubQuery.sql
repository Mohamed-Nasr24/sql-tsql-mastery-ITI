
select count(st_age), avg(st_age)
from Student
where St_Age is not null 

select *
from Student
where st_age > (
	select avg(st_age) from Student
	)

select *, (select count(st_id) from Student) as total
from Student


select *
from Student
where St_Fname in (select name from staff)


-------------- all - any --------------
-- to compare value with list of values

-- any work as min function
select *
from Student
where St_Address != 'Cairo' and st_age > any(select distinct st_age from Student where St_Address = 'Cairo')

-- all work as max function
select *
from Student
where St_Address != 'Cairo' and st_age > all(select distinct st_age from Student where St_Address = 'Cairo')


-- subQuery in `from` must has alias name
select *
from (select St_Fname as name, St_Age as age from Student) as NewTable -- must has alias name
order by age desc 

