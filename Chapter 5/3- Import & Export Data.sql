
select * from young_stud

-- importing data from another extention (txt/xslx/pbix)
bulk insert young_stud
from 'E:\Career\Data Analysis ITI\Chapter 5\newData.txt'
with (fieldterminator = ',')

select count(*), count(distinct(st_id))
from young_stud
