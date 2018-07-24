
--1. Sales by Rep
create view kpi.SalesbyRep as
with data as
(
select SalesRepRefFullName, cast(datepart(DAY,getdate())-datepart(DAY,txndate) as varchar(5)) + 'd' as range,sum(round(TotalAmount,0)) TotalSales from Salesorder
where txndate > format(DATEADD(day, -4, getdate()),'yyyy-MM-dd') 
group by SalesRepRefFullName,datepart(day,txndate)
union
select SalesRepRefFullName, cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w' as range,sum(round(TotalAmount,0)) TotalSales from Salesorder
where datepart(week,txndate) > datepart(week,getdate())-6  
group by SalesRepRefFullName,datepart(week,txndate)
union
select SalesRepRefFullName, cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm' as range,sum(round(TotalAmount,0)) TotalSales from Salesorder
where datepart(month,txndate) > datepart(month,getdate())-6 
group by SalesRepRefFullName,datepart(month,txndate)
)
select SalesRepRefFullName as RepName, isnull([0d],0) as [Today],isnull([1d],0) as [L1D],isnull([2d],0) as [L2D],isnull([3d],0) as [L3D],isnull([0w],0) as [WTD],isnull([1w],0) as [L1W],isnull([2w],0) as [L2W],isnull([3w],0) as [L3W],isnull([4w],0) as [L4W],isnull([5w],0) as [L5W],isnull([0m],0) as [MTD],isnull([1m],0) as [L1M],isnull([2m],0) as [L2M],isnull([3m],0) as [L3M],isnull([4m],0) as [L4M],isnull([5m],0) as [L5M]
from data
pivot (sum(TotalSales) for [range] in ([0d],[1d],[2d],[3d],[0w],[1w],[2w],[3w],[4w],[5w],[0m],[1m],[2m],[3m],[4m],[5m])) as Total
where SalesRepRefFullName not in (' ', 'Tarun', 'Manan', 'Steve', 'Aarti', 'Colin', 'Joshi', 'Dan', 'Cryst', 'shaw', 'Cyan', 'Reia', 'ZWEB_TEST', 'Casey', 'Lewis', 'Swati', 'Andrius', 'Rawan', 'Alan', 'Piri', 'Raj', 'Albert') 


--2 Sales by Category
create view kpi.SalesbyCategory as
with data as
(
select replace(left(i.ParentRefFullName,charindex(':',ParentRefFullName)),':','') as Category,  
cast(datepart(DAY,getdate())-datepart(DAY,s.txndate) as varchar(5)) + 'd' as range,
  sum(round(SalesOrderLineAmount,0)) as TotalSales
From salesorderline o , ItemInventory i, Salesorder s
where s.id=o.SalesorderID and o.SalesOrderLineItemRefFullName=i.name and o.SalesOrderLineItemRefFullName not in ('Freight',' ') and Category is not null
	and txndate > format(DATEADD(day, -4, getdate()),'yyyy-MM-dd') 
group by replace(left(i.ParentRefFullName,charindex(':',ParentRefFullName)),':',''),datepart(DAY,s.txndate)
union
select replace(left(i.ParentRefFullName,charindex(':',ParentRefFullName)),':','') as Category,  
cast(datepart(week,getdate())-datepart(week,s.txndate) as varchar(5)) + 'w' as range,
  sum(round(SalesOrderLineAmount,0)) as TotalSales
From salesorderline o , ItemInventory i, Salesorder s
where s.id=o.SalesorderID and o.SalesOrderLineItemRefFullName=i.name and o.SalesOrderLineItemRefFullName not in ('Freight',' ') and Category is not null
	and datepart(week,txndate) > datepart(week,getdate())-6
group by replace(left(i.ParentRefFullName,charindex(':',ParentRefFullName)),':',''),datepart(week,s.txndate)
union
select replace(left(i.ParentRefFullName,charindex(':',ParentRefFullName)),':','') as Category, 
cast(datepart(month,getdate())-datepart(month,s.txndate) as varchar(5)) + 'm' as range,
  sum(round(SalesOrderLineAmount,0)) as TotalSales
From salesorderline o , ItemInventory i, Salesorder s
where s.id=o.SalesorderID and o.SalesOrderLineItemRefFullName=i.name and o.SalesOrderLineItemRefFullName not in ('Freight',' ') and Category is not null
	and datepart(month,txndate) > datepart(month,getdate())-6
group by replace(left(i.ParentRefFullName,charindex(':',ParentRefFullName)),':',''),datepart(month,s.txndate)
)
select Category, isnull([0d],0) as [Today],isnull([1d],0) as [L1D],isnull([2d],0) as [L2D],isnull([3d],0) as [L3D],isnull([0w],0) as [WTD],isnull([1w],0) as [L1W],isnull([2w],0) as [L2W],isnull([3w],0) as [L3W],isnull([4w],0) as [L4W],isnull([5w],0) as [L5W],isnull([0m],0) as [MTD],isnull([1m],0) as [L1M],isnull([2m],0) as [L2M],isnull([3m],0) as [L3M],isnull([4m],0) as [L4M],isnull([5m],0) as [L5M]
from data
pivot (sum(TotalSales) for [range] in ([0d],[1d],[2d],[3d],[0w],[1w],[2w],[3w],[4w],[5w],[0m],[1m],[2m],[3m],[4m],[5m])) as Total


