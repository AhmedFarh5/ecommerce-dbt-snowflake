# 🚀 E-Commerce dbt Analytics Project on Snowflake

A production-ready dbt (Data Build Tool) project built on Snowflake, implementing the **Medallion Architecture** and **Kimball Dimensional Modeling** principles for an E-commerce dataset.

## 📊 Architecture & Structure
- **Raw Layer:** Source data loaded into Snowflake (`ECOMMERCE_DB`).
- **Staging Layer (`staging/`):** Cleansed and standardized views (`stg_orders`, `stg_customers`, `stg_products`).
- **Marts Layer (`marts/`):** Dimension and Fact tables structured for business intelligence and reporting.
  - **Fact Tables:** `fct_orders` (Includes data cleaning, null checks, and duplicate deduplication via `row_number()`).
  - **Dimension Tables:** `dim_customers`, `dim_products`.
  - **Aggregated Marts:** `mart_customer_summary`, `mart_category_sales`.

## 🧪 Data Quality & Testing
- Enforced strict data governance using dbt built-in tests (`unique`, `not_null`).
- **Test Results:** 100% pass rate (**16 / 16 tests passed successfully**).

## 🛠️ Tech Stack
- **Data Warehouse:** Snowflake
- **Transformation Tool:** dbt Cloud / dbt Core
- **Modeling Framework:** Kimball Dimensional Modeling & Medallion Architecture
