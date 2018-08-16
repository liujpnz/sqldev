--time zone list
select * from sys.time_zone_info

CREATE FUNCTION [dbo].[GetNzDate]()
returns DATETIME
as
begin

     RETURN getdate();

end
GO



--azure
CREATE FUNCTION [dbo].[GetNzDate]()
returns DATETIME
as
begin
     DECLARE @D AS datetimeoffset
     SET @D = CONVERT(datetimeoffset, getdate()) AT TIME ZONE 'New Zealand Standard Time'
     RETURN CONVERT(datetime, @D);
end
GO



After migrating to Azure sql, the default time zone is UTC, so we cannot directly use getdate() function in SQL statement .

I created a new function dbo.GetNzDate() to sort the time issue. So we need 


add DT variable defination:  Declare @DT as Datetime = dbo.GetNzDate();
replace getdate() with @DT:  getdate()--> @DT


Example:

--insert

Before:

insert into DispatchingPrepare ( PickBeginTime)values(getdate());


Now:

Declare @DT as Datetime = dbo.GetNzDate();
insert into DispatchingPrepare ( PickBeginTime)values(@DT);


--select

Before:

 select* from dbo.Salesorder where txndate=convert(varchar,FORMAT(getdate(), 'yyyy-MM-dd'),101)

Now:

 Declare @DT as Datetime = dbo.GetNzDate();
 select* from dbo.Salesorder where txndate=convert(varchar,FORMAT(@DT, 'yyyy-MM-dd'),101)