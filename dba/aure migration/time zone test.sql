USE [DatawarehouseDB]
GO

set statistics time on
set statistics io on

select * from DispatchingPrepare order by id desc
insert into DispatchingPrepare ( PickBeginTime)values( getdate());

Declare @DT as Datetime = dbo.GetNzDate();
insert into DispatchingPrepare ( PickBeginTime)values(@DT);

--
	select 
				*,
				(select SalesDesc from ItemInventory where Name = StockAdjustment.Sku) as SalesDes,
				(select SalesPrice from ItemInventory where Name = StockAdjustment.Sku)*Qty as ValueDiff
				 from StockAdjustment where Memo like '%Save On Product Page%' and CONVERT(date,TimeCreated) = CONVERT(date,getdate()) and Qty !=0 and Operator !='qin' order by TimeCreated desc

Declare @DT as Datetime = dbo.GetNzDate();
				select 
				*,
				(select SalesDesc from ItemInventory where Name = StockAdjustment.Sku) as SalesDes,
				(select SalesPrice from ItemInventory where Name = StockAdjustment.Sku)*Qty as ValueDiff
				 from StockAdjustment where Memo like '%Save On Product Page%' and CONVERT(date,TimeCreated) = CONVERT(date,@DT) and Qty !=0 and Operator !='qin' order by TimeCreated desc


--

		select Name,SalesDesc,QuantityOnHand from iteminventory where QuantityOnHand<=0 and IsActive = 1 
and exists (select * from Salesorderline,Salesorder where Salesorder.Id = SalesorderID and  SalesOrderLineItemRefFullName = iteminventory.Name and TxnDate = CONVERT(date ,getdate())) and WebLabel !='sold out'


Declare @DT as Datetime = dbo.GetNzDate();
		select Name,SalesDesc,QuantityOnHand from iteminventory where QuantityOnHand<=0 and IsActive = 1 
and exists (select * from Salesorderline,Salesorder where Salesorder.Id = SalesorderID and  SalesOrderLineItemRefFullName = iteminventory.Name and TxnDate = CONVERT(date ,@DT)) and WebLabel !='sold out'


---
select OrderChannel as label,round(sum(TotalAmount/1.15),2) as value from invoice where Store = 'auckland' and OrderChannel in ('Telesales','Web','Showroom','B2B','TradeMe')  and  TxnDate between convert(date,DATEADD(mm, DATEDIFF(mm,0,getdate()), 0)) and convert(date,DATEADD(ms,-3,DATEADD(mm, DATEDIFF(m,0,getdate())+1, 0))) group by OrderChannel

Declare @DT as Datetime = dbo.GetNzDate();
select OrderChannel as label,round(sum(TotalAmount/1.15),2) as value from invoice where Store = 'auckland' and OrderChannel in ('Telesales','Web','Showroom','B2B','TradeMe')  and  TxnDate between convert(date,DATEADD(mm, DATEDIFF(mm,0,@DT), 0)) and convert(date,DATEADD(ms,-3,DATEADD(mm, DATEDIFF(m,0,@DT)+1, 0))) group by OrderChannel

--
		select SUM(TotalAmount/1.15) as total from invoice where Store = 'auckland' and  TimeCreated between  CONVERT(datetime,CONVERT(char(8),getdate(),120)+'1') and getdate()
Declare @DT as Datetime = dbo.GetNzDate();
		select SUM(TotalAmount/1.15) as total from invoice where Store = 'auckland' and  TimeCreated between  CONVERT(datetime,CONVERT(char(8),@DT,120)+'1') and @DT


 set statistics io on
 set statistics time on
--
select 

(select case when sum(salesorderlineQuantity)>0 then sum(salesorderlineQuantity) else 0 end from salesorderline where SalesOrderLineItemRefFullName=iteminventory.name 

and  TimeCreated >=

    (CASE
        WHEN MONTH(getdate()) BETWEEN 1  AND 3  THEN concat(year(getdate()), '-01-01 00:00:00')
        WHEN MONTH(getdate()) BETWEEN 4  AND 6  THEN concat(year(getdate()), '-04-01 00:00:00')
        WHEN MONTH(getdate()) BETWEEN 7  AND 9  THEN concat(year(getdate()), '-07-01 00:00:00')
        WHEN MONTH(getdate()) BETWEEN 10 AND 12 THEN concat(year(getdate()), '-10-01 00:00:00')
    END)  and TimeCreated <=


    (CASE
        WHEN MONTH(getdate()) BETWEEN 1  AND 3  THEN concat(year(getdate()), '-03-31 23:59:59')
        WHEN MONTH(getdate()) BETWEEN 4  AND 6  THEN concat(year(getdate()), '-06-30 23:59:59')
        WHEN MONTH(getdate()) BETWEEN 7  AND 9  THEN concat(year(getdate()), '-09-30 23:59:59')
        WHEN MONTH(getdate()) BETWEEN 10 AND 12 THEN concat(year(getdate()), '-12-31 23:59:59')
    END) ) as Q0SoldQty, *
 from iteminventory  order by LastReorderDate DESC


 Declare @DT as Datetime = dbo.GetNzDate();
 select 

