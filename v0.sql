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
  ,[EmployeeName] VARCHAR(256) NOT NULL
  ,[DepartmentName] VARCHAR(256)
  ,[JobTitle] VARCHAR(256) NOT NULL
  ,[HomeAddress] VARCHAR(256) NOT NULL
  ,[HomePhone] VARCHAR(32) NOT NULL
  ,[CellPhone] VARCHAR(32) NULL
  ,[StartDate] DateTime2(0) NOT NULL
  ,[EndDate] DateTime2(0) NULL
  ,[IsEmployed] BIT NULL
);
GO

--Create Primary Key PK_Employee_EmployeeId PRIMARY KEY CLUSTERED
ALTER TABLE dbo.[Employee]
ADD CONSTRAINT PK_Employee_EmployeeId PRIMARY KEY CLUSTERED (EmployeeId);
GO

INSERT INTO dbo.Employee (
  [EmployeeName]
  ,[DepartmentName]
  ,[JobTitle]
  ,[HomeAddress]
  ,[HomePhone]
  ,[CellPhone]
  ,[StartDate]
  ,[EndDate]
  ,[IsEmployed]
)
VALUES
(
  'Alan Turing'
  ,'Research and Development'
  ,'Director of Mathematical Computer Sciences'
  ,'96 Euston Road, London NW1 2DB'
  ,'+44 (0)300 770 1912'
  ,NULL
  ,'1954-06-07 00:00:00'
  ,NULL
  ,1
)
,
(
  'Grace Hopper'
  ,'Research and Development'
  ,'Head Software Systems Architech'
  ,'1001 Avenida de las Americas Houston, Texas  77010'
  ,'(650) 352-7500'
  ,NULL
  ,'1980-01-07 00:00:00'
  ,NULL
  ,1
)
,
(
  'Bob'
  ,'Adminstration'
  ,'CEO'
  ,'Earth'
  ,'867-5309'
  ,NULL
  ,'1900-01-07 00:00:00'
  ,NULL
  ,1
);
GO

--If it exists drop Stored Procedure dbo.GetEmployees
DROP PROCEDURE IF EXISTS dbo.[spGetEmployees];
GO

--Create Stored Procedure dbo.GetEmployees
CREATE PROCEDURE dbo.[spGetEmployees]
AS
SELECT
  [EmployeeId]
  ,[EmployeeName]
  ,[DepartmentName]
  ,[JobTitle]
  ,[HomeAddress]
  ,[HomePhone]
  ,[CellPhone]
  ,[StartDate]
  ,[EndDate]
  ,[IsEmployed]
FROM
  dbo.Employee
;
GO

--Test that it calls
-- EXEC dbo.[spGetEmployees];
