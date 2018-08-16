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
create user dwuser with password='***'
create user pbuser with password='***'
alter role db_owner add member dwuser;
alter role db_owner add member pbuser;