--2.1 Sales by Sub Category
create view kpi.SalesbySubCategory as
with data as
(
select replace(left(i.ParentRefFullName,charindex(':',ParentRefFullName)),':','') as Category, substring(ParentRefFullName,CHARINDEX(':',ParentRefFullName)+1,len(ParentRefFullName))  as SubCategory, 
cast(datepart(DAY,getdate())-datepart(DAY,s.txndate) as varchar(5)) + 'd' as range,
  sum(round(SalesOrderLineAmount,0)) as TotalSales
From salesorderline o , ItemInventory i, Salesorder s
where s.id=o.SalesorderID and o.SalesOrderLineItemRefFullName=i.name and o.SalesOrderLineItemRefFullName not in ('Freight',' ') and Category is not null
	and  txndate > format(DATEADD(day, -13, getdate()),'yyyy-MM-dd') 
group by replace(left(i.ParentRefFullName,charindex(':',ParentRefFullName)),':',''),substring(ParentRefFullName,CHARINDEX(':',ParentRefFullName)+1,len(ParentRefFullName)),datepart(DAY,s.txndate)
union
select replace(left(i.ParentRefFullName,charindex(':',ParentRefFullName)),':','') as Category, substring(ParentRefFullName,CHARINDEX(':',ParentRefFullName)+1,len(ParentRefFullName))  as SubCategory, 
cast(datepart(week,getdate())-datepart(week,s.txndate) as varchar(5)) + 'w' as range,
  sum(round(SalesOrderLineAmount,0)) as TotalSales
From salesorderline o , ItemInventory i, Salesorder s
where s.id=o.SalesorderID and o.SalesOrderLineItemRefFullName=i.name and o.SalesOrderLineItemRefFullName not in ('Freight',' ') and Category is not null
	and datepart(week,txndate) > datepart(week,getdate())-13
group by replace(left(i.ParentRefFullName,charindex(':',ParentRefFullName)),':',''),substring(ParentRefFullName,CHARINDEX(':',ParentRefFullName)+1,len(ParentRefFullName)),datepart(week,s.txndate)
union
select replace(left(i.ParentRefFullName,charindex(':',ParentRefFullName)),':','') as Category, substring(ParentRefFullName,CHARINDEX(':',ParentRefFullName)+1,len(ParentRefFullName))  as SubCategory, 
cast(datepart(month,getdate())-datepart(month,s.txndate) as varchar(5)) + 'm' as range,
  sum(round(SalesOrderLineAmount,0)) as TotalSales
From salesorderline o , ItemInventory i, Salesorder s
where s.id=o.SalesorderID and o.SalesOrderLineItemRefFullName=i.name and o.SalesOrderLineItemRefFullName not in ('Freight',' ') and Category is not null
	and datepart(month,txndate) > datepart(month,getdate())-13
group by replace(left(i.ParentRefFullName,charindex(':',ParentRefFullName)),':',''),substring(ParentRefFullName,CHARINDEX(':',ParentRefFullName)+1,len(ParentRefFullName)),datepart(month,s.txndate)
)
select Category,SubCategory, isnull([0d],0) as [Today],isnull([1d],0) as [L1D],isnull([2d],0) as [L2D],isnull([3d],0) as [L3D],isnull([4d],0) as [L4D],isnull([5d],0) as [L5D],isnull([6d],0) as [L6D],isnull([7d],0) as [L7D],isnull([8d],0) as [L8D],isnull([9d],0) as [L9D],isnull([10d],0) as [L10D],isnull([11d],0) as [L11D],isnull([12d],0) as [L12D],
isnull([0w],0) as [WTD],isnull([1w],0) as [L1W],isnull([2w],0) as [L2W],isnull([3w],0) as [L3W],isnull([4w],0) as [L4W],isnull([5w],0) as [L5W],isnull([6w],0) as [L6W],isnull([7w],0) as [L7W],isnull([8w],0) as [L8W],isnull([9w],0) as [L9W],isnull([10w],0) as [L10W],isnull([11w],0) as [L11W],isnull([12w],0) as [L12W],
isnull([0m],0) as [MTD],isnull([1m],0) as [L1M],isnull([2m],0) as [L2M],isnull([3m],0) as [L3M],isnull([4m],0) as [L4M],isnull([5m],0) as [L5M],isnull([6m],0) as [L6M],isnull([7m],0) as [L7M],isnull([8m],0) as [L8M],isnull([9m],0) as [L9M],isnull([10m],0) as [L10M],isnull([11m],0) as [L11M],isnull([12m],0) as [L12M]
from data
pivot (sum(TotalSales) for [range] in ([0d],[1d],[2d],[3d],[4d],[5d],[6d],[7d],[8d],[9d],[10d],[11d],[12d],[0w],[1w],[2w],[3w],[4w],[5w],[6w],[7w],[8w],[9w],[10w],[11w],[12w],[0m],[1m],[2m],[3m],[4m],[5m],[6m],[7m],[8m],[9m],[10m],[11m],[12m])) as Total


