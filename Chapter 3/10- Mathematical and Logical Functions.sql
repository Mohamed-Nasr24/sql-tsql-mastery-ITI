-->> DB_name >> programmability >> functions >> system functions >> math functions 

-- sin - cos - tan
select sin(30)


-- approxmation 
select floor(123.49)
select CEILING(123.49)
select round(123.4999999, 2)

-- root
select SQRT(25)

-- square 
select SQUARE(4)

-- power 
select power(8, 2)

-- randomization [0:1]
select RAND()

-------------- logical functions --------------
-- return 0/1 
select ISDATE('8/26/2001') -- mm/dd/yyyy

select ISNUMERIC('F35') -- false

select ISNUMERIC('35') -- true

-- to choose element from array by it's index
select choose(4, 'Ahmed','Amr','Mona','Khalid','Heba','Ali','Mohamed','Saly','Fady','Marwa','Noha','Said','Faris','Khalid','Marwa')
