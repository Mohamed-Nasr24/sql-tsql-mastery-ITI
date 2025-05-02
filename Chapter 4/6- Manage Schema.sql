
------------ create shortcut in sql ------------
-- instead of using full schema and name 
select * from academic.department 

-- using synonym
create synonym dpt
for academic.Department 

select * from dpt

drop synonym dpt 

create synonym dpt 
for hr.student 

select * from dpt

------------ logins with query ------------
create login FZ2 with password = '123'

create user FZ2 for login FZ2 -- ==>> role public by default 

grant select on hr.student to FZ2