--3. Sales by Customer
create view kpi.SalesbyCustomer as
with data as
(
select salesrep as staff,cast(datepart(day,getdate())-datepart(day,createdtime) as varchar(5)) + 'd' as range,count(distinct(phoneto)) TotalCalls 
from phone 
where createdtime > format(DATEADD(day, -4, getdate()),'yyyy-MM-dd') and salesrep is not null  --last 3 day
group by salesrep,datepart(day,createdtime)
union 
select salesrep as staff,cast(datepart(week,getdate())-datepart(week,createdtime) as varchar(5)) + 'w' as range,count(distinct(phoneto)) TotalCalls 
from phone 
where datepart(week,createdtime) = datepart(week,getdate()) and salesrep is not null --this week
group by salesrep,datepart(week,createdtime)
union
select salesrep as staff,cast(datepart(month,getdate())-datepart(month,createdtime) as varchar(5)) + 'm' as range,count(distinct(phoneto)) TotalCalls 
from phone 
where datepart(month,createdtime) = datepart(month,getdate()) and salesrep is not null --this month
group by salesrep,datepart(month,createdtime)
union 
select salesrep as staff,cast(datepart(week,getdate())-datepart(week,createdtime) as varchar(5)) + 'w' as range,count(distinct(phoneto)) TotalCalls 
from phone 
where datepart(week,createdtime) = datepart(week,getdate())-1 and salesrep is not null --last week
group by salesrep,datepart(week,createdtime)
union
select salesrep as staff,cast(datepart(month,getdate())-datepart(month,createdtime) as varchar(5)) + 'm' as range,count(distinct(phoneto)) TotalCalls 
from phone 
where datepart(month,createdtime) = datepart(month,getdate())-1 and salesrep is not null --last month
group by salesrep,datepart(month,createdtime)
union
select SalesRepRefFullName, cast(datepart(DAY,getdate())-datepart(DAY,txndate) as varchar(5)) + 'd_s' as range,sum(round(TotalAmount,0)) TotalSales from Salesorder
where txndate = format(getdate(),'yyyy-MM-dd') and  SalesRepRefFullName <>' ' --sales today
group by SalesRepRefFullName,datepart(DAY,txndate)
union
select SalesRepRefFullName, cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w_s' as range,sum(round(TotalAmount,0)) TotalSales from Salesorder
where datepart(week,txndate) = datepart(week,getdate()) and  SalesRepRefFullName <>' ' --sales this week
group by SalesRepRefFullName,datepart(week,txndate)
union
select SalesRepRefFullName, cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm_s' as range,sum(round(TotalAmount,0)) TotalSales from Salesorder
where datepart(month,txndate) = datepart(month,getdate()) and  SalesRepRefFullName <>' ' and TotalAmount is not NULL  --sales this month
group by SalesRepRefFullName,datepart(month,txndate)
)
select staff, isnull([0d],0) as [C_Today],isnull([1d],0) as [C_L1D],isnull([2d],0) as [C_L2D],isnull([3d],0) as [C_L3D],isnull([0w],0) as [C_WTD],isnull([1w],0) as [C_L1W],isnull([0m],0) as [C_MTD],isnull([1m],0) as [C_L1M], isnull([0d_s],0) as [S_Today],isnull([0w_s],0) as [S_WTD],isnull([0m_s],0) as [S_MTD] 
from data
pivot (sum(TotalCalls) for [range] in ([0d],[1d],[2d],[3d],[0w],[1w],[0m],[1m],[0d_s],[0w_s],[0m_s])) as Total




