/*
Data Types
--------- Numeric -----------
-- bit      >> 1 bit   >> 0:1
-- tinyint  >> 1 byte  >> -128:127
-- samllint >> 2 bytes >> -32768:32767
-- int      >> 4 bytes >> -2^31:(2^31)-1
-- bigint   >> 8 bytes >> 

--------- Decimal -----------
-- samllmoney  >> 4 bytes >> .0000 + $
-- money       >> 8 bytes >> .0000
-- real        >> 4 bytes >> .0000000 (7*0)
-- float       >> 8 bytes >> .000000000000000 (15*0)
-- dec decimal >> dynamic >> dec decimal(5, 3) >> 12.345 >> 1.2 >> 1234.5 
--                        >> dec decimal(6, 5) >> 12345.6 >> 1.23456

--------- String -----------
-- char			 >> fixed length     >> char(10) > "Ahmed" > 10 bytes, char(10) > "Ali" > 10 bytes
-- varchar		 >> variable length  >> varchar(10) > "Ahmed" > 5 bytes, varchar(10) > "Ali" > 3 bytes
-- nchar		 >> unicode language >> like char but to detect any language overwise English
-- nvarchar      >> unicode language >> like varchar but to detect any language overwise English
-- nvarchar(max) >> unicode language >> up to 2 GB
-- text          >> large objects in English (default)
-- ntext         >> large objects in any language

--------- Date & Time -----------
-- Date           >> MM/DD/YYYY		               >> 08/26/2001
-- Time           >> HH:MM:SS.123                  >> 11:10:43.123
-- Time(7)        >> HH:MM:SS.1234567              >> 11:10:43.1234567
-- smalldatetime  >> MM:DD:YYYY HH:MM:SS           >> 08/26/2001 11:10:00         --year[1900:2079]
-- datetime       >> MM:DD:YYYY HH:MM:SS.123       >> 08/26/2001 11:10:43.123     --year[1753:9999]
-- datetime2(7)   >> MM:DD:YYYY HH:MM:SS.1234567   >> 08/26/2001 11:10:43.1234567 --year[1:999999]
-- datetimeoffset >> MM:DD:YYYY HH:MM:SS +timeZone >> 08/26/2001 11:10:00 +2:00
-- timestamp      >> random vlaue from current system 

--------- Binary Data -----------
-- binary >> 010101 10001 010111010
-- image  >> to convert image to binary code and store it in database 


--------- Others -----------
-- sql_variant >> to store any datatype
-- uniqueidentifier 
-- XML 
-- geography 
-- hierarchyID
*/