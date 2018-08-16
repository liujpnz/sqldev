
--#rename 
use dwdb

--rename db name
exec sp_rename 'dbtest11','dwtest','database'


--rename table name
exec sp_rename 'dbo.salesorder','salesorder_bak' 
exec sp_rename 'dbo.salesorder_bak','Salesorder'


--rename column name
EXEC sp_rename 'dbo.salesorder.TimeCreated', 'TimeCreated1', 'COLUMN';  

--rename index name
EXEC sp_rename 'dbo.salesorder.NonClusteredIndex-20171130-111601', 'NonClusteredIndex11', 'INDEX';  


--rename constraint
USE AdventureWorks2012;   
GO  
-- Return the current Primary Key, Foreign Key and Check constraints for the Employee table.  
SELECT name, SCHEMA_NAME(schema_id) AS schema_name, type_desc  
FROM sys.objects  
WHERE parent_object_id = (OBJECT_ID('HumanResources.Employee'))   
AND type IN ('C','F', 'PK');   
GO  

-- Rename the primary key constraint.  
sp_rename 'HumanResources.PK_Employee_BusinessEntityID', 'PK_EmployeeID';  
GO  

-- Rename a check constraint.  
sp_rename 'HumanResources.CK_Employee_BirthDate', 'CK_BirthDate';  
GO  

-- Rename a foreign key constraint.  
sp_rename 'HumanResources.FK_Employee_Person_BusinessEntityID', 'FK_EmployeeID';  

-- Return the current Primary Key, Foreign Key and Check constraints for the Employee table.  
SELECT name, SCHEMA_NAME(schema_id) AS schema_name, type_desc  
FROM sys.objects  
WHERE parent_object_id = (OBJECT_ID('HumanResources.Employee'))   
AND type IN ('C','F', 'PK');  



--rename statistics
CREATE STATISTICS ContactMail1  
    ON Person.Person (BusinessEntityID, EmailPromotion)  
    WITH SAMPLE 5 PERCENT;  

sp_rename 'Person.Person.ContactMail1', 'NewContact','Statistics';  



--active session



--sql state
SELECT query_stats.query_hash AS "Query Hash",
    SUM(query_stats.total_worker_time) / SUM(query_stats.execution_count) AS "Avg CPU Time",
    MIN(query_stats.statement_text) AS "Statement Text"
FROM
    (SELECT QS.*,
    SUBSTRING(ST.text, (QS.statement_start_offset/2) + 1,
    ((CASE statement_end_offset
        WHEN -1 THEN DATALENGTH(ST.text)
        ELSE QS.statement_end_offset END
            - QS.statement_start_offset)/2) + 1) AS statement_text
     FROM sys.dm_exec_query_stats AS QS
     CROSS APPLY sys.dm_exec_sql_text(QS.sql_handle) as ST) as query_stats
GROUP BY query_stats.query_hash
ORDER BY 2 DESC;



--grouping
Without grouping

SELECT STRING_AGG(Name, ', ') AS Departments
FROM HumanResources.Department;

With grouping :

SELECT GroupName, STRING_AGG(Name, ', ') AS Departments
FROM HumanResources.Department
GROUP BY GroupName;

With grouping and sub-sorting

SELECT GroupName, STRING_AGG(Name, ', ') WITHIN GROUP (ORDER BY Name ASC) AS Departments
FROM HumanResources.Department 
GROUP BY GroupName;


--
--top 5 sql
SELECT TOP 5 query_stats.query_hash AS "Query Hash",
    SUM(query_stats.total_worker_time) / SUM(query_stats.execution_count) AS "Avg CPU Time",
    MIN(query_stats.statement_text) AS "Statement Text"
FROM
    (SELECT QS.*,
    SUBSTRING(ST.text, (QS.statement_start_offset/2) + 1,
    ((CASE statement_end_offset
        WHEN -1 THEN DATALENGTH(ST.text)
        ELSE QS.statement_end_offset END
            - QS.statement_start_offset)/2) + 1) AS statement_text
     FROM sys.dm_exec_query_stats AS QS
     CROSS APPLY sys.dm_exec_sql_text(QS.sql_handle) as ST) as query_stats
GROUP BY query_stats.query_hash
ORDER BY 2 DESC;

--current running sql

SELECT sqltext.TEXT,
req.session_id,
req.status,
req.start_time,
req.command,
req.cpu_time,
req.total_elapsed_time
FROM sys.dm_exec_requests req
CROSS APPLY sys.dm_exec_sql_text(sql_handle) AS sqltext 



--session
select * from sys.dm_exec_sessions
select HOST_NAME,count(*) from sys.dm_exec_sessions group by HOST_NAME;
select HOST_NAME,program_name,count(*) from sys.dm_exec_sessions where Host_name not in ('DESKTOP-3SLRU37') group by HOST_NAME,program_name;



--connect with port
select * from sys.dm_exec_connections;

go


select * from sys.dm_exec_requests;
select * from sys.dm_exec_sql_text(0x020000005BD36F1F8C0A0F1C801AD40E0C861878492994890000000000000000000000000000000000000000);


--primary key

DROP INDEX PK_ItemStock1 ON [dbo].[ItemStock];
GO

CREATE UNIQUE CLUSTERED INDEX PK_ItemStock1 ON [dbo].[ItemStock](ID);
GO

ALTER TABLE [dbo].[ItemStock] 
ADD CONSTRAINT PK_ItemStock11 PRIMARY KEY CLUSTERED (ID);
GO
