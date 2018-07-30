select * from salesorder order by 2 desc




select * from sys.database_files;

use dwdb0724
ALTER DATABASE dwdb0724  SET RECOVERY SIMPLE;  
GO  

DBCC SHRINKFILE (WarehouseDataCenter_log, 100); 

-- Reset the database recovery model.  
ALTER DATABASE dwdb0724 SET RECOVERY FULL;  
GO  


#http://www.fileformat.info/tip/microsoft/sql_orphan_user.htm

/*
TITLE: Microsoft SQL Server Management Studio
------------------------------

One or more unsupported elements were found in the schema used as part of a data package.
Error SQL71564: Error validating element [dwuser]: The element [dwuser] has been orphaned from its login and cannot be deployed.
Error SQL71564: Error validating element [pbuser]: The element [pbuser] has been orphaned from its login and cannot be deployed.
 (Microsoft.SqlServer.Dac)

*/


SET NOCOUNT ON
USE dwdb0724
GO
DECLARE @loop INT
DECLARE @USER sysname
DECLARE @sqlcmd NVARCHAR(500) = ''

IF OBJECT_ID('tempdb..#Orphaned') IS NOT NULL 
 BEGIN
  DROP TABLE #orphaned
 END

CREATE TABLE #Orphaned (UserName sysname,IDENT INT IDENTITY(1,1))

--check unsupport login
INSERT INTO #Orphaned (UserName)
SELECT [name] FROM sys.database_principals WHERE [type] IN ('U','S') AND is_fixed_role = 0 AND [Name] NOT IN ('dbo','guest','sys','INFORMATION_SCHEMA')

IF(SELECT COUNT(*) FROM #Orphaned) > 0
BEGIN
 SET @loop = 1
 WHILE @loop <= (SELECT MAX(IDENT) FROM #Orphaned)
  BEGIN
    SET @USER = (SELECT UserName FROM #Orphaned WHERE IDENT = @loop)
    IF(SELECT COUNT(*) FROM sys.server_principals WHERE [Name] = @USER) <= 0
     BEGIN
        IF EXISTS(SELECT 1 FROM sys.database_principals WHERE [Name] = @USER AND type_desc = 'WINDOWS_USER')
         BEGIN
            SET @sqlcmd = 'CREATE LOGIN [' + @USER + '] FROM WINDOWS'
            Exec(@sqlcmd)
            PRINT @sqlcmd
         END
        IF EXISTS(SELECT 1 FROM sys.database_principals WHERE [Name] = @USER AND type_desc = 'SQL_USER')
         BEGIN
            SET @sqlcmd = 'CREATE LOGIN [' + @USER + '] WITH PASSWORD = N''password'''
            Exec(@sqlcmd)
            PRINT @sqlcmd
         END
     END

    SET @sqlcmd = 'ALTER USER [' + @USER + '] WITH LOGIN = [' + @USER + ']'
    Exec(@sqlcmd)
    PRINT @USER + ' link to DB user reset';
    SET @loop = @loop + 1
  END
END
SET NOCOUNT OFF


CREATE LOGIN [dwuser] WITH PASSWORD = N'***'
dwuser link to DB user reset
CREATE LOGIN [pbuser] WITH PASSWORD = N'***'
pbuser link to DB user reset



select * From  sys.database_principals
select * from sys.server_principals


select p.name,p.sid
from sys.database_principals p
where p.type in ('G','S','U')
and p.sid not in (select sid from sys.server_principals)
and p.name not in (
    'dbo',
    'guest',
    'INFORMATION_SCHEMA',
    'sys',
    'MS_DataCollectorInternalUser'
) ;
 