--4. Sales by Warehouse Staff
create view kpi.SalesbyWarehouseStaff as
with data as
(
select picker as staff,cast(datepart(day,getdate())-datepart(day,txndate) as varchar(5)) + 'd_pi' as range,count(distinct SalesorderRefNumber) TotalOrders from invoice 
where txndate = format(getdate(),'yyyy-MM-dd') and picker is not null
group by picker,datepart(day,txndate)
union 
select picker as staff,cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w_pi' as range,count(distinct SalesorderRefNumber) TotalOrders from invoice 
where datepart(week,txndate) = datepart(week,getdate()) and picker is not null
group by picker,datepart(week,txndate)
union
select picker as staff,cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm_pi' as range,count(distinct SalesorderRefNumber) TotalOrders from invoice 
where datepart(month,txndate) = datepart(month,getdate()) and picker is not null
group by picker,datepart(month,txndate)
union
--packer
select packer as staff,cast(datepart(day,getdate())-datepart(day,txndate) as varchar(5)) + 'd_pa' as range,count(distinct SalesorderRefNumber) TotalOrders from invoice 
where txndate = format(getdate(),'yyyy-MM-dd') and packer is not null
group by packer,datepart(day,txndate)
union 
select packer as staff,cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w_pa' as range,count(distinct SalesorderRefNumber) TotalOrders from invoice 
where datepart(week,txndate) = datepart(week,getdate()) and packer is not null
group by packer,datepart(week,txndate)
union
select packer as staff,cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm_pa' as range,count(distinct SalesorderRefNumber) TotalOrders from invoice 
where datepart(month,txndate) = datepart(month,getdate()) and packer is not null
group by packer,datepart(month,txndate)		
union
--invoice
select SalesRepRefFullName as staff,cast(datepart(day,getdate())-datepart(day,txndate) as varchar(5)) + 'd_in' as range,count(distinct SalesorderRefNumber) TotalOrders from invoice 
where txndate = format(getdate(),'yyyy-MM-dd') and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(day,txndate)
union 
select SalesRepRefFullName as staff,cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w_in' as range,count(distinct SalesorderRefNumber) TotalOrders from invoice 
where datepart(week,txndate) = datepart(week,getdate()) and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(week,txndate)
union
select SalesRepRefFullName as staff,cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm_in' as range,count(distinct SalesorderRefNumber) TotalOrders from invoice 
where datepart(month,txndate) = datepart(month,getdate()) and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(month,txndate)	
)
select Staff, isnull([0d_pi],0) as [Picked Today],isnull([0w_pi],0) as [Picked WTD],isnull([0m_pi],0) as [Picked MTD],isnull([0d_pa],0) as [Packed Today],isnull([0w_pa],0) as [Packed WTD],isnull([0m_pa],0) as [Packed MTD],isnull([0d_in],0) as [Invoiced Today],isnull([0w_in],0) as [Invoiced WTD],isnull([0m_in],0) as [Invoiced MTD]
from data
pivot (sum(TotalOrders) for [range] in ([0d_pi],[0w_pi],[0m_pi],[0d_pa],[0w_pa],[0m_pa],[0d_in],[0w_in],[0m_in])) as Total
where staff not in ('James','Joseph','Stu','Rae-John','Navneil','Shannon','Tarun', 'Manan', 'Steve', 'Aarti', 'Colin', 'Joshi', 'Dan', 'Cryst', 'shaw', 'Cyan', 'Reia', 'ZWEB_TEST', 'Casey', 'Lewis', 'Swati', 'Andrius', 'Rawan', 'Alan', 'Piri', 'Raj', 'Albert')   



--5. Invocie by Staff for david
create view kpi.InvoicebyStaff as
with data as
(
select SalesRepRefFullName, cast(datepart(DAY,getdate())-datepart(DAY,txndate) as varchar(5)) + 'd' as range,sum(round(TotalAmount,0)) TotalSales from Invoice
where txndate > format(DATEADD(day, -4, getdate()),'yyyy-MM-dd') 
group by SalesRepRefFullName,datepart(day,txndate)
union
select SalesRepRefFullName, cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w' as range,sum(round(TotalAmount,0)) TotalSales from Invoice
where datepart(week,txndate) > datepart(week,getdate())-6  
group by SalesRepRefFullName,datepart(week,txndate)
union
select SalesRepRefFullName, cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm' as range,sum(round(TotalAmount,0)) TotalSales from Invoice
where datepart(month,txndate) > datepart(month,getdate())-6 
group by SalesRepRefFullName,datepart(month,txndate)
union
select SalesRepRefFullName, cast(datepart(year,getdate())-datepart(year,txndate) as varchar(5)) + 'y' as range,sum(round(TotalAmount,0)) TotalSales from Invoice
where datepart(year,txndate) > datepart(year,getdate()) -6 
group by SalesRepRefFullName,datepart(year,txndate)
)
select SalesRepRefFullName as Staff, isnull([0d],0) as [Today],isnull([1d],0) as [L1D],isnull([2d],0) as [L2D],isnull([3d],0) as [L3D],isnull([0w],0) as [WTD],isnull([1w],0) as [L1W],isnull([2w],0) as [L2W],isnull([3w],0) as [L3W],isnull([4w],0) as [L4W],isnull([5w],0) as [L5W],isnull([0m],0) as [MTD],isnull([1m],0) as [L1M],isnull([2m],0) as [L2M],isnull([3m],0) as [L3M],isnull([4m],0) as [L4M],isnull([5m],0) as [L5M],isnull([0y],0) as [YTD],isnull([1y],0) as [L1Y],isnull([2y],0) as [L2Y],isnull([3y],0) as [L3Y],isnull([4y],0) as [L4Y],isnull([5y],0) as [L5Y]
from data
pivot (sum(TotalSales) for [range] in ([0d],[1d],[2d],[3d],[0w],[1w],[2w],[3w],[4w],[5w],[0m],[1m],[2m],[3m],[4m],[5m],[0y],[1y],[2y],[3y],[4y],[5y])) as Total
where SalesRepRefFullName not in (' ', 'Tarun', 'Manan', 'Steve', 'Aarti', 'Colin', 'Joshi', 'Dan', 'Cryst', 'shaw', 'Cyan', 'Reia', 'ZWEB_TEST', 'Casey', 'Lewis', 'Swati', 'Andrius', 'Rawan', 'Alan', 'Piri', 'Raj', 'Albert') 

