------------ like ------------
select St_Fname
from Student
where St_Fname like ''

/*
"___"             >> at least 3 chars 
"a%h" >>          >> start with a, end with h
"%n_" >>          >> mona
"_m__"            >> 4 chars and the second is m
"ahm%"            >> start with ahm
"[ahm]%"          >> start with a or h or m
"[^ahm]%"         >> not start with a or h or m
"[a-d]%"          >> start with any char in range
"[^a-d]%"         >> not start with any char in range
"[(am)(mo)(ah)]%" >> grouping with OR >> amr, mohamed, ahmed
"%[%]"            >> anytext%
"[_]%[_]"         >> _amr_
"[_]_%"           >> _amr >> start with _, at least 2 chars 
*/



------------ identity ------------
-- any table can has only one identity 
create table emp
(
id int primary key identity(1, 1), -- increament by default(1, 1) start from 1 & increase by 1
name varchar(10)
)

insert into emp values('ali')
insert into emp values('amr')
select * from emp


create table staff
(
id int identity(100, 5), -- increamen >> start from 100 & increase by 5
ssn int primary key,
name varchar(10)
)

insert into staff values(123, 'ali')
insert into staff values(124, 'amr')
insert into staff values(125, 'ahmed')

delete from staff where id = 125

insert into staff values(125, 'ahmed') -- after delete any record the identity keep the value of counter and increase in next insertion

select * from staff


set identity_insert staff on -- to allow insert value of identity 
insert into staff(id, ssn, name) values(15, 126, 'ahmed')
insert into staff(id, ssn, name) values(150, 127, 'ahmed')

set identity_insert staff off -- after off manual insertion, the identity take max value to make as start value to avoid dublication
insert into staff values(129, 'mona')

select @@IDENTITY -- global variable to show last identity
select SCOPE_IDENTITY() -- function to get last value of the identity 
select IDENT_CURRENT('emp') -- function to get last value of the identity in specific table 
select IDENT_INCR('staff') -- function to get increament value of the identity 
select IDENT_SEED('staff') -- function to get start value of the identity

dbcc checkident('staff', reseed, 1) -- to change start vlaue 
insert into staff values(130, 'mai')
insert into staff values(133, 'hagar')

------------ drop -- delete -- truncate ------------
-- drop >> ddl, remove the table with all data (meta, records)
drop table staff  -->> ddl will not be existed anymore 

delete from staff  -->> dml to delete records of data (uses where,  use rollback, slower, no change on identity)

truncate table staff -->> ddl to delete all records at once (no condition, no roll back, faster, child table, reset identity)


------------ FK update & delete ------------
-- this happen when change parent and want to control change in child -- most used with weak entity
-- go to database diagram and double click on relation to select properties
-- tap on "Insert and Update Specification"
---- no action   >> will not accept any change 
---- set null    >> will put FK null
---- casecade    >> will change FK like PK as father as son
---- set default >> select one of PK to make as default and any change will back to this default value

select * 
from student s
join Department d on s.Dept_Id = d.Dept_Id

update Department 
	set Dept_Id = 1
where Dept_Id = 10
-- 1 row affected (parent) but many rows changed (childs)

update Department 
	set Dept_Id = 10
where Dept_Id = 1
-- 1 row affected (parent) but many rows changed (childs)

delete from Department where Dept_Id = 800


------------ ISNULL() ------------
-- used to select all rows without filter but replace NULL >> "any text" or any other column
select isnull(St_Fname, 'anytext')
from Student

select isnull(St_Fname, St_Lname)
from Student