(select case when sum(salesorderlineQuantity)>0 then sum(salesorderlineQuantity) else 0 end from salesorderline where SalesOrderLineItemRefFullName=iteminventory.name 

and  TimeCreated >=

    (CASE
        WHEN MONTH(@DT) BETWEEN 1  AND 3  THEN concat(year(@DT), '-01-01 00:00:00')
        WHEN MONTH(@DT) BETWEEN 4  AND 6  THEN concat(year(@DT), '-04-01 00:00:00')
        WHEN MONTH(@DT) BETWEEN 7  AND 9  THEN concat(year(@DT), '-07-01 00:00:00')
        WHEN MONTH(@DT) BETWEEN 10 AND 12 THEN concat(year(@DT), '-10-01 00:00:00')
    END)  and TimeCreated <=


    (CASE
        WHEN MONTH(@DT) BETWEEN 1  AND 3  THEN concat(year(@DT), '-03-31 23:59:59')
        WHEN MONTH(@DT) BETWEEN 4  AND 6  THEN concat(year(@DT), '-06-30 23:59:59')
        WHEN MONTH(@DT) BETWEEN 7  AND 9  THEN concat(year(@DT), '-09-30 23:59:59')
        WHEN MONTH(@DT) BETWEEN 10 AND 12 THEN concat(year(@DT), '-12-31 23:59:59')
    END) ) as Q0SoldQty, *




 from iteminventory  order by LastReorderDate DESC


 --
  select year(getdate())
 Declare @DT as Datetime = dbo.getnzdate();
 select year(@DT)




select OldToNewBin.new as NEWBIN,t1.* ,d.Picker as PICKER,d.PickState as PICKED,d.Checker as CHECKER,d.CheckState as CHECKED ,d.Packer as PACKER, d.PackState as PACKED   from (
    select     
	c.CustomFieldPrice3Comments AS BIN , 
    c.parentreffullname as PARENTREFFULLNAME,	
	c.Name AS CODE,	
	c.SalesDesc AS DESCRIPTION, 
	so.RefNumber AS SALESORDER,
	b.SalesOrderLineSeqID  as SalesOrderLineSeqNo,
	datediff(dd,so.TxnDate,getdate()) as DAYS,
	concat(cast( round( 1*1.00 / (select count(*) from Salesorderline where SalesOrderLineInvoiced<SalesOrderLineQuantity and RefNumber=so.RefNumber and SalesOrderLineItemRefFullName<>'Freight')   ,2)*100 as int),'%') as PERCENTS,
    cast( b.SalesOrderLineQuantity-b.SalesOrderLineInvoiced as int) AS QTY,
	cast( c.QuantityOnHand   as numeric(36,2))  AS STOCK,  	 
				 
	(SELECT STRING_AGG( ISNULL(SUBSTRING(REPLACE(PurchaseOrderLineQuantity,'.00000','') ,0,11),'N/A'), ',')  AS orderqty 
	   FROM PurchaseOrderLine p 
	   WHERE p.PurchaseOrderLineItemRefListID= B.SalesOrderLineItemRefListID and
	         PatIndex('%[a-z]%', lower(PurchaseOrderLineQuantity)) !> 0   and	       
			 p.IsManuallyClosed !='True' and cast(p.PurchaseOrderLineReceivedQuantity as float)=0 and  B.SalesOrderLineItemRefListID is not null )    AS ONPURCHASE,
			 
	(select STRING_AGG( ISNULL(SUBSTRING(ExpectedDate,0,11),'N/A'), ',')  as ExpectedDate   from purchaseorderline where PurchaseOrderLineItemRefListID= B.SalesOrderLineItemRefListID and  IsManuallyClosed !=1  and cast(PurchaseOrderLineReceivedQuantity as float)=0 )  as  ETA,		 
	 
	( SELECT  CAST(sum( SalesOrderLineQuantity - SalesOrderLineInvoiced)  AS INT)
	        FROM  SalesOrderLine   
	        WHERE SalesOrderLine.SalesOrderLineItemRefListID= B.SalesOrderLineItemRefListID and  
			      IsFullyInvoiced=0  and  IsManuallyClosed=0  and
				  SalesOrderLineQuantity>SalesOrderLineInvoiced ) AS ONSALES,
				  
    so.CustomerRefFullName as CUSTOMERREFFULLNAME,
	CONCAT(so.ShipAddressLine1, so.ShipAddressLine2, so.ShipAddressDistrict, so.ShipAddressCity, so.ShipAddressRegion) as NAMEAREA,
    b.ShipMethodRefFullName  as SHIPPINGMETHOD,
	so.CustomFieldEmail as COMMENT 	
	FROM Salesorder  so, Salesorderline b , ItemInventory c   	    	     
	where 
	so.store='auckland' and 	   
	      cast( c.QuantityOnHand   as numeric(36,2))>=0	
		and so.RefNumber=b.RefNumber 
		and so.status not in ('fully_canceled','fully_invoiced','delivered','close')		
		and b.SalesOrderLineQuantity > b.SalesOrderLineInvoiced 
		and b.SalesOrderLineQuantity>0
		and b.SalesOrderLineItemRefFullName=c.name   
	    and c.name !='Freight'
	) as t1 LEFT JOIN OldToNewBin  ON (OldToNewBin.old= substring(t1.BIN,0,16))or(OldToNewBin.old= substring(t1.BIN,0,15))or(OldToNewBin.old= substring(t1.BIN,0,14))or(OldToNewBin.old= substring(t1.BIN,0,13))or
    (OldToNewBin.old= substring(t1.BIN,0,12))or(OldToNewBin.old= substring(t1.BIN,0,11))or(OldToNewBin.old= substring(t1.BIN,0,10))or(OldToNewBin.old= substring(t1.BIN,0,9))or(OldToNewBin.old= substring(t1.BIN,0,8))
    or(OldToNewBin.old= substring(t1.BIN,0,7))or(OldToNewBin.old= substring(t1.BIN,0,6))or(OldToNewBin.old= substring(t1.BIN,0,5))
    left join DispatchingPrepare d on ( t1.SALESORDER = d.SalesRefnumber and t1.code = d.Sku)