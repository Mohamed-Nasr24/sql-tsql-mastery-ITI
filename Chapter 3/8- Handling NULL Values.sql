select * from Student


---------- ISNULL ----------
-- to replace NULL with another value  
select ISNULL(St_Fname, St_Lname)
from Student

select ISNULL(St_Fname, 'NO NAME')
from Student

---------- coalesce ----------
-- replace NULL with many values + choose fist NON NULL value
select coalesce(St_Fname, st_lname, 'NO NAME')
from Student

-- Dynamic SQL
declare @colName1 nvarchar(20) = col_name(object_id('student'), 2);
declare @colName2 nvarchar(20) = col_name(object_id('student'), 3);

declare @exec nvarchar(max) = 'select coalesce(' + @colName1 + ',' + @colName2 + ', ''NO DATA'') from student';
exec sp_executesql @exec


---------- NULLIF ----------
-- retrun NULL if they are equal
-- return the first expression (expression1) if they are not equal
select isnull(NULLIF(St_Fname, st_lname), '')
from Student



