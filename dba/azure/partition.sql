--https://www.mssqltips.com/sqlservertip/3494/azure-sql-database--table-partitioning/

/*  
 Use table partitioning
*/

-- Which database to use.
USE Dwdb0724
GO

-- Create the partition function
CREATE PARTITION FUNCTION PF_HASH_BY_VALUE (BIGINT) AS RANGE LEFT 
FOR VALUES (100000, 200000, 300000, 400000, 500000, 600000, 700000, 800000, 900000)
GO

-- Show the function
SELECT * FROM sys.partition_functions
GO

-- Create the partition scheme
CREATE PARTITION SCHEME PS_HASH_BY_VALUE 
AS PARTITION PF_HASH_BY_VALUE
ALL TO ([PRIMARY]);
GO

-- Show the scheme
SELECT * FROM sys.partition_schemes
GO


-- Test partition function
SELECT 
  MY_VALUE,
  $PARTITION.PF_HASH_BY_VALUE(MY_VALUE) AS HASH_IDX
FROM 
(
 VALUES 
   (1),
   (100001), 
   (200001), 
   (300001), 
   (400001), 
   (500001), 
   (600001), 
   (700001), 
   (800001), 
   (900001)
) AS TEST (MY_VALUE);
GO

/*  
 Create a table to hold the prime numbers
*/

-- Which database to use.
USE Dwdb0724
GO

-- Delete existing table
IF  EXISTS (SELECT * FROM sys.objects 
  WHERE object_id = OBJECT_ID(N'[DBO].[TBL_PRIMES]') AND type in (N'U'))
DROP TABLE [DBO].[TBL_PRIMES]
GO

-- Add new table
CREATE TABLE [DBO].[TBL_PRIMES] 
(
  [MY_VALUE] [bigint] NOT NULL,
  [MY_DIVISION] [bigint] NOT NULL ,--CONSTRAINT [CHK_TBL_PRIMES] CHECK ([MY_DIVISION] - 0),
  [MY_TIME] [datetime] NOT NULL CONSTRAINT [DF_TBL_PRIMES] DEFAULT (GETDATE())
  CONSTRAINT [PK_TBL_PRIMES] PRIMARY KEY CLUSTERED ([MY_VALUE] ASC)
) ON PS_HASH_BY_VALUE ([MY_VALUE])
GO


/*  
 Create a procedure to determine if number is prime
*/


-- Which database to use.
USE Dwdb0724
GO

