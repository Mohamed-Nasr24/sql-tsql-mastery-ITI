/*
from 
join on
where 
group by 
having 
select
order 
limit -- top 
*/

-- effect of order
-- 1 correct query 
select st_age as age  
from Student
order by age desc -- `order by` execute after `select`, so age is valid and seen name 

-- 2 wrong query 
select st_age as age  
from Student
where age < 25 -- error as `where` execute before `select`, then age not seen name

-- 2.1 solve problem in 2 
select *
from (select st_age as age from Student) as NewTable -- subQuery in `from` must has alias name
where age < 25


