--for powerbi server data set
SELECT isnull([Staff],'Total') as Staff
      ,sum([Today]) as Today 
      ,sum([L1D]) as L1D
      ,sum([L2D]) as L2D
      ,sum([L3D]) as L3D
      ,sum([WTD]) as WTD
      ,sum([L1W]) as L1W
      ,sum([L2W]) as L2W
      ,sum([L3W]) as L3W
      ,sum([L4W]) as L4W
      ,sum([L5W]) as L5W
      ,sum([MTD]) as MTD
      ,sum([L1M]) as L1M
      ,sum([L2M]) as L2M
      ,sum([L3M]) as L3M
      ,sum([L4M]) as L4M
      ,sum([L5M]) as L5M
      ,sum([YTD]) as YTD
      ,sum([L1Y]) as L1Y
      ,sum([L2Y]) as L2Y
      ,sum([L3Y]) as L3Y
      ,sum([L4Y]) as L4Y
      ,sum([L5Y]) as L5Y
  FROM [DatawarehouseDB].[kpi].[InvoicebyStaff]
  group by rollup([Staff]) 
  order by L1M desc
  


--6 point sumary

create view kpi.PointSummary as
with data as
(
select picker as staff,cast(datepart(day,getdate())-datepart(day,txndate) as varchar(5)) + 'd' as range,round(count(distinct SalesorderRefNumber)*0.5,1) TotalPoints from invoice 
where txndate = format(getdate(),'yyyy-MM-dd') and picker is not null
group by picker,datepart(day,txndate)
union 
select picker as staff,cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w' as range,round(count(distinct SalesorderRefNumber)*0.5,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,getdate()) and picker is not null
group by picker,datepart(week,txndate)
union
select picker as staff,cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm' as range,round(count(distinct SalesorderRefNumber)*0.5,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,getdate()) and picker is not null
group by picker,datepart(month,txndate)
union
--packer
select packer as staff,cast(datepart(day,getdate())-datepart(day,txndate) as varchar(5)) + 'd' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where txndate = format(getdate(),'yyyy-MM-dd') and packer is not null
group by packer,datepart(day,txndate)
union 
select packer as staff,cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,getdate()) and packer is not null
group by packer,datepart(week,txndate)
union
select packer as staff,cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,getdate()) and packer is not null
group by packer,datepart(month,txndate)		
union
select Checker as staff,cast(datepart(day,getdate())-datepart(day,txndate) as varchar(5)) + 'd' as range,round(count(distinct SalesorderRefNumber)*0.05,1) TotalPoints from invoice 
where txndate = format(getdate(),'yyyy-MM-dd') and Checker is not null
group by Checker,datepart(day,txndate)
union 
select Checker as staff,cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w' as range,round(count(distinct SalesorderRefNumber)*0.05,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,getdate()) and Checker is not null
group by Checker,datepart(week,txndate)
union
select Checker as staff,cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm' as range,round(count(distinct SalesorderRefNumber)*0.05,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,getdate()) and Checker is not null
group by Checker,datepart(month,txndate)	
union
select SalesRepRefFullName as staff,cast(datepart(day,getdate())-datepart(day,txndate) as varchar(5)) + 'd' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where txndate = format(getdate(),'yyyy-MM-dd') and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(day,txndate)
union 
select SalesRepRefFullName as staff,cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,getdate()) and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(week,txndate)
union
select SalesRepRefFullName as staff,cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,getdate()) and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(month,txndate)
union
--for total amount
select picker as staff,cast(datepart(day,getdate())-datepart(day,txndate) as varchar(5)) + 'd' as range,round(sum(TotalAmount/100),1) TotalPoints from invoice 
where txndate = format(getdate(),'yyyy-MM-dd') and picker is not null
group by picker,datepart(day,txndate)
union 
select picker as staff,cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w' as range,round(sum(TotalAmount/100),1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,getdate()) and picker is not null
group by picker,datepart(week,txndate)
union
select picker as staff,cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm' as range,round(sum(TotalAmount/100),1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,getdate()) and picker is not null
group by picker,datepart(month,txndate)
union
--packer
select packer as staff,cast(datepart(day,getdate())-datepart(day,txndate) as varchar(5)) + 'd' as range,round(sum(TotalAmount/100)*0.5,1) TotalPoints from invoice 
where txndate = format(getdate(),'yyyy-MM-dd') and packer is not null
group by packer,datepart(day,txndate)
union 
select packer as staff,cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w' as range,round(sum(TotalAmount/100)*0.5,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,getdate()) and packer is not null
group by packer,datepart(week,txndate)
union
select packer as staff,cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm' as range,round(sum(TotalAmount/100)*0.5,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,getdate()) and packer is not null
group by packer,datepart(month,txndate)		
union
select Checker as staff,cast(datepart(day,getdate())-datepart(day,txndate) as varchar(5)) + 'd' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where txndate = format(getdate(),'yyyy-MM-dd') and Checker is not null
group by Checker,datepart(day,txndate)
union 
select Checker as staff,cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,getdate()) and Checker is not null
group by Checker,datepart(week,txndate)
union
select Checker as staff,cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,getdate()) and Checker is not null
group by Checker,datepart(month,txndate)	
union
select SalesRepRefFullName as staff,cast(datepart(day,getdate())-datepart(day,txndate) as varchar(5)) + 'd' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where txndate = format(getdate(),'yyyy-MM-dd') and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(day,txndate)
union 
select SalesRepRefFullName as staff,cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,getdate()) and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(week,txndate)
union
select SalesRepRefFullName as staff,cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,getdate()) and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(month,txndate)
	
)
select Staff, isnull([0d],0) as 'Today',isnull([0w],0)  as 'WTD',isnull([0m],0) as 'MTD'
from data
pivot (sum(TotalPoints) for [range] in ([0d] ,[0w],[0m] )) as Total
where staff not in ('James','Joseph','Stu','Rae-John','Navneil','Shannon','Tarun', 'Manan', 'Steve', 'Aarti', 'Colin', 'Joshi', 'Dan', 'Cryst', 'shaw', 'Cyan', 'Reia', 'ZWEB_TEST', 'Casey', 'Lewis', 'Swati', 'Andrius', 'Rawan', 'Alan', 'Piri', 'Raj', 'Albert')   




