
select * from hr.Instructor

-- Rank Functions used to:
-- 1. select specific rank from the data (select the 3rd highest salary)
-- 2. get grouping the data and get wanted data (top not used directly with group by)
-- 3. handel any duplicates 

------------ Rank_Number ------------
-- `order by` is excuted before `select`
select ROW_NUMBER() over(order by Salary desc, Dept_id) as RN, *
from hr.instructor

------------ Dense_Rank ------------
-- dupliacates take same rank 
-- to find all records in same rank (as top repeated students with highest score)
-- no gaps between ranks 
select *
from(
	select dense_rank() over(order by Salary desc) as DR, *
	from hr.instructor
	) as new_tbl
where DR = 1

------------ Rank ------------
-- dupliacates take same rank 
-- mix between `dense rank` and `row number` .. 
--       (if the salary = the above salary then R = above R,,, if salary <> above salary then R = RN)
-- Gaps between ranks 
select *
from(
	select rank() over(order by Salary desc) as R,
	row_number() over(order by salary desc) as RN 
	,*
	from hr.instructor
	) as new_tbl
-- where R = 1


------------ NTILE ------------
-- to divide table into n groups, each group records = count(*) / n
-- if not dividalbe number, the shortage comes in last groups 

-- each group records = 16 / 7 = 3 .. but last groups is 2
select *
from(
	select ntile((select count(distinct(dept_id)) from hr.instructor)) over(order by Salary desc) as NT, *
	from hr.instructor
	) as new_tbl

-- each group records = 16 / 5 = 4 .. but last group is 3
select *
from(
	select ntile(5) over(order by Salary desc) as NT, *
	from hr.instructor
	) as new_tbl



------------ partition by ------------
-- grouping the table 
-- return all data not only calculated value 
select *
from (
	select row_number() over(partition by dept_id order by salary desc) as RN, 
	*
	from hr.instructor
	) as newtble

-- to return top highest salaries in each dept
select *
from (
	select DENSE_RANK() over(partition by dept_id order by salary desc) as DR, 
	*
	from hr.instructor
	) as newtble
where DR = 1



