# 📊 SaaS Product Sales Analytics Warehouse (BigQuery + dbt Cloud)

This project is a full end-to-end cloud analytics warehouse built using dbt Cloud and BigQuery.  
The goal was to take raw, messy SaaS sales data and turn it into clean, reliable insights that a business could actually use.

I followed real Analytics Engineering best practices — modular dbt models, layered architecture, full documentation, and basic data testing.

---

## 🚀 What I Built

The project transforms raw sales transactions into clean tables that can answer important business questions like:
- How many customers are active every month?
- How much revenue are we making month-over-month?
- Which products are selling the most?
- Are customers coming back after their first purchase?

---

## 🛠️ Tools I Used

- dbt Cloud for transformation
- BigQuery for data warehouse
- GitHub for version control
- SQL, Jinja, and YAML for building and documenting models

---

## 🏗️ How the Project is Organized

I designed the project using three simple layers:

1. **Staging Layer**  
   This is where the raw sales data gets cleaned up — fixing missing fields, formatting dates properly, etc.

2. **Intermediate Layer**  
   Here, I built logic to calculate things like monthly active users, total revenue, and customer behavior summaries.

3. **Mart Layer**  
   These are the final tables — ready for dashboards and business analysis.  
   For example: customer retention over time, monthly recurring revenue, top-selling products.

---

## 📂 What's Inside the Project

**/models/raw_data/**
- `sources.yml`: Defines the raw data source and some basic tests.
- `stg_sales_transactions.sql`: Cleans the raw sales transaction data.

**/models/intermediate/**
- `int_monthly_active_users.sql`: Counts how many unique customers were active each month.
- `int_monthly_revenue.sql`: Calculates total revenue by month.
- `int_top_products.sql`: Identifies the top products sold each month.
- `int_customer_usage_summary.sql`: Summarizes customer behavior like purchases and revenue.

**/models/marts/**
- `mart_customer_retention.sql`: Tracks how many customers keep coming back month after month.
- `mart_mrr_summary.sql`: Calculates monthly recurring revenue (MRR) and revenue per active user.
- `mart_top_products_summary.sql`: Shows the best-selling products month by month.

Other important files:
- `dbt_project.yml`: Main project configuration.
- `packages.yml`: For dbt dependencies (if any).
- `README.md`: This document you're reading.

---

## 📈 What Metrics I Tracked

- Monthly active users
- Monthly revenue
- Revenue per active customer
- Top products sold
- Customer retention over time

All these metrics are super important for SaaS companies to track growth, customer loyalty, and revenue health.

---

## 📚 How to Rebuild or Reuse This Project

1. Clone this repository.
2. Set up your own dbt Cloud project and BigQuery warehouse.
3. Upload your raw sales data if you want.
4. Run `dbt run` to build all the models.
5. Run `dbt test` to validate the data.
6. (Optional) Generate documentation using `dbt docs generate`.

---

## 🙌 Credits

The dataset was inspired by open-source SaaS sales datasets (like those on Kaggle).  
The architecture and modeling ideas follow best practices from dbt Labs and the Analytics Engineering community.

---

## ✨ About Me

**Adwaith Raj** 
Data Enthusiast

---
