
  SELECT 'drop table dbo.' +name+';' FROM sys.objects WHERE  type in (N'U')  and schema_name(schema_id) in ('dbo','kpi') order by name
  SELECT 'drop view '+schema_name(schema_id)+'.' +name+';' FROM sys.objects WHERE  type in (N'V')  and schema_name(schema_id) in ('dbo','kpi') order by name

	select * from sys.views

for DMA
unselect user define function

	
	
  drop table dbo.Admin;
drop table dbo.AdminOnline;
drop table dbo.B2BCustomer;
drop table dbo.B2BPrice;
drop table dbo.BarcodeTemp;
drop table dbo.Bundle;
drop table dbo.BundleInvoiceLine;
drop table dbo.BundleLine;
drop table dbo.Category;
drop table dbo.CategorySales;
drop table dbo.ChrTransferLabelPrint;
drop table dbo.ChrTransferTable;
drop table dbo.ChrTransferTable2;
drop table dbo.ChrTransferTable3;
drop table dbo.ChrTransferTable4;
drop table dbo.ChrTransferTable5;
drop table dbo.ChrTransferTable6ZZZ;
drop table dbo.ChrTransferTable7NewSend0613;
drop table dbo.ChrTransferTable7NewSend0613backup;
drop table dbo.ChrTransferTableBundle;
drop table dbo.Configs;
drop table dbo.Container;
drop table dbo.ContainerLine;
drop table dbo.CreditNote;
drop table dbo.CreditNoteLine;
drop table dbo.Customer;
drop table dbo.DispatchingPrepare;
drop table dbo.Estimate;
drop table dbo.Estimateline;
drop table dbo.InventoryDetail;
drop table dbo.Invoice;

drop table dbo.Invoiceline;

drop table dbo.InvoiceSynLog;
drop table dbo.Issue;
drop table dbo.ItemCategory;
drop table dbo.ItemForecast;
drop table dbo.iteminventory;
drop table dbo.ItemInventoryStorage;
drop table dbo.ItemStock;
drop table dbo.OldToNewBin;
drop table dbo.phone;
drop table dbo.PrintLog;
drop table dbo.PurchaseOrder;
drop table dbo.PurchaseOrderLine;
drop table dbo.PurchaseOrderLineETA;
drop table dbo.[PurchaseOrderLine-old];
drop table dbo.[PurchaseOrder-old];
drop table dbo.PurchaseOrderReceiveAddress;
drop table dbo.PurchaseOrderReceiveItem;
drop table dbo.PurchaseSynLog;
drop table dbo.ReceivePayment;
drop table dbo.Region;
drop table dbo.Rid;


drop table dbo.Salesorder;
drop table dbo.Salesorderline;
drop table dbo.SalesRepresent;
drop table dbo.ScanItem;
drop table dbo.Sheet1;
drop table dbo.StockAdjustment;
drop table dbo.StockCheck;
drop table dbo.StockTransfer;
drop table dbo.Supplier;
drop table dbo.InvoicePrepareToDeductStock;
drop table dbo.StockTransferUpload;

drop table dbo.useractionbackup;
drop table dbo.UserActionLog;
drop table dbo.Vendors;
drop table dbo.Warehouse;
drop table dbo.BinLocation;
drop table kpi.DimDate;


drop view kpi.InvoicebyStaff;
drop view dbo.item_eta;
drop view kpi.PointDetails;
drop view kpi.PointSummary;
drop view kpi.SalesbyB2B;
drop view kpi.SalesbyCategory;
drop view kpi.SalesbyChannel;
drop view kpi.SalesbyCustomer;
drop view kpi.SalesbyRep;
drop view kpi.SalesbySubCategory;
drop view kpi.SalesbyWarehouseStaff;
drop view kpi.V_Reordering;
drop view dbo.v_sales_current_category;

drop schema kpi
