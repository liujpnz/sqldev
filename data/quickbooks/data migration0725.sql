
--move data from linked server
select * into SalesOrderLinkedTxn_raw  from [192.168.20.114].DataCenter.dbo.SalesOrderLinkedTxn_raw


use DataCenter

select count(*) From Salesorder; --119273
select count(*) from SalesOrderLine --591424
select count(*) from Invoice; --126662
select count(*) from InvoiceLine; --682826
select count(*) from SalesOrderLinkedTxn_raw;  --122143
go


--salesorder
alter table salesorder add constraint pk_salesorder primary key (txnid);
go

--salesorderline 
--alter table salesorderline drop constraint pk_salesorderline;
alter table salesorderline alter column txnid varchar(36) not null  ;
alter table salesorderline alter column SalesOrderLineSeqNo int not null  ;
alter table salesorderline add constraint pk_salesorderline primary key (txnid,SalesOrderLineSeqNo)
go

--invoice
alter table invoice add constraint pk_invoice primary key (txnid);
go

--invoiceline
alter table invoiceline alter column txnid varchar(36) not null  ;
alter table invoiceline alter column InvoiceLineSeqNo int not null  ;
alter table invoiceline add constraint pk_invoiceline primary key (txnid,InvoiceLineSeqNo);
go

--
select * from SalesOrderLinkedTxn_raw
alter table SalesOrderLinkedTxn_raw alter column txnid varchar(36) not null

--foreign key
alter table salesorderline add constraint fk_salesorderline foreign key (txnid) references salesorder(txnid);
alter table invoiceline add constraint fk_invoiceline foreign key (txnid) references invoice(txnid); --?

alter table SalesOrderLinkedTxn_raw add constraint FK_SalesOrderLinkedTxn_raw_Salesorder foreign key (txnid) references salesorder(txnid) --??

--line info has, invoice info miss
select distinct l.txnid from invoice i right join invoiceline l on i.TxnID=l.TxnID where i.txnid is null

--invoice has, line info miss
select distinct i.txnid from invoice i left join invoiceline l on i.TxnID=l.TxnID where l.txnid is null


--
select * from Salesorder where txnid='84FDD3-1520290317'
select * from Invoice where txnid in ('85D73A-1520629790','897547-1522043925')
select * from SalesOrderLinkedTxn_raw

TxnID	LinkedTxnSeqNo	LinkedTxnTxnID	LinkedTxnTxnType	LinkedTxnTxnDate	LinkedTxnRefNumber	LinkedTxnLinkType	LinkedTxnAmount
84FDD3-1520290317	1	85D73A-1520629790	Invoice	2018-3-10	140294	AMTTYPE	-733.00
84FDD3-1520290317	2	897547-1522043925	Invoice	2018-3-26	143878	AMTTYPE	-649.00

select s.TxnID,s.RefNumber as sref,s.BillAddressAddr1,s.Subtotal,l.txnID,l.LinkedTxnSeqNo,i.TxnID,i.RefNumber as iref,i.BillAddressAddr1,i.Subtotal
from SalesOrderLinkedTxn_raw l, Salesorder s,Invoice i
where l.txnid=s.txnid and l.LinkedTxnTxnID=i.TxnID 
--and s.txnid='84FDD3-1520290317'
order by 1,2




use DataCenter
select * from SalesOrderLinkedTxn order by 1,10

use DatawarehouseDB

--todo
--bak tables
select * into Saleorder_bak0725 from Salesorder;
select * into Saleorderline_bak0725 from SalesorderLine;
select * into invoice_bak0725 from Invoice;
select * into invoiceline_bak0725 from Invoiceline; 

select count(*) from Salesorder;  --21721
select count(*) from SalesorderLine; --66226
select count(*) from Invoice; --22088
select count(*) from Invoiceline; --76312

select * from DataCenter.dbo.Salesorder
select * from DatawarehouseDB.dbo.Salesorder

