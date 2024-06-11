
 {{ config(materialized='external', location='./data-transform/source/pollution-data-raw.csv', format='csv')}}


with pollution_data as (
   select * from {{ source('external_source', 'pollution-data') }}
)

select * from pollution_data