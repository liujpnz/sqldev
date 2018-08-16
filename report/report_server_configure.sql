
--data source setting
type = Microsoft Sql server
connection string
data source="tradedepot.database.windows.net";initial catalog=DatawarehouseDB




--Daily Invoice

Declare @DT as Datetime = dbo.GetNzDate();

select sum(TotalAmount) as 'di_invoice',70000 as 'di_target', (case when (sum(TotalAmount)-70000) >0 then 1 when (sum(TotalAmount)-70000) =0 then 0 when (sum(TotalAmount)-70000)<0 then -1 end ) as di_status from dbo.Invoice where txndate=convert(varchar,FORMAT(@DT, 'yyyy-MM-dd'),101)


--Daily call
Declare @DT as Datetime = dbo.GetNzDate();
select count(distinct(phoneto)) as 'Total Phone',
(select count(distinct(phoneto)) from phone where phonetype<>'missed' and  createdtime > format(@DT,'yyyy-MM-dd')) as 'Total Answered',
(select count(distinct(phoneto)) from phone where phonetype='missed' and  createdtime > format(@DT,'yyyy-MM-dd')) as 'Total Missed'
from phone where createdtime > format(@DT,'yyyy-MM-dd')


--Daily Dispatched
Declare @DT as Datetime = dbo.GetNzDate();
select count(*) as '1. Inoviced Today',
(select count(*) from salesorder where status not in ('fully_invoiced', 'fully_canceled', 'closed', 'delivered') and OrderType<>'BACKORDER') as '2. Open Sales Orders',
(select count(*) from salesorder where status not in ('fully_invoiced', 'fully_canceled', 'closed', 'delivered') and OrderType='BACKORDER') as '3. Back Orders'
 from dbo.Invoice where TxnDate=convert(varchar,FORMAT(@DT, 'yyyy-MM-dd'),101)
 
 
 --Daily sales
 Declare @DT as Datetime = dbo.GetNzDate();
 select sum(TotalAmount) as 'daily sales',(case when (sum(TotalAmount)-85000) >0 then 1 when (sum(TotalAmount)-85000) =0 then 0 when (sum(TotalAmount)-85000)<0 then -1 end ) as status from dbo.Salesorder where txndate=convert(varchar,FORMAT(@DT, 'yyyy-MM-dd'),101)
 
 
 --Sales Channel
 Declare @DT as Datetime = dbo.GetNzDate();
 SELECT 


(select  sum(totalamount) as total from salesorder where txndate=convert(varchar,FORMAT(@DT, 'yyyy-MM-dd'),101) and OrderChannel='B2B') as B2BSales,

(select  sum(totalamount) as total from salesorder where txndate=convert(varchar,FORMAT(@DT, 'yyyy-MM-dd'),101) and OrderChannel='Showroom') as ShowroomSales,

(select  sum(totalamount) as total from salesorder where txndate=convert(varchar,FORMAT(@DT, 'yyyy-MM-dd'),101) and OrderChannel='Showroom' and store='auckland') as ShowroomSales_al,

(select  sum(totalamount) as total from salesorder where txndate=convert(varchar,FORMAT(@DT, 'yyyy-MM-dd'),101) and OrderChannel='Showroom' and store='christchurch') as ShowroomSales_cc,

(select  sum(totalamount) as total from salesorder where txndate=convert(varchar,FORMAT(@DT, 'yyyy-MM-dd'),101) and OrderChannel='Telesales') as TeleSales,

(select  sum(totalamount) as total from salesorder where txndate=convert(varchar,FORMAT(@DT, 'yyyy-MM-dd'),101) and OrderChannel='TradeMe' and store='auckland' ) as TradeMeSales_al,

(select  sum(totalamount) as total from salesorder where txndate=convert(varchar,FORMAT(@DT, 'yyyy-MM-dd'),101) and OrderChannel='TradeMe' and store='christchurch' ) as TradeMeSales_cc,

(select  sum(totalamount) as total from salesorder where txndate=convert(varchar,FORMAT(@DT, 'yyyy-MM-dd'),101) and OrderChannel='TradeMe') as TradeMeSales,

(select  sum(totalamount) as total from salesorder where txndate=convert(varchar,FORMAT(@DT, 'yyyy-MM-dd'),101) and OrderChannel='Web') as WebSales



