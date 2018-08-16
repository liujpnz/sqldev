with data as
(
select replace(left(i.ParentRefFullName,charindex(':',ParentRefFullName)),':','') as Category,  
cast(datepart(DAY,getdate())-datepart(DAY,s.txndate) as varchar(5)) + 'd' as range,
  sum(round(SalesOrderLineAmount,0)) as TotalSales
From salesorderline o , ItemInventory i, Salesorder s
where s.id=o.SalesorderID and o.SalesOrderLineItemRefFullName=i.name and o.SalesOrderLineItemRefFullName not in ('Freight',' ') and Category is not null
and txndate = format(getdate(),'yyyy-MM-dd')
group by replace(left(i.ParentRefFullName,charindex(':',ParentRefFullName)),':',''),datepart(DAY,s.txndate)
union
select replace(left(i.ParentRefFullName,charindex(':',ParentRefFullName)),':','') as Category,  
cast(datediff(w,txndate, GETDATE()) as varchar(5)) + 'w' as range,
  sum(round(SalesOrderLineAmount,0)) as TotalSales
From salesorderline o , ItemInventory i, Salesorder s
where s.id=o.SalesorderID and o.SalesOrderLineItemRefFullName=i.name and o.SalesOrderLineItemRefFullName not in ('Freight',' ') and Category is not null
and  txndate >  CONVERT(DATE,DATEADD(w,DATEDIFF(w, 0, GETDATE())-6,0))
group by replace(left(i.ParentRefFullName,charindex(':',ParentRefFullName)),':',''),cast(datediff(w,txndate, GETDATE()) as varchar(5))
union
select replace(left(i.ParentRefFullName,charindex(':',ParentRefFullName)),':','') as Category, 
cast(datediff(m,txndate, GETDATE()) as varchar(5)) + 'm' as range,
  sum(round(SalesOrderLineAmount,0)) as TotalSales
From salesorderline o , ItemInventory i, Salesorder s
where s.id=o.SalesorderID and o.SalesOrderLineItemRefFullName=i.name and o.SalesOrderLineItemRefFullName not in ('Freight',' ') and Category is not null
and txndate >  CONVERT(DATE,DATEADD(m,DATEDIFF(m, 0, GETDATE())-6,0))
group by replace(left(i.ParentRefFullName,charindex(':',ParentRefFullName)),':',''),cast(datediff(m,txndate, GETDATE()) as varchar(5))
)
select Category, isnull([0d],0) as [Today],isnull([0w],0) as [This Week],isnull([1w],0) as [Last 1 Week],isnull([2w],0) as [Last 2 Week],isnull([3w],0) as [Last 3 Week],isnull([4w],0) as [Last 4 Week],isnull([5w],0) as [Last 5 Week],isnull([0m],0) as [This Month],isnull([1m],0) as [Last 1 Month],isnull([2m],0) as [Last 2 Month],isnull([3m],0) as [Last 3 Month],isnull([4m],0) as [Last 4 Month],isnull([5m],0) as [Last 5 Month]
from data
pivot (sum(TotalSales) for [range] in ([0d],[0w],[1w],[2w],[3w],[4w],[5w],[0m],[1m],[2m],[3m],[4m],[5m])) as Total
order by [Last 1 Month] desc