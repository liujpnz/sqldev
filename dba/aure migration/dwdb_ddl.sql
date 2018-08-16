/******** DMA Schema Migration Deployment Script      Script Date: 13/08/2018 8:15:47 p.m. ********/
-- 7 object(s) with recommendations identified during assessment. Please review these objects before deploying.

/****** Object:  Schema [kpi]    Script Date: 13/08/2018 8:15:43 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'kpi')
EXEC sys.sp_executesql N'CREATE SCHEMA [kpi]'

GO
/****** Object:  Table [dbo].[BinLocation]    Script Date: 13/08/2018 8:15:43 p.m. ******/
/**
Assessment issue: Deprecated data types TEXT, IMAGE or NTEXT
Categories: Compatibility, Deprecated
Applicable compatibility levels: CompatLevel140
Impact: These data types are checked as deprecated. In some cases, using TEXT, IMAGE or NTEXT might harm performance.
Impact details: Object dbo.BinLocation.Note uses deprecated data type TEXT, IMAGE or NTEXT which will be discontinued for future versions of SQL Server. For more details, please see: Line 10, Column 5.
Recommendation: Deprecated data types are marked to be discontinued on next versions of SQL Server, should use new data types such as: (varchar(max), nvarchar(max), varbinary(max) and etc.)
More information: ntext, text, and image (Transact-SQL) (https://go.microsoft.com/fwlink/?LinkId=798558)
 **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BinLocation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BinLocation](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [LineNumber] [varchar](100) COLLATE Latin1_General_CI_AS NULL,
 [ColumnNumber] [varchar](10) COLLATE Latin1_General_CI_AS NULL,
 [LayerNumber] [varchar](4) COLLATE Latin1_General_CI_AS NULL,
 [BinLocation] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PalletQuantity] [int] NULL,
 [PalletModel] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [DefaultSKU] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Note] [text] COLLATE Latin1_General_CI_AS NULL,
 [MaxSKUQty] [int] NULL,
 [WarehouseID] [int] NULL,
 [Warehouse] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Volume] [float] NULL,
 [Length] [float] NULL,
 [Width] [float] NULL,
 [Height] [float] NULL,
 CONSTRAINT [PK_Storage] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 13/08/2018 8:15:43 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PurchaseOrder](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [TimeCreated] [datetime2](3) NOT NULL,
 [TimeModified] [datetime2](3) NOT NULL,
 [TxnDate] [date] NULL,
 [RefNumber] [varchar](11) COLLATE Latin1_General_CI_AS NULL,
 [VendorName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressLine1] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressLine2] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorTelephone] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorMobile] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorEmail] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressDistrict] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressCity] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressRegion] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressCountry] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorPostalCode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressNote] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipEmail] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipTelephone] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipMobile] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressLine1] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressLine2] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressDistrict] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressCity] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressRegion] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressPostalCode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressCountry] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressNote] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [DueDate] [date] NULL,
 [ExpectedDate] [date] NULL,
 [ShipMethodRefListID] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipMethodRefFullName] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [FOB] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [TotalAmount] [float] NULL,
 [IsManuallyClosed] [bit] NULL,
 [IsFullyReceived] [bit] NULL,
 [Memo] [varchar](5000) COLLATE Latin1_General_CI_AS NULL,
 [VendorMsg] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [Status] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Timestamp] [timestamp] NULL,
 [ContainerNo] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ImportRefNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorRefFullName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorRefListID] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Terms] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [TrackingNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [DiscountAmount] [float] NULL,
 [PurchaseTaxtotal] [float] NULL,
 [SupplierTaxCode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [IsEmailed] [bit] NULL,
 [IsPrinted] [bit] NULL,
 [SupplierMessage] [varchar](550) COLLATE Latin1_General_CI_AS NULL,
 [SalesTaxTotal] [float] NULL,
 [ManufatureCode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Description] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [PurchaseCost] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ReckonNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [EstimateArrival] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [TxnNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressLine3] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressLine4] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [Container] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [Done] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [TotalReceiveAmount] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_PurchaseOrder_1] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[PurchaseOrderLine-old]    Script Date: 13/08/2018 8:15:43 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrderLine-old]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PurchaseOrderLine-old](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [TimeCreated] [datetime2](3) NOT NULL,
 [TimeModified] [datetime2](3) NOT NULL,
 [TxnDate] [date] NULL,
 [PurchaseOrderLineItemRefListID] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PurchaseOrderLineItemRefFullName] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [RefNumber] [varchar](11) COLLATE Latin1_General_CI_AS NULL,
 [PurchaseOrderLineDesc] [varchar](5000) COLLATE Latin1_General_CI_AS NULL,
 [PurchaseOrderLineQuantity] [float] NULL,
 [PurchaseOrderLineRate] [float] NULL,
 [PurchaseOrderLineOldRate] [float] NULL,
 [PurchaseOrderLineAmount] [float] NULL,
 [PurchaseOrderLineReceivedQuantity] [float] NULL,
 [PurchaseOrderLinesManyallyClosed] [float] NULL,
 [Status] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Timestamp] [timestamp] NULL,
 [PurchaseOrderID] [int] NULL,
 [Memo] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [DiscountPercentage] [float] NULL,
 [DiscountAmount] [float] NULL,
 [PurchaseOrderLineSeqID] [int] NULL,
 [PurchaseOrderLineInvoiced] [float] NULL,
 [IsManuallyClosed] [bit] NULL,
 [ExpectedDate] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Description] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [ManufactureCode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [TxnNumber] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [ImportRefNumber] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [PurchaseOrderLineTxnLineID] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [Container] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [QtyArrived] [float] NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BackOrder] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [UsdCost] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [UsdCostRate] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Done] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ReceiveAmount] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_PurchaseOrderLine] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrderLine-old]') AND name = N'IX_PurchaseOrderLine')
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderLine] ON [dbo].[PurchaseOrderLine-old]
(
 [PurchaseOrderLineItemRefFullName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrderLine-old]') AND name = N'IX_PurchaseOrderLine_1')
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderLine_1] ON [dbo].[PurchaseOrderLine-old]
(
 [ExpectedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PurchaseOrderLine_TimeCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PurchaseOrderLine-old] ADD  CONSTRAINT [DF_PurchaseOrderLine_TimeCreated]  DEFAULT (dbo.GetNzDate()) FOR [TimeCreated]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PurchaseOrderLine_TimeModified]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PurchaseOrderLine-old] ADD  CONSTRAINT [DF_PurchaseOrderLine_TimeModified]  DEFAULT (dbo.GetNzDate()) FOR [TimeModified]
END

GO
/****** Object:  Table [dbo].[Container]    Script Date: 13/08/2018 8:15:43 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Container]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Container](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [TimeCreated] [datetime] NOT NULL,
 [Container] [varchar](150) COLLATE Latin1_General_CI_AS NOT NULL,
 [PurchaseOrder] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Delivery] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Demurrage] [date] NULL,
 [EtaPort] [date] NULL,
 [EtaTD] [date] NULL,
 [Detention] [date] NULL,
 [StatusDate] [date] NULL,
 [MainStatus] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [SubStatus] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Location] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [DoorDirection] [varchar](255) COLLATE Latin1_General_CI_AS NULL,
 [Type] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipDate] [date] NULL,
 [ShipTo] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Status] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Carrier] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Operator] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Supplier] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_Container] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Container_TimeCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Container] ADD  CONSTRAINT [DF_Container_TimeCreated]  DEFAULT (dbo.GetNzDate()) FOR [TimeCreated]
END

GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 13/08/2018 8:15:43 p.m. ******/
/**
Assessment issue: Deprecated data types TEXT, IMAGE or NTEXT
Categories: Compatibility, Deprecated
Applicable compatibility levels: CompatLevel140
Impact: These data types are checked as deprecated. In some cases, using TEXT, IMAGE or NTEXT might harm performance.
Impact details: Object dbo.Warehouse.Note uses deprecated data type TEXT, IMAGE or NTEXT which will be discontinued for future versions of SQL Server. For more details, please see: Line 10, Column 5.
Recommendation: Deprecated data types are marked to be discontinued on next versions of SQL Server, should use new data types such as: (varchar(max), nvarchar(max), varbinary(max) and etc.)
More information: ntext, text, and image (Transact-SQL) (https://go.microsoft.com/fwlink/?LinkId=798558)
 **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Warehouse]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Warehouse](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [WarehouseName] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [Address] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [City] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ColumnQuantity] [int] NULL,
 [RackQuantity] [int] NULL,
 [BinLocationAmount] [int] NULL,
 [PalletAmount] [int] NULL,
 [Note] [text] COLLATE Latin1_General_CI_AS NULL,
 [Store] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[PurchaseOrderLine]    Script Date: 13/08/2018 8:15:43 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrderLine]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PurchaseOrderLine](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [TimeCreated] [datetime2](3) NOT NULL,
 [TimeModified] [datetime2](3) NOT NULL,
 [TxnDate] [date] NULL,
 [PurchaseOrderLineItemRefListID] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PurchaseOrderLineItemRefFullName] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [RefNumber] [varchar](11) COLLATE Latin1_General_CI_AS NULL,
 [PurchaseOrderLineDesc] [varchar](5000) COLLATE Latin1_General_CI_AS NULL,
 [PurchaseOrderLineQuantity] [float] NULL,
 [PurchaseOrderLineRate] [float] NULL,
 [PurchaseOrderLineOldRate] [float] NULL,
 [PurchaseOrderLineAmount] [float] NULL,
 [PurchaseOrderLineReceivedQuantity] [float] NULL,
 [PurchaseOrderLinesManyallyClosed] [float] NULL,
 [Status] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Timestamp] [timestamp] NULL,
 [PurchaseOrderID] [int] NULL,
 [Memo] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [DiscountPercentage] [float] NULL,
 [DiscountAmount] [float] NULL,
 [PurchaseOrderLineSeqID] [int] NULL,
 [PurchaseOrderLineInvoiced] [float] NULL,
 [IsManuallyClosed] [bit] NULL,
 [ExpectedDate] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Description] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [ManufactureCode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [TxnNumber] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [ImportRefNumber] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [PurchaseOrderLineTxnLineID] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [Container] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [QtyArrived] [float] NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BackOrder] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [UsdCost] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [UsdCostRate] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Done] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ReceiveAmount] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [PurchaseOrderLineReceivedQuantityBackUp] [float] NULL,
 CONSTRAINT [PK_PurchaseOrderLine_1] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[Category]    Script Date: 13/08/2018 8:15:43 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Category](
 [id] [int] NOT NULL,
 [name] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [parent_id] [int] NULL,
 [sort_num] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
 [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 13/08/2018 8:15:43 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customer](
 [ID] [int] IDENTITY(1,1) NOT NULL,
 [CUSTOMERTYPE] [nvarchar](50) COLLATE Latin1_General_CI_AS NULL,
 [NAME] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [REFNUM] [float] NULL,
 [TIMESTAMP] [float] NULL,
 [BADDR1] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [BADDR2] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [BADDR3] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [BADDR4] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [BADDR5] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [SADDR1] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [SADDR2] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [SADDR3] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [SADDR4] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [SADDR5] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S1ADDR1] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S1ADDR2] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S1ADDR3] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S1ADDR4] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S1ADDR5] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S1ADDR6] [float] NULL,
 [S2ADDR1] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S2ADDR2] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S2ADDR3] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S2ADDR4] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S2ADDR5] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S2ADDR6] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S3ADDR1] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S3ADDR2] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S3ADDR3] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S3ADDR4] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S3ADDR5] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S3ADDR6] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S4ADDR1] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S4ADDR2] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S4ADDR3] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S4ADDR4] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S4ADDR5] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [S4ADDR6] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [SDEFAULTADDR1] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [SDEFAULTADDR2] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [SDEFAULTADDR3] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [SDEFAULTADDR4] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [SDEFAULTADDR5] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [SDEFAULTADDR6] [float] NULL,
 [PHONE1] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [PHONE2] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [FAXNUM] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [EMAIL] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [CC] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [NOTE] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [CONT1] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [CONT2] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [CTYPE] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [TERMS] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [TAXABLE] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [TAXCODE] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [TAXCOUNTRY] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [PREFERREDPAYMENT] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [PREFERREDSENDMETHOD] [float] NULL,
 [OBAMOUNT] [float] NULL,
 [OBDATE] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [LIMIT] [float] NULL,
 [REP] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [SALUTATION] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [COMPANYNAME] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [FIRSTNAME] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [LASTNAME] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [CUSTFLD1] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [CUSTFLD2] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [HIDDEN] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [DELCOUNT] [float] NULL,
 [PRICELEVEL] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [listid] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [isBlocked] [bit] NULL,
 [isActived] [bit] NULL,
 [OrderBy] [int] NULL,
 [auckland] [bit] NULL,
 [christchurch] [bit] NULL,
 [training] [bit] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
 [ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Customer_isBlocked]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_isBlocked]  DEFAULT ((0)) FOR [isBlocked]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Customer_isActived]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_isActived]  DEFAULT ((1)) FOR [isActived]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Customer_auckland]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_auckland]  DEFAULT ((1)) FOR [auckland]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Customer_christchurch]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_christchurch]  DEFAULT ((0)) FOR [christchurch]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Customer_training]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_training]  DEFAULT ((1)) FOR [training]
END

GO
/****** Object:  Table [dbo].[Issue]    Script Date: 13/08/2018 8:15:44 p.m. ******/
/**
Assessment issue: Deprecated data types TEXT, IMAGE or NTEXT
Categories: Compatibility, Deprecated
Applicable compatibility levels: CompatLevel140
Impact: These data types are checked as deprecated. In some cases, using TEXT, IMAGE or NTEXT might harm performance.
Impact details: Object dbo.Issue.Description uses deprecated data type TEXT, IMAGE or NTEXT which will be discontinued for future versions of SQL Server. For more details, please see: Line 4, Column 5.
Recommendation: Deprecated data types are marked to be discontinued on next versions of SQL Server, should use new data types such as: (varchar(max), nvarchar(max), varbinary(max) and etc.)
More information: ntext, text, and image (Transact-SQL) (https://go.microsoft.com/fwlink/?LinkId=798558)
 **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issue]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Issue](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [IssueType] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Description] [text] COLLATE Latin1_General_CI_AS NULL,
 [DueDate] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [TimeCreated] [datetime] NOT NULL,
 [Assignee] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Page] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [Status] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
 [Reporter] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_issue] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_issue_TimeCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Issue] ADD  CONSTRAINT [DF_issue_TimeCreated]  DEFAULT (dbo.GetNzDate()) FOR [TimeCreated]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_issue_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Issue] ADD  CONSTRAINT [DF_issue_Status]  DEFAULT ('pending') FOR [Status]
END

GO
/****** Object:  Table [dbo].[Sheet1]    Script Date: 13/08/2018 8:15:44 p.m. ******/
/**
Assessment issue: Deprecated data types TEXT, IMAGE or NTEXT
Categories: Compatibility, Deprecated
Applicable compatibility levels: CompatLevel140
Impact: These data types are checked as deprecated. In some cases, using TEXT, IMAGE or NTEXT might harm performance.
Impact details: Object dbo.Sheet1.result uses deprecated data type TEXT, IMAGE or NTEXT which will be discontinued for future versions of SQL Server. For more details, please see: Line 7, Column 5.
Recommendation: Deprecated data types are marked to be discontinued on next versions of SQL Server, should use new data types such as: (varchar(max), nvarchar(max), varbinary(max) and etc.)
More information: ntext, text, and image (Transact-SQL) (https://go.microsoft.com/fwlink/?LinkId=798558)
 **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sheet1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sheet1](
 [SKU] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [LANDED] [float] NULL,
 [ReckonMar31] [float] NULL,
 [TotalValue] [float] NULL,
 [itemid] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [result] [text] COLLATE Latin1_General_CI_AS NULL,
 [result2] [text] COLLATE Latin1_General_CI_AS NULL,
 [result3] [text] COLLATE Latin1_General_CI_AS NULL
)
END
GO
/****** Object:  Table [dbo].[CreditNoteLine]    Script Date: 13/08/2018 8:15:44 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditNoteLine]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CreditNoteLine](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [RefNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [CustomerRefListID] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [ARAccountRefListID] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [TxnDate] [date] NULL,
 [Memo] [varchar](2500) COLLATE Latin1_General_CI_AS NULL,
 [CreditNoteLineSeqID] [int] NULL,
 [CreditNoteLineItemName] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [CreditNoteLineDesc] [varchar](2500) COLLATE Latin1_General_CI_AS NULL,
 [CreditNoteLineQuantity] [float] NULL,
 [CreditNoteLineRate] [float] NULL,
 [CreditNoteLineOldRate] [float] NULL,
 [CreditNoteLineAmount] [float] NULL,
 [DiscountAmount] [float] NULL,
 [DiscountPercentage] [float] NULL,
 [FQSaveToCache] [int] NULL,
 [TotalAmount] [float] NULL,
 [CreditNoteID] [int] NULL,
 CONSTRAINT [PK_CreditNoteLine] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[ChrTransferTable6ZZZ]    Script Date: 13/08/2018 8:15:44 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChrTransferTable6ZZZ]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChrTransferTable6ZZZ](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [BundleSku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BundleDescription] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Descripton] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [StockOnHand] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PrimaryBinLocation] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [OtherBinLocation] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [QtyToSend] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ChristLocation] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PrintTimes] [int] NULL,
 [IndexLabel] [int] NULL,
 [DeleteLabel] [int] NULL,
 [Reckon] [varchar](150) COLLATE Latin1_General_CI_AS NULL
)
END
GO
/****** Object:  Table [dbo].[AdminOnline]    Script Date: 13/08/2018 8:15:44 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminOnline]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AdminOnline](
 [id] [int] IDENTITY(1,1) NOT NULL,
 [Name] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [LoginTime] [date] NULL,
 CONSTRAINT [PK_AdminOnline] PRIMARY KEY CLUSTERED 
(
 [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[InventoryDetail]    Script Date: 13/08/2018 8:15:44 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InventoryDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InventoryDetail](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [BinID] [int] NULL,
 [SKUID] [int] NULL,
 [SKUQty] [float] NULL,
 [Palletnumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BinLocation] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Qty] [float] NULL,
 CONSTRAINT [PK_InventoryDetails] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[ItemCategory]    Script Date: 13/08/2018 8:15:44 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ItemCategory](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [CategoryName] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [ParentId] [int] NULL,
 [NodeLevel] [int] NULL,
 [HasChild] [bit] NULL,
 [FullCategoryName] [varchar](1500) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_ItemCategory] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[UserActionLog]    Script Date: 13/08/2018 8:15:44 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserActionLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserActionLog](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [TimeCreated] [datetime] NULL,
 [Page] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [UserName] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [IpAddr] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_user_action_log] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserActionLog]') AND name = N'idx_useractionlog')
CREATE NONCLUSTERED INDEX [idx_useractionlog] ON [dbo].[UserActionLog]
(
 [Page] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserActionLog]') AND name = N'idx_useractionlog_time')
CREATE NONCLUSTERED INDEX [idx_useractionlog_time] ON [dbo].[UserActionLog]
(
 [TimeCreated] ASC
)
INCLUDE (  [UserName]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_UserActionLog_TimeCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UserActionLog] ADD  CONSTRAINT [DF_UserActionLog_TimeCreated]  DEFAULT (dbo.GetNzDate()) FOR [TimeCreated]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_UserActionLog_Page]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UserActionLog] ADD  CONSTRAINT [DF_UserActionLog_Page]  DEFAULT (dbo.GetNzDate()) FOR [Page]
END

GO
/****** Object:  Table [dbo].[Estimate]    Script Date: 13/08/2018 8:15:44 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Estimate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Estimate](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [TimeCreated] [datetime2](3) NOT NULL,
 [TimeModified] [datetime2](3) NOT NULL,
 [CustomerRefListID] [varchar](36) COLLATE Latin1_General_CI_AS NULL,
 [ImportRefNumber] [varchar](11) COLLATE Latin1_General_CI_AS NULL,
 [RefNumber] [varchar](11) COLLATE Latin1_General_CI_AS NULL,
 [SalesorderRefNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [TxnDate] [date] NULL,
 [BillPersonFullName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillPersonTelephone] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillPersonMobile] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillPersonFax] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressPostalCode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressCountry] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressRegion] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressCity] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressDistrict] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressLine1] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressLine2] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipPersonFullName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipPersonTelephone] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipPersonMobile] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipPersonFax] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressPostalCode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressCountry] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressRegion] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressCity] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressDistrict] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressLine1] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressLine2] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [DueDate] [date] NULL,
 [SalesRepRefListID] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [SalesRepRefFullName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [FOB] [varchar](20) COLLATE Latin1_General_CI_AS NULL,
 [Subtotal] [float] NULL,
 [ItemSalesTaxRefListID] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ItemSalesTaxRefFullName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [TotalAmount] [float] NULL,
 [Memo] [varchar](5000) COLLATE Latin1_General_CI_AS NULL,
 [CustomerMsgRefFullName] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [IsTobeEmailed] [bit] NULL,
 [DiscountAmount] [float] NULL,
 [DiscountPercentage] [float] NULL,
 [Status] [varchar](36) COLLATE Latin1_General_CI_AS NULL,
 [SalesTaxTotal] [float] NULL,
 [Seed] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [EftposAmount] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [CashAmount] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ReceiptNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Notes] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [CustomerEmail] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [shipping_method] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [shipping_region] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [freight_cost] [float] NULL,
 [ShipMethodRefFullName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [CustomerPONumber] [varchar](200) COLLATE Latin1_General_CI_AS NULL,
 [TaxCode] [nchar](10) COLLATE Latin1_General_CI_AS NULL,
 [CustomerId] [int] NULL,
 [OrderChannel] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [AmountIncludeTax] [bit] NULL,
 [ScheduleDate] [date] NULL,
 [Store] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_Estimate1] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Estimate_TimeCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Estimate] ADD  CONSTRAINT [DF_Estimate_TimeCreated]  DEFAULT (dbo.GetNzDate()) FOR [TimeCreated]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Estimate_TimeModified]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Estimate] ADD  CONSTRAINT [DF_Estimate_TimeModified]  DEFAULT (dbo.GetNzDate()) FOR [TimeModified]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Estimate_TxnDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Estimate] ADD  CONSTRAINT [DF_Estimate_TxnDate]  DEFAULT (dbo.GetNzDate()) FOR [TxnDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Estimate_DueDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Estimate] ADD  CONSTRAINT [DF_Estimate_DueDate]  DEFAULT (dbo.GetNzDate()) FOR [DueDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Estimate_Subtotal]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Estimate] ADD  CONSTRAINT [DF_Estimate_Subtotal]  DEFAULT ((0.0)) FOR [Subtotal]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Estimate_TotalAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Estimate] ADD  CONSTRAINT [DF_Estimate_TotalAmount]  DEFAULT ((0.0)) FOR [TotalAmount]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Estimate_DiscountAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Estimate] ADD  CONSTRAINT [DF_Estimate_DiscountAmount]  DEFAULT ((0.0)) FOR [DiscountAmount]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Estimate_DiscountPercentage]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Estimate] ADD  CONSTRAINT [DF_Estimate_DiscountPercentage]  DEFAULT ((0.0)) FOR [DiscountPercentage]
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[AutoEstimate_TimeModified]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:  <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE TRIGGER [dbo].[AutoEstimate_TimeModified]
   ON   [dbo].[Estimate]
   AFTER   UPDATE 
AS 
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;
 update [dbo].[Estimate]  
 set    [dbo].[Estimate].TimeModified = dbo.GetNzDate()  
 from   [dbo].[Estimate]   
 JOIN inserted  
 ON  [dbo].[Estimate].id = inserted.id  
  

END
' 
GO
ALTER TABLE [dbo].[Estimate] ENABLE TRIGGER [AutoEstimate_TimeModified]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Estimate_AutoGenerateRefnumber]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:  <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE TRIGGER [dbo].[Estimate_AutoGenerateRefnumber]
   ON   [dbo].[Estimate]
   AFTER   insert 
AS 
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;
  

 update [dbo].[Estimate]  
 set    [dbo].[Estimate].refnumber = ''E''+convert(varchar(20),10000+inserted.id)  
 from   [dbo].[Estimate]   
 JOIN inserted  
 ON  [dbo].[Estimate].id = inserted.id  

    -- Insert statements for trigger here

END
' 
GO
ALTER TABLE [dbo].[Estimate] ENABLE TRIGGER [Estimate_AutoGenerateRefnumber]
GO
/****** Object:  Table [dbo].[Salesorder]    Script Date: 13/08/2018 8:15:44 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Salesorder]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Salesorder](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [TimeCreated] [datetime2](3) NOT NULL,
 [TimeModified] [datetime2](3) NOT NULL,
 [TimeApproved] [datetime2](3) NULL,
 [TimeInvoiced] [datetime2](3) NULL,
 [CustomerRefListID] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [CustomerRefFullName] [varchar](360) COLLATE Latin1_General_CI_AS NULL,
 [TxnDate] [date] NULL,
 [ImportRefNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [EstimateRefNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [RefNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [InvoiceRefNumber] [varchar](120) COLLATE Latin1_General_CI_AS NULL,
 [BillPersonFullName] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressLine1] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressLine2] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [BillPersonTelephone] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillPersonMobile] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillPersonFax] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressDistrict] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressCity] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressRegion] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressCountry] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressPostalCode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressNote] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipPersonFullName] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [ShipPersonFax] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [ShipPersonTelephone] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipPersonMobile] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressLine1] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressLine2] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressDistrict] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressCity] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressRegion] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressCountry] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressPostalCode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressNote] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [PONumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [DueDate] [date] NULL,
 [SalesRepRefListID] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [SalesRepRefFullName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [TrackingNumber] [varchar](100) COLLATE Latin1_General_CI_AS NULL,
 [ShipDate] [date] NULL,
 [ShipMethodRefListID] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipMethodRefFullName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Subtotal] [float] NULL,
 [TotalAmount] [float] NULL,
 [ItemSalesTaxRefListID] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ItemSalesTaxRefFullName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [IsManuallyClosed] [bit] NULL,
 [IsFullyInvoiced] [bit] NULL,
 [Memo] [varchar](5000) COLLATE Latin1_General_CI_AS NULL,
 [CustomerMsgRefListID] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [CustomerMsgRefFullName] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [IsTobePrinted] [bit] NULL,
 [IsTobeEmailed] [bit] NULL,
 [CustomerFieldBarcode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Status] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Timestamp] [timestamp] NULL,
 [ShippingRegion] [varchar](200) COLLATE Latin1_General_CI_AS NULL,
 [IsApproved] [bit] NULL,
 [ShipFee] [float] NULL,
 [CustomerEmail] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Seed] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [EftposAmount] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [CashAmount] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ReceiptNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Notes] [varchar](5000) COLLATE Latin1_General_CI_AS NULL,
 [salestaxtotal] [float] NULL,
 [discountamount] [float] NULL,
 [SpecialNotes] [varchar](100) COLLATE Latin1_General_CI_AS NULL,
 [Transport] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [OnlineBankingAmount] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [CreditCardAmount] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [CreditInAccountAmount] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [TotalReceivedPayment] [float] NULL,
 [TotalRefund] [float] NULL,
 [PickTo] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Picker] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PickedQty] [float] NULL,
 [StartPickingTime] [datetime] NULL,
 [EndPickingTime] [datetime] NULL,
 [CustomFieldEmail] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [cbm] [float] NULL,
 [OrderType] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [OrderChannel] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Taxcode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [CustomerID] [int] NULL,
 [ImportTime] [datetime] NULL,
 [ImportMemo] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [CustomerPONumber] [varchar](200) COLLATE Latin1_General_CI_AS NULL,
 [Manager] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ScheduleDate] [date] NULL,
 [CombinedIntoRefNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [OrderedBy] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Store] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Subscribe] [int] NULL,
 [FulfilStoreLocation] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Send] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [importTxnid] [varchar](36) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_Salesorder1] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Salesorder]') AND name = N'NonClusteredIndex-20171130-111601')
CREATE UNIQUE NONCLUSTERED INDEX [NonClusteredIndex-20171130-111601] ON [dbo].[Salesorder]
(
 [RefNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Salesorder_TimeCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Salesorder] ADD  CONSTRAINT [DF_Salesorder_TimeCreated]  DEFAULT (dbo.GetNzDate()) FOR [TimeCreated]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Salesorder_TimeModified]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Salesorder] ADD  CONSTRAINT [DF_Salesorder_TimeModified]  DEFAULT (dbo.GetNzDate()) FOR [TimeModified]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Salesorder_TxnDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Salesorder] ADD  CONSTRAINT [DF_Salesorder_TxnDate]  DEFAULT (dbo.GetNzDate()) FOR [TxnDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Salesorder_ShipDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Salesorder] ADD  CONSTRAINT [DF_Salesorder_ShipDate]  DEFAULT (dbo.GetNzDate()) FOR [ShipDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Salesorder_Subtotal]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Salesorder] ADD  CONSTRAINT [DF_Salesorder_Subtotal]  DEFAULT ((0.0)) FOR [Subtotal]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Salesorder_TotalAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Salesorder] ADD  CONSTRAINT [DF_Salesorder_TotalAmount]  DEFAULT ((0.0)) FOR [TotalAmount]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Salesorder_ShipFee]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Salesorder] ADD  CONSTRAINT [DF_Salesorder_ShipFee]  DEFAULT ((0.0)) FOR [ShipFee]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Salesorder_ScheduleDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Salesorder] ADD  CONSTRAINT [DF_Salesorder_ScheduleDate]  DEFAULT (dbo.GetNzDate()) FOR [ScheduleDate]
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[AutoSalesorder_TimeModified]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:  <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE TRIGGER [dbo].[AutoSalesorder_TimeModified]
   ON   [dbo].[Salesorder]
   AFTER   UPDATE 
AS 
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;
 update [dbo].[Salesorder]  
 set    [dbo].[Salesorder].TimeModified = dbo.GetNzDate()  
 from   [dbo].[Salesorder]   
 JOIN inserted  
 ON  [dbo].[Salesorder].id = inserted.id  

 update [dbo].[Salesorder]  
 set    [dbo].[Salesorder].TimeApproved = dbo.GetNzDate()  
 from   [dbo].[Salesorder]   
    JOIN inserted  ON  [dbo].[Salesorder].id = inserted.id  and  inserted.IsApproved = 1 
 JOIN deleted   ON  [dbo].[Salesorder].id = deleted.id   and  (deleted.IsApproved  = 0  or deleted.IsApproved is null )

 update [dbo].[Salesorder]  
 set    [dbo].[Salesorder].TimeInvoiced = dbo.GetNzDate()  
 from   [dbo].[Salesorder]   
 JOIN inserted  ON  [dbo].[Salesorder].id = inserted.id  and  inserted.Status = ''partially_invoiced'' 
 JOIN deleted   ON  [dbo].[Salesorder].id = deleted.id   and  (deleted.Status  <>''partially_invoiced'' or deleted.Status is null)
    
 update [dbo].[Salesorder]  
 set    [dbo].[Salesorder].TimeInvoiced = dbo.GetNzDate()  
 from   [dbo].[Salesorder]   
 JOIN inserted  ON  [dbo].[Salesorder].id = inserted.id  and  inserted.Status = ''fully_invoiced'' 
 JOIN deleted   ON  [dbo].[Salesorder].id = deleted.id   and ( deleted.Status  <>''fully_invoiced'' or deleted.Status is null)
END
' 
GO
ALTER TABLE [dbo].[Salesorder] ENABLE TRIGGER [AutoSalesorder_TimeModified]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Salesorder_AutoGenerateRefnumber]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:  <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE TRIGGER [dbo].[Salesorder_AutoGenerateRefnumber]
   ON   [dbo].[Salesorder]
   AFTER   insert 
AS 
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;
  
 declare @newId int
 set @newID = (select inserted.id from inserted)
 declare @newRef varchar(20)
 set @newRef = ''S''+convert(varchar(20),10000 + @newID)  

 update [dbo].[Salesorder]  
 set    [dbo].[Salesorder].refnumber = @newRef, Status=''open''
 from   [dbo].[Salesorder]   
 JOIN inserted  
 ON  [dbo].[Salesorder].id = inserted.id

    -- Insert statements for trigger here

 -- update the SalesOrder''s InvoiceRef
 update [dbo].[Estimate]  
 set    [dbo].[Estimate].salesorderrefnumber =  (@newRef +'','' + ISNULL( [dbo].[Estimate].salesorderrefnumber ,'''')) , [dbo].[Estimate].status = ''converted'' 
 from   [dbo].[Estimate]   
 JOIN inserted  
 ON   [dbo].[Estimate].refnumber = inserted.estimaterefnumber  
 and inserted.estimaterefnumber is not null  

END
' 
GO
ALTER TABLE [dbo].[Salesorder] ENABLE TRIGGER [Salesorder_AutoGenerateRefnumber]
GO
/****** Object:  Table [dbo].[ItemStock]    Script Date: 13/08/2018 8:15:44 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemStock]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ItemStock](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BinLocation] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Qty] [float] NULL,
 [Warehouse] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ModifyTime] [date] NULL,
 CONSTRAINT [PK_ItemStock11] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ItemStock]') AND name = N'IX_ItemStock')
CREATE NONCLUSTERED INDEX [IX_ItemStock] ON [dbo].[ItemStock]
(
 [BinLocation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ItemStock]') AND name = N'IX_ItemStock_1')
CREATE NONCLUSTERED INDEX [IX_ItemStock_1] ON [dbo].[ItemStock]
(
 [Qty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ItemStock]') AND name = N'IX_ItemStock_2')
CREATE NONCLUSTERED INDEX [IX_ItemStock_2] ON [dbo].[ItemStock]
(
 [Sku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ItemStock]') AND name = N'IX_ItemStock_3')
CREATE NONCLUSTERED INDEX [IX_ItemStock_3] ON [dbo].[ItemStock]
(
 [Warehouse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ItemStock_ModifyTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ItemStock] ADD  CONSTRAINT [DF_ItemStock_ModifyTime]  DEFAULT (dbo.GetNzDate()) FOR [ModifyTime]
END

GO
/****** Object:  Table [dbo].[ContainerLine]    Script Date: 13/08/2018 8:15:44 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContainerLine]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ContainerLine](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [BundleSku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Description] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [Qty] [float] NULL,
 [Memo] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [ContainerId] [int] NULL,
 [QtyReceived] [float] NULL,
 [BinLocReceived] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [SalesOrderRef] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [RefNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [SalesOrderLineQty] [float] NULL,
 [CreatedTime] [datetime] NULL,
 CONSTRAINT [PK_ContainerLine] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ContainerLine_CreatedTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ContainerLine] ADD  CONSTRAINT [DF_ContainerLine_CreatedTime]  DEFAULT (dbo.GetNzDate()) FOR [CreatedTime]
END

GO
/****** Object:  Table [dbo].[ReceivePayment]    Script Date: 13/08/2018 8:15:44 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReceivePayment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ReceivePayment](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [SalesorderID] [int] NULL,
 [PayDate] [datetime] NULL,
 [CashAmount] [float] NULL,
 [EftposAmount] [float] NULL,
 [OnlineBankingAmount] [float] NULL,
 [CreditCardAmount] [float] NULL,
 [CreditInAccountAmount] [float] NULL,
 [operator] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PaymentReceiveRef] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_SalesorderReceivePayment] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[ItemInventoryStorage]    Script Date: 13/08/2018 8:15:44 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemInventoryStorage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ItemInventoryStorage](
 [sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [multi_location] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [ProductID] [int] NULL,
 [StorageID] [int] NULL,
 CONSTRAINT [PK_ItemInventoryStorage] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[ChrTransferTable2]    Script Date: 13/08/2018 8:15:44 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChrTransferTable2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChrTransferTable2](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [BundleSku] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [BundleDescription] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [Sku] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [Descripton] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [StockOnHand] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [PrimaryBinLocation] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [OtherBinLocation] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [QtyToSend] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [ChristLocation] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [PrintTimes] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [IndexLabel] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_ChrTransferTable2] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[ChrTransferTable7NewSend0613]    Script Date: 13/08/2018 8:15:44 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChrTransferTable7NewSend0613]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChrTransferTable7NewSend0613](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [BundleSku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BundleDescription] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Descripton] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [StockOnHand] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PrimaryBinLocation] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [OtherBinLocation] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [QtyToSend] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ChristLocation] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PrintTimes] [int] NULL,
 [IndexLabel] [int] NULL,
 [DeleteLabel] [int] NULL,
 [Reckon] [varchar](150) COLLATE Latin1_General_CI_AS NULL
)
END
GO
/****** Object:  Table [dbo].[BundleInvoiceLine]    Script Date: 13/08/2018 8:15:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BundleInvoiceLine]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BundleInvoiceLine](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [SalesOrderId] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BundleSku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [InvoicedQty] [float] NULL,
 [Operater] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [CreateTime] [datetime] NULL,
 CONSTRAINT [PK_BundleInvoiceLine] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BundleInvoiceLine_CreateTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BundleInvoiceLine] ADD  CONSTRAINT [DF_BundleInvoiceLine_CreateTime]  DEFAULT (dbo.GetNzDate()) FOR [CreateTime]
END

GO
/****** Object:  Table [dbo].[ChrTransferTable3]    Script Date: 13/08/2018 8:15:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChrTransferTable3]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChrTransferTable3](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [BundleSku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BundleDescription] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Descripton] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [StockOnHand] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PrimaryBinLocation] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [OtherBinLocation] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [QtyToSend] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ChristLocation] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PrintTimes] [int] NULL,
 [IndexLabel] [int] NULL
)
END
GO
/****** Object:  Table [dbo].[StockTransfer]    Script Date: 13/08/2018 8:15:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockTransfer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StockTransfer](
 [id] [int] IDENTITY(1,1) NOT NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Transferfrom] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Transferto] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Status] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Sender] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Receiver] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Txndate] [date] NULL,
 [Container] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Notes] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [DateofDispatch] [date] NULL,
 [DateofReceive] [date] NULL,
 [QtyReceived] [float] NULL,
 [isLocationSelectDone] [bit] NULL,
 [SelectedLocation] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [putAwayLocation] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [StockRequest] [float] NULL,
 [ShowroomRequest] [float] NULL,
 [ReplaceRequest] [float] NULL,
 [QtyInTransit] [float] NULL,
 [QtyOutstanding] [float] NULL,
 [StockAdjusted] [float] NULL,
 [Diff] [float] NULL,
 [OrderRequest] [float] NULL,
 [Urgent] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_StockTransfer] PRIMARY KEY CLUSTERED 
(
 [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockTransfer_Transferfrom]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockTransfer] ADD  CONSTRAINT [DF_StockTransfer_Transferfrom]  DEFAULT ('auckland') FOR [Transferfrom]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockTransfer_Transferto]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockTransfer] ADD  CONSTRAINT [DF_StockTransfer_Transferto]  DEFAULT ('christchurch') FOR [Transferto]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockTransfer_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockTransfer] ADD  CONSTRAINT [DF_StockTransfer_Status]  DEFAULT ('plantotransfer') FOR [Status]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockTransfer_Txndate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockTransfer] ADD  CONSTRAINT [DF_StockTransfer_Txndate]  DEFAULT (dbo.GetNzDate()) FOR [Txndate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockTransfer_DateofDispatch]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockTransfer] ADD  CONSTRAINT [DF_StockTransfer_DateofDispatch]  DEFAULT (dbo.GetNzDate()) FOR [DateofDispatch]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockTransfer_QtyReceived]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockTransfer] ADD  CONSTRAINT [DF_StockTransfer_QtyReceived]  DEFAULT ((0)) FOR [QtyReceived]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockTransfer_isLocationSelectDone]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockTransfer] ADD  CONSTRAINT [DF_StockTransfer_isLocationSelectDone]  DEFAULT ((0)) FOR [isLocationSelectDone]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockTransfer_StockRequest]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockTransfer] ADD  CONSTRAINT [DF_StockTransfer_StockRequest]  DEFAULT ((0)) FOR [StockRequest]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockTransfer_ShowroomRequest]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockTransfer] ADD  CONSTRAINT [DF_StockTransfer_ShowroomRequest]  DEFAULT ((0)) FOR [ShowroomRequest]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockTransfer_ReplaceRequest]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockTransfer] ADD  CONSTRAINT [DF_StockTransfer_ReplaceRequest]  DEFAULT ((0)) FOR [ReplaceRequest]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockTransfer_QtyInTransit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockTransfer] ADD  CONSTRAINT [DF_StockTransfer_QtyInTransit]  DEFAULT ((0)) FOR [QtyInTransit]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockTransfer_QtyOutstanding]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockTransfer] ADD  CONSTRAINT [DF_StockTransfer_QtyOutstanding]  DEFAULT ((0)) FOR [QtyOutstanding]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockTransfer_StockAdjusted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockTransfer] ADD  CONSTRAINT [DF_StockTransfer_StockAdjusted]  DEFAULT ((0)) FOR [StockAdjusted]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockTransfer_OrderRequest]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockTransfer] ADD  CONSTRAINT [DF_StockTransfer_OrderRequest]  DEFAULT ((0)) FOR [OrderRequest]
END

GO
/****** Object:  Table [dbo].[Invoiceline]    Script Date: 13/08/2018 8:15:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoiceline]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Invoiceline](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [TimeCreated] [datetime2](3) NOT NULL,
 [TimeModified] [datetime2](3) NOT NULL,
 [RefNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [InvoiceLineSeqID] [int] NULL,
 [InvoiceLineItemRefListID] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [InvoiceLineItemFullName] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [InvoiceLineDesc] [varchar](5000) COLLATE Latin1_General_CI_AS NULL,
 [InvoiceLineQuantity] [float] NULL,
 [InvoiceLineRate] [float] NULL,
 [InvoiceLineAmount] [float] NULL,
 [InvoiceLineTaxAmount] [float] NULL,
 [Timestamp] [timestamp] NULL,
 [InvoiceID] [int] NULL,
 [InvoiceLineOldRate] [float] NULL,
 [DiscountPercentage] [float] NULL,
 [DiscountAmount] [float] NULL,
 [Memo] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [InvoicedBy] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Store] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_Invoiceline1] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Invoiceline]') AND name = N'idx_Invoiceline_itemname')
CREATE NONCLUSTERED INDEX [idx_Invoiceline_itemname] ON [dbo].[Invoiceline]
(
 [InvoiceLineItemFullName] ASC
)
INCLUDE (  [InvoiceLineAmount],
 [InvoiceID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Invoiceline]') AND name = N'NonClusteredIndex-20171130-111537')
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20171130-111537] ON [dbo].[Invoiceline]
(
 [RefNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Invoiceline_TimeCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Invoiceline] ADD  CONSTRAINT [DF_Invoiceline_TimeCreated]  DEFAULT (dbo.GetNzDate()) FOR [TimeCreated]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Invoiceline_TimeModified]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Invoiceline] ADD  CONSTRAINT [DF_Invoiceline_TimeModified]  DEFAULT (dbo.GetNzDate()) FOR [TimeModified]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Invoiceline_InvoiceLineQuantity]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Invoiceline] ADD  CONSTRAINT [DF_Invoiceline_InvoiceLineQuantity]  DEFAULT ((0.0)) FOR [InvoiceLineQuantity]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Invoiceline_InvoiceLineRate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Invoiceline] ADD  CONSTRAINT [DF_Invoiceline_InvoiceLineRate]  DEFAULT ((0.0)) FOR [InvoiceLineRate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Invoiceline_InvoiceLineAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Invoiceline] ADD  CONSTRAINT [DF_Invoiceline_InvoiceLineAmount]  DEFAULT ((0.0)) FOR [InvoiceLineAmount]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Invoiceline_InvoiceLineRatePercent]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Invoiceline] ADD  CONSTRAINT [DF_Invoiceline_InvoiceLineRatePercent]  DEFAULT ((0.0)) FOR [InvoiceLineTaxAmount]
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[AutoInvoiceline_TimeModified]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:  <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
-- =============================================
CREATE TRIGGER [dbo].[AutoInvoiceline_TimeModified]
   ON   [dbo].[Invoiceline]
   AFTER   UPDATE 
AS 
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;
 update [dbo].[Invoiceline]  
 set    [dbo].[Invoiceline].TimeModified = dbo.GetNzDate()  
 from   [dbo].[Invoiceline]   
 JOIN inserted  
 ON  [dbo].[Invoiceline].id = inserted.id  

END
' 
GO
ALTER TABLE [dbo].[Invoiceline] ENABLE TRIGGER [AutoInvoiceline_TimeModified]
GO
/****** Object:  Table [dbo].[InvoiceSynLog]    Script Date: 13/08/2018 8:15:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceSynLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InvoiceSynLog](
 [id] [int] IDENTITY(1,1) NOT NULL,
 [refnumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [synlog] [varchar](300) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_InvoiceSynLog] PRIMARY KEY CLUSTERED 
(
 [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[PurchaseOrderReceiveItem]    Script Date: 13/08/2018 8:15:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrderReceiveItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PurchaseOrderReceiveItem](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ReceiveDate] [date] NULL,
 [ReceiveAmount] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PurchaseOrderID] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ReceiveQty] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [SyncRes] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_PurchaseOrderReceiveItem] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PurchaseOrderReceiveItem_ReceiveDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PurchaseOrderReceiveItem] ADD  CONSTRAINT [DF_PurchaseOrderReceiveItem_ReceiveDate]  DEFAULT (dbo.GetNzDate()) FOR [ReceiveDate]
END

GO
/****** Object:  Table [dbo].[Bundle]    Script Date: 13/08/2018 8:15:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bundle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Bundle](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [FullName] [varchar](60) COLLATE Latin1_General_CI_AS NULL,
 [Name] [varchar](60) COLLATE Latin1_General_CI_AS NULL,
 [SalesDesc] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [SalesPrice] [float] NULL,
 [IsEnableOnWeb] [bit] NULL,
 [IsExistOnWeb] [bit] NULL,
 [QuantityOnHand] [float] NULL,
 [QuantityOnSalesorder] [float] NULL,
 [ETA] [date] NULL,
 [MagentoShortDesc] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [MagentoLabel] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [purchasedesc] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PrefVendorRefFullName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [MagentoSubSkus] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [WebLabel] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PictureUrl] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_Bundle] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Bundle_WebLabel]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Bundle] ADD  CONSTRAINT [DF_Bundle_WebLabel]  DEFAULT ('auto sync') FOR [WebLabel]
END

GO
/****** Object:  Table [dbo].[Admin]    Script Date: 13/08/2018 8:15:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Admin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Admin](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [UserName] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [Name] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [Fullname] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [Passcode] [varchar](300) COLLATE Latin1_General_CI_AS NULL,
 [Active] [int] NULL,
 [UserGroup] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Email] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [StoreScope] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [DataScope] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [Role] [varchar](260) COLLATE Latin1_General_CI_AS NULL,
 [SalesRepName] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [SalesRepInitials] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PickerName] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[ScanItem]    Script Date: 13/08/2018 8:15:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScanItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ScanItem](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [TimeCreated] [datetime] NULL,
 [SalesOrderId] [int] NULL,
 [BundleSku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [SalesorderQty] [float] NULL,
 [ScanedQty] [float] NULL,
 [Description] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [CHCHSendQty] [float] NULL,
 [OperatedBy] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ContainerId] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ContainerName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_ScanItem] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ScanItem_TimeCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ScanItem] ADD  CONSTRAINT [DF_ScanItem_TimeCreated]  DEFAULT (dbo.GetNzDate()) FOR [TimeCreated]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ScanItem_CHCHSendQty]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ScanItem] ADD  CONSTRAINT [DF_ScanItem_CHCHSendQty]  DEFAULT ((0)) FOR [CHCHSendQty]
END

GO
/****** Object:  Table [dbo].[ChrTransferTable4]    Script Date: 13/08/2018 8:15:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChrTransferTable4]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChrTransferTable4](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [BundleSku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BundleDescription] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Descripton] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [StockOnHand] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PrimaryBinLocation] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [OtherBinLocation] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [QtyToSend] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ChristLocation] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PrintTimes] [int] NULL,
 [IndexLabel] [int] NULL,
 [DeleteLabel] [int] NULL,
 [Reckon] [varchar](50) COLLATE Latin1_General_CI_AS NULL
)
END
GO
/****** Object:  Table [dbo].[Configs]    Script Date: 13/08/2018 8:15:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Configs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Configs](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [configname] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [configvalue] [varchar](100) COLLATE Latin1_General_CI_AS NULL,
 [storeid] [int] NULL,
 [IsShowGlobal] [tinyint] NOT NULL,
 CONSTRAINT [PK_Configs] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Configs__IsShowG__330B79E8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Configs] ADD  CONSTRAINT [DF__Configs__IsShowG__330B79E8]  DEFAULT ('1') FOR [IsShowGlobal]
END

GO
/****** Object:  Table [dbo].[DispatchingPrepare]    Script Date: 13/08/2018 8:15:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DispatchingPrepare]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DispatchingPrepare](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [SalesRefnumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PickerAssigner] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Picker] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PickBeginTime] [datetime] NULL,
 [PickEndTime] [datetime] NULL,
 [PickState] [varchar](10) COLLATE Latin1_General_CI_AS NULL,
 [Checker] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [CheckBeginTime] [datetime] NULL,
 [CheckEndTime] [datetime] NULL,
 [CheckState] [varchar](10) COLLATE Latin1_General_CI_AS NULL,
 [Packer] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PackBeginTime] [datetime] NULL,
 [PackEndTime] [datetime] NULL,
 [PackState] [varchar](10) COLLATE Latin1_General_CI_AS NULL,
 [LineSeqNo] [varchar](10) COLLATE Latin1_General_CI_AS NULL,
 [InvoiceNumber] [varchar](100) COLLATE Latin1_General_CI_AS NULL,
 [PickBeginHour] [varchar](10) COLLATE Latin1_General_CI_AS NULL,
 [PickBeginMinute] [varchar](10) COLLATE Latin1_General_CI_AS NULL,
 [PickEndHour] [varchar](10) COLLATE Latin1_General_CI_AS NULL,
 [PickEndMinute] [varchar](10) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_DispatchingPrepare] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[PurchaseOrder-old]    Script Date: 13/08/2018 8:15:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder-old]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PurchaseOrder-old](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [TimeCreated] [datetime2](3) NOT NULL,
 [TimeModified] [datetime2](3) NOT NULL,
 [TxnDate] [date] NULL,
 [RefNumber] [varchar](11) COLLATE Latin1_General_CI_AS NULL,
 [VendorName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressLine1] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressLine2] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorTelephone] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorMobile] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorEmail] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressDistrict] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressCity] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressRegion] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressCountry] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorPostalCode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressNote] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipEmail] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipTelephone] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipMobile] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressLine1] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressLine2] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressDistrict] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressCity] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressRegion] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressPostalCode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressCountry] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressNote] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [DueDate] [date] NULL,
 [ExpectedDate] [date] NULL,
 [ShipMethodRefListID] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipMethodRefFullName] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [FOB] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [TotalAmount] [float] NULL,
 [IsManuallyClosed] [bit] NULL,
 [IsFullyReceived] [bit] NULL,
 [Memo] [varchar](5000) COLLATE Latin1_General_CI_AS NULL,
 [VendorMsg] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [Status] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Timestamp] [timestamp] NULL,
 [ContainerNo] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ImportRefNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorRefFullName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorRefListID] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Terms] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [TrackingNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [DiscountAmount] [float] NULL,
 [PurchaseTaxtotal] [float] NULL,
 [SupplierTaxCode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [IsEmailed] [bit] NULL,
 [IsPrinted] [bit] NULL,
 [SupplierMessage] [varchar](550) COLLATE Latin1_General_CI_AS NULL,
 [SalesTaxTotal] [float] NULL,
 [ManufatureCode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Description] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [PurchaseCost] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ReckonNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [EstimateArrival] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [TxnNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressLine3] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressLine4] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [Container] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [Done] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [TotalReceiveAmount] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_PurchaseOrder] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PurchaseOrder_TimeCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PurchaseOrder-old] ADD  CONSTRAINT [DF_PurchaseOrder_TimeCreated]  DEFAULT (dbo.GetNzDate()) FOR [TimeCreated]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PurchaseOrder_TimeModified]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PurchaseOrder-old] ADD  CONSTRAINT [DF_PurchaseOrder_TimeModified]  DEFAULT (dbo.GetNzDate()) FOR [TimeModified]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PurchaseOrder_TxnDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PurchaseOrder-old] ADD  CONSTRAINT [DF_PurchaseOrder_TxnDate]  DEFAULT (dbo.GetNzDate()) FOR [TxnDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PurchaseOrder_Done]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PurchaseOrder-old] ADD  CONSTRAINT [DF_PurchaseOrder_Done]  DEFAULT ((0)) FOR [Done]
END

GO
/****** Object:  Table [dbo].[ItemForecast]    Script Date: 13/08/2018 8:15:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemForecast]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ItemForecast](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [QEST] [float] NULL,
 [Q0] [float] NULL,
 [Q1] [float] NULL,
 [Q2] [float] NULL,
 [Q3] [float] NULL,
 [Q4] [float] NULL,
 [Q5] [float] NULL,
 [SOH1m] [float] NULL,
 [SOH2m] [float] NULL,
 [SOH3m] [float] NULL,
 [SOH4m] [float] NULL,
 [SOH5m] [float] NULL,
 [SOH6m] [float] NULL,
 [AvailableQty] [float] NULL,
 [ItemId] [int] NULL,
 CONSTRAINT [PK_ItemForecast] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 13/08/2018 8:15:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Invoice](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [TimeCreated] [datetime2](3) NOT NULL,
 [TimeModified] [datetime2](3) NOT NULL,
 [CustomerRefListID] [varchar](36) COLLATE Latin1_General_CI_AS NULL,
 [CustomerRefFullName] [varchar](360) COLLATE Latin1_General_CI_AS NULL,
 [TxnDate] [date] NULL,
 [ImportRefNumber] [varchar](11) COLLATE Latin1_General_CI_AS NULL,
 [SalesorderRefNumber] [varchar](20) COLLATE Latin1_General_CI_AS NULL,
 [RefNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillPersonFullName] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressLine1] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressLine2] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [BillPersonTelephone] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillPersonMobile] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillPersonFax] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressDistrict] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressCity] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressRegion] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressCountry] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressPostalCode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressNote] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [ShipPersonFullName] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [ShipPersonFax] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [ShipPersonTelephone] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipPersonMobile] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressLine1] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressLine2] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressDistrict] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressCity] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressRegion] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressCountry] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressPostalCode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressNote] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [ReckonNumber] [varchar](25) COLLATE Latin1_General_CI_AS NULL,
 [DueDate] [date] NULL,
 [SalesRepRefListID] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [SalesRepRefFullName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [FOB] [varchar](20) COLLATE Latin1_General_CI_AS NULL,
 [ShipDate] [date] NULL,
 [ShipMethodRefListID] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipMethodRefFullName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Subtotal] [float] NULL,
 [AppliedAmount] [float] NULL,
 [BalanceRemaining] [float] NULL,
 [Memo] [varchar](5000) COLLATE Latin1_General_CI_AS NULL,
 [IsPaid] [bit] NULL,
 [CustomerMsgRefListID] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [CustomerMsgRefFullName] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [IsTobePrinted] [bit] NULL,
 [IsTobeEmailed] [bit] NULL,
 [SuggestedDiscountAmount] [float] NULL,
 [SuggestedDiscountDate] [date] NULL,
 [Status] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Timestamp] [timestamp] NULL,
 [ShippingRegion] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [IsEmailSent] [bit] NULL,
 [TrackingNumber] [varchar](100) COLLATE Latin1_General_CI_AS NULL,
 [ExpressCompany] [varchar](100) COLLATE Latin1_General_CI_AS NULL,
 [IsSavedInReckon] [bit] NULL,
 [SalesTaxTotal] [float] NULL,
 [SalesTaxPercentage] [float] NULL,
 [CustomFieldOther] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [CustomFieldEmail] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [TotalAmount] [float] NULL,
 [DiscountAmount] [float] NULL,
 [ShipStatus] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ShipTerms] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [CustomerEmail] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Notes] [varchar](5000) COLLATE Latin1_General_CI_AS NULL,
 [ShipFee] [float] NULL,
 [Checker] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Packer] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Picker] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Taxcode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [CustomerID] [int] NULL,
 [CustomerPONumber] [varchar](200) COLLATE Latin1_General_CI_AS NULL,
 [OrderChannel] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ScheduleDate] [date] NULL,
 [InvoicedBy] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Store] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [importTxnid] [varchar](36) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_Invoice1] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Invoice]') AND name = N'idx_invoice_txndate_store')
CREATE NONCLUSTERED INDEX [idx_invoice_txndate_store] ON [dbo].[Invoice]
(
 [TxnDate] ASC,
 [Store] ASC
)
INCLUDE (  [TotalAmount]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Invoice]') AND name = N'NonClusteredIndex-20171130-111345')
CREATE UNIQUE NONCLUSTERED INDEX [NonClusteredIndex-20171130-111345] ON [dbo].[Invoice]
(
 [RefNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Invoice_TimeCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_TimeCreated]  DEFAULT (dbo.GetNzDate()) FOR [TimeCreated]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Invoice_TimeModified]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_TimeModified]  DEFAULT (dbo.GetNzDate()) FOR [TimeModified]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Invoice_TxnDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_TxnDate]  DEFAULT (dbo.GetNzDate()) FOR [TxnDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Invoice_Subtotal]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_Subtotal]  DEFAULT ((0.0)) FOR [Subtotal]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Invoice_AppliedAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_AppliedAmount]  DEFAULT ((0.0)) FOR [AppliedAmount]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Invoice_BalanceRemaining]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_BalanceRemaining]  DEFAULT ((0.0)) FOR [BalanceRemaining]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Invoice_SuggestedDiscountAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_SuggestedDiscountAmount]  DEFAULT ((0.0)) FOR [SuggestedDiscountAmount]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Invoice_SalesTaxTotal]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_SalesTaxTotal]  DEFAULT ((0.0)) FOR [SalesTaxTotal]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Invoice_SalesTaxPercentage]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_SalesTaxPercentage]  DEFAULT ((0.0)) FOR [SalesTaxPercentage]
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[AutoInvoice_TimeModified]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:  <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE TRIGGER [dbo].[AutoInvoice_TimeModified]
   ON   [dbo].[Invoice]
   AFTER   UPDATE 
AS 
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;
 update [dbo].Invoice  
 set    [dbo].Invoice.TimeModified = dbo.GetNzDate()  
 from   [dbo].Invoice   
 JOIN inserted  
 ON  [dbo].Invoice.id = inserted.id  

END
' 
GO
ALTER TABLE [dbo].[Invoice] ENABLE TRIGGER [AutoInvoice_TimeModified]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Invoice_AutoGenerateRefnumber]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:  <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE TRIGGER [dbo].[Invoice_AutoGenerateRefnumber]
   ON   [dbo].[Invoice]
   AFTER   insert 
AS 
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;
  
 declare @newId int
 set @newID = (select inserted.id from inserted)
 declare @newRef varchar(20)
 set @newRef = ''I''+convert(varchar(20),10000+@newID)  

 update [dbo].[Invoice]  
 set    [dbo].[Invoice].refnumber = @newRef
 from   [dbo].[Invoice]   
 JOIN inserted  
 ON  [dbo].[Invoice].id = @newID  

    -- Insert statements for trigger here

 -- update the SalesOrder''s InvoiceRef
 update [dbo].[Salesorder]    
 set    [dbo].[Salesorder].InvoiceRefNumber =  (@newRef +'','' + ISNULL( [dbo].[Salesorder].InvoiceRefNumber,''''))
 
 from   [dbo].[Salesorder]  JOIN inserted  
 ON   [dbo].[Salesorder].refnumber = inserted.salesorderrefnumber  
 And inserted.salesorderrefnumber is not null  

END
' 
GO
ALTER TABLE [dbo].[Invoice] ENABLE TRIGGER [Invoice_AutoGenerateRefnumber]
GO
/****** Object:  Table [dbo].[SalesRepresent]    Script Date: 13/08/2018 8:15:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalesRepresent]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SalesRepresent](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [SalesRepID] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [SalesRepFullName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [UserType] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_SalesRepresent] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[ChrTransferTable7NewSend0613backup]    Script Date: 13/08/2018 8:15:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChrTransferTable7NewSend0613backup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChrTransferTable7NewSend0613backup](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [BundleSku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BundleDescription] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Descripton] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [StockOnHand] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PrimaryBinLocation] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [OtherBinLocation] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [QtyToSend] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ChristLocation] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PrintTimes] [int] NULL,
 [IndexLabel] [int] NULL,
 [DeleteLabel] [int] NULL,
 [Reckon] [varchar](150) COLLATE Latin1_General_CI_AS NULL
)
END
GO
/****** Object:  Table [dbo].[StockTransferUpload]    Script Date: 13/08/2018 8:15:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockTransferUpload]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StockTransferUpload](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [CreateTime] [datetime] NULL,
 [FileName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [UploadTime] [datetime] NULL,
 [UploadBy] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_StockTransferUpload] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockTransferUpload_CreateTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockTransferUpload] ADD  CONSTRAINT [DF_StockTransferUpload_CreateTime]  DEFAULT (dbo.GetNzDate()) FOR [CreateTime]
END

GO
/****** Object:  Table [dbo].[PrintLog]    Script Date: 13/08/2018 8:15:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PrintLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PrintLog](
 [id] [int] IDENTITY(1,1) NOT NULL,
 [printuser] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
 [printdatetime] [datetime] NULL,
 [printtype] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [salesordernumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [comment] [varchar](5000) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_PrintLog] PRIMARY KEY CLUSTERED 
(
 [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[InvoicePrepareToDeductStock]    Script Date: 13/08/2018 8:15:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoicePrepareToDeductStock]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InvoicePrepareToDeductStock](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [SalesOrderId] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BundleSku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [InvoiceQty] [float] NULL,
 [CreatedTime] [datetime] NULL,
 [BinLocation] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [IsDeducted] [bit] NOT NULL,
 CONSTRAINT [PK_InvoicePrepareToDeductStock] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InvoicePrepareToDeductStock_BundleSku]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InvoicePrepareToDeductStock] ADD  CONSTRAINT [DF_InvoicePrepareToDeductStock_BundleSku]  DEFAULT ('') FOR [BundleSku]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InvoicePrepareToDeductStock_CreatedTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InvoicePrepareToDeductStock] ADD  CONSTRAINT [DF_InvoicePrepareToDeductStock_CreatedTime]  DEFAULT (dbo.GetNzDate()) FOR [CreatedTime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InvoicePrepareToDeductStock_IsDeducted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InvoicePrepareToDeductStock] ADD  CONSTRAINT [DF_InvoicePrepareToDeductStock_IsDeducted]  DEFAULT ((0)) FOR [IsDeducted]
END

GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 13/08/2018 8:15:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendors]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vendors](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [ListID] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [TimeCreated] [datetime] NULL,
 [TimeModified] [datetime] NULL,
 [EditSequence] [float] NULL,
 [Name] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [IsActive] [float] NULL,
 [IsTaxAgency] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [CompanyName] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [Salutation] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [FirstName] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [MiddleName] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [LastName] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressAddr1] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressAddr2] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressAddr3] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressAddr4] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressAddr5] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressCity] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressState] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressProvince] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressCounty] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressPostalCode] [float] NULL,
 [VendorAddressCountry] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressNote] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressBlockAddr1] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressBlockAddr2] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressBlockAddr3] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressBlockAddr4] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [VendorAddressBlockAddr5] [float] NULL,
 [ShipAddressAddr1] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressAddr2] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressAddr3] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressAddr4] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressAddr5] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressCity] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressState] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressPostalCode] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressCountry] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [ShipAddressNote] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [Phone] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [AltPhone] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [Fax] [float] NULL,
 [Email] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [Contact] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [AltContact] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [NameOnCheck] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [AccountNumber] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [Notes] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [VendorTypeRefListID] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [VendorTypeRefFullName] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [TermsRefListID] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [TermsRefFullName] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [CreditLimit] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [VendorTaxIdent] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [IsVendorEligibleFor1099] [float] NULL,
 [IsVendorEligibleForT4A] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [OpenBalance] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [OpenBalanceDate] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [Balance] [float] NULL,
 [BillingRateRefListID] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [BillingRateRefFullName] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [PrefillAccount1RefListID] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [PrefillAccount1RefFullName] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [PrefillAccount2RefListID] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [PrefillAccount2RefFullName] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [PrefillAccount3RefListID] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [PrefillAccount3RefFullName] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [BusinessNumber] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [CurrencyRefListID] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [CurrencyRefFullName] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [BankAccountName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BankName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BranchCode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BankAccountNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [TaxCode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [TaxRegID] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillingRatelevel] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PrintOnCheque] [nchar](10) COLLATE Latin1_General_CI_AS NULL,
 [Fob] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[AutoVendors_TimeModified]'))
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:  <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE TRIGGER [dbo].[AutoVendors_TimeModified]
   ON   [dbo].[Vendors]
   AFTER   UPDATE 
AS 
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;
 update [dbo].[Vendors]  
 set    [dbo].[Vendors].TimeModified = dbo.GetNzDate()  
 from   [dbo].[Vendors]   
 JOIN inserted  
 ON  [dbo].[Vendors].id = inserted.id  

END
' 
GO
ALTER TABLE [dbo].[Vendors] ENABLE TRIGGER [AutoVendors_TimeModified]
GO
/****** Object:  Table [dbo].[ChrTransferLabelPrint]    Script Date: 13/08/2018 8:15:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChrTransferLabelPrint]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChrTransferLabelPrint](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Des] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [Category] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [ChrisLocation] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PriceTax] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PriceExcTax] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_ChrTransferLabelPrint] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[B2BCustomer]    Script Date: 13/08/2018 8:15:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[B2BCustomer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[B2BCustomer](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [Email] [varchar](255) COLLATE Latin1_General_CI_AS NULL,
 [MatrixId] [varchar](255) COLLATE Latin1_General_CI_AS NULL,
 [AccountCode] [varchar](255) COLLATE Latin1_General_CI_AS NULL,
 [TaxCode] [varchar](25) COLLATE Latin1_General_CI_AS NULL,
 [TieredPricing] [bit] NULL,
 CONSTRAINT [PK_B2BCustomer] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[Salesorderline]    Script Date: 13/08/2018 8:15:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Salesorderline]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Salesorderline](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [TimeCreated] [datetime2](3) NOT NULL,
 [TimeModified] [datetime2](3) NOT NULL,
 [ImportRefNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [RefNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [SalesOrderLineSeqID] [int] NULL,
 [SalesOrderLineItemRefListID] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [SalesOrderLineItemRefFullName] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [SalesOrderLineDesc] [varchar](5000) COLLATE Latin1_General_CI_AS NULL,
 [SalesOrderLineQuantity] [float] NULL,
 [SalesOrderLineOldRate] [float] NULL,
 [SalesOrderLineRate] [float] NULL,
 [SalesOrderLineAmount] [float] NULL,
 [SalesOrderLineTaxAmount] [float] NULL,
 [SalesOrderLineInvoiced] [float] NULL,
 [SalesOrderLinesManuallyClosed] [bit] NULL,
 [CustomerFieldSalesOrderLineProductNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Timestamp] [timestamp] NULL,
 [SalesOrderLinePrepareToInvoiceQuantity] [float] NULL,
 [SalesorderID] [int] NULL,
 [DiscountPercentage] [float] NULL,
 [DiscountAmount] [float] NULL,
 [Memo] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [Status] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [IsFullyInvoiced] [bit] NULL,
 [IsManuallyClosed] [bit] NULL,
 [ShipMethodRefFullName] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [Picker] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Picked] [bit] NULL,
 [StartPickingTime] [datetime] NULL,
 [EndPickingTime] [datetime] NULL,
 [ImportTime] [datetime] NULL,
 [ImportMemo] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [OrderedBy] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Store] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Send] [float] NULL,
 CONSTRAINT [PK_Salesorderline1] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Salesorderline]') AND name = N'idx_salesorderline')
CREATE NONCLUSTERED INDEX [idx_salesorderline] ON [dbo].[Salesorderline]
(
 [SalesorderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Salesorderline]') AND name = N'NonClusteredIndex-20171130-111626')
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20171130-111626] ON [dbo].[Salesorderline]
(
 [RefNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Salesorderline_TimeCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Salesorderline] ADD  CONSTRAINT [DF_Salesorderline_TimeCreated]  DEFAULT (dbo.GetNzDate()) FOR [TimeCreated]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Salesorderline_TimeModified]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Salesorderline] ADD  CONSTRAINT [DF_Salesorderline_TimeModified]  DEFAULT (dbo.GetNzDate()) FOR [TimeModified]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Salesorderline_SalesOrderLineQuantity]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Salesorderline] ADD  CONSTRAINT [DF_Salesorderline_SalesOrderLineQuantity]  DEFAULT ((0.0)) FOR [SalesOrderLineQuantity]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Salesorderline_SalesOrderLineRate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Salesorderline] ADD  CONSTRAINT [DF_Salesorderline_SalesOrderLineRate]  DEFAULT ((0.0)) FOR [SalesOrderLineRate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Salesorderline_SalesOrderLineAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Salesorderline] ADD  CONSTRAINT [DF_Salesorderline_SalesOrderLineAmount]  DEFAULT ((0.0)) FOR [SalesOrderLineAmount]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Salesorderline_SalesOrderLineTaxAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Salesorderline] ADD  CONSTRAINT [DF_Salesorderline_SalesOrderLineTaxAmount]  DEFAULT ((0.0)) FOR [SalesOrderLineTaxAmount]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Salesorderline_SalesOrderLineInvoiced]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Salesorderline] ADD  CONSTRAINT [DF_Salesorderline_SalesOrderLineInvoiced]  DEFAULT ((0.0)) FOR [SalesOrderLineInvoiced]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Salesorderline_Send]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Salesorderline] ADD  CONSTRAINT [DF_Salesorderline_Send]  DEFAULT ((0)) FOR [Send]
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[AutoSalesorderline_TimeModified]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:  <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE TRIGGER [dbo].[AutoSalesorderline_TimeModified]
   ON   [dbo].[Salesorderline]
   AFTER   UPDATE 
AS 
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;
 update [dbo].[Salesorderline]  
 set    [dbo].[Salesorderline].TimeModified = dbo.GetNzDate()  
 from   [dbo].[Salesorderline]   
 JOIN inserted  
 ON  [dbo].[Salesorderline].id = inserted.id  

END
' 
GO
ALTER TABLE [dbo].[Salesorderline] ENABLE TRIGGER [AutoSalesorderline_TimeModified]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 13/08/2018 8:15:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Region]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Region](
 [Id] [int] NOT NULL,
 [Code] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Name] [varchar](100) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[ChrTransferTableBundle]    Script Date: 13/08/2018 8:15:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChrTransferTableBundle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChrTransferTableBundle](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [BundleSku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BundleDes] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Des] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [QtyToSend] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PrimaryBinLocation] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Price] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Total] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [OtherBinLocation] [varchar](250) COLLATE Latin1_General_CI_AS NULL
)
END
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 13/08/2018 8:15:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Supplier]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Supplier](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [NAME] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [REFNUM] [float] NULL,
 [TIMESTAMP] [float] NULL,
 [PRINTAS] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [ADDR1] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [ADDR2] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [ADDR3] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [ADDR4] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [ADDR5] [float] NULL,
 [VTYPE] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [CONT1] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [CONT2] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [PHONE1] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [PHONE2] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [FAXNUM] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [EMAIL] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [CC] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [NOTE] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [TAXID] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [LIMIT] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [TERMS] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [NOTEPAD] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [SALUTATION] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [COMPANYNAME] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [FIRSTNAME] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [MIDINIT] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [LASTNAME] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [1099] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [HIDDEN] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [DELCOUNT] [float] NULL,
 [ACCNTNAME] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [TAXCODE] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [TAXCOUNTRY] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 [BILLRATELVL] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[ChrTransferTable5]    Script Date: 13/08/2018 8:15:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChrTransferTable5]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChrTransferTable5](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [BundleSku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BundleDescription] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Descripton] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [StockOnHand] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PrimaryBinLocation] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [OtherBinLocation] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [QtyToSend] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ChristLocation] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PrintTimes] [int] NULL,
 [IndexLabel] [int] NULL,
 [DeleteLabel] [int] NULL
)
END
GO
/****** Object:  Table [dbo].[CreditNote]    Script Date: 13/08/2018 8:15:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditNote]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CreditNote](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [RefNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillPersonFullName] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressLine1] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressLine2] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [BillPersonTelephone] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillPersonMobile] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillPersonFax] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressDistrict] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressCity] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressRegion] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressCountry] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressPostalCode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BillAddressNote] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [Taxcode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [CustomerID] [int] NULL,
 [SalesorderRefnumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [InvoiceRefnumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ReckonInvoiceRefnumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ReckonRefNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [WebRefNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Notes] [varchar](5000) COLLATE Latin1_General_CI_AS NULL,
 [TxnDate] [date] NULL,
 [TimeCreated] [datetime2](3) NULL,
 [TimeModified] [datetime2](3) NULL,
 [TotalAmount] [float] NULL,
 [SyncToReckonStatus] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [salestaxtotal] [float] NULL,
 [discountamount] [float] NULL,
 [SalesOrderRepPerson] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [RefundVia] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Processer] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BankAccount] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [ReasonForRefund] [varchar](5000) COLLATE Latin1_General_CI_AS NULL,
 [ReturnDocket] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Store] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_CreditNote] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[AutoCreditNote_TimeModified]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[AutoCreditNote_TimeModified]
   ON   [dbo].[CreditNote]
   AFTER   UPDATE 
AS 
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;
 update [dbo].CreditNote  
 set    [dbo].CreditNote.TimeModified = dbo.GetNzDate()  
 from   [dbo].CreditNote   
 JOIN inserted  
 ON  [dbo].CreditNote.id = inserted.id  

END
' 
GO
ALTER TABLE [dbo].[CreditNote] ENABLE TRIGGER [AutoCreditNote_TimeModified]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[CreditNote_AutoGenerateRefnumber]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[CreditNote_AutoGenerateRefnumber]
   ON   [dbo].[CreditNote]
   AFTER   insert 
AS 
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;
  
 declare @newId int
 set @newID = (select inserted.id from inserted)
 declare @newRef varchar(20)
 set @newRef = ''C''+convert(varchar(20),10000+@newID)  

 update [dbo].[CreditNote]  
 set    [dbo].[CreditNote].refnumber = @newRef
 from   [dbo].[CreditNote]   
 JOIN inserted  
 ON  [dbo].[CreditNote].id = @newID  

 

END
' 
GO
ALTER TABLE [dbo].[CreditNote] ENABLE TRIGGER [CreditNote_AutoGenerateRefnumber]
GO
/****** Object:  Table [dbo].[PurchaseOrderReceiveAddress]    Script Date: 13/08/2018 8:15:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrderReceiveAddress]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PurchaseOrderReceiveAddress](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [Name] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Address1] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Address2] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [AddressDistrict] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [AddressRegion] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [AddressCity] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [AddressCountry] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PostCode] [varchar](20) COLLATE Latin1_General_CI_AS NULL,
 [Email] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Phone] [varchar](20) COLLATE Latin1_General_CI_AS NULL,
 [Mobile] [varchar](20) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_PurchaseOrderReceiveAddress] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[Estimateline]    Script Date: 13/08/2018 8:15:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Estimateline]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Estimateline](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [TimeCreated] [datetime2](3) NOT NULL,
 [TimeModified] [datetime2](3) NOT NULL,
 [ImportRefNumber] [varchar](11) COLLATE Latin1_General_CI_AS NULL,
 [RefNumber] [varchar](11) COLLATE Latin1_General_CI_AS NULL,
 [EstimateLineSeqID] [int] NULL,
 [EstimateLineItemRefListID] [varchar](36) COLLATE Latin1_General_CI_AS NULL,
 [EstimateLineItemRefFullName] [varchar](160) COLLATE Latin1_General_CI_AS NULL,
 [EstimateLineDesc] [varchar](5000) COLLATE Latin1_General_CI_AS NULL,
 [EstimateLineQuantity] [float] NULL,
 [EstimateLineRate] [float] NULL,
 [EstimateLineAmount] [float] NULL,
 [Timestamp] [timestamp] NULL,
 [Status] [varchar](36) COLLATE Latin1_General_CI_AS NULL,
 [BinLocation] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [EstimateLineTaxAmount] [float] NULL,
 [EstimateID] [int] NULL,
 [DiscountPercentage] [float] NULL,
 [DiscountAmount] [float] NULL,
 [EstimateLineOldRate] [float] NULL,
 [Memo] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [Store] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_Estimateline1] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Estimateline_TimeCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Estimateline] ADD  CONSTRAINT [DF_Estimateline_TimeCreated]  DEFAULT (dbo.GetNzDate()) FOR [TimeCreated]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Estimateline_TimeModified]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Estimateline] ADD  CONSTRAINT [DF_Estimateline_TimeModified]  DEFAULT (dbo.GetNzDate()) FOR [TimeModified]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Estimateline_EstimateLineQuantity]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Estimateline] ADD  CONSTRAINT [DF_Estimateline_EstimateLineQuantity]  DEFAULT ((0.0)) FOR [EstimateLineQuantity]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Estimateline_EstimateLineRate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Estimateline] ADD  CONSTRAINT [DF_Estimateline_EstimateLineRate]  DEFAULT ((0.0)) FOR [EstimateLineRate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Estimateline_EstimateLineAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Estimateline] ADD  CONSTRAINT [DF_Estimateline_EstimateLineAmount]  DEFAULT ((0.0)) FOR [EstimateLineAmount]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Estimateline_DiscountPercentage]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Estimateline] ADD  CONSTRAINT [DF_Estimateline_DiscountPercentage]  DEFAULT ((0)) FOR [DiscountPercentage]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Estimateline_DiscountAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Estimateline] ADD  CONSTRAINT [DF_Estimateline_DiscountAmount]  DEFAULT ((0)) FOR [DiscountAmount]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Estimateline_EstimateLineOldRate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Estimateline] ADD  CONSTRAINT [DF_Estimateline_EstimateLineOldRate]  DEFAULT ((0.0)) FOR [EstimateLineOldRate]
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[AutoEstimateline_TimeModified]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:  <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE TRIGGER [dbo].[AutoEstimateline_TimeModified]
   ON   [dbo].[Estimateline]
   AFTER   UPDATE 
AS 
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

 update [dbo].[Estimateline]  
 set    [dbo].[Estimateline].TimeModified = dbo.GetNzDate()  
 from   [dbo].[Estimateline]   
 JOIN inserted  
 ON  [dbo].[Estimateline].id = inserted.id  
   
END
' 
GO
ALTER TABLE [dbo].[Estimateline] ENABLE TRIGGER [AutoEstimateline_TimeModified]
GO
/****** Object:  Table [dbo].[B2BPrice]    Script Date: 13/08/2018 8:15:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[B2BPrice]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[B2BPrice](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Trade++] [float] NULL,
 CONSTRAINT [PK_B2BPrice] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[phone]    Script Date: 13/08/2018 8:15:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[phone]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[phone](
 [id] [int] IDENTITY(1,1) NOT NULL,
 [phonetype] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [phonenumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [phoneto] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [phonetime] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [phoneduration] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [salesrep] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [createdtime] [datetime] NOT NULL,
 CONSTRAINT [PK_phone] PRIMARY KEY CLUSTERED 
(
 [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_phone_createdtime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[phone] ADD  CONSTRAINT [DF_phone_createdtime]  DEFAULT (dbo.GetNzDate()) FOR [createdtime]
END

GO
/****** Object:  Table [dbo].[iteminventory]    Script Date: 13/08/2018 8:15:47 p.m. ******/
/**
Assessment issue: Deprecated data types TEXT, IMAGE or NTEXT
Categories: Compatibility, Deprecated
Applicable compatibility levels: CompatLevel140
Impact: These data types are checked as deprecated. In some cases, using TEXT, IMAGE or NTEXT might harm performance.
Impact details: Object dbo.iteminventory.PurchaseDesc uses deprecated data type TEXT, IMAGE or NTEXT which will be discontinued for future versions of SQL Server. For more details, please see: Line 21, Column 5.
Recommendation: Deprecated data types are marked to be discontinued on next versions of SQL Server, should use new data types such as: (varchar(max), nvarchar(max), varbinary(max) and etc.)
More information: ntext, text, and image (Transact-SQL) (https://go.microsoft.com/fwlink/?LinkId=798558)
 **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[iteminventory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[iteminventory](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [ListID] [varchar](36) COLLATE Latin1_General_CI_AS NULL,
 [TimeCreated] [datetime2](7) NULL,
 [TimeModified] [datetime2](7) NULL,
 [Name] [varchar](31) COLLATE Latin1_General_CI_AS NULL,
 [FullName] [varchar](159) COLLATE Latin1_General_CI_AS NULL,
 [IsActive] [bit] NOT NULL,
 [ClassRefListID] [varchar](36) COLLATE Latin1_General_CI_AS NULL,
 [ClassRefFullName] [varchar](159) COLLATE Latin1_General_CI_AS NULL,
 [ParentRefListID] [varchar](36) COLLATE Latin1_General_CI_AS NULL,
 [ParentRefFullName] [varchar](159) COLLATE Latin1_General_CI_AS NULL,
 [Sublevel] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [IsTaxIncluded] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [SalesTaxCodeRefListID] [varchar](36) COLLATE Latin1_General_CI_AS NULL,
 [SalesTaxCodeRefFullName] [varchar](6) COLLATE Latin1_General_CI_AS NULL,
 [SalesDesc] [varchar](300) COLLATE Latin1_General_CI_AS NULL,
 [SalesPrice] [float] NULL,
 [IncomeAccountRefListID] [varchar](36) COLLATE Latin1_General_CI_AS NULL,
 [IncomeAccountRefFullName] [varchar](159) COLLATE Latin1_General_CI_AS NULL,
 [PurchaseDesc] [text] COLLATE Latin1_General_CI_AS NULL,
 [PurchaseCost] [float] NULL,
 [PurchaseTaxCodeRefListID] [varchar](36) COLLATE Latin1_General_CI_AS NULL,
 [PurchaseTaxCodeRefFullName] [varchar](31) COLLATE Latin1_General_CI_AS NULL,
 [COGSAccountRefListID] [varchar](36) COLLATE Latin1_General_CI_AS NULL,
 [COGSAccountRefFullName] [varchar](159) COLLATE Latin1_General_CI_AS NULL,
 [PrefVendorRefListID] [varchar](36) COLLATE Latin1_General_CI_AS NULL,
 [PrefVendorRefFullName] [varchar](41) COLLATE Latin1_General_CI_AS NULL,
 [AssetAccountRefListID] [varchar](36) COLLATE Latin1_General_CI_AS NULL,
 [AssetAccountRefFullName] [varchar](159) COLLATE Latin1_General_CI_AS NULL,
 [ReorderPoint] [float] NULL,
 [QuantityOnHand] [float] NULL,
 [TotalValue] [float] NULL,
 [InventoryDate] [varchar](36) COLLATE Latin1_General_CI_AS NULL,
 [AverageCost] [float] NULL,
 [QuantityOnOrder] [float] NULL,
 [QuantityOnSalesOrder] [float] NULL,
 [QuarterSaleEstimate] [float] NULL,
 [ManufactureCode] [varchar](30) COLLATE Latin1_General_CI_AS NULL,
 [UsdCost] [float] NULL,
 [CustomFieldPrice3Comments] [varchar](30) COLLATE Latin1_General_CI_AS NULL,
 [Barcode] [varchar](30) COLLATE Latin1_General_CI_AS NULL,
 [CustomFieldProductNumber] [varchar](30) COLLATE Latin1_General_CI_AS NULL,
 [Maximum] [varchar](30) COLLATE Latin1_General_CI_AS NULL,
 [ETA] [date] NULL,
 [Weight] [float] NULL,
 [Volume] [float] NULL,
 [OldSku] [varchar](30) COLLATE Latin1_General_CI_AS NULL,
 [Category] [varchar](30) COLLATE Latin1_General_CI_AS NULL,
 [BoxQty] [float] NULL,
 [WebStockStatus] [varchar](30) COLLATE Latin1_General_CI_AS NULL,
 [SalesQtyQuarter0] [float] NULL,
 [SalesQtyQuarter1] [float] NULL,
 [SalesQtyQuarter2] [float] NULL,
 [SalesQtyQuarter3] [float] NULL,
 [SalesQtyQuarter4] [float] NULL,
 [ArrivalQtyMonth1] [float] NULL,
 [ArrivalQtyMonth2] [float] NULL,
 [ArrivalQtyMonth3] [float] NULL,
 [ArrivalQtyMonth4] [float] NULL,
 [ArrivalQtyMonth5] [float] NULL,
 [ArrivalQtyMonth6] [float] NULL,
 [ArrivalQtyMonth7] [float] NULL,
 [ArrivalQtyMonth8] [float] NULL,
 [ArrivalQtyMonth9] [float] NULL,
 [ArrivalQtyMonth10] [float] NULL,
 [ArrivalQtyMonth11] [float] NULL,
 [ArrivalQtyMonth12] [float] NULL,
 [IsEnableOnWeb] [bit] NULL,
 [IsExistOnWeb] [bit] NULL,
 [PictureUrl] [varchar](300) COLLATE Latin1_General_CI_AS NULL,
 [PrimaryImage] [varchar](200) COLLATE Latin1_General_CI_AS NULL,
 [Length] [float] NULL,
 [Width] [float] NULL,
 [Height] [float] NULL,
 [SpecialPrice] [float] NULL,
 [GrossProfit] [money] NULL,
 [MagentoShortDesc] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [MagentoLabel] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [StorageLocation] [varchar](100) COLLATE Latin1_General_CI_AS NULL,
 [Price2] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ListID_Reckon2018] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [CategoryId] [int] NULL,
 [SortCode] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ReorderNotes] [varchar](300) COLLATE Latin1_General_CI_AS NULL,
 [DoNotReorder] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Stocktake] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Promotion] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Deactivate] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [GP] [float] NULL,
 [QuantityReordered] [float] NULL,
 [LastReorderDate] [date] NULL,
 [QuantityAvailable] [float] NULL,
 [TTL] [float] NULL,
 [QTRS] [float] NULL,
 [PrimaryBinLocation] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
 [d331] [float] NULL,
 [d502] [float] NULL,
 [QuantityDataWarehouse] [float] NULL,
 [WebLabel] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BackOrderNote] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [ETADW] [date] NULL,
 [logtime] [datetime2](7) NULL,
 [BackOrderRefs] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 [ChchStockUpToQty] [float] NULL,
 [ChchStockLocation] [varchar](250) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_iteminventory_1] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[iteminventory]') AND name = N'IX_ItemInventory')
CREATE NONCLUSTERED INDEX [IX_ItemInventory] ON [dbo].[iteminventory]
(
 [ListID] ASC,
 [TimeCreated] ASC,
 [TimeModified] ASC,
 [Name] ASC,
 [FullName] ASC,
 [ParentRefFullName] ASC,
 [SalesDesc] ASC,
 [QuantityOnHand] ASC,
 [TotalValue] ASC,
 [QuantityOnOrder] ASC,
 [Barcode] ASC,
 [ETA] ASC,
 [OldSku] ASC,
 [SalesPrice] ASC,
 [QuantityOnSalesOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[iteminventory]') AND name = N'NonClusteredIndex-20171220-083655')
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20171220-083655] ON [dbo].[iteminventory]
(
 [Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ItemInventory_IsActive1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iteminventory] ADD  CONSTRAINT [DF_ItemInventory_IsActive1]  DEFAULT ((1)) FOR [IsActive]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ItemInventory_WebLabel1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iteminventory] ADD  CONSTRAINT [DF_ItemInventory_WebLabel1]  DEFAULT ('auto sync') FOR [WebLabel]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ItemInventory_logtime1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iteminventory] ADD  CONSTRAINT [DF_ItemInventory_logtime1]  DEFAULT (dbo.GetNzDate()) FOR [logtime]
END

GO
/****** Object:  Table [dbo].[StockAdjustment]    Script Date: 13/08/2018 8:15:47 p.m. ******/
/**
Assessment issue: Deprecated data types TEXT, IMAGE or NTEXT
Categories: Compatibility, Deprecated
Applicable compatibility levels: CompatLevel140
Impact: These data types are checked as deprecated. In some cases, using TEXT, IMAGE or NTEXT might harm performance.
Impact details: Object dbo.StockAdjustment.Memo uses deprecated data type TEXT, IMAGE or NTEXT which will be discontinued for future versions of SQL Server. For more details, please see: Line 6, Column 5.
Recommendation: Deprecated data types are marked to be discontinued on next versions of SQL Server, should use new data types such as: (varchar(max), nvarchar(max), varbinary(max) and etc.)
More information: ntext, text, and image (Transact-SQL) (https://go.microsoft.com/fwlink/?LinkId=798558)
 **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockAdjustment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StockAdjustment](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [TimeCreated] [datetime] NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Qty] [float] NULL,
 [Memo] [text] COLLATE Latin1_General_CI_AS NULL,
 [Operator] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [OldQty] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [NewQty] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Note] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [Approve] [int] NULL,
 CONSTRAINT [PK_StockAdjustment] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockAdjustment_TimeCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockAdjustment] ADD  CONSTRAINT [DF_StockAdjustment_TimeCreated]  DEFAULT (dbo.GetNzDate()) FOR [TimeCreated]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockAdjustment_Approve]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockAdjustment] ADD  CONSTRAINT [DF_StockAdjustment_Approve]  DEFAULT ((0)) FOR [Approve]
END

GO
/****** Object:  Table [dbo].[StockCheck]    Script Date: 13/08/2018 8:15:47 p.m. ******/
/**
Assessment issue: Deprecated data types TEXT, IMAGE or NTEXT
Categories: Compatibility, Deprecated
Applicable compatibility levels: CompatLevel140
Impact: These data types are checked as deprecated. In some cases, using TEXT, IMAGE or NTEXT might harm performance.
Impact details: Object dbo.StockCheck.Memo uses deprecated data type TEXT, IMAGE or NTEXT which will be discontinued for future versions of SQL Server. For more details, please see: Line 6, Column 5.
Recommendation: Deprecated data types are marked to be discontinued on next versions of SQL Server, should use new data types such as: (varchar(max), nvarchar(max), varbinary(max) and etc.)
More information: ntext, text, and image (Transact-SQL) (https://go.microsoft.com/fwlink/?LinkId=798558)
 **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockCheck]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StockCheck](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [TimeCreated] [datetime] NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Qty] [float] NULL,
 [Memo] [text] COLLATE Latin1_General_CI_AS NULL,
 [Operator] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [OldQty] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [NewQty] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Note] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 [Approve] [int] NULL,
 [CheckDay] [date] NULL,
 [Checked] [int] NULL
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockCheck_TimeCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockCheck] ADD  CONSTRAINT [DF_StockCheck_TimeCreated]  DEFAULT (dbo.GetNzDate()) FOR [TimeCreated]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockCheck_Checked]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockCheck] ADD  CONSTRAINT [DF_StockCheck_Checked]  DEFAULT ((0)) FOR [Checked]
END

GO
/****** Object:  Table [dbo].[BundleLine]    Script Date: 13/08/2018 8:15:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BundleLine]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BundleLine](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [BundleId] [int] NULL,
 [BundleName] [varchar](30) COLLATE Latin1_General_CI_AS NULL,
 [Name] [varchar](30) COLLATE Latin1_General_CI_AS NULL,
 [Qty] [float] NULL,
 CONSTRAINT [PK_BundleLine] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[CategorySales]    Script Date: 13/08/2018 8:15:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategorySales]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CategorySales](
 [id] [int] IDENTITY(1,1) NOT NULL,
 [date_from] [date] NULL,
 [sales_amount] [float] NULL,
 [is_caculated] [int] NULL,
 [cid] [int] NULL,
 CONSTRAINT [PK_CategorySales] PRIMARY KEY CLUSTERED 
(
 [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[Rid]    Script Date: 13/08/2018 8:15:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rid]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Rid](
 [id] [int] IDENTITY(1,1) NOT NULL,
 [sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [rid2016] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [rid2018] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_Rid] PRIMARY KEY CLUSTERED 
(
 [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[PurchaseOrderLineETA]    Script Date: 13/08/2018 8:15:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrderLineETA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PurchaseOrderLineETA](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [RefNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ETA] [date] NULL,
 [Container] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [QtyInContainer] [float] NULL,
 CONSTRAINT [PK_PurchaseOrderLineETA] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[ChrTransferTable]    Script Date: 13/08/2018 8:15:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChrTransferTable]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChrTransferTable](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [BundleSku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [BundleDescription] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [Sku] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [Descripton] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [StockOnHand] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PrimaryBinLocation] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [OtherBinLocation] [varchar](350) COLLATE Latin1_General_CI_AS NULL,
 [QtyToSend] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [ChristLocation] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
 [PrintTimes] [int] NULL,
 [IndexLabel] [int] NULL,
 [DeleteLabel] [int] NULL,
 [Reckon] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_ChrTransferTable] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ChrTransferTable_PrintTimes]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ChrTransferTable] ADD  CONSTRAINT [DF_ChrTransferTable_PrintTimes]  DEFAULT ((1)) FOR [PrintTimes]
END

GO
/****** Object:  View [kpi].[SalesbyB2B]    Script Date: 13/08/2018 8:15:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[kpi].[SalesbyB2B]'))
EXEC dbo.sp_executesql @statement = N'create view kpi.SalesbyB2B as
with data as
(
select c.name as Customer ,cast(datediff(d,txndate, dbo.GetNzDate()) as varchar(5)) + ''d'' as range ,sum(round(TotalAmount,0)) TotalSales  
from Customer c  left join Salesorder o on o.CustomerID=c.id
 and o.txndate >  CONVERT(DATE,DATEADD(d,DATEDIFF(d, 0, dbo.GetNzDate())-4,0))  
where c.CUSTOMERTYPE=''B2B''
group by c.name ,datediff(d,txndate, dbo.GetNzDate())
union
select c.name as Customer, cast(datepart(WEEK,dbo.GetNzDate())-datepart(WEEK,txndate) as varchar(5)) + ''w'' as range,sum(round(TotalAmount,0)) TotalSales  
from Customer c  left join Salesorder o on o.CustomerID=c.id
 and datepart(week,txndate) > datepart(week,dbo.GetNzDate())-6 
where  c.CUSTOMERTYPE=''B2B''
group by c.name,datepart(week,txndate)
union
select c.name as Customer, cast(datediff(m,txndate, dbo.GetNzDate()) as varchar(5)) + ''m'' as range,sum(round(TotalAmount,0)) TotalSales  
from Customer c  left join Salesorder o on o.CustomerID=c.id
 and o.txndate >  CONVERT(DATE,DATEADD(m,DATEDIFF(m, 0, dbo.GetNzDate())-6,0))  
where  c.CUSTOMERTYPE=''B2B''
group by c.name,datediff(m,txndate, dbo.GetNzDate())
union
select c.name as Customer, cast(datediff(YYYY,txndate, dbo.GetNzDate()) as varchar(5)) + ''y'' as range,sum(round(TotalAmount,0)) TotalSales  
from Customer c  left join Salesorder o on o.CustomerID=c.id
 and o.txndate >  CONVERT(DATE,DATEADD(YYYY,DATEDIFF(YYYY, 0, dbo.GetNzDate())-6,0))  
where  c.CUSTOMERTYPE=''B2B''
group by c.name,datediff(YYYY,txndate, dbo.GetNzDate())
)
select Customer, isnull([0d],0) as [Today],isnull([1d],0) as [L1D],isnull([2d],0) as [L2D],isnull([3d],0) as [L3D],isnull([0w],0) as [WTD],isnull([1w],0) as [L1W],isnull([2w],0) as [L2W],isnull([3w],0) as [L3W],isnull([4w],0) as [L4W],isnull([5w],0) as [L5W],isnull([0m],0) as [MTD],isnull([1m],0) as [L1M],isnull([2m],0) as [L2M],isnull([3m],0) as [L3M],isnull([4m],0) as [L4M],isnull([5m],0) as [L5M],isnull([0y],0) as [YTD],isnull([1y],0) as [L1Y],isnull([2y],0) as [L2Y],isnull([3y],0) as [L3Y],isnull([4y],0) as [L4Y],isnull([5y],0) as [L5Y]
from data
pivot (sum(TotalSales) for [range] in ([0d],[1d],[2d],[3d],[0w],[1w],[2w],[3w],[4w],[5w],[0m],[1m],[2m],[3m],[4m],[5m],[0y],[1y],[2y],[3y],[4y],[5y])) as Total' 
GO
/****** Object:  View [kpi].[SalesbyRep]    Script Date: 13/08/2018 8:15:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[kpi].[SalesbyRep]'))
EXEC dbo.sp_executesql @statement = N'create view [kpi].[SalesbyRep] as
with data as
(
select SalesRepRefFullName, cast(datepart(DAY,dbo.GetNzDate())-datepart(DAY,txndate) as varchar(5)) + ''d'' as range,sum(round(TotalAmount,0)) TotalSales from Salesorder
where txndate > format(DATEADD(day, -4, dbo.GetNzDate()),''yyyy-MM-dd'') 
group by SalesRepRefFullName,datepart(day,txndate)
union
select SalesRepRefFullName, cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w'' as range,sum(round(TotalAmount,0)) TotalSales from Salesorder
where datepart(week,txndate) > datepart(week,dbo.GetNzDate())-6  
group by SalesRepRefFullName,datepart(week,txndate)
union
select SalesRepRefFullName, cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m'' as range,sum(round(TotalAmount,0)) TotalSales from Salesorder
where datepart(month,txndate) > datepart(month,dbo.GetNzDate())-6 
group by SalesRepRefFullName,datepart(month,txndate)
)
select SalesRepRefFullName as RepName, isnull([0d],0) as [Today],isnull([1d],0) as [L1D],isnull([2d],0) as [L2D],isnull([3d],0) as [L3D],isnull([0w],0) as [WTD],isnull([1w],0) as [L1W],isnull([2w],0) as [L2W],isnull([3w],0) as [L3W],isnull([4w],0) as [L4W],isnull([5w],0) as [L5W],isnull([0m],0) as [MTD],isnull([1m],0) as [L1M],isnull([2m],0) as [L2M],isnull([3m],0) as [L3M],isnull([4m],0) as [L4M],isnull([5m],0) as [L5M]
from data
pivot (sum(TotalSales) for [range] in ([0d],[1d],[2d],[3d],[0w],[1w],[2w],[3w],[4w],[5w],[0m],[1m],[2m],[3m],[4m],[5m])) as Total
where SalesRepRefFullName in (select SalesRepInitials from admin where SalesRepInitials is not null and SalesRepInitials!='''')
' 
GO
/****** Object:  View [kpi].[SalesbyChannel]    Script Date: 13/08/2018 8:15:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[kpi].[SalesbyChannel]'))
EXEC dbo.sp_executesql @statement = N'create view kpi.SalesbyChannel as
with data as
(
select OrderChannel, cast(datepart(DAY,dbo.GetNzDate())-datepart(DAY,txndate) as varchar(5)) + ''d'' as range,sum(round(TotalAmount,0)) TotalSales from Salesorder
where txndate > format(DATEADD(day, -4, dbo.GetNzDate()),''yyyy-MM-dd'') 
and store <>''training''
group by OrderChannel,datepart(day,txndate)
union
select OrderChannel, cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w'' as range,sum(round(TotalAmount,0)) TotalSales from Salesorder
where datepart(week,txndate) > datepart(week,dbo.GetNzDate())-6 
and store <>''training'' 
group by OrderChannel,datepart(week,txndate)
union
select OrderChannel, cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m'' as range,sum(round(TotalAmount,0)) TotalSales from Salesorder
where datepart(month,txndate) > datepart(month,dbo.GetNzDate())-6 
and store <>''training''
group by OrderChannel,datepart(month,txndate)
union
select OrderChannel+''_''+Store as OrderChannel, cast(datepart(DAY,dbo.GetNzDate())-datepart(DAY,txndate) as varchar(5)) + ''d'' as range,sum(round(TotalAmount,0)) TotalSales from Salesorder
where txndate > format(DATEADD(day, -4, dbo.GetNzDate()),''yyyy-MM-dd'') 
and orderChannel in (''Showroom'',''TradeMe'') and store <>''training''
group by OrderChannel+''_''+Store,datepart(day,txndate)
union
select OrderChannel+''_''+Store as OrderChannel, cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w'' as range,sum(round(TotalAmount,0)) TotalSales from Salesorder
where datepart(week,txndate) > datepart(week,dbo.GetNzDate())-6 
and orderChannel in (''Showroom'',''TradeMe'')  and store <>''training''
group by OrderChannel+''_''+Store,datepart(week,txndate)
union
select OrderChannel+''_''+Store as OrderChannel , cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m'' as range,sum(round(TotalAmount,0)) TotalSales from Salesorder
where datepart(month,txndate) > datepart(month,dbo.GetNzDate())-6 
and orderChannel in (''Showroom'',''TradeMe'') and store <>''training''
group by OrderChannel+''_''+Store,datepart(month,txndate)
)
select OrderChannel as Channel, isnull([0d],0) as [Today],isnull([1d],0) as [L1D],isnull([2d],0) as [L2D],isnull([3d],0) as [L3D],isnull([0w],0) as [WTD],isnull([1w],0) as [L1W],isnull([2w],0) as [L2W],isnull([3w],0) as [L3W],isnull([4w],0) as [L4W],isnull([5w],0) as [L5W],isnull([0m],0) as [MTD],isnull([1m],0) as [L1M],isnull([2m],0) as [L2M],isnull([3m],0) as [L3M],isnull([4m],0) as [L4M],isnull([5m],0) as [L5M]
from data
pivot (sum(TotalSales) for [range] in ([0d],[1d],[2d],[3d],[0w],[1w],[2w],[3w],[4w],[5w],[0m],[1m],[2m],[3m],[4m],[5m])) as Total
where OrderChannel in (''Showroom'',''TradeMe'',''B2B'',''Web'',''Telesales'',''TradeMe_auckland'',''TradeMe_christchurch'',''Showroom_auckland'',''Showroom_christchurch'')
' 
GO
/****** Object:  View [dbo].[v_sales_current_category]    Script Date: 13/08/2018 8:15:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sales_current_category]'))
EXEC dbo.sp_executesql @statement = N'create view v_sales_current_category as SELECT * FROM CategorySales WHERE cid IN (10000,10001,10002,10003,10004,10005,10006,10007,10008,10009,10010,10011,10012,10013,10014,10015,10016,10017,10018,10019,10020,10021,10022,10023,10024,10025,10181,10184,10185,10195,10026,10027,10028,10029,10030,10031,10032,10033,10034,10035,10036,10182,10037,10038,10039,10040,10041,10042,10043,10044,10045,10046,10047,10048,10049,10050,10051,10052,10053,10054,10055,10056,10057,10058,10059,10060,10061,10062,10063,10064,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074,10075,10076,10077,10078,10079,10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10114,10115,10116,10117,10118,10189,10192,10193,10194,10119,10120,10121,10122,10123,10188,10186,10187,10124,10125,10126,10127,10191,10128,10129,10130,10131,10132,10133,10134,10135,10136,10137,10138,10139,10140,10141,10142,10143,10183,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178)' 
GO
/****** Object:  View [kpi].[SalesbyCategory]    Script Date: 13/08/2018 8:15:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[kpi].[SalesbyCategory]'))
EXEC dbo.sp_executesql @statement = N'create view kpi.SalesbyCategory as
with data as
(
select replace(left(i.ParentRefFullName,charindex('':'',ParentRefFullName)),'':'','''') as Category,  
cast(datepart(DAY,dbo.GetNzDate())-datepart(DAY,s.txndate) as varchar(5)) + ''d'' as range,
  sum(round(SalesOrderLineAmount,0)) as TotalSales
From salesorderline o , ItemInventory i, Salesorder s
where s.id=o.SalesorderID and o.SalesOrderLineItemRefFullName=i.name and o.SalesOrderLineItemRefFullName not in (''Freight'','' '') and Category is not null
 and txndate > format(DATEADD(day, -4, dbo.GetNzDate()),''yyyy-MM-dd'') 
group by replace(left(i.ParentRefFullName,charindex('':'',ParentRefFullName)),'':'',''''),datepart(DAY,s.txndate)
union
select replace(left(i.ParentRefFullName,charindex('':'',ParentRefFullName)),'':'','''') as Category,  
cast(datepart(week,dbo.GetNzDate())-datepart(week,s.txndate) as varchar(5)) + ''w'' as range,
  sum(round(SalesOrderLineAmount,0)) as TotalSales
From salesorderline o , ItemInventory i, Salesorder s
where s.id=o.SalesorderID and o.SalesOrderLineItemRefFullName=i.name and o.SalesOrderLineItemRefFullName not in (''Freight'','' '') and Category is not null
 and datepart(week,txndate) > datepart(week,dbo.GetNzDate())-6
group by replace(left(i.ParentRefFullName,charindex('':'',ParentRefFullName)),'':'',''''),datepart(week,s.txndate)
union
select replace(left(i.ParentRefFullName,charindex('':'',ParentRefFullName)),'':'','''') as Category, 
cast(datepart(month,dbo.GetNzDate())-datepart(month,s.txndate) as varchar(5)) + ''m'' as range,
  sum(round(SalesOrderLineAmount,0)) as TotalSales
From salesorderline o , ItemInventory i, Salesorder s
where s.id=o.SalesorderID and o.SalesOrderLineItemRefFullName=i.name and o.SalesOrderLineItemRefFullName not in (''Freight'','' '') and Category is not null
 and datepart(month,txndate) > datepart(month,dbo.GetNzDate())-6
group by replace(left(i.ParentRefFullName,charindex('':'',ParentRefFullName)),'':'',''''),datepart(month,s.txndate)
)
select Category, isnull([0d],0) as [Today],isnull([1d],0) as [L1D],isnull([2d],0) as [L2D],isnull([3d],0) as [L3D],isnull([0w],0) as [WTD],isnull([1w],0) as [L1W],isnull([2w],0) as [L2W],isnull([3w],0) as [L3W],isnull([4w],0) as [L4W],isnull([5w],0) as [L5W],isnull([0m],0) as [MTD],isnull([1m],0) as [L1M],isnull([2m],0) as [L2M],isnull([3m],0) as [L3M],isnull([4m],0) as [L4M],isnull([5m],0) as [L5M]
from data
pivot (sum(TotalSales) for [range] in ([0d],[1d],[2d],[3d],[0w],[1w],[2w],[3w],[4w],[5w],[0m],[1m],[2m],[3m],[4m],[5m])) as Total

' 
GO
/****** Object:  View [kpi].[SalesbyCustomer]    Script Date: 13/08/2018 8:15:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[kpi].[SalesbyCustomer]'))
EXEC dbo.sp_executesql @statement = N'create view kpi.SalesbyCustomer as
with data as
(
select salesrep as staff,cast(datepart(day,dbo.GetNzDate())-datepart(day,createdtime) as varchar(5)) + ''d'' as range,count(distinct(phoneto)) TotalCalls 
from phone 
where createdtime > format(DATEADD(day, -4, dbo.GetNzDate()),''yyyy-MM-dd'') and salesrep is not null  --last 3 day
group by salesrep,datepart(day,createdtime)
union 
select salesrep as staff,cast(datepart(week,dbo.GetNzDate())-datepart(week,createdtime) as varchar(5)) + ''w'' as range,count(distinct(phoneto)) TotalCalls 
from phone 
where datepart(week,createdtime) = datepart(week,dbo.GetNzDate()) and salesrep is not null --this week
group by salesrep,datepart(week,createdtime)
union
select salesrep as staff,cast(datepart(month,dbo.GetNzDate())-datepart(month,createdtime) as varchar(5)) + ''m'' as range,count(distinct(phoneto)) TotalCalls 
from phone 
where datepart(month,createdtime) = datepart(month,dbo.GetNzDate()) and salesrep is not null --this month
group by salesrep,datepart(month,createdtime)
union 
select salesrep as staff,cast(datepart(week,dbo.GetNzDate())-datepart(week,createdtime) as varchar(5)) + ''w'' as range,count(distinct(phoneto)) TotalCalls 
from phone 
where datepart(week,createdtime) = datepart(week,dbo.GetNzDate())-1 and salesrep is not null --last week
group by salesrep,datepart(week,createdtime)
union
select salesrep as staff,cast(datepart(month,dbo.GetNzDate())-datepart(month,createdtime) as varchar(5)) + ''m'' as range,count(distinct(phoneto)) TotalCalls 
from phone 
where datepart(month,createdtime) = datepart(month,dbo.GetNzDate())-1 and salesrep is not null --last month
group by salesrep,datepart(month,createdtime)
union
select SalesRepRefFullName, cast(datepart(DAY,dbo.GetNzDate())-datepart(DAY,txndate) as varchar(5)) + ''d_s'' as range,sum(round(TotalAmount,0)) TotalSales from Salesorder
where txndate = format(dbo.GetNzDate(),''yyyy-MM-dd'') and  SalesRepRefFullName <>'' '' --sales today
group by SalesRepRefFullName,datepart(DAY,txndate)
union
select SalesRepRefFullName, cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w_s'' as range,sum(round(TotalAmount,0)) TotalSales from Salesorder
where datepart(week,txndate) = datepart(week,dbo.GetNzDate()) and  SalesRepRefFullName <>'' '' --sales this week
group by SalesRepRefFullName,datepart(week,txndate)
union
select SalesRepRefFullName, cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m_s'' as range,sum(round(TotalAmount,0)) TotalSales from Salesorder
where datepart(month,txndate) = datepart(month,dbo.GetNzDate()) and  SalesRepRefFullName <>'' '' and TotalAmount is not NULL  --sales this month
group by SalesRepRefFullName,datepart(month,txndate)
)
select staff, isnull([0d],0) as [C_Today],isnull([1d],0) as [C_L1D],isnull([2d],0) as [C_L2D],isnull([3d],0) as [C_L3D],isnull([0w],0) as [C_WTD],isnull([1w],0) as [C_L1W],isnull([0m],0) as [C_MTD],isnull([1m],0) as [C_L1M], isnull([0d_s],0) as [S_Today],isnull([0w_s],0) as [S_WTD],isnull([0m_s],0) as [S_MTD] 
from data
pivot (sum(TotalCalls) for [range] in ([0d],[1d],[2d],[3d],[0w],[1w],[0m],[1m],[0d_s],[0w_s],[0m_s])) as Total' 
GO
/****** Object:  View [kpi].[SalesbyWarehouseStaff]    Script Date: 13/08/2018 8:15:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[kpi].[SalesbyWarehouseStaff]'))
EXEC dbo.sp_executesql @statement = N'--4. Sales by Warehouse Staff
create view kpi.SalesbyWarehouseStaff as
with data as
(
select picker as staff,cast(datepart(day,dbo.GetNzDate())-datepart(day,txndate) as varchar(5)) + ''d_pi'' as range,count(distinct SalesorderRefNumber) TotalOrders from invoice 
where txndate = format(dbo.GetNzDate(),''yyyy-MM-dd'') and picker is not null
group by picker,datepart(day,txndate)
union 
select picker as staff,cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w_pi'' as range,count(distinct SalesorderRefNumber) TotalOrders from invoice 
where datepart(week,txndate) = datepart(week,dbo.GetNzDate()) and picker is not null
group by picker,datepart(week,txndate)
union
select picker as staff,cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m_pi'' as range,count(distinct SalesorderRefNumber) TotalOrders from invoice 
where datepart(month,txndate) = datepart(month,dbo.GetNzDate()) and picker is not null
group by picker,datepart(month,txndate)
union
--packer
select packer as staff,cast(datepart(day,dbo.GetNzDate())-datepart(day,txndate) as varchar(5)) + ''d_pa'' as range,count(distinct SalesorderRefNumber) TotalOrders from invoice 
where txndate = format(dbo.GetNzDate(),''yyyy-MM-dd'') and packer is not null
group by packer,datepart(day,txndate)
union 
select packer as staff,cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w_pa'' as range,count(distinct SalesorderRefNumber) TotalOrders from invoice 
where datepart(week,txndate) = datepart(week,dbo.GetNzDate()) and packer is not null
group by packer,datepart(week,txndate)
union
select packer as staff,cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m_pa'' as range,count(distinct SalesorderRefNumber) TotalOrders from invoice 
where datepart(month,txndate) = datepart(month,dbo.GetNzDate()) and packer is not null
group by packer,datepart(month,txndate)  
union
--invoice
select SalesRepRefFullName as staff,cast(datepart(day,dbo.GetNzDate())-datepart(day,txndate) as varchar(5)) + ''d_in'' as range,count(distinct SalesorderRefNumber) TotalOrders from invoice 
where txndate = format(dbo.GetNzDate(),''yyyy-MM-dd'') and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(day,txndate)
union 
select SalesRepRefFullName as staff,cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w_in'' as range,count(distinct SalesorderRefNumber) TotalOrders from invoice 
where datepart(week,txndate) = datepart(week,dbo.GetNzDate()) and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(week,txndate)
union
select SalesRepRefFullName as staff,cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m_in'' as range,count(distinct SalesorderRefNumber) TotalOrders from invoice 
where datepart(month,txndate) = datepart(month,dbo.GetNzDate()) and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(month,txndate) 
)
select Staff, isnull([0d_pi],0) as [Picked Today],isnull([0w_pi],0) as [Picked WTD],isnull([0m_pi],0) as [Picked MTD],isnull([0d_pa],0) as [Packed Today],isnull([0w_pa],0) as [Packed WTD],isnull([0m_pa],0) as [Packed MTD],isnull([0d_in],0) as [Invoiced Today],isnull([0w_in],0) as [Invoiced WTD],isnull([0m_in],0) as [Invoiced MTD]
from data
pivot (sum(TotalOrders) for [range] in ([0d_pi],[0w_pi],[0m_pi],[0d_pa],[0w_pa],[0m_pa],[0d_in],[0w_in],[0m_in])) as Total
where staff not in (''James'',''Joseph'',''Stu'',''Rae-John'',''Navneil'',''Shannon'',''Tarun'', ''Manan'', ''Steve'', ''Aarti'', ''Colin'', ''Joshi'', ''Dan'', ''Cryst'', ''shaw'', ''Cyan'', ''Reia'', ''ZWEB_TEST'', ''Casey'', ''Lewis'', ''Swati'', ''Andrius'', ''Rawan'', ''Alan'', ''Piri'', ''Raj'', ''Albert'')   

' 
GO
/****** Object:  View [kpi].[InvoicebyStaff]    Script Date: 13/08/2018 8:15:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[kpi].[InvoicebyStaff]'))
EXEC dbo.sp_executesql @statement = N'create view kpi.InvoicebyStaff as
with data as
(
select SalesRepRefFullName, cast(datepart(DAY,dbo.GetNzDate())-datepart(DAY,txndate) as varchar(5)) + ''d'' as range,sum(round(TotalAmount,0)) TotalSales from Invoice
where txndate > format(DATEADD(day, -4, dbo.GetNzDate()),''yyyy-MM-dd'') 
group by SalesRepRefFullName,datepart(day,txndate)
union
select SalesRepRefFullName, cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w'' as range,sum(round(TotalAmount,0)) TotalSales from Invoice
where datepart(week,txndate) > datepart(week,dbo.GetNzDate())-6  
group by SalesRepRefFullName,datepart(week,txndate)
union
select SalesRepRefFullName, cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m'' as range,sum(round(TotalAmount,0)) TotalSales from Invoice
where datepart(month,txndate) > datepart(month,dbo.GetNzDate())-6 
group by SalesRepRefFullName,datepart(month,txndate)
union
select SalesRepRefFullName, cast(datepart(year,dbo.GetNzDate())-datepart(year,txndate) as varchar(5)) + ''y'' as range,sum(round(TotalAmount,0)) TotalSales from Invoice
where datepart(year,txndate) > datepart(year,dbo.GetNzDate()) -6 
group by SalesRepRefFullName,datepart(year,txndate)
)
select SalesRepRefFullName as Staff, isnull([0d],0) as [Today],isnull([1d],0) as [L1D],isnull([2d],0) as [L2D],isnull([3d],0) as [L3D],isnull([0w],0) as [WTD],isnull([1w],0) as [L1W],isnull([2w],0) as [L2W],isnull([3w],0) as [L3W],isnull([4w],0) as [L4W],isnull([5w],0) as [L5W],isnull([0m],0) as [MTD],isnull([1m],0) as [L1M],isnull([2m],0) as [L2M],isnull([3m],0) as [L3M],isnull([4m],0) as [L4M],isnull([5m],0) as [L5M],isnull([0y],0) as [YTD],isnull([1y],0) as [L1Y],isnull([2y],0) as [L2Y],isnull([3y],0) as [L3Y],isnull([4y],0) as [L4Y],isnull([5y],0) as [L5Y]
from data
pivot (sum(TotalSales) for [range] in ([0d],[1d],[2d],[3d],[0w],[1w],[2w],[3w],[4w],[5w],[0m],[1m],[2m],[3m],[4m],[5m],[0y],[1y],[2y],[3y],[4y],[5y])) as Total
where SalesRepRefFullName not in ('' '', ''Tarun'', ''Manan'', ''Steve'', ''Aarti'', ''Colin'', ''Joshi'', ''Dan'', ''Cryst'', ''shaw'', ''Cyan'', ''Reia'', ''ZWEB_TEST'', ''Casey'', ''Lewis'', ''Swati'', ''Andrius'', ''Rawan'', ''Alan'', ''Piri'', ''Raj'', ''Albert'') 
' 
GO
/****** Object:  View [kpi].[PointSummary]    Script Date: 13/08/2018 8:15:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[kpi].[PointSummary]'))
EXEC dbo.sp_executesql @statement = N'
create view kpi.PointSummary as
with data as
(
select picker as staff,cast(datepart(day,dbo.GetNzDate())-datepart(day,txndate) as varchar(5)) + ''d'' as range,round(count(distinct SalesorderRefNumber)*0.5,1) TotalPoints from invoice 
where txndate = format(dbo.GetNzDate(),''yyyy-MM-dd'') and picker is not null
group by picker,datepart(day,txndate)
union 
select picker as staff,cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w'' as range,round(count(distinct SalesorderRefNumber)*0.5,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,dbo.GetNzDate()) and picker is not null
group by picker,datepart(week,txndate)
union
select picker as staff,cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m'' as range,round(count(distinct SalesorderRefNumber)*0.5,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,dbo.GetNzDate()) and picker is not null
group by picker,datepart(month,txndate)
union
--packer
select packer as staff,cast(datepart(day,dbo.GetNzDate())-datepart(day,txndate) as varchar(5)) + ''d'' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where txndate = format(dbo.GetNzDate(),''yyyy-MM-dd'') and packer is not null
group by packer,datepart(day,txndate)
union 
select packer as staff,cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w'' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,dbo.GetNzDate()) and packer is not null
group by packer,datepart(week,txndate)
union
select packer as staff,cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m'' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,dbo.GetNzDate()) and packer is not null
group by packer,datepart(month,txndate)  
union
select Checker as staff,cast(datepart(day,dbo.GetNzDate())-datepart(day,txndate) as varchar(5)) + ''d'' as range,round(count(distinct SalesorderRefNumber)*0.05,1) TotalPoints from invoice 
where txndate = format(dbo.GetNzDate(),''yyyy-MM-dd'') and Checker is not null
group by Checker,datepart(day,txndate)
union 
select Checker as staff,cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w'' as range,round(count(distinct SalesorderRefNumber)*0.05,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,dbo.GetNzDate()) and Checker is not null
group by Checker,datepart(week,txndate)
union
select Checker as staff,cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m'' as range,round(count(distinct SalesorderRefNumber)*0.05,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,dbo.GetNzDate()) and Checker is not null
group by Checker,datepart(month,txndate) 
union
select SalesRepRefFullName as staff,cast(datepart(day,dbo.GetNzDate())-datepart(day,txndate) as varchar(5)) + ''d'' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where txndate = format(dbo.GetNzDate(),''yyyy-MM-dd'') and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(day,txndate)
union 
select SalesRepRefFullName as staff,cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w'' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,dbo.GetNzDate()) and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(week,txndate)
union
select SalesRepRefFullName as staff,cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m'' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,dbo.GetNzDate()) and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(month,txndate)
union
--for total amount
select picker as staff,cast(datepart(day,dbo.GetNzDate())-datepart(day,txndate) as varchar(5)) + ''d'' as range,round(sum(TotalAmount/100),1) TotalPoints from invoice 
where txndate = format(dbo.GetNzDate(),''yyyy-MM-dd'') and picker is not null
group by picker,datepart(day,txndate)
union 
select picker as staff,cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w'' as range,round(sum(TotalAmount/100),1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,dbo.GetNzDate()) and picker is not null
group by picker,datepart(week,txndate)
union
select picker as staff,cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m'' as range,round(sum(TotalAmount/100),1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,dbo.GetNzDate()) and picker is not null
group by picker,datepart(month,txndate)
union
--packer
select packer as staff,cast(datepart(day,dbo.GetNzDate())-datepart(day,txndate) as varchar(5)) + ''d'' as range,round(sum(TotalAmount/100)*0.5,1) TotalPoints from invoice 
where txndate = format(dbo.GetNzDate(),''yyyy-MM-dd'') and packer is not null
group by packer,datepart(day,txndate)
union 
select packer as staff,cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w'' as range,round(sum(TotalAmount/100)*0.5,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,dbo.GetNzDate()) and packer is not null
group by packer,datepart(week,txndate)
union
select packer as staff,cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m'' as range,round(sum(TotalAmount/100)*0.5,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,dbo.GetNzDate()) and packer is not null
group by packer,datepart(month,txndate)  
union
select Checker as staff,cast(datepart(day,dbo.GetNzDate())-datepart(day,txndate) as varchar(5)) + ''d'' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where txndate = format(dbo.GetNzDate(),''yyyy-MM-dd'') and Checker is not null
group by Checker,datepart(day,txndate)
union 
select Checker as staff,cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w'' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,dbo.GetNzDate()) and Checker is not null
group by Checker,datepart(week,txndate)
union
select Checker as staff,cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m'' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,dbo.GetNzDate()) and Checker is not null
group by Checker,datepart(month,txndate) 
union
select SalesRepRefFullName as staff,cast(datepart(day,dbo.GetNzDate())-datepart(day,txndate) as varchar(5)) + ''d'' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where txndate = format(dbo.GetNzDate(),''yyyy-MM-dd'') and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(day,txndate)
union 
select SalesRepRefFullName as staff,cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w'' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,dbo.GetNzDate()) and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(week,txndate)
union
select SalesRepRefFullName as staff,cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m'' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,dbo.GetNzDate()) and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(month,txndate)
 
)
select Staff, isnull([0d],0) as ''Today'',isnull([0w],0)  as ''WTD'',isnull([0m],0) as ''MTD''
from data
pivot (sum(TotalPoints) for [range] in ([0d] ,[0w],[0m] )) as Total
where staff not in (''James'',''Joseph'',''Stu'',''Rae-John'',''Navneil'',''Shannon'',''Tarun'', ''Manan'', ''Steve'', ''Aarti'', ''Colin'', ''Joshi'', ''Dan'', ''Cryst'', ''shaw'', ''Cyan'', ''Reia'', ''ZWEB_TEST'', ''Casey'', ''Lewis'', ''Swati'', ''Andrius'', ''Rawan'', ''Alan'', ''Piri'', ''Raj'', ''Albert'')   
' 
GO
/****** Object:  View [kpi].[V_Reordering]    Script Date: 13/08/2018 8:15:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[kpi].[V_Reordering]'))
EXEC dbo.sp_executesql @statement = N'create view kpi.V_Reordering
as
with 
t_eta as
(
select sku,iif(min(PurchaseOrder.ExpectedDate)=''1900-01-01'',0,datediff(day,dbo.GetNzDate(),min(PurchaseOrder.ExpectedDate))) as ETA 
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
and i.TxnDate>= CONVERT(DATE,DATEADD(q,DATEDIFF(q, 0, dbo.GetNzDate()),0)) 
group by il.InvoiceLineItemFullName
),
t_q1 as
(
select il.InvoiceLineItemFullName as sku,SUM(il.InvoiceLineQuantity) as Q1 
from Invoiceline il, Invoice i 
where i.id=il.InvoiceID 
and i.TxnDate>= CONVERT(DATE,DATEADD(q,DATEDIFF(q, 0, dbo.GetNzDate())-1,0)) and i.TxnDate< CONVERT(DATE,DATEADD(q,DATEDIFF(q, 0, dbo.GetNzDate()),0))
group by il.InvoiceLineItemFullName
),
---Q2 old
t_new_all as
(
select pl.sku,sum(pl.PurchaseOrderLineQuantity) as new_all from PurchaseOrderLine pl 
 where done!=1
 -- and pl.ExpectedDate > format(dbo.GetNzDate(),''yyyy-MM-dd'') 
 group by pl.sku
),
t_new_q1 as
(
select pl.sku,sum(pl.PurchaseOrderLineQuantity) as new_q1 from PurchaseOrderLine pl, PurchaseOrder po
 where po.id=pl.PurchaseOrderID and
 po.ExpectedDate > format(dbo.GetNzDate(),''yyyy-MM-dd'')   and po.ExpectedDate<CONVERT(DATE,DATEADD(m,DATEDIFF(m, 0, dbo.GetNzDate())+1,0))
 group by pl.sku
),
t_new_q2 as
(
 select pl.sku,sum(pl.PurchaseOrderLineQuantity) as new_q2 from PurchaseOrderLine pl, PurchaseOrder po 
 where po.id=pl.PurchaseOrderID and
 po.ExpectedDate > format(dbo.GetNzDate(),''yyyy-MM-dd'')   and po.ExpectedDate<CONVERT(DATE,DATEADD(m,DATEDIFF(m, 0, dbo.GetNzDate())+2,0))
 group by pl.sku
),
t_new_q3 as
(
 select pl.sku,sum(pl.PurchaseOrderLineQuantity) as new_q3 from PurchaseOrderLine pl, PurchaseOrder po 
 where po.id=pl.PurchaseOrderID and
 po.ExpectedDate > format(dbo.GetNzDate(),''yyyy-MM-dd'')   and po.ExpectedDate<CONVERT(DATE,DATEADD(m,DATEDIFF(m, 0, dbo.GetNzDate())+3,0))
 group by pl.sku
),
t_new_q4 as
(
 select pl.sku,sum(pl.PurchaseOrderLineQuantity) as new_q4 from PurchaseOrderLine pl, PurchaseOrder po
 where po.id=pl.PurchaseOrderID and
 po.ExpectedDate > format(dbo.GetNzDate(),''yyyy-MM-dd'')   and po.ExpectedDate<CONVERT(DATE,DATEADD(m,DATEDIFF(m, 0, dbo.GetNzDate())+4,0))
 group by pl.sku
),
t_new_q5 as
(
 select pl.sku,sum(pl.PurchaseOrderLineQuantity) as new_q5 from PurchaseOrderLine pl, PurchaseOrder po 
 where po.id=pl.PurchaseOrderID and
 po.ExpectedDate > format(dbo.GetNzDate(),''yyyy-MM-dd'')   and po.ExpectedDate<CONVERT(DATE,DATEADD(m,DATEDIFF(m, 0, dbo.GetNzDate())+5,0))
 group by pl.sku
),
t_new_q6 as
(
 select pl.sku,sum(pl.PurchaseOrderLineQuantity) as new_q6 from PurchaseOrderLine pl, PurchaseOrder po 
 where po.id=pl.PurchaseOrderID and
 po.ExpectedDate > format(dbo.GetNzDate(),''yyyy-MM-dd'')   and po.ExpectedDate<CONVERT(DATE,DATEADD(m,DATEDIFF(m, 0, dbo.GetNzDate())+6,0))
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
  isnull(t_new_by_month.ArrivalQtyMonth10,0) as ArrivalQtyMonth10,
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
' 
GO
/****** Object:  View [kpi].[PointDetails]    Script Date: 13/08/2018 8:15:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[kpi].[PointDetails]'))
EXEC dbo.sp_executesql @statement = N'create view kpi.PointDetails as
with data as
(
select picker as staff,cast(datepart(day,dbo.GetNzDate())-datepart(day,txndate) as varchar(5)) + ''d_pi_n'' as range,round(count(distinct SalesorderRefNumber)*0.5,1) TotalPoints from invoice 
where txndate = format(dbo.GetNzDate(),''yyyy-MM-dd'') and picker is not null
group by picker,datepart(day,txndate)
union 
select picker as staff,cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w_pi_n'' as range,round(count(distinct SalesorderRefNumber)*0.5,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,dbo.GetNzDate()) and picker is not null
group by picker,datepart(week,txndate)
union
select picker as staff,cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m_pi_n'' as range,round(count(distinct SalesorderRefNumber)*0.5,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,dbo.GetNzDate()) and picker is not null
group by picker,datepart(month,txndate)
union
--packer
select packer as staff,cast(datepart(day,dbo.GetNzDate())-datepart(day,txndate) as varchar(5)) + ''d_pa_n'' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where txndate = format(dbo.GetNzDate(),''yyyy-MM-dd'') and packer is not null
group by packer,datepart(day,txndate)
union 
select packer as staff,cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w_pa_n'' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,dbo.GetNzDate()) and packer is not null
group by packer,datepart(week,txndate)
union
select packer as staff,cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m_pa_n'' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,dbo.GetNzDate()) and packer is not null
group by packer,datepart(month,txndate)  
union
select Checker as staff,cast(datepart(day,dbo.GetNzDate())-datepart(day,txndate) as varchar(5)) + ''d_ch_n'' as range,round(count(distinct SalesorderRefNumber)*0.05,1) TotalPoints from invoice 
where txndate = format(dbo.GetNzDate(),''yyyy-MM-dd'') and Checker is not null
group by Checker,datepart(day,txndate)
union 
select Checker as staff,cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w_ch_n'' as range,round(count(distinct SalesorderRefNumber)*0.05,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,dbo.GetNzDate()) and Checker is not null
group by Checker,datepart(week,txndate)
union
select Checker as staff,cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m_ch_n'' as range,round(count(distinct SalesorderRefNumber)*0.05,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,dbo.GetNzDate()) and Checker is not null
group by Checker,datepart(month,txndate) 
union
select SalesRepRefFullName as staff,cast(datepart(day,dbo.GetNzDate())-datepart(day,txndate) as varchar(5)) + ''d_in_n'' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where txndate = format(dbo.GetNzDate(),''yyyy-MM-dd'') and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(day,txndate)
union 
select SalesRepRefFullName as staff,cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w_in_n'' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,dbo.GetNzDate()) and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(week,txndate)
union
select SalesRepRefFullName as staff,cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m_in_n'' as range,round(count(distinct SalesorderRefNumber)*0.25,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,dbo.GetNzDate()) and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(month,txndate)
union
--for total amount
select picker as staff,cast(datepart(day,dbo.GetNzDate())-datepart(day,txndate) as varchar(5)) + ''d_pi_v'' as range,round(sum(TotalAmount/100),1) TotalPoints from invoice 
where txndate = format(dbo.GetNzDate(),''yyyy-MM-dd'') and picker is not null
group by picker,datepart(day,txndate)
union 
select picker as staff,cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w_pi_v'' as range,round(sum(TotalAmount/100),1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,dbo.GetNzDate()) and picker is not null
group by picker,datepart(week,txndate)
union
select picker as staff,cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m_pi_v'' as range,round(sum(TotalAmount/100),1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,dbo.GetNzDate()) and picker is not null
group by picker,datepart(month,txndate)
union
--packer
select packer as staff,cast(datepart(day,dbo.GetNzDate())-datepart(day,txndate) as varchar(5)) + ''d_pa_v'' as range,round(sum(TotalAmount/100)*0.5,1) TotalPoints from invoice 
where txndate = format(dbo.GetNzDate(),''yyyy-MM-dd'') and packer is not null
group by packer,datepart(day,txndate)
union 
select packer as staff,cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w_pa_v'' as range,round(sum(TotalAmount/100)*0.5,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,dbo.GetNzDate()) and packer is not null
group by packer,datepart(week,txndate)
union
select packer as staff,cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m_pa_v'' as range,round(sum(TotalAmount/100)*0.5,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,dbo.GetNzDate()) and packer is not null
group by packer,datepart(month,txndate)  
union
select Checker as staff,cast(datepart(day,dbo.GetNzDate())-datepart(day,txndate) as varchar(5)) + ''d_ch_v'' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where txndate = format(dbo.GetNzDate(),''yyyy-MM-dd'') and Checker is not null
group by Checker,datepart(day,txndate)
union 
select Checker as staff,cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w_ch_v'' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,dbo.GetNzDate()) and Checker is not null
group by Checker,datepart(week,txndate)
union
select Checker as staff,cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m_ch_v'' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,dbo.GetNzDate()) and Checker is not null
group by Checker,datepart(month,txndate) 
union
select SalesRepRefFullName as staff,cast(datepart(day,dbo.GetNzDate())-datepart(day,txndate) as varchar(5)) + ''d_in_v'' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where txndate = format(dbo.GetNzDate(),''yyyy-MM-dd'') and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(day,txndate)
union 
select SalesRepRefFullName as staff,cast(datepart(week,dbo.GetNzDate())-datepart(week,txndate) as varchar(5)) + ''w_in_v'' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where datepart(week,txndate) = datepart(week,dbo.GetNzDate()) and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(week,txndate)
union
select SalesRepRefFullName as staff,cast(datepart(month,dbo.GetNzDate())-datepart(month,txndate) as varchar(5)) + ''m_in_v'' as range,round(sum(TotalAmount/100)*0.1,1) TotalPoints from invoice 
where datepart(month,txndate) = datepart(month,dbo.GetNzDate()) and SalesRepRefFullName is not null
group by SalesRepRefFullName,datepart(month,txndate)
 
)
select Staff, isnull([0d_pi_n],0) as [0d_pi_n],isnull([0w_pi_n],0) as [0w_pi_n],isnull([0m_pi_n],0) as [0m_pi_n],isnull([0d_pa_n],0) as [0d_pa_n],isnull([0w_pa_n],0) as [0w_pa_n],isnull([0m_pa_n],0) as [0m_pa_n],isnull([0d_in_n],0) as [0d_in_n],isnull([0w_in_n],0) as [0w_in_n],isnull([0m_in_n],0) as [0m_in_n],
isnull([0d_pi_v],0) as [0d_pi_v],isnull([0w_pi_v],0) as [0w_pi_v],isnull([0m_pi_v],0) as [0m_pi_v],isnull([0d_pa_v],0) as [0d_pa_v],isnull([0w_pa_v],0) as [0w_pa_v],isnull([0m_pa_v],0) as [0m_pa_v],isnull([0d_in_v],0) as [0d_in_v],isnull([0w_in_v],0) as [0w_in_v],isnull([0m_in_v],0) as [0m_in_v]
from data
pivot (sum(TotalPoints) for [range] in ([0d_pi_n],[0w_pi_n],[0m_pi_n],[0d_pa_n],[0w_pa_n],[0m_pa_n],[0d_ch_n],[0w_ch_n],[0m_ch_n],[0d_in_n],[0w_in_n],[0m_in_n],[0d_pi_v],[0w_pi_v],[0m_pi_v],[0d_pa_v],[0w_pa_v],[0m_pa_v],[0d_ch_v],[0w_ch_v],[0m_ch_v],[0d_in_v],[0w_in_v],[0m_in_v])) as Total
where staff not in (''James'',''Joseph'',''Stu'',''Rae-John'',''Navneil'',''Shannon'',''Tarun'', ''Manan'', ''Steve'', ''Aarti'', ''Colin'', ''Joshi'', ''Dan'', ''Cryst'', ''shaw'', ''Cyan'', ''Reia'', ''ZWEB_TEST'', ''Casey'', ''Lewis'', ''Swati'', ''Andrius'', ''Rawan'', ''Alan'', ''Piri'', ''Raj'', ''Albert'')   

' 
GO
/****** Object:  View [dbo].[item_eta]    Script Date: 13/08/2018 8:15:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[item_eta]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW item_eta AS

select 
     
     PARSENAME(REPLACE(PurchaseOrderLineItemRefFullName, '':'', ''.''), 1) as sku, 
     ExpectedDate
     
from PurchaseOrderLine

where len(PARSENAME(REPLACE(PurchaseOrderLineItemRefFullName, '':'', ''.''), 1))>5' 
GO
/****** Object:  View [kpi].[SalesbySubCategory]    Script Date: 13/08/2018 8:15:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[kpi].[SalesbySubCategory]'))
EXEC dbo.sp_executesql @statement = N'create view kpi.SalesbySubCategory as
with data as
(
select replace(left(i.ParentRefFullName,charindex('':'',ParentRefFullName)),'':'','''') as Category, substring(ParentRefFullName,CHARINDEX('':'',ParentRefFullName)+1,len(ParentRefFullName))  as SubCategory, 
cast(datepart(DAY,dbo.GetNzDate())-datepart(DAY,s.txndate) as varchar(5)) + ''d'' as range,
  sum(round(SalesOrderLineAmount,0)) as TotalSales
From salesorderline o , ItemInventory i, Salesorder s
where s.id=o.SalesorderID and o.SalesOrderLineItemRefFullName=i.name and o.SalesOrderLineItemRefFullName not in (''Freight'','' '') and Category is not null
 and  txndate > format(DATEADD(day, -13, dbo.GetNzDate()),''yyyy-MM-dd'') 
group by replace(left(i.ParentRefFullName,charindex('':'',ParentRefFullName)),'':'',''''),substring(ParentRefFullName,CHARINDEX('':'',ParentRefFullName)+1,len(ParentRefFullName)),datepart(DAY,s.txndate)
union
select replace(left(i.ParentRefFullName,charindex('':'',ParentRefFullName)),'':'','''') as Category, substring(ParentRefFullName,CHARINDEX('':'',ParentRefFullName)+1,len(ParentRefFullName))  as SubCategory, 
cast(datepart(week,dbo.GetNzDate())-datepart(week,s.txndate) as varchar(5)) + ''w'' as range,
  sum(round(SalesOrderLineAmount,0)) as TotalSales
From salesorderline o , ItemInventory i, Salesorder s
where s.id=o.SalesorderID and o.SalesOrderLineItemRefFullName=i.name and o.SalesOrderLineItemRefFullName not in (''Freight'','' '') and Category is not null
 and datepart(week,txndate) > datepart(week,dbo.GetNzDate())-13
group by replace(left(i.ParentRefFullName,charindex('':'',ParentRefFullName)),'':'',''''),substring(ParentRefFullName,CHARINDEX('':'',ParentRefFullName)+1,len(ParentRefFullName)),datepart(week,s.txndate)
union
select replace(left(i.ParentRefFullName,charindex('':'',ParentRefFullName)),'':'','''') as Category, substring(ParentRefFullName,CHARINDEX('':'',ParentRefFullName)+1,len(ParentRefFullName))  as SubCategory, 
cast(datepart(month,dbo.GetNzDate())-datepart(month,s.txndate) as varchar(5)) + ''m'' as range,
  sum(round(SalesOrderLineAmount,0)) as TotalSales
From salesorderline o , ItemInventory i, Salesorder s
where s.id=o.SalesorderID and o.SalesOrderLineItemRefFullName=i.name and o.SalesOrderLineItemRefFullName not in (''Freight'','' '') and Category is not null
 and datepart(month,txndate) > datepart(month,dbo.GetNzDate())-13
group by replace(left(i.ParentRefFullName,charindex('':'',ParentRefFullName)),'':'',''''),substring(ParentRefFullName,CHARINDEX('':'',ParentRefFullName)+1,len(ParentRefFullName)),datepart(month,s.txndate)
)
select Category,SubCategory, isnull([0d],0) as [Today],isnull([1d],0) as [L1D],isnull([2d],0) as [L2D],isnull([3d],0) as [L3D],isnull([4d],0) as [L4D],isnull([5d],0) as [L5D],isnull([6d],0) as [L6D],isnull([7d],0) as [L7D],isnull([8d],0) as [L8D],isnull([9d],0) as [L9D],isnull([10d],0) as [L10D],isnull([11d],0) as [L11D],isnull([12d],0) as [L12D],
isnull([0w],0) as [WTD],isnull([1w],0) as [L1W],isnull([2w],0) as [L2W],isnull([3w],0) as [L3W],isnull([4w],0) as [L4W],isnull([5w],0) as [L5W],isnull([6w],0) as [L6W],isnull([7w],0) as [L7W],isnull([8w],0) as [L8W],isnull([9w],0) as [L9W],isnull([10w],0) as [L10W],isnull([11w],0) as [L11W],isnull([12w],0) as [L12W],
isnull([0m],0) as [MTD],isnull([1m],0) as [L1M],isnull([2m],0) as [L2M],isnull([3m],0) as [L3M],isnull([4m],0) as [L4M],isnull([5m],0) as [L5M],isnull([6m],0) as [L6M],isnull([7m],0) as [L7M],isnull([8m],0) as [L8M],isnull([9m],0) as [L9M],isnull([10m],0) as [L10M],isnull([11m],0) as [L11M],isnull([12m],0) as [L12M]
from data
pivot (sum(TotalSales) for [range] in ([0d],[1d],[2d],[3d],[4d],[5d],[6d],[7d],[8d],[9d],[10d],[11d],[12d],[0w],[1w],[2w],[3w],[4w],[5w],[6w],[7w],[8w],[9w],[10w],[11w],[12w],[0m],[1m],[2m],[3m],[4m],[5m],[6m],[7m],[8m],[9m],[10m],[11m],[12m])) as Total
' 
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ItemInventoryStorage_Storage]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemInventoryStorage]'))
ALTER TABLE [dbo].[ItemInventoryStorage]  WITH CHECK ADD  CONSTRAINT [FK_ItemInventoryStorage_Storage] FOREIGN KEY([StorageID])
REFERENCES [dbo].[BinLocation] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ItemInventoryStorage_Storage]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemInventoryStorage]'))
ALTER TABLE [dbo].[ItemInventoryStorage] CHECK CONSTRAINT [FK_ItemInventoryStorage_Storage]
GO

/****** Restoring object ownership for scripted objects      Script Date: 13/08/2018 8:15:51 p.m. ******/
ALTER AUTHORIZATION
    ON SCHEMA::[kpi]
    TO [dbo]
GO

