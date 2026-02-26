from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("StreamingFraud").getOrCreate()

schema = "transaction_id STRING, customer_id STRING, amount DOUBLE"

stream_df = (
    spark.readStream
         .schema(schema)
         .json("data/streaming/")
)

fraud_stream = stream_df.filter("amount > 200000")

query = (
    fraud_stream.writeStream
        .outputMode("append")
        .format("console")
        .option("checkpointLocation", "checkpoint/")
        .start()
)

query.awaitTermination()