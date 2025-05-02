create table lasttracnactions(
	Lid int primary key,
	Lname varchar(20),
	Lvalue int
)

create table dailytracnactions(
	Did int primary key,
	Dname varchar(20),
	Dvalue int
)

insert into lasttracnactions values(1, 'ahmed', 3000),
									(2, 'ali', 4000),
									(3, 'mona', 5000),
									(4, 'manar', 6000)

insert into dailytracnactions values(1, 'ahmed', 1500),
									(2, 'manar', 4000), 
									(7, 'nada', 8000)


-- merge >> used to make DML Queries between source(table/subquery) and target(table)
merge into lasttracnactions as T -- T >> target
using dailytracnactions as S -- S >> source
on T.Lid = S.Did

when matched then 
	update 
		set T.Lvalue = S.Dvalue
/*
-- adding condition 
when matched and S.Dvalue > T.Lvalue then
	update
		set T.Lvalue = S.Dvalue
*/

when not matched by target then 
	insert
		values(S.Did, S.Dname, S.Dvalue)

when not matched by source then
	delete
	
output $action;

select * from lasttracnactions
select * from dailytracnactions

drop table dailytracnactions, lasttracnactions

