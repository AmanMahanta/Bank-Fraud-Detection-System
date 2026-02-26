-- Clustering for pruning
ALTER TABLE fact_transactions
CLUSTER BY (customer_id, txn_date);

-- Partitioning (logical via micro-partitions)
-- Snowflake doesn't use traditional partitions,
-- but clustering + date filtering acts like partitioning

-- Optimize query
SELECT *
FROM fact_transactions
WHERE txn_date >= CURRENT_DATE - 7;
-- Time Travel
ALTER TABLE fact_transactions
SET DATA_RETENTION_TIME_IN_DAYS = 7;

-- Clustering
ALTER TABLE fact_transactions
CLUSTER BY (customer_id, time_id);