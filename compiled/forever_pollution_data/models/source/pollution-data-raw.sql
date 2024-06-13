with pollution_data as (
   select * from read_parquet('./data/full.parquet')
)

select * from pollution_data