--7 point details

create view kpi.PointDetails as
with data as
(
select picker as staff,cast(datepart(day,getdate())-datepart(day,txndate) as varchar(5)) + 'd_pi_n' as range,round(count(distinct SalesorderRefNumber)*0.5,1) TotalPoints from invoice 
where txndate = format(getdate(),'yyyy-MM-dd') and picker is not null
group by picker,datepart(day,txndate)
union 
select picker as staff,cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w_pi_n' as range,round(count(distinct SalesorderRefNumber)*0.5,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,getdate()) and picker is not null
group by picker,datepart(week,txndate)
union
select picker as staff,cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm_pi_n' as range,round(count(distinct SalesorderRefNumber)*0.5,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,getdate()) and picker is not null
group by picker,datepart(month,txndate)
union
--packer
select packer as staff,cast(datepart(day,getdate())-datepart(day,txndate) as varchar(5)) + 'd_pa_n' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where txndate = format(getdate(),'yyyy-MM-dd') and packer is not null
group by packer,datepart(day,txndate)
union 
select packer as staff,cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w_pa_n' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,getdate()) and packer is not null
group by packer,datepart(week,txndate)
union
select packer as staff,cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm_pa_n' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,getdate()) and packer is not null
group by packer,datepart(month,txndate)		
union
select Checker as staff,cast(datepart(day,getdate())-datepart(day,txndate) as varchar(5)) + 'd_ch_n' as range,round(count(distinct SalesorderRefNumber)*0.05,1) TotalPoints from invoice 
where txndate = format(getdate(),'yyyy-MM-dd') and Checker is not null
group by Checker,datepart(day,txndate)
union 
select Checker as staff,cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w_ch_n' as range,round(count(distinct SalesorderRefNumber)*0.05,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,getdate()) and Checker is not null
group by Checker,datepart(week,txndate)
union
select Checker as staff,cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm_ch_n' as range,round(count(distinct SalesorderRefNumber)*0.05,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,getdate()) and Checker is not null
group by Checker,datepart(month,txndate)	
union
select SalesRepRefFullName as staff,cast(datepart(day,getdate())-datepart(day,txndate) as varchar(5)) + 'd_in_n' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where txndate = format(getdate(),'yyyy-MM-dd') and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(day,txndate)
union 
select SalesRepRefFullName as staff,cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w_in_n' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,getdate()) and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(week,txndate)
union
select SalesRepRefFullName as staff,cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm_in_n' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,getdate()) and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(month,txndate)
union
--for total amount
select picker as staff,cast(datepart(day,getdate())-datepart(day,txndate) as varchar(5)) + 'd_pi_v' as range,round(sum(TotalAmount/100),1) TotalPoints from invoice 
where txndate = format(getdate(),'yyyy-MM-dd') and picker is not null
group by picker,datepart(day,txndate)
union 
select picker as staff,cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w_pi_v' as range,round(sum(TotalAmount/100),1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,getdate()) and picker is not null
group by picker,datepart(week,txndate)
union
select picker as staff,cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm_pi_v' as range,round(sum(TotalAmount/100),1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,getdate()) and picker is not null
group by picker,datepart(month,txndate)
union
--packer
select packer as staff,cast(datepart(day,getdate())-datepart(day,txndate) as varchar(5)) + 'd_pa_v' as range,round(sum(TotalAmount/100)*0.5,1) TotalPoints from invoice 
where txndate = format(getdate(),'yyyy-MM-dd') and packer is not null
group by packer,datepart(day,txndate)
union 
select packer as staff,cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w_pa_v' as range,round(sum(TotalAmount/100)*0.5,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,getdate()) and packer is not null
group by packer,datepart(week,txndate)
union
select packer as staff,cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm_pa_v' as range,round(sum(TotalAmount/100)*0.5,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,getdate()) and packer is not null
group by packer,datepart(month,txndate)		
union
select Checker as staff,cast(datepart(day,getdate())-datepart(day,txndate) as varchar(5)) + 'd_ch_v' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where txndate = format(getdate(),'yyyy-MM-dd') and Checker is not null
group by Checker,datepart(day,txndate)
union 
select Checker as staff,cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w_ch_v' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,getdate()) and Checker is not null
group by Checker,datepart(week,txndate)
union
select Checker as staff,cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm_ch_v' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,getdate()) and Checker is not null
group by Checker,datepart(month,txndate)	
union
select SalesRepRefFullName as staff,cast(datepart(day,getdate())-datepart(day,txndate) as varchar(5)) + 'd_in_v' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where txndate = format(getdate(),'yyyy-MM-dd') and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(day,txndate)
union 
select SalesRepRefFullName as staff,cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w_in_v' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,getdate()) and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(week,txndate)
union
select SalesRepRefFullName as staff,cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm_in_v' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,getdate()) and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(month,txndate)
	
)
select Staff, isnull([0d_pi_n],0) as [0d_pi_n],isnull([0w_pi_n],0) as [0w_pi_n],isnull([0m_pi_n],0) as [0m_pi_n],isnull([0d_pa_n],0) as [0d_pa_n],isnull([0w_pa_n],0) as [0w_pa_n],isnull([0m_pa_n],0) as [0m_pa_n],isnull([0d_in_n],0) as [0d_in_n],isnull([0w_in_n],0) as [0w_in_n],isnull([0m_in_n],0) as [0m_in_n],
isnull([0d_pi_v],0) as [0d_pi_v],isnull([0w_pi_v],0) as [0w_pi_v],isnull([0m_pi_v],0) as [0m_pi_v],isnull([0d_pa_v],0) as [0d_pa_v],isnull([0w_pa_v],0) as [0w_pa_v],isnull([0m_pa_v],0) as [0m_pa_v],isnull([0d_in_v],0) as [0d_in_v],isnull([0w_in_v],0) as [0w_in_v],isnull([0m_in_v],0) as [0m_in_v]
from data
pivot (sum(TotalPoints) for [range] in ([0d_pi_n],[0w_pi_n],[0m_pi_n],[0d_pa_n],[0w_pa_n],[0m_pa_n],[0d_ch_n],[0w_ch_n],[0m_ch_n],[0d_in_n],[0w_in_n],[0m_in_n],[0d_pi_v],[0w_pi_v],[0m_pi_v],[0d_pa_v],[0w_pa_v],[0m_pa_v],[0d_ch_v],[0w_ch_v],[0m_ch_v],[0d_in_v],[0w_in_v],[0m_in_v])) as Total
where staff not in ('James','Joseph','Stu','Rae-John','Navneil','Shannon','Tarun', 'Manan', 'Steve', 'Aarti', 'Colin', 'Joshi', 'Dan', 'Cryst', 'shaw', 'Cyan', 'Reia', 'ZWEB_TEST', 'Casey', 'Lewis', 'Swati', 'Andrius', 'Rawan', 'Alan', 'Piri', 'Raj', 'Albert')   




