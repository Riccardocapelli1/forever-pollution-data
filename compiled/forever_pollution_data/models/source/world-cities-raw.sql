with worldcities as (
   select * from read_csv_auto('./data/worldcities.csv', header=True)
)

select * from worldcities