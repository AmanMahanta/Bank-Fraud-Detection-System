# 🏦 Banking Transaction Fraud Detection System

This project implements an end-to-end **Banking Transaction Fraud Detection System** using
**Data Warehousing, ETL pipelines, Apache Spark, Snowflake SQL, Security controls, and Data Visualization**.

The system detects suspicious banking transactions using rule-based logic
and demonstrates real-world data engineering and analytics workflows.

---

## 📌 Features Implemented

✔ Data Warehouse (Star Schema)  
✔ Advanced SQL (CTE, Window Functions, Indexing, Partitioning)  
✔ Python-based ETL / ELT pipelines  
✔ Apache Spark (Batch + Streaming)  
✔ Snowflake Storage & Optimization  
✔ Security (RBAC, Data Masking)  
✔ Performance Optimization  
✔ Interactive Data Visualization Dashboard  
✔ Architecture Diagram & Final Presentation  

---

## 🗂️ Project Structure
Fraud Detection System/
│
├── data/
│ ├── raw/
│ │ ├── transactions.csv
│ │ ├── customers.csv
│ │ └── merchants.csv
│ └── streaming/
│ └── live_transactions.json
│
├── etl/
│ ├── extract.py
│ ├── transform.py
│ └── load_to_snowflake.py
│
├── spark/
│ ├── batch_fraud_detection.py
│ └── streaming_fraud_detection.py
│
├── snowflake/
│ ├── schema.sql
│ ├── advanced_queries.sql
│ ├── security.sql
│ └── optimization.sql
│
├── dashboard/
│ └── dashboard.py
│
├── architecture/
│ └── Banking_Fraud_Detection_Architecture.pptx
│
├── requirements.txt
└── README.md

---

## 🧱 Data Warehouse Design

### Star Schema
- **Fact Table**: `fact_transactions`
- **Dimensions**:
  - `dim_customer`
  - `dim_merchant`
  - `dim_time`

Foreign keys enforce relationships between fact and dimension tables.

---

## 🔁 ETL Pipeline (Python)

### Extract
Reads raw CSV files:
- transactions
- customers
- merchants

### Transform
- Fraud detection rule: `amount > 200000`
- Generates:
  - `is_fraud`
  - `fraud_score`
  - `time_id`
  - `device_info` (semi-structured JSON)

### Load
Prepared for Snowflake ingestion (table-ready DataFrames).

---

## ⚡ Apache Spark Processing

### Batch Processing
- Aggregates high-risk customers
- Identifies abnormal transaction behavior

### Streaming Processing
- Reads live JSON transactions
- Flags high-value transactions in real time

---

## ❄️ Snowflake Integration

✔ Star schema tables  
✔ Semi-structured `VARIANT` column  
✔ Clustering & optimization  
✔ Time Travel support  
✔ Advanced SQL analytics  

---

## 🔐 Security Implementation

- Role-Based Access Control (RBAC)
- Data Masking Policy for sensitive customer data
- Governance using role-based permissions

---

## 📊 Interactive Dashboard (Streamlit)

Displays:
- Total transactions
- Fraud transaction count
- Fraud percentage
- Fraud by channel
- Transaction-level data table

---

## ▶️ How to Run the Project

## ▶️ How to Run the Project

### 1️⃣ Activate Virtual Environment
```bash
venv\Scripts\activate
2️⃣ Run ETL Pipeline
python -m etl.load_to_snowflake

Expected Output:

Transactions: (6, 9)
Customers: (3, 4)
Merchants: (4, 3)
3️⃣ Run Spark Batch Job
spark-submit spark/batch_fraud_detection.py
4️⃣ Run Spark Streaming Job
spark-submit spark/streaming_fraud_detection.py
5️⃣ Run Dashboard
streamlit run dashboard/dashboard.py

Open browser:

http://localhost:8501

🏁 Conclusion

This project demonstrates a complete banking fraud detection pipeline
covering data engineering, analytics, security, and visualization.