-- date of this moment 
select GETDATE()

---------- exctract year from date ----------
select YEAR(GETDATE())
-- exctract month from date 
select month(GETDATE())
-- exctract day from date 
select day(GETDATE())


---------- to get month as string name ----------
select DATENAME(MONTH, GETDATE())
-- to get month as number 
select DATEPART(MONTH, GETDATE())

---------- DATEDIFF ----------
select Dept_Name, year(getdate()) - year(Manager_hiredate) as 'years of managers'
from Department

select Dept_Name, DATEDIFF(YEAR, Manager_hiredate, GETDATE()) as 'years of managers'
from Department

select Dept_Name, DATEDIFF(DAY, Manager_hiredate, GETDATE()) as 'Days of managers'
from Department


---------- Date Format ----------
-- return values as date format 
select DATEFROMPARTS(2001, 8, 26)

---------- isDate ----------
-- return 0/1
select ISDATE('Nasr') -- not date 
select ISDATE('2001-18-26') -- not valid date 
select ISDATE('2001-8-26') -- valid date 

---------- DateADD ----------
-- to add (days/months/years)
select DATEADD(DAY, 7, GETDATE())
select DATEADD(DAY, 80, '2001-6-7')


---------- convert ----------
select CONVERT(varchar(50), GETDATE()) -- Apr 12 2025  4:55PM
select CONVERT(varchar(50), GETDATE(), 101) -- 04/12/2025 >> MM/DD/YYYY
select CONVERT(varchar(50), GETDATE(), 102) -- 2025.04.12 >> YYYY.MM.YY
select CONVERT(varchar(50), GETDATE(), 103) -- 12/04/2025 >> DD/MM/YYYY
select CONVERT(varchar(50), GETDATE(), 104) -- 12.04.2025 >> DD.MM.YYYY
select CONVERT(varchar(50), GETDATE(), 105) -- 12-04-2025 >> DD-MM-YYYY


---------- format ----------
-- to control date format as you want
select FORMAT(GETDATE(), 'dd-mm-yyyy')
select FORMAT(GETDATE(), 'dddd mmmm yyyy')
select FORMAT(GETDATE(), 'ddd mmm yyyy')
select FORMAT(GETDATE(), 'dd/mm/yyyy')
select FORMAT(GETDATE(), 'hh:mm:ss tt')


---------- cast ----------
select CAST(GETDATE() as varchar(50))


---------- EndOfMonth ----------
-- return last day of current month 
select EOMONTH(GETDATE()) -- last day date in current month 
select format(EOMONTH(GETDATE()), 'dd') -- last day in numbers 
select format(EOMONTH(GETDATE()), 'dddd') -- last day in string 
select EOMONTH(GETDATE(), 8) -- last day in month 8 in current year
select EOMONTH(GETDATE(), -2) -- last in previous 2 months before 





