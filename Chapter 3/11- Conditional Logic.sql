
-- case when ==>> to make many conditions 
select 
	Ins_Name,
	case 
		when salary >= 5000 then 'high'
		when salary < 5000 then 'low'
		else 'NO DATA'
	end as crt
from Instructor


-- iif ==>> if only 2 options 
alter table Instructor add gender varchar(20);

select iif(gender='f', 'female', 'male')
from Instructor



