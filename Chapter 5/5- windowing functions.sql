------------ Windowing Functions ------------
-- lead >> to show the next value 
-- lag >> to show the previous value 
-- first value >> to show first value in the order 
-- last value >> to show last value in the order 
-- precent rank >> calc the precent between current val and previous val


select st.st_id, st.st_fname, st.st_lname, c.Grade, cname.crs_name into grades 
from Stud_Course c
left join hr.student st
	on c.St_Id = st.st_id
left join academic.course cname
	on cname.crs_id = c.Crs_Id

select * 
from grades 

select st_fname, st_lname, grade,
	_prev = lag(st_fname) over(order by grade desc),
	_next = lead(st_fname) over(order by grade desc)
from grades 

-- divide table into patitions then grouping each patition 
select st_fname, st_lname, grade, crs_name,
	_prev = lag(st_fname) over(partition by crs_name order by grade desc),
	_next = lead(st_fname) over(partition by crs_name order by grade desc)
from grades 

-- first and last overall 
select st_fname, st_lname, grade,
	st_val = FIRST_VALUE(Grade) over(order by grade desc),
	last_val = last_value(grade) 
				over(order by grade desc rows between unbounded preceding and unbounded following) -- to take last of all rows
from grades 


-- first and last in each partition 
select st_fname, st_lname, crs_name, grade,
	st_val = FIRST_VALUE(grade) over(partition by crs_name order by grade desc),
	last_val = last_VALUE(grade) 
		over(partition by crs_name order by grade desc rows between unbounded preceding and unbounded following)
from grades 

/*
be like min and max in numbers
                 ||      ||
		         ||      ||
                \  /    \  /

*/
select st_fname, st_lname, crs_name, grade,
	min(grade) over(partition by crs_name order by grade desc rows between unbounded preceding and unbounded following),
	max(grade) over(partition by crs_name order by grade desc rows between unbounded preceding and unbounded following)
from grades 

-- useful to read data and understand it
select st_fname, grade, crs_name,
		_PREV = LAG(ST_FNAME) over(partition by crs_name order by grade),
		_NEXT =	lead(st_fname) over(partition by crs_name order by grade),
		st_val = FIRST_VALUE(grade) over(partition by crs_name order by grade),
		last_val = LAST_VALUE(grade) over(partition by crs_name order by grade rows between unbounded preceding and unbounded following),
		_perc_rank = cast(PERCENT_RANK() over(partition by crs_name order by grade) as decimal (11, 2))
from grades 




