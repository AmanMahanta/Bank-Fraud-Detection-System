-- 1. Daily Fraud Trend
SELECT
    txn_date,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) AS fraud_transactions,
    ROUND(
        (SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
        2
    ) AS fraud_percentage
FROM fact_transactions
GROUP BY txn_date
ORDER BY txn_date;


-- 2. Fraud by Channel
SELECT
    channel,
    COUNT(*) AS total_txns,
    SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) AS fraud_txns
FROM fact_transactions
GROUP BY channel
ORDER BY fraud_txns DESC;


-- 3. High-Risk Customers
SELECT
    customer_id,
    COUNT(*) AS fraud_count,
    SUM(amount) AS fraud_amount
FROM fact_transactions
WHERE is_fraud = TRUE
GROUP BY customer_id
ORDER BY fraud_amount DESC;