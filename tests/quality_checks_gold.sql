/*
===============================================================================
Data Quality Checks - Gold Layer
===============================================================================
Purpose:
    - Validate integrity and reliability of Gold layer data.
    - Ensure keys are unique in dimensions.
    - Confirm relationships between fact and dimension tables.
    - Detect missing or inconsistent references.

Usage:
    - Run after Gold views are created and populated.
    - Review and fix issues if any rows are returned.
===============================================================================
*/

-- ====================================================================
-- Check: gold.dim_customers
-- ====================================================================
-- Ensure each customer_key is unique
-- Expected: No duplicate rows
SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Check: gold.dim_products
-- ====================================================================
-- Ensure each product_key is unique
-- Expected: No duplicate rows
SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Check: gold.fact_sales
-- ====================================================================
-- Validate referential integrity: 
-- Fact entries should always map to valid dimension records
SELECT 
    f.* 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
WHERE p.product_key IS NULL 
   OR c.customer_key IS NULL;
