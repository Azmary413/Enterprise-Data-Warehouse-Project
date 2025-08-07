# 📊 Enterprise-Data-Warehouse & Analytics Project

Welcome to the **Data Warehouse & Analytics Project**!  
This project is a practical, end-to-end solution that demonstrates how to build a modern data warehouse using **PostgreSQL**, following best practices in **data engineering**, **ETL**, and **analytics**.

---

## 🏗️ Architecture: Medallion Layered Design

I’ve structured the warehouse using the **Medallion Architecture**—a layered approach that brings clarity and scalability.

### 🔹 Bronze Layer – Raw Ingestion  
- Raw data is ingested directly from CRM and ERP source files (CSV format)  
- Stored as-is in PostgreSQL tables for traceability and audit

### 🔸 Silver Layer – Cleaned & Modeled  
- Data is cleansed, standardized, and normalized  
- Transformations handle missing values, formatting, and structural consistency  
- Designed for joining and enrichment across data domains

### 🟡 Gold Layer – Business-Ready  
- Star schema with well-defined **fact** and **dimension** tables  
- Optimized for analytical queries and BI consumption  
- Enables key insights into customer behavior, product sales, and operational metrics

---


