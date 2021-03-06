create view kpi.V_Reordering
as
with 
t_eta as
(
select sku,iif(min(PurchaseOrder.ExpectedDate)='1900-01-01',0,datediff(day,GETDATE(),min(PurchaseOrder.ExpectedDate))) as ETA 
from PurchaseOrderLine,PurchaseOrder  where PurchaseOrder.id=PurchaseOrderLine.PurchaseOrderID and PurchaseOrderLine.done!=1 group by PurchaseOrderLine.sku
),
t_reco as
(
select name as sku,PurchaseCost,UsdCost,SalesPrice, (case when SalesPrice=0 or UsdCost=0 then 0 else (1 - round(UsdCost*1.6*1.15/SalesPrice,2)) end) as GP from ItemInventory
),
t_q0 as
(
select il.InvoiceLineItemFullName as sku,SUM(il.InvoiceLineQuantity) as Q0 
from Invoiceline il, Invoice i 
where i.id=il.InvoiceID 
and i.TxnDate>= CONVERT(DATE,DATEADD(q,DATEDIFF(q, 0, GETDATE()),0)) 
group by il.InvoiceLineItemFullName
),
t_q1 as
(
select il.InvoiceLineItemFullName as sku,SUM(il.InvoiceLineQuantity) as Q1 
from Invoiceline il, Invoice i 
where i.id=il.InvoiceID 
and i.TxnDate>= CONVERT(DATE,DATEADD(q,DATEDIFF(q, 0, GETDATE())-1,0)) and i.TxnDate< CONVERT(DATE,DATEADD(q,DATEDIFF(q, 0, GETDATE()),0))
group by il.InvoiceLineItemFullName
),
---Q2 old
t_new_all as
(
select pl.sku,sum(pl.PurchaseOrderLineQuantity) as new_all from PurchaseOrderLine pl 
 where done!=1
 -- and pl.ExpectedDate > format(getdate(),'yyyy-MM-dd') 
 group by pl.sku
),
t_new_q1 as
(
select pl.sku,sum(pl.PurchaseOrderLineQuantity) as new_q1 from PurchaseOrderLine pl, PurchaseOrder po
 where po.id=pl.PurchaseOrderID and
 po.ExpectedDate > format(getdate(),'yyyy-MM-dd')   and po.ExpectedDate<CONVERT(DATE,DATEADD(m,DATEDIFF(m, 0, GETDATE())+1,0))
 group by pl.sku
),
t_new_q2 as
(
 select pl.sku,sum(pl.PurchaseOrderLineQuantity) as new_q2 from PurchaseOrderLine pl, PurchaseOrder po 
 where po.id=pl.PurchaseOrderID and
 po.ExpectedDate > format(getdate(),'yyyy-MM-dd')   and po.ExpectedDate<CONVERT(DATE,DATEADD(m,DATEDIFF(m, 0, GETDATE())+2,0))
 group by pl.sku
),
t_new_q3 as
(
 select pl.sku,sum(pl.PurchaseOrderLineQuantity) as new_q3 from PurchaseOrderLine pl, PurchaseOrder po 
 where po.id=pl.PurchaseOrderID and
 po.ExpectedDate > format(getdate(),'yyyy-MM-dd')   and po.ExpectedDate<CONVERT(DATE,DATEADD(m,DATEDIFF(m, 0, GETDATE())+3,0))
 group by pl.sku
),
t_new_q4 as
(
 select pl.sku,sum(pl.PurchaseOrderLineQuantity) as new_q4 from PurchaseOrderLine pl, PurchaseOrder po
 where po.id=pl.PurchaseOrderID and
 po.ExpectedDate > format(getdate(),'yyyy-MM-dd')   and po.ExpectedDate<CONVERT(DATE,DATEADD(m,DATEDIFF(m, 0, GETDATE())+4,0))
 group by pl.sku
),
t_new_q5 as
(
 select pl.sku,sum(pl.PurchaseOrderLineQuantity) as new_q5 from PurchaseOrderLine pl, PurchaseOrder po 
 where po.id=pl.PurchaseOrderID and
 po.ExpectedDate > format(getdate(),'yyyy-MM-dd')   and po.ExpectedDate<CONVERT(DATE,DATEADD(m,DATEDIFF(m, 0, GETDATE())+5,0))
 group by pl.sku
),
t_new_q6 as
(
 select pl.sku,sum(pl.PurchaseOrderLineQuantity) as new_q6 from PurchaseOrderLine pl, PurchaseOrder po 
 where po.id=pl.PurchaseOrderID and
 po.ExpectedDate > format(getdate(),'yyyy-MM-dd')   and po.ExpectedDate<CONVERT(DATE,DATEADD(m,DATEDIFF(m, 0, GETDATE())+6,0))
 group by pl.sku
),
t_new_by_month as
(
 select sku,isnull([1],0) as ArrivalQtyMonth1,isnull([2],0) as ArrivalQtyMonth2,isnull([3],0) as ArrivalQtyMonth3,isnull([4],0) as ArrivalQtyMonth4,isnull([5],0) as ArrivalQtyMonth5,isnull([6],0) as ArrivalQtyMonth6,isnull([7],0) as ArrivalQtyMonth7,isnull([8],0) as ArrivalQtyMonth8,isnull([9],0) as ArrivalQtyMonth9,isnull([10],0) as ArrivalQtyMonth10,isnull([11],0) as ArrivalQtyMonth11,isnull([12],0) as ArrivalQtyMonth12
 from (
	select pl.sku,DATEPART(month,po.ExpectedDate) as month,sum(pl.PurchaseOrderLineQuantity) as month_arrived 
	from PurchaseOrderLine pl, PurchaseOrder po  where po.id=pl.PurchaseOrderID and pl.done!=1 group by pl.sku, DATEPART(month,po.ExpectedDate)) as data
	pivot (sum(month_arrived) for month in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) as Total
)
SELECT distinct i.id as Id,i.name as Name,i.IsEnableOnWeb,i.DoNotReorder,i.Stocktake,i.Promotion,i.Deactivate,
	i.PrefVendorRefFullName as PrefVendorRefFullName,
	i.SalesDesc , isnull(i.CategoryId,0) as CategoryId, 
	i.SortCode as SortCode,
	isnull(i.QuantityOnHand,0) as QuantityOnHand,
	isnull(i.QuantityOnSalesOrder,0) as QuantityOnSalesOrder,
	isnull((i.QuantityOnHand-i.QuantityOnSalesOrder),0) as QuantityAvailable,
	i.QuantityReordered as QuantityReordered,
	isnull(t_new_all.new_all,0) as QuantityOnOrder,
	(i.QuantityAvailable+i.QuantityReordered+isnull(t_new_all.new_all,0)) as TTL,
	iif(QuarterSaleEstimate=0,0,isnull(round((i.QuantityAvailable+i.QuantityReordered+isnull(t_new_all.new_all,0))/QuarterSaleEstimate,1),0)) as QTRS,
	isnull(i.QuarterSaleEstimate,0) as QuarterSaleEstimate,
  isnull(t_q0.Q0,0) as Q0,isnull(t_q1.Q1,0) as Q1,0 as Q2, 0 as Q3, 0 as Q4,
  isnull(i.SalesQtyQuarter0,0) as SalesQtyQuarter0 ,isnull(i.SalesQtyQuarter1,0) as SalesQtyQuarter1 ,isnull(i.SalesQtyQuarter2,0) as SalesQtyQuarter2,isnull(i.SalesQtyQuarter3,0) as SalesQtyQuarter3,isnull(i.SalesQtyQuarter4,0) as SalesQtyQuarter4,
  isnull(i.QuantityAvailable+t_new_q1.new_q1-round(QuarterSaleEstimate/3,0),0) as SOH1m, 
  isnull(i.QuantityAvailable+t_new_q2.new_q2-round(2*QuarterSaleEstimate/3,0),0) as SOH2m,
  isnull(i.QuantityAvailable+t_new_q3.new_q3-round(3*QuarterSaleEstimate/3,0),0) as SOH3m,
  isnull(i.QuantityAvailable+t_new_q4.new_q4-round(4*QuarterSaleEstimate/3,0),0) as SOH4m,
  isnull(i.QuantityAvailable+t_new_q5.new_q5-round(5*QuarterSaleEstimate/3,0),0) as SOH5m,
  isnull(i.QuantityAvailable+t_new_q6.new_q6-round(6*QuarterSaleEstimate/3,0),0) as SOH6m,
  isnull(t_eta.ETA,0) as ETA,
  i.ReorderNotes as ReorderNotes, 
  isnull(t_reco.PurchaseCost,0) as PurchaseCost,
  isnull(t_reco.UsdCost,0) as UsdCost,
  isnull(t_reco.SalesPrice,0) as SalesPrice,
  isnull(t_reco.GP,0) as GP,
  isnull(t_new_by_month.ArrivalQtyMonth1,0) as ArrivalQtyMonth1,
  isnull(t_new_by_month.ArrivalQtyMonth2,0) as ArrivalQtyMonth2,
  isnull(t_new_by_month.ArrivalQtyMonth3,0) as ArrivalQtyMonth3,
  isnull(t_new_by_month.ArrivalQtyMonth4,0) as ArrivalQtyMonth4,
  isnull(t_new_by_month.ArrivalQtyMonth5,0) as ArrivalQtyMonth5,	
  isnull(t_new_by_month.ArrivalQtyMonth6,0) as ArrivalQtyMonth6,
  isnull(t_new_by_month.ArrivalQtyMonth7,0) as ArrivalQtyMonth7,
  isnull(t_new_by_month.ArrivalQtyMonth8,0) as ArrivalQtyMonth8,
  isnull(t_new_by_month.ArrivalQtyMonth9,0) as ArrivalQtyMonth9,
  isnull(t_new_by_month.ArrivalQtyMonth10,0) as	ArrivalQtyMonth10,
  isnull(t_new_by_month.ArrivalQtyMonth11,0) as  ArrivalQtyMonth11,
  isnull(t_new_by_month.ArrivalQtyMonth12,0) as  ArrivalQtyMonth12

FROM ItemInventory i 
left join PurchaseOrderLine pl on i.name=pl.sku
left join t_eta on i.name=t_eta.sku
left join t_reco on i.name=t_reco.sku
left join t_new_all on i.name=t_new_all.Sku
left join t_new_q1 on i.name=t_new_q1.Sku
left join t_new_q2 on i.name=t_new_q2.Sku
left join t_new_q3 on i.name=t_new_q3.Sku
left join t_new_q4 on i.name=t_new_q4.Sku
left join t_new_q5 on i.name=t_new_q5.Sku
left join t_new_q6 on i.name=t_new_q6.Sku 
left join t_q0 on i.name=t_q0.sku
left join t_q1 on i.name=t_q1.sku
left join t_new_by_month on i.name=t_new_by_month.Sku
where i.IsActive=1
