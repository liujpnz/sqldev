#https://blogs.msdn.microsoft.com/azuresqldbsupport/2016/10/05/create-sql-login-and-sql-user-on-your-azure-sql-db/

There are multiple options to authenticate with your Azure SQL, in this post I want to discuss only SQL Authentication option

That's true that we recommend to use Azure Active directory for authentication but yet this is very common to use SQL Authentication with databases.

There are two main options to setup this type of authentication,


Using SQL Login + SQL user (the most common and familiar option)
Pros
Easy to manage if access to multiple database on the same server is needed
Cons
Database is not portable, for instance if used in Geo-Replication SQL login must be created on the replicated SQL Server with the same SID for the user so it will be usable for reading
How to:
/*1: Create SQL Login on master database (connect with admin account to master database)*/

CREATE LOGIN MaryLogin WITH PASSWORD = '<strong_password>';

/*2: Create SQL user on the master database (this is necessary for login attempt to the <default> database, as with Azure SQL you cannot set the DEFAULT_DATABASE property of the login so it always will be [master] database.)*/

CREATE USER MaryUser FROM LOGIN MaryLogin;

/*3: Create SQL User on the user database (connect with admin account to user database)*/

CREATE USER MaryUser FROM LOGIN MaryLogin;

/*4. Grant permissions to the user by assign him to a database role*/

ALTER ROLE db_datareader ADD MEMBER MaryUser;

See complete list of available database roles here: https://msdn.microsoft.com/en-us/library/ms189121.aspx



Using contained database user (SQL User with password, no login is involved)
Pros
Database is portable
Cons
Database name must be used when authenticating, cannot use just <default> database.
Hard to manage passwords if access to multiple databases on the same SQL Server is needed (in this case, Azure Active Directory is the recommended approach>
How to:
/*1: Create SQL user with password on the user database (connect with admin account to user database)*/

CREATE USER MaryUser WITH PASSWORD = '<strong_password>';

/*2: Grant permissions to the user by assign him to a database role*/

ALTER ROLE db_datareader ADD MEMBER MaryUser;

Login with the newly created user:

With SSMS use the newly created user, make sure to set the database name of the user database you want to connect.

(you will not be able to connect to any other database on the same server as this user exists only on this specific database)

See screenshot earlier in this article.