--1. sales summary
SELECT
  kpi.SalesbyRep.RepName
  ,kpi.SalesbyRep.Today
  ,kpi.SalesbyRep.L1D
  ,kpi.SalesbyRep.L2D
  ,kpi.SalesbyRep.L3D
  ,kpi.SalesbyRep.WTD
  ,kpi.SalesbyRep.L1W
  ,kpi.SalesbyRep.L2W
  ,kpi.SalesbyRep.L3W
  ,kpi.SalesbyRep.L4W
  ,kpi.SalesbyRep.L5W
  ,kpi.SalesbyRep.MTD
  ,kpi.SalesbyRep.L1M
  ,kpi.SalesbyRep.L2M
  ,kpi.SalesbyRep.L3M
  ,kpi.SalesbyRep.L4M
  ,kpi.SalesbyRep.L5M
FROM
  kpi.SalesbyRep
order by kpi.SalesbyRep.L1M desc



--2.category sales
SELECT
  kpi.SalesbyCategory.Category
  ,kpi.SalesbyCategory.Today
  ,kpi.SalesbyCategory.L1D
  ,kpi.SalesbyCategory.L2D
  ,kpi.SalesbyCategory.L3D
  ,kpi.SalesbyCategory.WTD
  ,kpi.SalesbyCategory.L1W
  ,kpi.SalesbyCategory.L2W
  ,kpi.SalesbyCategory.L3W
  ,kpi.SalesbyCategory.L4W
  ,kpi.SalesbyCategory.L5W
  ,kpi.SalesbyCategory.MTD
  ,kpi.SalesbyCategory.L1M
  ,kpi.SalesbyCategory.L2M
  ,kpi.SalesbyCategory.L3M
  ,kpi.SalesbyCategory.L4M
  ,kpi.SalesbyCategory.L5M
FROM
  kpi.SalesbyCategory
order by kpi.SalesbyCategory.L1M DESC


--3.customer service
SELECT
  kpi.SalesbyCustomer.Staff
  ,kpi.SalesbyCustomer.C_Today
  ,kpi.SalesbyCustomer.C_L1D
  ,kpi.SalesbyCustomer.C_L2D
  ,kpi.SalesbyCustomer.C_L3D
  ,kpi.SalesbyCustomer.C_WTD
  ,kpi.SalesbyCustomer.C_L1W
  ,kpi.SalesbyCustomer.C_MTD
  ,kpi.SalesbyCustomer.C_L1M
  ,kpi.SalesbyCustomer.S_Today
  ,kpi.SalesbyCustomer.S_WTD
  ,kpi.SalesbyCustomer.S_MTD
FROM
  kpi.SalesbyCustomer
order by kpi.SalesbyCustomer.C_L1M desc


--4.warehouse staff
SELECT
  kpi.SalesbyWarehouseStaff.Staff
  ,kpi.SalesbyWarehouseStaff.[Picked Today]
  ,kpi.SalesbyWarehouseStaff.[Picked WTD]
  ,kpi.SalesbyWarehouseStaff.[Picked MTD]
  ,kpi.SalesbyWarehouseStaff.[Packed Today]
  ,kpi.SalesbyWarehouseStaff.[Packed WTD]
  ,kpi.SalesbyWarehouseStaff.[Packed MTD]
  ,kpi.SalesbyWarehouseStaff.[Invoiced Today]
  ,kpi.SalesbyWarehouseStaff.[Invoiced WTD]
  ,kpi.SalesbyWarehouseStaff.[Invoiced MTD]
FROM
  kpi.SalesbyWarehouseStaff
order by kpi.SalesbyWarehouseStaff.[Invoiced WTD] desc


--5 invoice by staff for David
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
  FROM [kpi].[InvoicebyStaff]
  group by rollup([Staff]) 
  order by L1M desc
  
--6 sales by b2b for david
SELECT
  kpi.SalesbyB2B.Customer
  ,kpi.SalesbyB2B.Today
  ,kpi.SalesbyB2B.L1D
  ,kpi.SalesbyB2B.L2D
  ,kpi.SalesbyB2B.L3D
  ,kpi.SalesbyB2B.WTD
  ,kpi.SalesbyB2B.L1W
  ,kpi.SalesbyB2B.L2W
  ,kpi.SalesbyB2B.L3W
  ,kpi.SalesbyB2B.L4W
  ,kpi.SalesbyB2B.L5W
  ,kpi.SalesbyB2B.MTD
  ,kpi.SalesbyB2B.L1M
  ,kpi.SalesbyB2B.L2M
  ,kpi.SalesbyB2B.L3M
  ,kpi.SalesbyB2B.L4M
  ,kpi.SalesbyB2B.L5M
  ,kpi.SalesbyB2B.YTD
  ,kpi.SalesbyB2B.L1Y
  ,kpi.SalesbyB2B.L2Y
  ,kpi.SalesbyB2B.L3Y
  ,kpi.SalesbyB2B.L4Y
  ,kpi.SalesbyB2B.L5Y
FROM
  kpi.SalesbyB2B
order by YTD DESC