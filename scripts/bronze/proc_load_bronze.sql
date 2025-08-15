/*
===============================================================================
Procedure: bronze.load_bronze
===============================================================================
Purpose:
    Load CSV data into the Bronze schema.
    - Clears each table before loading new data.
    - Uses BULK INSERT to pull data from source CSV files.

Note:
    No parameters are required. 
    Running this will overwrite the existing data in Bronze tables.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

USE master;
GO

USE enterprise_dw;
GO

CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME, @overall_start DATETIME, @overall_end DATETIME;

    BEGIN TRY
        -- Record start time
        SET @overall_start = GETDATE();
        PRINT '==========================================';
        PRINT 'Starting Bronze Layer Load';
        PRINT '==========================================';

        -------------------------
        -- Load CRM Tables
        -------------------------
        PRINT '--- CRM Data ---';

        -- crm_cust_info
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_cust_info;
        BULK INSERT bronze.crm_cust_info
        FROM 'D:\Azmary Stuff\Data Engineering\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
        SET @end_time = GETDATE();
        PRINT 'crm_cust_info loaded in ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';

        -- crm_prd_info
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_prd_info;
        BULK INSERT bronze.crm_prd_info
        FROM 'D:\Azmary Stuff\Data Engineering\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
        SET @end_time = GETDATE();
        PRINT 'crm_prd_info loaded in ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';

        -- crm_sales_details
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_sales_details;
        BULK INSERT bronze.crm_sales_details
        FROM 'D:\Azmary Stuff\Data Engineering\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
        SET @end_time = GETDATE();
        PRINT 'crm_sales_details loaded in ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';

        -------------------------
        -- Load ERP Tables
        -------------------------
        PRINT '--- ERP Data ---';

        -- erp_loc_a101
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.erp_loc_a101;
        BULK INSERT bronze.erp_loc_a101
        FROM 'D:\Azmary Stuff\Data Engineering\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
        SET @end_time = GETDATE();
        PRINT 'erp_loc_a101 loaded in ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';

        -- erp_cust_az12
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.erp_cust_az12;
        BULK INSERT bronze.erp_cust_az12
        FROM 'D:\Azmary Stuff\Data Engineering\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
        SET @end_time = GETDATE();
        PRINT 'erp_cust_az12 loaded in ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';

        -- erp_px_cat_g1v2
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'D:\Azmary Stuff\Data Engineering\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
        SET @end_time = GETDATE();
        PRINT 'erp_px_cat_g1v2 loaded in ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';

        -------------------------
        -- End of process
        -------------------------
        SET @overall_end = GETDATE();
        PRINT '==========================================';
        PRINT 'Bronze Layer Load Completed';
        PRINT 'Total Duration: ' + CAST(DATEDIFF(SECOND, @overall_start, @overall_end) AS NVARCHAR) + ' seconds';
        PRINT '==========================================';

    END TRY
    BEGIN CATCH
        PRINT '!!! Error while loading Bronze Layer !!!';
        PRINT 'Message: ' + ERROR_MESSAGE();
        PRINT 'Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'State: ' + CAST(ERROR_STATE() AS NVARCHAR);
    END CATCH
END;
GO