--add columns
alter table DatawarehouseDB.dbo.salesorder add importTxnid varchar(36);
alter table DatawarehouseDB.dbo.invoice add importTxnid varchar(36);
alter table DatawarehouseDB.dbo.invoice alter column refnumber varchar(50);
alter table DatawarehouseDB.dbo.invoiceline alter column refnumber varchar(50);

--identity reseed
use DatawarehouseDB
dbcc checkident('Salesorder',reseed,-1000000)
select IDENT_CURRENT('Salesorder') as curr,IDENT_INCR('Salesorder') as incr,IDENT_SEED('Salesorder') as seed 
--25920

dbcc checkident('Salesorderline',reseed,-1000000)
select IDENT_CURRENT('Salesorderline') as curr,IDENT_INCR('Salesorderline') as incr,IDENT_SEED('Salesorderline') as seed 
--225134

dbcc checkident('Invoice',reseed,-1000000)
select IDENT_CURRENT('Invoice') as curr,IDENT_INCR('Invoice') as incr,IDENT_SEED('Invoice') as seed 
--25140

dbcc checkident('Invoiceline',reseed,-1000000)
select IDENT_CURRENT('Invoiceline') as curr,IDENT_INCR('Invoiceline') as incr,IDENT_SEED('Invoiceline') as seed 
--88469

--disable trigger
ALTER TABLE [DatawarehouseDB].[dbo].[Salesorder] DISABLE TRIGGER [Salesorder_AutoGenerateRefnumber];
ALTER TABLE [DatawarehouseDB].[dbo].[Salesorder] DISABLE TRIGGER [AutoSalesorder_TimeModified];

ALTER TABLE [DatawarehouseDB].[dbo].[Invoice] DISABLE TRIGGER [Invoice_AutoGenerateRefnumber];
ALTER TABLE [DatawarehouseDB].[dbo].[Invoice] DISABLE TRIGGER [AutoInvoice_TimeModified];

ALTER TABLE [DatawarehouseDB].[dbo].[Invoiceline] DISABLE TRIGGER [AutoInvoiceline_TimeModified];

ALTER TABLE [DatawarehouseDB].[dbo].[Salesorderline] DISABLE TRIGGER [AutoSalesorderline_TimeModified];



--insert into salesorder
select top 5 * from DatawarehouseDB.dbo.Salesorder;
select top 5 * from DataCenter.dbo.Salesorder;

select top 5 * from DataCenter.dbo.Salesorder where refnumber='23600';
select refnumber,count(*) as num from DataCenter.dbo.Salesorder group by RefNumber order by 2 desc

select top 5 TimeCreated,TimeModified,TxnDate,RefNumber,BillAddressLine1,SalesRepRefFullName,Subtotal,TotalAmount,IsFullyInvoiced from DatawarehouseDB.dbo.Salesorder;
select top 5  TimeCreated,TimeModified,TimeCreated,CustomerRefListID,CustomerRefFullName, format(TxnDate,'yyyy-MM-dd'),'HS'+RefNumber,BillAddressBlockAddr1,BillAddressBlockAddr2,BillAddressBlockAddr3,BillAddressBlockAddr4,BillAddressBlockAddr5,Billaddresscity,'NZ',BillAddressPostalCode,ShipAddressBlockAddr1,ShipAddressBlockAddr2,ShipAddressBlockAddr3,ShipAddressBlockAddr4,ShipAddressPostalCode,SalesRepRefListID, SalesRepRefFullName,FOB,format(ShipDate,'yyyy-MM-dd'),ShipMethodRefListID,ShipMethodRefFullName,Subtotal,TotalAmount,ItemSalesTaxRefListID,ItemSalesTaxRefFullName,IsManuallyClosed,IsFullyInvoiced,Memo,CustomerMsgRefListID,CustomerMsgRefFullName,IsToBePrinted,IsToBeEmailed,CustomFieldBarcode,'fully_invoiced',1,SalesTaxTotal,0,0,0,'reckon',CustomerTaxCodeRefFullName,CustomerRefListID,'auckland',1,'auckland',TxnID from DataCenter.dbo.Salesorder;

