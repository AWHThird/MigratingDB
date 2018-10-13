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

--Drop Table dbo.Employee if exists
DROP TABLE IF EXISTS dbo.[Employee];
GO

--Create Table dbo.[Employee] with identity
CREATE TABLE dbo.[Employee] (
  [EmployeeId] INT IDENTITY(1,1) NOT NULL
  ,[EmployeeName] VARCHAR(256)
  ,[DepartmentName] VARCHAR(256)
  ,[JobTitle] VARCHAR(256)
  ,[HomeAddress] VARCHAR(256)
  ,[HomePhone] VARCHAR(32)
  ,[CellPhone] VARCHAR(32)
  ,[StartDate] DateTime2(0)
  ,[EndDate] DateTime2(0)
  ,[Employed] BIT
);
GO

--Create Primary Key PK_Employee_EmployeeId PRIMARY KEY CLUSTERED
ALTER TABLE dbo.[Employee]
ADD CONSTRAINT PK_Employee_EmployeeId PRIMARY KEY CLUSTERED (EmployeeId);
GO
