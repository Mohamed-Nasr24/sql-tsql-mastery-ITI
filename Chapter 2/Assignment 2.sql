-- 1
select d.Dnum, concat(e.Fname, ' ', e.Lname), e.SSN
from Departments d
join Employee e
	on d.MGRSSN = e.SSN

-- 2 
select d.Dname, p.Pname
from Departments d
left join Project p
	on d.Dnum = p.Dnum

-- 3
select d.*, concat(e.Fname, ' ', e.Lname) as Full_name
from Dependent d
join Employee e
	on d.ESSN = e.SSN

-- 4
select *
from Project
where City in ('Alex', 'Cairo')

-- 5
select *
from Project
where Pname like 'a%'

-- 6
select *
from Employee
where Dno = 30 
	and salary between 1000 and 2000

-- 7
select e.Fname + e.Lname as full_name, e.Dno, p.Pname, w.Hours
from Employee e
join Project p 
	on e.Dno = p.Dnum
join Works_for w
	on p.Pnumber = w.Pno
where e.Dno = 10
	and p.Pname = 'Al Rabwah'
	and w.Hours >= 10

-- 8
select e2.Fname + ' ' + e2.Lname as emp_name, e1.Fname + ' ' + e1.Lname as supervisor 
from Employee e1
join Employee e2
	on e1.SSN = e2.Superssn
where e2.Fname = 'Kamel' and e2.Lname = 'Mohamed'

-- 9
select e.Fname + ' ' + e.Lname, p.Pname
from Employee e
left join Project p
	on e.Dno = p.Dnum
order by 2

-- 10
select p.Pnumber, p.Pname, p.City, p.Dnum, d.Dname, e.Lname, e.Address
from Project p
left join Departments d
	on p.Dnum = d.Dnum
left join Employee e
	on e.SSN = d.MGRSSN
where p.City = 'Cairo'


-- 11
select *
from Employee
where Superssn is null


-- 12
select *
from Employee e
left join Dependent d
	on e.SSN = d.ESSN

-- 13
/* this query first to change existing ssn to insert new record with same ssn
----- this query couldn't run because of there is no diagram in this database
update Employee
set SSN = 102673
where SSN = 102672
*/

insert into Employee(Fname, Lname, Dno, SSN, Superssn, Salary)
	values('Mohamed', 'Nasr', 30, 102672, 112233, 3000)


-- 14
-- same as number 13,l there is no diagram to change setting (update casecade)


-- 15
update Employee
set Salary += Salary * .20