--8 sales by channel

create view kpi.SalesbyChannel as
with data as
(
select OrderChannel, cast(datepart(DAY,getdate())-datepart(DAY,txndate) as varchar(5)) + 'd' as range,sum(round(TotalAmount,0)) TotalSales from Salesorder
where txndate > format(DATEADD(day, -4, getdate()),'yyyy-MM-dd') 
group by OrderChannel,datepart(day,txndate)
union
select OrderChannel, cast(datepart(week,getdate())-datepart(week,txndate) as varchar(5)) + 'w' as range,sum(round(TotalAmount,0)) TotalSales from Salesorder
where datepart(week,txndate) > datepart(week,getdate())-6  
group by OrderChannel,datepart(week,txndate)
union
select OrderChannel, cast(datepart(month,getdate())-datepart(month,txndate) as varchar(5)) + 'm' as range,sum(round(TotalAmount,0)) TotalSales from Salesorder
where datepart(month,txndate) > datepart(month,getdate())-6 
group by OrderChannel,datepart(month,txndate)
)
select OrderChannel as RepName, isnull([0d],0) as [Today],isnull([1d],0) as [L1D],isnull([2d],0) as [L2D],isnull([3d],0) as [L3D],isnull([0w],0) as [WTD],isnull([1w],0) as [L1W],isnull([2w],0) as [L2W],isnull([3w],0) as [L3W],isnull([4w],0) as [L4W],isnull([5w],0) as [L5W],isnull([0m],0) as [MTD],isnull([1m],0) as [L1M],isnull([2m],0) as [L2M],isnull([3m],0) as [L3M],isnull([4m],0) as [L4M],isnull([5m],0) as [L5M]
from data
pivot (sum(TotalSales) for [range] in ([0d],[1d],[2d],[3d],[0w],[1w],[2w],[3w],[4w],[5w],[0m],[1m],[2m],[3m],[4m],[5m])) as Total
where OrderChannel in ('Showroom','TradeMe','B2B','Web','Telesales')


