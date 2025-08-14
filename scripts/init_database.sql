/*
=============================================================
Database and Schema Setup Script
=============================================================
Purpose:
    This script initializes a new database called 'enterprise_dw'. 
    If the database already exists, it will be dropped and recreated. 
    After creating the database, three schemas are added: 'bronze', 
    'silver', and 'gold'.

Warning:
    Executing this script will permanently delete all existing data 
    in the 'enterprise_dw' database. Ensure backups are taken if needed.
*/

-- Switch to the system master database
USE master;
GO

-- Check for existing database and remove it if found
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'enterprise_dw')
BEGIN
    ALTER DATABASE enterprise_dw SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE enterprise_dw;
END;
GO

-- Create a fresh 'enterprise_dw' database
CREATE DATABASE enterprise_dw;
GO

-- Switch context to the new database
USE enterprise_dw;
GO

-- Establish required schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