--insert salesorder with new id
with temp as
(
select refnumber,count(*) as num from DataCenter.dbo.Salesorder group by RefNumber having count(*)=1
) 
insert into DatawarehouseDB.dbo.Salesorder(TimeCreated,TimeModified,timeapproved,CustomerRefListID,CustomerRefFullName,TxnDate,RefNumber,Billpersonfullname,BillAddressLine1,BillAddressLine2,BillpersonTelephone,BillpersonMobile,BilladdressCity,Billaddresscountry,BillAddressPostalCode,shippersonfullname,shippersontelephone,shipaddressline1,shipaddressline2,ShipAddressPostalCode,SalesRepRefListID,SalesRepRefFullName,trackingNumber,ShipDate,ShipMethodRefListID,ShipMethodRefFullName,Subtotal,TotalAmount,ItemSalesTaxRefListID,ItemSalesTaxRefFullName,IsManuallyClosed,IsFullyInvoiced,Memo,CustomerMsgRefListID,CustomerMsgRefFullName,IsToBePrinted,IsToBeEmailed,CustomerFieldBarcode,"status",isapproved,SalesTaxTotal,discountamount,totalreceivedPayment,totalrefund,orderchannel,taxcode,store,subscribe,fulfilstorelocation,importTxnid) 
select TimeCreated,TimeModified,TimeCreated,CustomerRefListID,CustomerRefFullName, format(TxnDate,'yyyy-MM-dd'),'HS'+s.RefNumber,BillAddressBlockAddr1,BillAddressBlockAddr2,BillAddressBlockAddr3,BillAddressBlockAddr4,BillAddressBlockAddr5,Billaddresscity,'NZ',BillAddressPostalCode,ShipAddressBlockAddr1,ShipAddressBlockAddr2,ShipAddressBlockAddr3,ShipAddressBlockAddr4,ShipAddressPostalCode,SalesRepRefListID, SalesRepRefFullName,FOB,format(ShipDate,'yyyy-MM-dd'),ShipMethodRefListID,ShipMethodRefFullName,Subtotal,TotalAmount,ItemSalesTaxRefListID,ItemSalesTaxRefFullName,IsManuallyClosed,IsFullyInvoiced,Memo,CustomerMsgRefListID,CustomerMsgRefFullName,IsToBePrinted,IsToBeEmailed,CustomFieldBarcode,'fully_invoiced',1,SalesTaxTotal,0,0,0,'reckon',CustomerTaxCodeRefFullName,'auckland',1,'auckland',TxnID from DataCenter.dbo.Salesorder s,temp 
	where s.RefNumber=temp.refnumber
go




select * from DatawarehouseDB.dbo.Salesorder where id<0
go

--insert invoice with new id
select top 5 * from  DatawarehouseDB.dbo.Invoice;
select top 5 * from  DataCenter.dbo.Invoice;


select max(len(refnumber)) from  DataCenter.dbo.Invoice;

