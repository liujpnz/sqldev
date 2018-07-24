--time zone list
select * from sys.time_zone_info

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

