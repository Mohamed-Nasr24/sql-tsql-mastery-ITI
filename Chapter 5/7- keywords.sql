

-- rollup >> sum all values after grouping
-- cube >> rollup all cols and all combinations 
-- grouping sets >> rollup for each element in each col
-- pivot >> 
-- unpivot >> 

------------ rollup ------------
-- before rollup
select SalesmanName, ft.SalesmanID, sum(Qty) as total_per_man
from [Fact Sales] ft
left join SalesmanDim sm
	on sm.SalesmanID = ft.SalesmanID
group by ft.SalesmanID, SalesmanName

union

select 'total sum', ' ', sum(qty)
from [Fact Sales]
order by 3 desc

--after rollup >> one col grouping
select isnull(SalesmanName, 'Total Sum'), sum(Qty) as total_per_man
from [Fact Sales] ft
left join SalesmanDim sm
	on sm.SalesmanID = ft.SalesmanID
group by rollup(SalesmanName)

-- rollup 2 cols grouping
---- rollup work for first grouping column and the overall total 
select p.ProductID, sm.SalesmanName, sum(Qty)
from [Fact Sales] f
left join ProductDim p
	on f.ProductID = p.ProductID
left join SalesmanDim sm
	on sm.SalesmanID = f.SalesmanID
group by rollup(p.ProductID, sm.SalesmanName)


------------ cube ------------
-- doing rollup for every col in grouping and for each combination 
select p.ProductID, sm.SalesmanName, sum(Qty)
from [Fact Sales] f
left join ProductDim p
	on f.ProductID = p.ProductID
left join SalesmanDim sm
	on sm.SalesmanID = f.SalesmanID
group by cube(p.ProductID, sm.SalesmanName)


------------ grouping sets ------------
-- showing only sums for each element in each col 
select p.ProductID, sm.SalesmanName, sum(Qty)
from [Fact Sales] f
left join ProductDim p
	on f.ProductID = p.ProductID
left join SalesmanDim sm
	on sm.SalesmanID = f.SalesmanID
group by grouping sets(p.ProductID, sm.SalesmanName)


------------ pivot ------------
-- rotate with agg
-- pivot must take alias name
select p.ProductID, SalesmanName, sum(Qty) as total_per_man into newSales
from [Fact Sales] ft
left join SalesmanDim sm
	on sm.SalesmanID = ft.SalesmanID
left join ProductDim p
	on p.ProductID = ft.ProductID
group by SalesmanName, p.ProductID


select * into stPivot
from newSales
pivot (sum(total_per_man) for salesmanName in ([Ahmed], [Omar], [Khalid])) as pvt

select * into ndPivot
from newSales
pivot (sum(total_per_man) for productID in([1], [2], [3], [4], [5])) as pvt2


------------ unpivot ------------
-- return the pivot to normal Dim
select * 
from stPivot
unpivot (QTY for salesmanName in ([Ahmed], [Omar], [Khalid])) as st_unpvt

select *
from ndPivot
unpivot (QTY for productID in ([1], [2], [3], [4], [5])) as nd_unpivot