--insert invoice
with temp as
(
--only import distinct refnumber
select refnumber,count(*) as num from DataCenter.dbo.Invoice group by RefNumber  having count(*)=1
) 
insert into DatawarehouseDB.dbo.Invoice(TimeCreated,TimeModified,CustomerRefListID,CustomerRefFullName,TxnDate,SalesorderRefNumber,RefNumber,BillPersonFullName,BillAddressLine1,BillAddressLine2,BillPersonTelephone,BillPersonMobile,BillAddressCity,BillAddressCountry,BillAddressPostalCode,ShipPersonFullName,ShipPersonTelephone,ShipAddressLine1,ShipAddressLine2,ShipAddressPostalCode,ReckonNumber,SalesRepRefListID,SalesRepRefFullName,FOB,ShipDate,ShipMethodRefListID,ShipMethodRefFullName,Subtotal,AppliedAmount,BalanceRemaining,Memo,IsPaid,CustomerMsgRefListID,CustomerMsgRefFullName,IsTobePrinted,IsTobeEmailed,Status,IsEmailSent,TrackingNumber,IsSavedInReckon,SalesTaxTotal,TotalAmount,DiscountAmount,Taxcode,OrderChannel,Store,importTxnid) 
select  i.TimeCreated,i.TimeModified,i.CustomerRefListID,i.CustomerRefFullName,format(i.TxnDate,'yyyy-MM-dd'),s.RefNumber,'HI'+i.RefNumber,i.BillAddressBlockAddr1,i.BillAddressBlockAddr2,i.BillAddressBlockAddr3,i.BillAddressBlockAddr4,i.BillAddressBlockAddr5,i.Billaddresscity,'NZ',i.BillAddressPostalCode,i.ShipAddressBlockAddr1,i.ShipAddressBlockAddr2,i.ShipAddressBlockAddr3,i.ShipAddressBlockAddr4,i.ShipAddressPostalCode,i.RefNumber,i.SalesRepRefListID,i.SalesRepRefFullName,i.FOB,i.ShipDate,i.ShipMethodRefListID,i.ShipMethodRefFullName,i.Subtotal,i.AppliedAmount,i.BalanceRemaining,i.Memo,i.IsPaid,i.CustomerMsgRefListID,i.CustomerMsgRefFullName,i.IsToBePrinted,i.IsToBeEmailed,'delivered',0,i.FOB,0 ,i.SalesTaxTotal,i.subtotal*1.15,0,i.CustomerTaxCodeRefFullName,'reckon','auckland',i.Txnid from DataCenter.dbo.Invoice i,DataCenter.dbo.SalesOrderLinkedTxn_raw l, DatawarehouseDB.dbo.Salesorder s, temp
	where i.TxnID=l.LinkedTxnTxnID and s.importTxnid=l.TxnID and i.RefNumber=temp.RefNumber


SELECT TimeCreated,TimeModified,CustomerRefListID,CustomerRefFullName,TxnDate,SalesorderRefNumber,RefNumber,BillPersonFullName,BillAddressLine1,BillAddressLine2,BillPersonTelephone,BillPersonMobile,BillAddressCity,BillAddressCountry,BillAddressPostalCode,ShipPersonFullName,ShipPersonTelephone,ShipAddressLine1,ShipAddressLine2,ShipAddressPostalCode,ReckonNumber,SalesRepRefListID,SalesRepRefFullName,FOB,ShipDate,ShipMethodRefListID,ShipMethodRefFullName,Subtotal,AppliedAmount,BalanceRemaining,Memo,IsPaid,CustomerMsgRefListID,CustomerMsgRefFullName,IsTobePrinted,IsTobeEmailed,Status,IsEmailSent,TrackingNumber,IsSavedInReckon,SalesTaxTotal,TotalAmount,DiscountAmount,Taxcode,OrderChannel,Store,importTxnid FROM DatawarehouseDB.dbo.Invoice
SELECT TimeCreated,TimeModified,CustomerRefListID,CustomerRefFullName,format(TxnDate,'yyyy-MM-dd'),s.RefNumber,'HI'+i.RefNumber,BillAddressBlockAddr1,BillAddressBlockAddr2,BillAddressBlockAddr3,BillAddressBlockAddr4,BillAddressBlockAddr5,Billaddresscity,'NZ',BillAddressPostalCode,ShipAddressBlockAddr1,ShipAddressBlockAddr2,ShipAddressBlockAddr3,ShipAddressBlockAddr4,ShipAddressPostalCode,RefNumber,SalesRepRefListID,SalesRepRefFullName,FOB,ShipDate,ShipMethodRefListID,ShipMethodRefFullName,Subtotal,AppliedAmount,BalanceRemaining,Memo,IsPaid,CustomerMsgRefListID,CustomerMsgRefFullName,IsToBePrinted,IsToBeEmailed,'delivered',0,FOB,0 ,SalesTaxTotal,subtotal*1.15,0,CustomerTaxCodeRefFullName,'reckon','auckland', Txnid   FROM DataCenter.dbo.Invoice