-- Delete existing procedure
IF  EXISTS (SELECT * FROM sys.objects 
  WHERE object_id = OBJECT_ID(N'[dbo].[SP_IS_PRIME]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_IS_PRIME]
GO

-- Create the stored procedure from scratch
CREATE PROCEDURE [dbo].[SP_IS_PRIME]
    @VAR_NUM2 BIGINT
AS
BEGIN
    -- NO DISPLAY
    SET NOCOUNT ON
 
    -- LOCAL VARIABLES
    DECLARE @VAR_CNT2 BIGINT;
    DECLARE @VAR_MAX2 BIGINT;

    -- NOT A PRIME NUMBER
    IF (@VAR_NUM2 = 1)
        RETURN 0;            

    -- A PRIME NUMBER
    IF (@VAR_NUM2 = 2)
        RETURN 1;            

    -- SET UP COUNTERS    
    SELECT @VAR_CNT2 = 2;
    SELECT @VAR_MAX2 = SQRT(@VAR_NUM2) + 1;

    -- TRIAL DIVISION 2 TO SQRT(X)
    WHILE (@VAR_CNT2 <= @VAR_MAX2)
    BEGIN
        -- NOT A PRIME NUMBER
        IF (@VAR_NUM2 % @VAR_CNT2) = 0
            RETURN 0;            

        -- INCREMENT COUNTER
        SELECT @VAR_CNT2 = @VAR_CNT2 + 1;
        
    END;

    -- A PRIME NUMBER
    RETURN 1;
    
END
GO


/*    
 Create a procedure to store primes from x to y.
*/

-- Which database to use.
USE Dwdb0724
GO

-- Delete existing procedure
IF  EXISTS (SELECT * FROM sys.objects 
  WHERE object_id = OBJECT_ID(N'[dbo].[SP_STORE_PRIMES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_STORE_PRIMES]
GO

-- Create the stored procedure from scratch
CREATE PROCEDURE SP_STORE_PRIMES
    @VAR_ALPHA BIGINT,
    @VAR_OMEGA BIGINT
AS
BEGIN
    -- NO DISPLAY
    SET NOCOUNT ON
 
    -- DECLARE VARIABLES
    DECLARE @VAR_CNT1 BIGINT;
    DECLARE @VAR_RET1 INT;
    
    -- SET VARIABLES
    SELECT @VAR_RET1 = 0;
    SELECT @VAR_CNT1 = @VAR_ALPHA;

    -- CHECK EACH NUMBER FOR PRIMENESS
    WHILE (@VAR_CNT1 <= @VAR_OMEGA)
    BEGIN
        -- ARE WE PRIME?
        EXEC @VAR_RET1 = DBO.SP_IS_PRIME @VAR_CNT1;
        
        -- FOUND A PRIME
        IF (@VAR_RET1 = 1)
          INSERT INTO [DBO].[TBL_PRIMES] (MY_VALUE, MY_DIVISION) 
    VALUES (@VAR_CNT1, SQRT(@VAR_CNT1));
    
        -- INCREMENT COUNTER
        SELECT @VAR_CNT1 = @VAR_CNT1 + 1        
    END;
    
END
GO





--
REM
REM  Calculate primes numbers <= 1M asynchronously.
REM 

REM [Partition 1]
start cmd /c sqlcmd -S codf58h5ey.database.windows.net,1433 -U jminer -P SQLtip$2015 
  -d MATH -Q "EXEC SP_STORE_PRIMES 1, 100000;"

REM [Partition 2]
start cmd /c sqlcmd -S codf58h5ey.database.windows.net,1433 -U jminer -P SQLtip$2015 
  -d MATH -Q "EXEC SP_STORE_PRIMES 100001, 200000;"

REM [Partition 3]
start cmd /c sqlcmd -S codf58h5ey.database.windows.net,1433 -U jminer -P SQLtip$2015 
  -d MATH -Q "EXEC SP_STORE_PRIMES 200001, 300000;"

REM [Partition 4]
start cmd /c sqlcmd -S codf58h5ey.database.windows.net,1433 -U jminer -P SQLtip$2015 
  -d MATH -Q "EXEC SP_STORE_PRIMES 300001, 400000;"

REM [Partition 5]
start cmd /c sqlcmd -S codf58h5ey.database.windows.net,1433 -U jminer -P SQLtip$2015 
  -d MATH -Q "EXEC SP_STORE_PRIMES 400001, 500000;"

REM [Partition 6]
start cmd /c sqlcmd -S codf58h5ey.database.windows.net,1433 -U jminer -P SQLtip$2015 
  -d MATH -Q "EXEC SP_STORE_PRIMES 500001, 600000;"

REM [Partition 7]
start cmd /c sqlcmd -S codf58h5ey.database.windows.net,1433 -U jminer -P SQLtip$2015 
  -d MATH -Q "EXEC SP_STORE_PRIMES 600001, 700000;"

REM [Partition 8]
start cmd /c sqlcmd -S codf58h5ey.database.windows.net,1433 -U jminer -P SQLtip$2015 
  -d MATH -Q "EXEC SP_STORE_PRIMES 700001, 800000;"

REM [Partition 9]
start cmd /c sqlcmd -S codf58h5ey.database.windows.net,1433 -U jminer -P SQLtip$2015 
  -d MATH -Q "EXEC SP_STORE_PRIMES 800001, 900000;"

REM [Partition 10]
start cmd /c sqlcmd -S codf58h5ey.database.windows.net,1433 -U jminer -P SQLtip$2015 
  -d MATH -Q "EXEC SP_STORE_PRIMES 900001, 1000000;"



  /*  
 Validate data placement
*/


-- Use dmv to get partitions
SELECT 
  Partition_Number, Row_Count 
FROM sys.dm_db_partition_stats
WHERE object_id = object_id('TBL_PRIMES'); 


-- Using the $PARTITION function
SELECT 
    $PARTITION.PF_HASH_BY_VALUE([MY_VALUE]) as Partition_Number, 
    COUNT(*) as Row_Count
FROM 
    Dwdb0724.[dbo].[TBL_PRIMES]
GROUP BY 
    $PARTITION.PF_HASH_BY_VALUE([MY_VALUE]);