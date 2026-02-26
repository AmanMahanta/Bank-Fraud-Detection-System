-- CTE: Suspicious customers
WITH suspicious_txns AS (
  SELECT
    customer_id,
    COUNT(*) AS txn_count,
    SUM(amount) AS total_amount
  FROM fact_transactions
  GROUP BY customer_id
)
SELECT *
FROM suspicious_txns
WHERE txn_count > 5 OR total_amount > 300000;

-- Window function: rolling average
SELECT
  transaction_id,
  customer_id,
  amount,
  AVG(amount) OVER (
    PARTITION BY customer_id
    ORDER BY time_id
    ROWS BETWEEN 5 PRECEDING AND CURRENT ROW
  ) AS rolling_avg
FROM fact_transactions;

-- Clustering (Snowflake optimization)
ALTER TABLE fact_transactions
CLUSTER BY (customer_id, txn_date);