USE [master]
GO
CREATE LOGIN [dwuser] WITH PASSWORD=N'*****', DEFAULT_DATABASE=[DatawarehouseDB], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [DatawarehouseDB]
GO
CREATE USER [dwuser] FOR LOGIN [dwuser]
GO
USE [DatawarehouseDB]
GO
ALTER ROLE [db_owner] ADD MEMBER [dwuser]
GO




USE [master]
GO
CREATE LOGIN [pbuser] WITH PASSWORD=N'****', DEFAULT_DATABASE=[DatawarehouseDB], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [DatawarehouseDB]
GO
CREATE USER [pbuser] FOR LOGIN [pbuser]
GO
USE [DatawarehouseDB]
GO
ALTER ROLE [db_datareader] ADD MEMBER [pbuser]
GO


alter login dwuser with password='***'
alter login pbuser with password='***'




USE [master]
GO
CREATE LOGIN [TRADEDEPOT\jason.liu] FROM WINDOWS WITH DEFAULT_DATABASE=[master]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [TRADEDEPOT\jason.liu]
GO
