

with pollution_data as (
   select * from {{ source('external_source', 'pollution-data') }}
)

select * from pollution_data