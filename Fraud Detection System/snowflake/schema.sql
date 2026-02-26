-- Database & Schema
CREATE DATABASE IF NOT EXISTS BANK_FRAUD_DB;
USE DATABASE BANK_FRAUD_DB;

CREATE SCHEMA IF NOT EXISTS DW;
USE SCHEMA DW;

-- Dimension Tables
CREATE OR REPLACE TABLE dim_customer (
  customer_id STRING PRIMARY KEY,
  age INT,
  location STRING,
  risk_profile STRING
);

CREATE OR REPLACE TABLE dim_merchant (
  merchant_id STRING PRIMARY KEY,
  category STRING,
  country STRING
);

CREATE OR REPLACE TABLE dim_time (
  time_id INT PRIMARY KEY,
  txn_date DATE,
  hour INT,
  day INT,
  month INT,
  year INT
);

-- Fact Table
CREATE OR REPLACE TABLE fact_transactions (
  transaction_id STRING PRIMARY KEY,
  customer_id STRING,
  merchant_id STRING,
  time_id INT,
  amount NUMBER(10,2),
  channel STRING,
  is_fraud BOOLEAN,
  fraud_score INT,
  device_info VARIANT,

  CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
  CONSTRAINT fk_merchant FOREIGN KEY (merchant_id) REFERENCES dim_merchant(merchant_id),
  CONSTRAINT fk_time FOREIGN KEY (time_id) REFERENCES dim_time(time_id)
);