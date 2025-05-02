-------------- Security --------------
-- authentication (Login_name + Password)
---- windows authentication (locally with OS user+password)
-------->> windows admin >> sql admin

----SQLServer authentication 
-------- admin create new logins (login_name + passwords) for other developer in project
-------- steps 
-------- 1. turn on SQLServer authentication mode 
-------- 2. restart SQLServer from services
-------- 3. create new login >> security folser of the server
-------- 4. adding new user in any database want the developer to see 
-- till now the new user can access the server and see the database BUT cant see tables or do any thing 

-- authorization (Permissions)
---- given from admin to new user to see tables and edit query or access any action 
---- SchemaName.ObjectName -->> dbo.student "DataBaseOwner" by default 
-------- schemas are created to:
---------- 1. give same name for many objects but each is unique in his schema 
---------- 2. grouping objects "logically" -->> each schema has many objects 
---------- 3. enhanced permissions management -->> giving many objects `grant` or `deny` by schema name 

-- creating new schema 
create schema HR

-- transfering table from default schema `dbo` to `HR` schema
alter schema HR transfer student
alter schema HR transfer instructor

-- creating new schema 
create schema academic

-- transfering many tables from default schema `dbo` to `HR` schema by many approach 
declare @script nvarchar(max)= '';

select @script = @script + 'alter schema academic transfer ' + name + ';' + CHAR(10)
from sys.tables
where name in ('Course', 'Department')

EXEC sp_executesql @script

-- must write HR.ObjectName as only `student` >> `dbo.student` by default
select * from HR.student