select * from DatawarehouseDB.dbo.invoice where id<0



--insert salesorderline details with new salesorderid and refnumber
select top 5 * from DatawarehouseDB.dbo.Salesorder;
select top 5 * from DatawarehouseDB.dbo.Salesorderline;
select top 5 SalesOrderLineItemRefFullName,sku from DataCenter.dbo.SalesOrderLine;
select RefNumber,salesorderid,SalesOrderLineSeqID ,SalesOrderLineItemRefFullName,TimeCreated,TimeModified,SalesOrderLineQuantity,SalesOrderLineRate,SalesOrderLineAmount,Store from DatawarehouseDB.dbo.Salesorderline
select top 5 s.RefNumber,s.id,hl.SalesOrderLineSeqNo,hl.sku,hl.TimeCreated,hl.TimeModified,hl.SalesOrderLineQuantity,hl.SalesOrderLineRate,hl.SalesOrderLineAmount,'auckland' from DataCenter.dbo.SalesOrderLine hl, DatawarehouseDB.dbo.Salesorder s
where s.importTxnid=hl.TxnID;

--insert
insert into DatawarehouseDB.dbo.Salesorderline (TimeCreated,TimeModified,RefNumber,SalesOrderLineSeqID,SalesOrderLineItemRefListID,SalesOrderLineItemRefFullName,SalesOrderlinedesc,SalesOrderLineQuantity,SalesOrderLineOldRate,SalesOrderLineRate,SalesOrderLineAmount,SalesOrderLineTaxAmount,SalesOrderLineInvoiced,SalesOrderLinePrepareToInvoiceQuantity,SalesorderID,DiscountPercentage,DiscountAmount,IsManuallyClosed,Store)
select hl.TimeCreated,hl.TimeModified,s.RefNumber,hl.SalesOrderLineSeqNo,hl.SalesOrderLineItemRefListID,hl.sku,hl.SalesOrderLineItemRefFullName,hl.SalesOrderLineQuantity,hl.SalesOrderLineRate,hl.SalesOrderLineRate,hl.SalesOrderLineAmount,hl.salestaxtotal,hl.SalesOrderLineQuantity,0,s.id,0,0,0,'auckland' from DataCenter.dbo.SalesOrderLine hl, DatawarehouseDB.dbo.Salesorder s
where s.importTxnid=hl.TxnID;


SELECT TimeCreated,TimeModified,RefNumber,SalesOrderLineSeqID,SalesOrderLineItemRefListID,SalesOrderLineItemRefFullName,SalesOrderlinedesc,SalesOrderLineQuantity,SalesOrderLineOldRate,SalesOrderLineRate,SalesOrderLineAmount,SalesOrderLineTaxAmount,SalesOrderLineInvoiced,SalesOrderLinePrepareToInvoiceQuantity,SalesorderID,DiscountPercentage,DiscountAmount,IsManuallyClosed,Store FROM DatawarehouseDB.dbo.Salesorderline
SELECT hl.TimeCreated,hl.TimeModified,s.RefNumber,hl.SalesOrderLineSeqNo,hl.SalesOrderLineItemRefListID,hl.sku,hl.SalesOrderLineItemRefFullName,hl.SalesOrderLineQuantity,hl.SalesOrderLineRate,hl.SalesOrderLineRate,hl.SalesOrderLineAmount,hl.salestaxtotal,hl.SalesOrderLineQuantity,0,s.id,0,0,0,'auckland' FROM DataCenter.dbo.SalesOrderLine  hl 
  
