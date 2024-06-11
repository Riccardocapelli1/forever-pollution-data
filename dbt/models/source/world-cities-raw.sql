
{{ config(materialized='external', location='./data-transform/source/worldcities-raw.csv', format='csv')}}


with worldcities as (
   select * from {{ source('external_source', 'worldcities') }}
)

select * from worldcities