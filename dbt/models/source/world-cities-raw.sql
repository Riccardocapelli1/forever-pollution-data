

with worldcities as (
   select * from {{ source('external_source', 'worldcities') }}
)

select * from worldcities