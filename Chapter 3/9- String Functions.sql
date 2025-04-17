
select * from Student

---------- concat ----------
-- NULL + anything ==>> NULL 
select ISNULL(St_Fname, '') + ' ' + ISNULL(convert(varchar(20), St_Age), 0)
from Student

-- concat do all above
select concat(St_Fname, ' ', St_Age)
from Student

---------- concat_ws ----------
-- concat with separator
select CONCAT('ali', 'omar', 'mona', 'ahmed')

select CONCAT_WS('-', 'ali', 'omar', 'mona', 'ahmed')


---------- qoutename ----------
-- to put special quote around ant item
select QUOTENAME(St_Fname, '(')
from Student

select QUOTENAME(St_Fname, '"')
from Student

select CONCAT_WS('-', 'ali', QUOTENAME('omar', '['), 'mona', 'ahmed')

---------- upper + lower ----------
select concat(upper(St_Fname), ' ', lower(st_lname))
from Student

---------- LEN ----------
select len(St_Fname)
from Student

---------- substring ----------
-- substring(string, start_index, end_index)
select substring(St_Fname, 1, 3)
from Student

select substring(St_Fname, 1, len(st_fname) - 1)
from Student

---------- left + right ----------
select RIGHT(St_Fname, 3)
from Student

select LEFT(St_Fname, 3)
from Student

---------- charindex ----------
-- to find index of any (char, substring)
select CHARINDEX('m', St_Lname)
from Student


---------- patindex ----------
-- to find index of pattern 
select PATINDEX('%n%', St_Lname), St_Lname
from Student

select PATINDEX('a%', St_Fname), St_Fname
from Student


---------- replace ----------
declare @mail varchar(20) = 'nasr-gmail.com';
declare @ind int = charindex('gmail', @mail)
select replace(@mail, substring(@mail, @ind - 1, 1), '@')


---------- stuff ----------
-- to replace chars with index 
-- stuff (exp, start_index, end_index, replace_with)
select lower(STUFF(concat(St_Fname, St_Lname), 6, len(concat(st_fname, st_lname)), ''))
from Student


---------- trim ----------
declare @name varchar(20) = '    Nasr    '

-- remove all spaces around the text
select TRIM(@name)

-- remove right spaces only
select RTRIM(@name)

-- remove left spaces only
select LTRIM(@name)


---------- reverse ----------
-- reversing data (text/float/numbers)
select REVERSE(St_Fname), REVERSE(cast(St_Age as varchar(30))), REVERSE(St_Age), reverse(123.456)
from Student


---------- replicate ----------
-- to repeat data
select REPLICATE(St_Fname, 3)
from Student


-------------- String Manipulation --------------
select St_Fname from Student

-- string_agg ==>> as agg functions not considering NULLS
-- from array to string 
select STRING_AGG(St_Fname, ', ')
from Student


-- string_split
-- from string to array 
select * from string_split('Ahmed, Amr, Mona, Ahmed, Khalid, Heba, Ali, Mohamed, 
							Saly, Fady, Marwa, Noha, Said, Faris , Khalid, Marwa', ',')

create table my_data
(
id int primary key,
st_name varchar(20),
skills varchar(50)
)

select * from my_data

-- cross apply ==>> to join between tables and (string to table function)
select id, st_name, value
from my_data cross apply string_split(skills, ',')




