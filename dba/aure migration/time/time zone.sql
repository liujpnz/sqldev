 --function change utc to local time
CREATE FUNCTION GetNzDate( @dFecha as datetime)
returns DATETIME
as
begin
     DECLARE @D AS datetimeoffset
     SET @D = CONVERT(datetimeoffset, @Dfecha) AT TIME ZONE 'New Zealand Standard Time'
     RETURN CONVERT(datetime, @D);
end

--check
select getdate() as UTCDate ,dbo.GetNzDate(getdate()) as NzDate


SELECT GETDATE() AS GetDateValue,  --datetime Local
       SYSDATETIME() AS SysDateTimeValue,  --datetime2 Local
       SYSUTCDATETIME() AS SysUTCDateTimeValue; --datetime2 UTC


--replace getdate with GetNzDate






Declare @DT as Datetime = GETUTCDATE()
Select DATEADD(MILLISECOND,DATEDIFF(MILLISECOND,getutcdate(),GETDATE()),@DT) as UTC_To_LocalTime
 select DATEADD(hh, DATEDIFF(hh, getutcdate() AT TIME ZONE 'New Zealand Standard Time',GETUTCDATE()), GETUTCDATE())
select  DATEDIFF(hh, convert(datetime,'2018-09-06 04:46:33.327') AT TIME ZONE 'New Zealand Standard Time',convert(datetime,'2018-09-06 04:46:33.327'))

select convert(datetime,'2018-11-06 04:46:33.327')
select getutcdate()




 
 
 
 CREATE FUNCTION dbo.GetNzDate
        (@SomeINT INT)
RETURNS INT WITH SCHEMABINDING AS
  BEGIN
 RETURN @SomeINT * 2
    END
;
CREATE FUNCTION GetNzDate( @dFecha as datetime)
returns DATETIME
as
begin

     RETURN @dFecha;

end

CREATE FUNCTION GetNzDate()
returns DATETIME
as
begin

     RETURN getdate();

end

CREATE FUNCTION GetNzDate1
        ( @dFecha as datetime)
RETURNS TABLE WITH SCHEMABINDING AS
 RETURN SELECT NzDate = @dFecha
;

CREATE FUNCTION GetNzDate3
        ( )
RETURNS TABLE WITH SCHEMABINDING AS
 RETURN SELECT NzDate = getdate()
;


SET STATISTICS time  on
SET STATISTICS io  on

select distinct(username) from UserActionLog where timecreated>= DATEADD(mi,-20,GETDATE())

select distinct(username) from UserActionLog where timecreated>= DATEADD(mi,-20,dbo.GetNzDate2())

select distinct(username) from UserActionLog where timecreated>= DATEADD(mi,-20,(select NzDate from dbo.GetNzDate3()))

select DATEADD(mi,-20,GETDATE())

select DATEADD(mi,-20,dbo.GetNzDate(getdate()))
select DATEADD(mi,-20,getutcdate() AT TIME ZONE 'New Zealand Standard Time')
select getdate() AT TIME ZONE 'New Zealand Standard Time'

select NzDate from dbo.GetNzDate3();

select dbo.GetNzDate(getdate())
select * from dbo.GetNzDate1()

select getdate() AT TIME ZONE 'New Zealand Standard Time'


SELECT nzdate  
CROSS APPLY dbo.GetNzDate3() AS l;

select getdate() AT TIME ZONE 'Eastern Standard Time'
CREATE FUNCTION dbo.TimesTwo
        (@SomeINT INT)
RETURNS TABLE WITH SCHEMABINDING AS
 RETURN SELECT Doubled = @SomeINT * 2
;

/*********************************************************************
 Test the function for duration without using SET STATISTICS TIME ON.
*********************************************************************/
--===== Declare a "throw-away" variable to take display/storage times
     -- out of the picture.
DECLARE @Result INT
;
--===== Begin measuring duration using GETDATE
DECLARE @StartTime DATETIME;
 SELECT @StartTime = GETDATE()
;
--===== Test the code using the "throw-away" variable
 SELECT @Result = ca.Doubled
   FROM #TestTable
  CROSS APPLY dbo.TimesTwo(SomeNumber) ca
;
--===== "Stop the timer" and report the duration
  PRINT DATEDIFF(ms,@StartTime,GETDATE())
;

select len(getdate()),len(GETUTCDATE()),len(GETUTCDATE() AT TIME ZONE 'New Zealand Standard Time')
 select getdate() AT TIME ZONE 'New Zealand Standard Time',GETUTCDATE() AT TIME ZONE 'New Zealand Standard Time'

 insert into PrintLog (printuser,printdatetime,printtype,salesordernumber,comment)values('sagar',getdate(),'copypick','S37387','')
  insert into PrintLog (printuser,printdatetime,printtype,salesordernumber,comment)values('sagar',GETUTCDATE() AT TIME ZONE 'New Zealand Standard Time','copypick','S37387','')
  select * from printlog

  select DATEADD(HOUR, DATEDIFF(HOUR,GETDATE(), GETUTCDATE()),[UTCfield])

  select DATEDIFF(HOUR,GETDATE(), GETUTCDATE())
  
  
  
  
  
*************************
--time zone list
select * from sys.time_zone_info

--function change utc to local time
--azure
--function change utc to local time
CREATE FUNCTION [dbo].[GetNzDate]()
returns DATETIME
as
begin
     DECLARE @D AS datetimeoffset
     SET @D = CONVERT(datetimeoffset, getdate()) AT TIME ZONE 'New Zealand Standard Time'
     RETURN CONVERT(datetime, @D);
end
GO


select getdate() as UTCDate,dbo.GetNzDate() as NzDate


--local
CREATE FUNCTION GetNzDate( @dFecha as datetime)
returns DATETIME
as
begin

     RETURN @dFecha;

end

--check
select getdate() as UTCDate,dbo.GetNzDate(getdate()) as NzDate


Declare @DT as Datetime = GETUTCDATE()
Select DATEADD(MILLISECOND,DATEDIFF(MILLISECOND,getutcdate(),GETDATE()),@DT) as UTC_To_LocalTime
 select DATEADD(hh, DATEDIFF(hh, getutcdate() AT TIME ZONE 'New Zealand Standard Time',GETUTCDATE()), GETUTCDATE())
select  DATEDIFF(hh, convert(datetime,'2018-09-06 04:46:33.327') AT TIME ZONE 'New Zealand Standard Time',convert(datetime,'2018-09-06 04:46:33.327'))

select convert(datetime,'2018-11-06 04:46:33.327')
select getutcdate()





--create user
create user dwuser with password='Tradedepot123'
create user pbuser with password='Tradedepot123'
alter role db_owner add member dwuser;
alter role db_owner add member pbuser;