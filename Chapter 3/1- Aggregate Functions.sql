select * from Employee
-- agg functions don't calc null values

------ sum ------
select sum(salary) total_salaries
from Employee

------ count ------
select count(*) number_of_all, count(Fname) number_of_names -- count all records at least has 1 value
from Employee

insert into Employee(SSN) values (111111) -- counter increased by 1 

------ max ------
select max(Salary)
from Employee

------ min ------
select min(salary)
from Employee

------ avg ------
-- sum / count
select 
	avg(salary), -- not calc null values 
	sum(salary) / count(*), -- force to take null values 
	sum(salary) / count(salary), -- default not taking null values 
	avg(isnull(salary, 0)) -- replace all salary null with 0 to take in calcs (optimized)
from Employee

------ group by ------
-- used to do calcs on group of rows to show some data insights 
select 
	MIN(salary) min_salary,
	max(salary) max_salary, 
	Dno dept_no
from Employee
group by Dno

-- where group
-- where work before grouping, so it filters all rows once before group
select sum(Salary) total_salaries_dept, Dno
from Employee
-- where Salary > 2000
group by Dno

select sum(Salary) total_salaries_dept, Dno
from Employee
where Salary > 2000
group by Dno

-- group having
-- having work after grouping, so it filters the groups
select sum(Salary), Dno
from Employee
group by Dno having	sum(Salary) > 2810

select sum(salary), Dno
from Employee
group by Dno having count(SSN) >= 2

-- where group having 
select sum(salary) total, count(salary) cnt_, Dno
from Employee
where Fname LIKE '_a%'
group by Dno having count(salary) < 3


