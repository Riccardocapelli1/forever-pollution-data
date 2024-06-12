import duckdb
import polars as pl

# Define the CSV file URL
csv_url = 'https://gitlab.com/lucmartinon/ffp-data/-/raw/main/public/full.csv?ref_type=heads'

# Read the CSV file into a Polars DataFrame
df = pl.read_csv(csv_url)

# Create a DuckDB connection and save the DataFrame to a .parquet file
conn = duckdb.connect()
conn.sql("CREATE TABLE df_full AS SELECT * FROM df")
conn.sql("COPY df_full TO 'data/full.parquet' (FORMAT PARQUET);")

conn.close()

print("Data has been successfully written to full.parquet")
