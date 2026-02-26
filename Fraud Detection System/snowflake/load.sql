-- 1️⃣ Create file format
CREATE OR REPLACE FILE FORMAT fraud_csv
TYPE = 'CSV'
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
SKIP_HEADER = 1;

-- 2️⃣ Create internal stage
CREATE OR REPLACE STAGE fraud_stage
FILE_FORMAT = fraud_csv;

-- 3️⃣ Upload files (run from SnowSQL / UI)
-- PUT file://transactions.csv @fraud_stage;
-- PUT file://customers.csv @fraud_stage;
-- PUT file://merchants.csv @fraud_stage;

-- 4️⃣ Load dimension tables
COPY INTO dim_customer
FROM @fraud_stage/customers.csv;

COPY INTO dim_merchant
FROM @fraud_stage/merchants.csv;

-- 5️⃣ Load fact table
COPY INTO fact_transactions
FROM @fraud_stage/transactions.csv;