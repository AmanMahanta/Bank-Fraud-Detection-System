from pyspark.sql import SparkSession
from pyspark.sql.functions import count, sum

spark = SparkSession.builder.appName("BatchFraud").getOrCreate()

df = spark.read.option("header", "true").csv(
    "D:/wipro/Project/Fraud Detection System/data/raw/transactions.csv"
)

fraud_users = (
    df.groupBy("customer_id")
      .agg(
          count("*").alias("txn_count"),
          sum("amount").alias("total_amount")
      )
      .filter("txn_count > 10 OR total_amount > 500000")
)

fraud_users.show()
spark.stop()