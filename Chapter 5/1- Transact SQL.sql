
select DB_NAME()

-- top 
select top 2 * 
from HR.instructor
order by salary desc


-- top with ties
---- select all rows with same value of last in top
---- always come with order by to make all same values in group 
select top 3 with ties *
from hr.instructor 
order by salary desc



-- newid()
---- giving every row in table random unique id in the whole server 
select *, newid()
from hr.student

-- used to make random choices 
select top 10 *
from hr.student 
order by newid()

-- generating unique identifier by default 
create table users (
	id uniqueidentifier primary key default newid(),
	username varchar(20),
	_password varchar(50)
)

insert into users(username, _password) values ('amr', '1234')

select * from users 



-- FullPath
-- serverName.DBname.SchemaName.ObjectName
-- NASR-PC24.ITI.dbo.users
-- with full path we can reach to any object from any where 
-- we now on iti db

select st_id, st_fname, st_lname
from hr.Student
union all
select ssn, Fname, Lname
from Company_SD.dbo.Employee







