---------------------------------  DDL ---------------------------------
-- create database -- create table -- alter table -- alter column -- drop -- 

--1 create database with query 
create database query_DataBase
on (
	name='Query_DB_master',
	filename = 'E:\Career\Data Analysis ITI\Query DB\Query_DB_master.mdf'
)
log on 
(
	name='Query_DB_log',
	filename = 'E:\Career\Data Analysis ITI\Query DB\Query_DB_log.ldf'
)

--2 drop database
-- drop database query_DataBase

--3 create a backup file for database 
backup database query_DataBase
to disk = 'E:\Career\Data Analysis ITI\Query DB\query_DataBase.bak' 

--4 restore data from backup file 
restore database query_DataBase
from disk = 'E:\Career\Data Analysis ITI\Query DB\query_DataBase.bak'

--5 create tables 
create table employee
(
	emp_ID int primary key,
	emp_name varchar(50) not null,
	salary int default 10000, 
	age int,
	emp_address varchar(50) default 'cairo',
	dept_num int foreign key references dept(dept_ID),
	hiredate date default getdate()
)

create table dept
(
	dept_ID int primary key,
	dept_name varchar(20)
)

--6 dropping tables 
-- drop table employee 

--7 adding new columns for existing tables 
alter table employee 
add overtime float

--8 edit column data type 
alter table employee alter column overtime int

--9 dropping column 
alter table employee drop column overtime 



---------------------------------  DML ---------------------------------
-- insert -- update -- delete 

--1 inserting data to tables 
insert into employee
values (1,'Ali', 2000, 24, 'Alex', NULL, '1/1/2014'), 
	(2,'Omar', 3000, 34, 'Qena', NULL, '6/3/2019'),
	(3,'Ahmed', 4000, 44, NULL, NULL, NULL)

-- inserting some of data and rest will be dafault or null
insert into employee(emp_ID, emp_name)
values (5, 'Karim')

--2 updating data in tables 
update employee 
set emp_address = 'Giza', 
	hiredate = '3/5/2022'
where emp_ID = 3


--3 delete from table
delete from employee
where emp_ID = 5

select * from employee
