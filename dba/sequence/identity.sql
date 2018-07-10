--identity
--gap may occur
--no cycling support, when maximum reach, you need to reseed current identity values
--can not generate the value before using it
--can not update
--truncate statement reset 

create table testidentity (id int identity(1,1) not null, val int)
insert into testidentity (val) values(1);
insert into testidentity (val) values(2);
select * from testidentity;

--
select SCOPE_IDENTITY() as scope_identity, --last identity value generated in your session in the current scope 
	@@IDENTITY as [@@identity],  --last identity value generated in your session regardess of scope
		IDENT_CURRENT('testidentity') as ident_current; --last identity value generated in the input table regardless of session


		--try another session, first two you will get null values.

--stored procedure p1 call p2, and will generate new identity value
--scope_identity() see p1 
--@@identity see p2


--reseed
select IDENT_CURRENT('testidentity') as curr,IDENT_INCR('testidentity') as incr,IDENT_SEED('testidentity') as seed --2
dbcc checkident('testidentity',reseed,6)
select IDENT_CURRENT('testidentity') as curr,IDENT_INCR('testidentity') as incr,IDENT_SEED('testidentity') as seed --6

--backward
dbcc checkident('testidentity',reseed,-1000000)
select IDENT_CURRENT('testidentity') as curr,IDENT_INCR('testidentity') as incr,IDENT_SEED('testidentity') as seed ---10000000

insert into testidentity (val) values(3);
insert into testidentity (val) values(4);
select * from testidentity;
select IDENT_CURRENT('testidentity') as curr,IDENT_INCR('testidentity') as incr,IDENT_SEED('testidentity') as seed ---10000000

--forward
dbcc checkident('testidentity',reseed,2);
insert into testidentity (val) values(5);
select IDENT_CURRENT('testidentity') as curr,IDENT_INCR('testidentity') as incr,IDENT_SEED('testidentity') as seed --3

--
dbcc checkident('testidentity',reseed,-10000)
insert into testidentity (val) values(6);
select * from testidentity;
--noreseed, display current value,max value
dbcc checkident('testidentity',noreseed);
--reseed, set current value with max value
dbcc checkident('testidentity',reseed);
dbcc checkident('testidentity');

--without pk or unique constraints, duplicate record insert, or error
dbcc checkident('testidentity',reseed,2);
insert into testidentity (val) values(7);
