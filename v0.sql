USE master;
GO

--If database ID for MigratingDB exists
IF DB_ID('MigratingDB') IS NOT NULL
  BEGIN
       --Set user access to current user
       ALTER DATABASE MigratingDB
       SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

       --Drop Database
       DROP DATABASE MigratingDB;
   END
GO

--Create Database
CREATE DATABASE MigratingDB;
GO

--Use Database
USE MigratingDB;
GO
