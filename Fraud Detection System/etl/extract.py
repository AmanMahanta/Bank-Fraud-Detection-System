import pandas as pd
import os

def extract():
    # Project root directory
    BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    RAW_PATH = os.path.join(BASE_DIR, "data", "raw")

    transactions = pd.read_csv(os.path.join(RAW_PATH, "transactions.csv"))
    customers    = pd.read_csv(os.path.join(RAW_PATH, "customers.csv"))
    merchants    = pd.read_csv(os.path.join(RAW_PATH, "merchants.csv"))

    return transactions, customers, merchants