
{{ config(materialized='external', location='./data-transform/transform/worldcities.csv', format='csv')}}


with worldcities as (
   select * from {{ ref('world-cities-raw') }} 
)

select 
city
,city_ascii
,country
,lower(city) AS lower_city_ascii
,lower(city_ascii) AS lower_city_ascii
,lower(country) AS lower_country
,iso2
,iso3
,admin_name AS administrative_region
--,capital
,population AS estimated_population
,id 
from worldcities
--where country = 'Italy'