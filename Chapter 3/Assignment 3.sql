-- 1
select 
	concat(e.Fname, ' ', e.Lname) as full_name,
	e.ssn as SSN, 
	e.Sex,
	d.Dependent_name as Dependent_name,
	d.Sex
from Employee e
inner join Dependent d
	on e.SSN = d.ESSN
where e.Sex = 'F' and d.Sex = 'F'

union 

select 
	concat(e.Fname, ' ', e.Lname) as full_name,
	e.ssn as SSN, 
	e.Sex,
	d.Dependent_name as Dependent_name,
	d.Sex
from Employee e
inner join Dependent d
	on e.SSN = d.ESSN
where e.Sex = 'M' and d.Sex = 'M'

order by e.Sex

-------------------------------------------------
-- 2 pro_name, tot_hours/week on each project 
select p.Pname, sum(w.Hours) as total_houes
from Project p
left join Works_for w
	on p.Pnumber = w.Pno
group by p.Pname 
order by 1

-------------------------------------------------
-- 3
select 
	d.Dname, e.Dno, d.MGRSSN
from Employee e
left join Departments d
	on e.Dno = d.Dnum
group by e.Dno, d.MGRSSN, d.Dname having MIN(e.SSN) = (select min(ssn) from Employee)

-- to check the answer
select * 
from Employee
where ssn = (select min(ssn) from Employee)

-------------------------------------------------
-- 4
select 
	d.Dnum, max(Salary) max_salary, min(Salary) min_salary, avg(Salary) avg_salary, string_agg(salary, ', ') all_salaries
from Employee e
left join Departments d
	on e.Dno = d.Dnum
group by d.Dnum

-------------------------------------------------
-- 5
select * 
from Employee e 
inner join Departments d
	on e.SSN = d.MGRSSN
where e.SSN not in (select ESSN from Dependent)

-------------------------------------------------
-- 6
select d.Dnum, d.Dname, count(e.SSN) num_of_emps
from Departments d
	left join Employee e 
	on d.Dnum = e.Dno
group by Dnum, Dname having avg(e.Salary) < (select avg(Salary) from Employee)

-------------------------------------------------
-- 7
select concat(e.Fname, ' ', e.Lname) Full_Nmae, p.Pname, e.Dno
from Project p
left join Employee e
	on p.Dnum = e.Dno
order by e.Dno, e.Lname, e.Fname

-------------------------------------------------
-- 8
select distinct top 2 salary top_salaries
from Employee
order by salary desc


-------------------------------------------------
-- 9
select concat(Fname, ' ', Lname) as Full_Common_Name
from Employee
where concat(Fname, ' ', Lname) in (select Dependent_name from Dependent)


-------------------------------------------------
-- 10
-- exists >> self study
select concat(Fname, ' ', Lname) as emp_name, SSN as emp_number
from Employee e
where exists(
	select 1 
	from Dependent d
	where e.SSN = d.ESSN
		)


-------------------------------------------------
-- 11
insert into Departments
values ('DEPT IT', 101, 112233, '1-11-2006')

select * from Departments

-------------------------------------------------
-- 12
--> 1
update Departments
set MGRSSN = 968574
where Dnum = 101

--> 2
update Departments
set MGRSSN = 102672
where Dnum = 20

--> 3

update Employee
set Dno = 20
where SSN = 102660


-------------------------------------------------
-- 13
-- no diagram for this data so can't change  relation between employee & Works_for
delete from Employee
where SSN = 223344


-------------------------------------------------
-- 14
update Employee 
set Salary += 0.3 * Salary
where dno = (select p.Dnum
	from Project p
	left join Employee e
		on p.Dnum = e.Dno
	where p.Pname = 'Al Rawdah')
