---------- Set Operators ----------
---- union all ---- union ---- intersect ---- except
-- COLs names taken from first select 
-- Equal number of COLs
-- Compatible Col type
-- (union - intersect -- except) default distinct and order result set 




---------- union all ----------
---- merging all result set in same column
select St_Fname as all_names
from Student
union all -->> to merge all data "faster" -- no operations 
select Ins_Name
from Instructor

---------- union ----------
---- merging results with (unique + order)
select St_Fname as all_names
from Student
union -->> to merge unique data + order "slower"
select Ins_Name
from Instructor

---- union of many cols >> unique on combination
select St_Fname as all_names, Dept_Id
from Student
union  -- merge unique combinations & order 
select Ins_Name, Dept_Id
from Instructor


---- NO. of col must be same 
select St_Fname as all_names, Dept_Id
from Student
union all  -- merge all data 
select Ins_Name, Dept_Id
from Instructor

---- merged cols must be same data type (number(all types) == number, date == date, str == str)
select St_Fname as all_names, Dept_Id -- int
from Student
union all
select Ins_Name, Salary -- float 
from Instructor
union all
select st_fname, st_age
from Student




---------- intersect ----------
---- to get repeated result set
select St_Fname as all_names
from Student
intersect -->> repeated unique result 
select Ins_Name
from Instructor

---- intersect on the combination
select St_Fname as all_names, St_Id
from Student
intersect -->> repeated unique result 
select Ins_Name, Ins_Id
from Instructor


---------- except ----------
---- get data in firts table and not in second 
select St_Fname
from Student
except -->> names in Student but not in Instructor 
select Ins_Name
from Instructor

select St_Id
from Student
except -->> IDs in Student but not in Instructor 
select Ins_Id
from Instructor


---- except on the combination
select St_Fname as all_names, St_Id
from Student
except -->> combination in Student but not on Instructor 
select Ins_Name, Ins_Id
from Instructor





