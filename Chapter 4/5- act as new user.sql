
select SUSER_NAME(), SUSER_ID()

-- can select 
select * from HR.student

-- can insert 
insert into HR.student values (23, 'saad', 'amr', 'Cairo', 33, 30, 9)

-- can't delete or update 
update HR.student 
set st_fname = 'said' 
where st_id = 23

delete from HR.student 
where st_id = 23