SELECT TimeCreated,TimeModified,s.RefNumber,hl.SalesOrderLineSeqNo,SalesOrderLineItemRefListID,sku,SalesOrderLineItemRefFullName,SalesOrderLineQuantity, SalesOrderLineRate, SalesOrderLineRate,SalesOrderLineAmount,salestaxtotal,SalesOrderLineQuantity,0, **??,0,0,0,'auckland' ,Sku FROM DataCenter.dbo.SalesOrderLine  

select id,RefNumber,salesorderid,SalesOrderLineSeqID ,SalesOrderLineItemRefFullName,TimeCreated,TimeModified,SalesOrderLineQuantity,SalesOrderLineRate,SalesOrderLineAmount,Store from DatawarehouseDB.dbo.Salesorderline where id<0;

--insert invoiceline details
select top 5 * from DatawarehouseDB.dbo.Invoice;
select top 5 * from DatawarehouseDB.dbo.Invoiceline;
select top 5  * from DataCenter.dbo.InvoiceLine;

select TimeCreated,TimeModified,RefNumber,InvoiceLineSeqID,InvoiceLineQuantity,InvoiceLineRate,InvoiceLineAmount,InvoiceID,Store from DatawarehouseDB.dbo.Invoiceline;
select hl.TimeCreated,hl.TimeModified,i.RefNumber,hl.InvoiceLineSeqNo,hl.InvoiceLineQuantity,hl.InvoiceLineRate,hl.InvoiceLineAmount,i.id,'auckland' from DataCenter.dbo.InvoiceLine hl, DatawarehouseDB.dbo.Invoice i
where i.importTxnid=hl.TxnID

--insert
insert into DatawarehouseDB.dbo.Invoiceline(TimeCreated,TimeModified,RefNumber,InvoiceLineSeqID,InvoiceLineItemFullName,InvoiceLineQuantity,InvoiceLineRate,InvoiceLineAmount,InvoiceLineTaxAmount,InvoiceID,InvoiceLineOldRate,DiscountPercentage,DiscountAmount,Memo,Store) 
select hl.TimeCreated,hl.TimeModified,i.RefNumber,hl.InvoiceLineSeqNo,hl.InvoiceLineItemRefFullName,hl.InvoiceLineQuantity,hl.InvoiceLineRate,hl.InvoiceLineAmount,hl.salestaxtotal,i.id,hl.InvoiceLineRate,0,0,hl.Memo,'auckland' from DataCenter.dbo.InvoiceLine hl, DatawarehouseDB.dbo.Invoice i
where i.importTxnid=hl.TxnID


SELECT TimeCreated,TimeModified,RefNumber,InvoiceLineSeqID,InvoiceLineItemFullName,InvoiceLineQuantity,InvoiceLineRate,InvoiceLineAmount,InvoiceLineTaxAmount,InvoiceID,InvoiceLineOldRate,DiscountPercentage,DiscountAmount,Memo,Store  FROM DatawarehouseDB.dbo.Invoiceline

SELECT hl.TimeCreated,hl.TimeModified,i.RefNumber,hl.InvoiceLineSeqNo,hl.InvoiceLineItemRefFullName,hl.InvoiceLineQuantity,hl.InvoiceLineRate,hl.InvoiceLineAmount,hl.salestaxtotal,i.id,hl.InvoiceLineRate,0,0,hl.Memo,'auckland'  FROM DataCenter.dbo.InvoiceLine
  
select count(*) from DatawarehouseDB.dbo.invoiceline where id<0
  

select count(*) from DatawarehouseDB.dbo.Invoice


alter 
select USER_NAME(1),* from sys.all_objects where name like 'Salesorder_AutoGenerateRefnumber'


DECLARE @stxnid varchar(100)

DECLARE @itxnid varchar(100)

