
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