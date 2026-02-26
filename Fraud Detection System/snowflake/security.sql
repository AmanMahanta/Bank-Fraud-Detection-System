-- Role
CREATE OR REPLACE ROLE analyst;
GRANT USAGE ON DATABASE BANK_FRAUD_DB TO ROLE analyst;
GRANT USAGE ON SCHEMA DW TO ROLE analyst;
GRANT SELECT ON fact_transactions TO ROLE analyst;

-- Masking Policy
CREATE OR REPLACE MASKING POLICY mask_customer
AS (val STRING) RETURNS STRING ->
CASE
  WHEN CURRENT_ROLE() IN ('ACCOUNTADMIN') THEN val
  ELSE 'XXXX'
END;

-- Apply Mask
ALTER TABLE fact_transactions
MODIFY COLUMN customer_id
SET MASKING POLICY mask_customer;