DECLARE @getProductID CURSOR SET @getProductID = CURSOR
FOR
SELECT ProductID
FROM Production.Product

OPEN @getProductID

FETCH NEXT
FROM @getProductID
INTO @ProductID

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @ProductID

	FETCH NEXT
	FROM @getProductID
	INTO @ProductID
END

CLOSE @getProductID

DEALLOCATE @getProductID
GO




--enable trigger
ALTER TABLE [DatawarehouseDB].[dbo].[Salesorder] ENABLE TRIGGER [Salesorder_AutoGenerateRefnumber];
ALTER TABLE [DatawarehouseDB].[dbo].[Salesorder] ENABLE TRIGGER [AutoSalesorder_TimeModified];

ALTER TABLE [DatawarehouseDB].[dbo].[Invoice] ENABLE TRIGGER [Invoice_AutoGenerateRefnumber];
ALTER TABLE [DatawarehouseDB].[dbo].[Invoice] ENABLE TRIGGER [AutoInvoice_TimeModified];

ALTER TABLE [DatawarehouseDB].[dbo].[Invoiceline] ENABLE TRIGGER [AutoInvoiceline_TimeModified];

ALTER TABLE [DatawarehouseDB].[dbo].[Salesorderline] ENABLE TRIGGER [AutoSalesorderline_TimeModified];








--tuning sql
SELECT sum(invoiceline.InvoiceLineAmount / 1.15) AS TotalAmount
	,datepart(week, getdate()) - datepart(week, invoice.TxnDate)
	,convert(VARCHAR, min(CONVERT(DATE, DATEADD(WEEK, DATEDIFF(WEEK, 0, invoice.TxnDate), 0)))) AS Monday
FROM Invoice
	,Invoiceline
	,ItemInventory
WHERE InvoiceID = invoice.Id
	AND Name = InvoiceLineItemFullName
	AND datepart(week, invoice.TxnDate) > datepart(week, getdate()) - 12
	AND ParentRefFullName LIKE 'Appliances%'
	AND invoice.Store = 'auckland'
	and invoice.id>0
GROUP BY datepart(week, invoice.TxnDate)
ORDER BY datepart(week, invoice.TxnDate)	


SELECT sum(SalesOrderLineQuantity - SalesOrderLineInvoiced) AS uninvoiced
FROM salesorderline
WHERE (SalesOrderLineQuantity - SalesOrderLineInvoiced) > 0



--create nonclustered index idx_invoiceline on invoiceline(invoiceid) include (InvoiceLineItemFullName,InvoiceLineAmount)
drop index idx_invoiceline on invoiceline

select count(distinct(so.id)) as number from salesorder   so 
				left join salesorderline cc
				 on cc.SalesorderID = so.id
				left join iteminventory dd
				 on dd.name = cc.SalesOrderLineItemRefFullName 

				where  (so.store = 'auckland') and  so.ordertype='BACKORDER' and so.status not in ('fully_canceled','fully_invoiced','delivered','close') and so.IsApproved=1	
				and 
				lower(cc.SalesOrderLineItemRefFullName)<>'freight'
							  and cc.SalesOrderLineQuantity > cc.SalesOrderLineInvoiced 
				and dd.QuantityOnHand >= (cc.SalesOrderLineQuantity - cc.SalesOrderLineInvoiced )

create nonclustered index idx_salesorderline on salesorderline(SalesorderID)


--create nonclustered index idx_invoice_txndate on invoice(txndate)
--drop index idx_invoice_txndate on invoice




--identity reseed
use DatawarehouseDB
dbcc checkident('Salesorder',reseed)
select IDENT_CURRENT('Salesorder') as curr,IDENT_INCR('Salesorder') as incr,IDENT_SEED('Salesorder') as seed 
--25920

