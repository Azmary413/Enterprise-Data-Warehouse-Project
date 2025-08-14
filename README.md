# 📊 Enterprise-Data-Warehouse & Analytics Project

Welcome to the **Data Warehouse & Analytics Project**!  
This project is a practical, end-to-end solution that demonstrates how to build a modern data warehouse using **SQL Server**, following best practices in **data engineering**, **ETL**, and **analytics**.

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


## 🚀 Project Requirements

### 🏗️ Data Engineering – Building the Data Warehouse

#### 🎯 Objective  
Developing a modern data warehouse using **SQL Server** to consolidate sales-related data from ERP and CRM systems, enabling efficient analytical reporting and data-driven decision-making.

#### 📋 Specifications

- **Data Sources:**  
  Import data from two distinct source systems – CRM and ERP – provided as CSV files.

- **Data Quality:**  
  Cleanse, standardize, and resolve inconsistencies in the raw data before any transformation or analysis.

- **Integration:**  
  Combine both data sources into a unified, user-friendly data model optimized for analytical queries.

- **Data Scope:**  
  Focus on the most recent dataset only. Historical tracking (historization) is not within the scope of this project.

- **Documentation:**  
  Provide clear and concise documentation of the data model, table relationships, and schema structure to support both business stakeholders and data analysts.

---

### 📊 BI – Analytics & Reporting

#### 🎯 Objective  
Developing SQL-based analytics and reporting logic to deliver actionable insights that support strategic business decisions.

#### 🔍 Focus Areas

- **Customer Behavior**  
  Understand purchase patterns, segmentation, and engagement levels.

- **Product Performance**  
  Identify best-selling products, underperformers, and product mix trends.

- **Sales Trends**  
  Analyze sales over time, across locations, and customer types to uncover growth opportunities.

These insights are designed to empower stakeholders with key business metrics and help steer decisions with confidence.

---
