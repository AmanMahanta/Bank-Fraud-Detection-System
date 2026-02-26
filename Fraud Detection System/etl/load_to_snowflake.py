from etl.extract import extract
from etl.transform import (
    transform_transactions,
    transform_customers,
    transform_merchants
)

def load():
    transactions, customers, merchants = extract()

    transactions = transform_transactions(transactions)
    customers = transform_customers(customers)
    merchants = transform_merchants(merchants)

    print("Transactions:", transactions.shape)
    print("Customers:", customers.shape)
    print("Merchants:", merchants.shape)

    print("ETL pipeline executed successfully")

if __name__ == "__main__":
    load()