dbcc checkident('Salesorderline',reseed)
select IDENT_CURRENT('Salesorderline') as curr,IDENT_INCR('Salesorderline') as incr,IDENT_SEED('Salesorderline') as seed 
--225134

dbcc checkident('Invoice',reseed)
select IDENT_CURRENT('Invoice') as curr,IDENT_INCR('Invoice') as incr,IDENT_SEED('Invoice') as seed 
--25140

dbcc checkident('Invoiceline',reseed)
select IDENT_CURRENT('Invoiceline') as curr,IDENT_INCR('Invoiceline') as incr,IDENT_SEED('Invoiceline') as seed 
--88469



--update customerID to 240
select CustomerID from Salesorder where id<0
update Salesorder set CustomerID=240 where id<0

select CustomerID from Invoice where id<0
update Invoice set CustomerID=240 where id<0


alter table salesorder alter column InvoiceRefNumber varchar(120)
with data as
(
select SalesorderRefNumber,STRING_AGG(RefNumber,',')+',' as num From invoice 
where id<0 and SalesorderRefNumber is not null GROUP BY SalesorderRefNumber
)
update Salesorder set InvoiceRefNumber=data.num  from salesorder join data on salesorder.RefNumber=data.SalesorderRefNumber where id<0



select TimeInvoiced from Salesorder where id<0
with data as
(
select SalesorderRefNumber,max(TimeCreated) as num From invoice 
where id<0 and SalesorderRefNumber is not null GROUP BY SalesorderRefNumber
)
update Salesorder set TimeInvoiced=data.num  from salesorder join data on salesorder.RefNumber=data.SalesorderRefNumber where id<0


----


select  from Invoice order by id desc
select InvoiceRefNumber from Salesorder order by id desc

select InvoiceRefNumber from Salesorder where id=25482
union all
select InvoiceRefNumber from salesorder where RefNumber='HS65955'
select RefNumber,* From invoice where SalesorderRefNumber in ('S35482','HS65955')

GROUP BY GroupName;
select STRING_AGG(RefNumber,'.')+'.' From invoice where SalesorderRefNumber='HS65955'

alter table salesorder alter column InvoiceRefNumber varchar(120)
with data as
(
select SalesorderRefNumber,STRING_AGG(RefNumber,',')+',' as num From invoice 
where id<0 and SalesorderRefNumber is not null GROUP BY SalesorderRefNumber
)
update Salesorder set InvoiceRefNumber=data.num  from salesorder join data on salesorder.RefNumber=data.SalesorderRefNumber where id<0



select TimeInvoiced from Salesorder where id<0
with data as
(
select SalesorderRefNumber,max(TimeCreated) as num From invoice 
where id<0 and SalesorderRefNumber is not null GROUP BY SalesorderRefNumber
)
update Salesorder set TimeInvoiced=data.num  from salesorder join data on salesorder.RefNumber=data.SalesorderRefNumber where id<0



select * from salesorder where RefNumber='HS65955'

select * From invoice where RefNumber='HI76998' ;

select SalesorderRefNumber,STRING_AGG(RefNumber,'.')+'.' as num, len(STRING_AGG(RefNumber,'.')+'.') From invoice 
where id<0 and SalesorderRefNumber is not null GROUP BY SalesorderRefNumber order by 3 desc


select count(*) from [192.168.20.213].DatawarehouseDB.dbo.iteminventory









--rollback

--check new rows
select * from Salesorder where  id <0 and txndate>getdate()-2;

select * from Salesorder where  id<0 and txndate>'2018-07-23';
select * from Invoice where  id<0 and txndate>'2018-07-23';




--delete inserted data
delete DatawarehouseDB.dbo.Salesorder where id<0
delete DatawarehouseDB.dbo.Salesorderline where id<0
delete DatawarehouseDB.dbo.Invoice where id<0
delete DatawarehouseDB.dbo.Invoiceline where id<0


or

use DatawarehouseDB
exec sp_rename 'dbo.table_oldname','newname'


