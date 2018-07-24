
backup db job


restart db

--check session
select * from sys.dm_exec_sessions
select HOST_NAME,count(*) from sys.dm_exec_sessions group by HOST_NAME;
select HOST_NAME,program_name,count(*) from sys.dm_exec_sessions where Host_name not in ('DESKTOP-3SLRU37') group by HOST_NAME,program_name;


restart db

--check session
select * from sys.dm_exec_sessions
select HOST_NAME,count(*) from sys.dm_exec_sessions group by HOST_NAME;
select HOST_NAME,program_name,count(*) from sys.dm_exec_sessions where Host_name not in ('DESKTOP-3SLRU37') group by HOST_NAME,program_name;


--check records
SELECT count(*)
  FROM [DatawarehouseDB].[dbo].[Salesorder] 

select top 10 * from [DatawarehouseDB].[dbo].[Salesorder] order by 2 desc;



--offline old db
alter database offline




--transaction log compact

select * from sys.database_files;

use DataCenter
ALTER DATABASE DataCenter  SET RECOVERY SIMPLE;  
GO  


DBCC SHRINKFILE (DataCenter_log, 100); 

-- Reset the database recovery model.  
ALTER DATABASE DataCenter SET RECOVERY FULL;  
GO  

use DatawarehouseDB
select * from sys.databases;
ALTER DATABASE DatawarehouseDB  SET RECOVERY SIMPLE;  
GO  

DBCC SHRINKFILE (WarehouseDataCenter_log, 100);  

ALTER DATABASE DatawarehouseDB  SET RECOVERY FULL;  



--alter database offline


copy file to usb

unplug



copy to data 
--attach database file


--start application

--check session
select * from sys.dm_exec_sessions
select HOST_NAME,count(*) from sys.dm_exec_sessions group by HOST_NAME;
select HOST_NAME,program_name,count(*) from sys.dm_exec_sessions where Host_name not in ('DESKTOP-3SLRU37') group by HOST_NAME,program_name;