--9 sales by B2B for david
create view kpi.SalesbyB2B as
with data as
(
select c.name as Customer ,cast(datediff(d,txndate, GETDATE()) as varchar(5)) + 'd' as range ,sum(round(TotalAmount,0)) TotalSales  
from Customer c  left join Salesorder o on o.CustomerID=c.id
	and o.txndate >  CONVERT(DATE,DATEADD(d,DATEDIFF(d, 0, GETDATE())-4,0))  
where c.CUSTOMERTYPE='B2B'
group by c.name ,datediff(d,txndate, GETDATE())
union
select c.name as Customer, cast(datepart(WEEK,getdate())-datepart(WEEK,txndate) as varchar(5)) + 'w' as range,sum(round(TotalAmount,0)) TotalSales  
from Customer c  left join Salesorder o on o.CustomerID=c.id
	and datepart(week,txndate) > datepart(week,getdate())-6 
where  c.CUSTOMERTYPE='B2B'
group by c.name,datepart(week,txndate)
union
select c.name as Customer, cast(datediff(m,txndate, GETDATE()) as varchar(5)) + 'm' as range,sum(round(TotalAmount,0)) TotalSales  
from Customer c  left join Salesorder o on o.CustomerID=c.id
	and o.txndate >  CONVERT(DATE,DATEADD(m,DATEDIFF(m, 0, GETDATE())-6,0))  
where  c.CUSTOMERTYPE='B2B'
group by c.name,datediff(m,txndate, GETDATE())
union
select c.name as Customer, cast(datediff(YYYY,txndate, GETDATE()) as varchar(5)) + 'y' as range,sum(round(TotalAmount,0)) TotalSales  
from Customer c  left join Salesorder o on o.CustomerID=c.id
	and o.txndate >  CONVERT(DATE,DATEADD(YYYY,DATEDIFF(YYYY, 0, GETDATE())-6,0))  
where  c.CUSTOMERTYPE='B2B'
group by c.name,datediff(YYYY,txndate, GETDATE())
)
select Customer, isnull([0d],0) as [Today],isnull([1d],0) as [L1D],isnull([2d],0) as [L2D],isnull([3d],0) as [L3D],isnull([0w],0) as [WTD],isnull([1w],0) as [L1W],isnull([2w],0) as [L2W],isnull([3w],0) as [L3W],isnull([4w],0) as [L4W],isnull([5w],0) as [L5W],isnull([0m],0) as [MTD],isnull([1m],0) as [L1M],isnull([2m],0) as [L2M],isnull([3m],0) as [L3M],isnull([4m],0) as [L4M],isnull([5m],0) as [L5M],isnull([0y],0) as [YTD],isnull([1y],0) as [L1Y],isnull([2y],0) as [L2Y],isnull([3y],0) as [L3Y],isnull([4y],0) as [L4Y],isnull([5y],0) as [L5Y]
from data
pivot (sum(TotalSales) for [range] in ([0d],[1d],[2d],[3d],[0w],[1w],[2w],[3w],[4w],[5w],[0m],[1m],[2m],[3m],[4m],[5m],[0y],[1y],[2y],[3y],[4y],[5y])) as Total
