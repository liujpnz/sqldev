--full backup
DECLARE @BackupFileName1 varchar(100)
DECLARE @BackupFileName2 varchar(100)

SET @BackupFileName1 = 'F:\DB_bak\Dwdb_usb_' + REPLACE(REPLACE(REPLACE(CONVERT(varchar,GETDATE(), 20),'-',''),':',''),' ','') + '.bak0'
SET @BackupFileName2 = 'C:\DB_bak\Dwdb_loc_' + REPLACE(REPLACE(REPLACE(CONVERT(varchar,GETDATE(), 20),'-',''),':',''),' ','') + '.bak0'


BACKUP DATABASE DatawarehouseDB TO  disk=@BackupFileName1
mirror to disk=@BackupFileName2 WITH FORMAT


--differential backup
DECLARE @BackupFileName1 varchar(100)
DECLARE @BackupFileName2 varchar(100)

SET @BackupFileName1 = 'F:\DB_bak\Dwdb_usb_' + REPLACE(REPLACE(REPLACE(CONVERT(varchar,GETDATE(), 20),'-',''),':',''),' ','') + '.bak1'
SET @BackupFileName2 = 'C:\DB_bak\Dwdb_loc_' + REPLACE(REPLACE(REPLACE(CONVERT(varchar,GETDATE(), 20),'-',''),':',''),' ','') + '.bak1'


BACKUP DATABASE DatawarehouseDB TO  disk=@BackupFileName1
mirror to disk=@BackupFileName2 WITH DIFFERENTIAL,FORMAT


--transaction log backup
DECLARE @BackupFileName1 varchar(100)
DECLARE @BackupFileName2 varchar(100)

SET @BackupFileName1 = 'F:\DB_bak\Dwdb_usb_' + REPLACE(REPLACE(REPLACE(CONVERT(varchar,GETDATE(), 20),'-',''),':',''),' ','') + '.log'
SET @BackupFileName2 = 'C:\DB_bak\Dwdb_loc_' + REPLACE(REPLACE(REPLACE(CONVERT(varchar,GETDATE(), 20),'-',''),':',''),' ','') + '.log'


BACKUP log DatawarehouseDB TO  disk=@BackupFileName1
mirror to disk=@BackupFileName2 WITH FORMAT





--restore 
USE [master]
RESTORE DATABASE Dwtest FROM  DISK = N'D:\bak\Dwdb_0_loc_20180608161135.bak' WITH  FILE = 1,  MOVE N'WarehouseDataCenter' TO N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Dwtest.mdf',  MOVE N'WarehouseDataCenter_log' TO N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Dwtest_log.ldf',  NORECOVERY,  NOUNLOAD,  REPLACE,  STATS = 5
RESTORE DATABASE Dwtest FROM  DISK = N'D:\bak\Dwdb_1_loc_20180608161229.bak' WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG Dwtest FROM  DISK = N'D:\bak\Dwdb_log_loc_20180608161318.bak' WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG Dwtest FROM  DISK = N'D:\bak\Dwdb_log_loc_20180608161500.bak' WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  STATS = 5

GO

restore database Dwtest with recovery;


--restore in point of time
RESTORE LOG AdventureWorks  
   FROM AdventureWorksBackups  
   WITH FILE=5, NORECOVERY, STOPAT = 'Apr 15, 2020 12:00 AM';  
RESTORE DATABASE AdventureWorks WITH RECOVERY;   
GO  


