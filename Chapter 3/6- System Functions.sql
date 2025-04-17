-- Built-in Functions 
---- path: 'DataBase_Name' >> 'Progammability' folder >> 'System Functions' Folder

---------- to get currrent daatbase name ----------
select DB_NAME()

---------- to get user name -- to track who >> 'SQL login' ----------
select SUSER_NAME() as ServerLoginName
-- to get User ID
select SUSER_ID()

---------- to get machine name -- to track where >> 'Client Machine' ----------
select HOST_NAME() as ClientMachineName
-- to get Machine ID
select HOST_ID()

SELECT 
    SUSER_NAME() AS WhoAmI,
    HOST_NAME() AS WhichMachine;

---------- to get any object ID >> (user table `U`, view `V`, stored procedur `P`, trigger `TR`, scalar function `FN`) ----------
-- any object ID
select OBJECT_ID('Student', 'U')

-- object type 
select 
	name as 'Object_Name', 
	type_desc as 'object_Type'
from sys.objects
where OBJECT_ID = OBJECT_ID('dbo.Staff')

-- check if not exist to create 
if OBJECT_ID('dbo.temp_table') is null
	create table temp_table (
	id int not null, 
	st_name varchar(50)
	)

-- check if exist to drop 
if OBJECT_ID('dbo.temp_table') is not null
	drop table temp_table

-- dynamic validation
declare @temp_var varchar(20) = 'dbo.student';
if OBJECT_ID(@temp_var) is not null
	exec('select * from ' + @temp_var);
else 
	print('object not exist');


---------- COL_ NAME ----------
select COL_NAME(OBJECT_ID('dbo.student', 'U'), 1) as 'first col name'
select COL_NAME(OBJECT_ID('dbo.student', 'U'), 3) as 'third col name'


---------- Identity ----------
-- last value of the identity 
select IDENT_CURRENT('staff')

-- null if no exist identity 
select IDENT_CURRENT('student')

