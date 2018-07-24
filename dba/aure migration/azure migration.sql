select * from salesorder order by 2 desc




select * from sys.database_files;

use Dwdb
ALTER DATABASE Dwdb  SET RECOVERY SIMPLE;  
GO  

DBCC SHRINKFILE (WarehouseDataCenter_log, 100); 

-- Reset the database recovery model.  
ALTER DATABASE Dwdb SET RECOVERY FULL;  
GO  


#http://www.fileformat.info/tip/microsoft/sql_orphan_user.htm

SET NOCOUNT ON
USE dwdb
GO
DECLARE @loop INT
DECLARE @USER sysname
DECLARE @sqlcmd NVARCHAR(500) = ''

IF OBJECT_ID('tempdb..#Orphaned') IS NOT NULL 
 BEGIN
  DROP TABLE #orphaned
 END

CREATE TABLE #Orphaned (UserName sysname,IDENT INT IDENTITY(1,1))


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
 