USE AdventureWorks2017
GO

DECLARE @ProductID INT

DECLARE @getProductID CURSOR SET @getProductID = CURSOR
FOR
SELECT ProductID
FROM Production.Product

OPEN @getProductID

FETCH NEXT
FROM @getProductID
INTO @ProductID

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @ProductID

	FETCH NEXT
	FROM @getProductID
	INTO @ProductID
END

CLOSE @getProductID

DEALLOCATE @getProductID
GO

