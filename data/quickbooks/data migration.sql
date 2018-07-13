
use DataCenter_Local

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
alter table salesorderline alter column   ;
alter table salesorderline add constraint pk_salesorderline primary key (txnid,SalesOrderLineSeqNo)
go

--invoice
alter table invoice add constraint pk_invoice primary key (txnid);
go

--invoiceline
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

select s.TxnID,l.LinkedTxnSeqNo,i.TxnID,s.RefNumber as sref,i.RefNumber as iref,s.BillAddressAddr1,i.BillAddressAddr1,s.Subtotal,i.Subtotal
from SalesOrderLinkedTxn_raw l, Salesorder s,Invoice i
where l.txnid=s.txnid and l.LinkedTxnTxnID=i.TxnID 
--and s.txnid='84FDD3-1520290317'
order by 1,2
 

