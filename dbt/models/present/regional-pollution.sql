--
--{{ config(materialized='external', location='./data-transform/present/regional-pollution.csv', format='csv')}}
--

with 
pollution_data as (
   select * from {{ ref('pollution-data') }} 
), 
world_cities as (
   select * from {{ ref('world-cities') }} 
)


SELECT 
name
,wci.city
,wci.country
,administrative_region
,estimated_population
,matrix
,type
,sector
,pfas_char
,year
,year_char
,pfas_value 
FROM pollution_data pdi
LEFT JOIN world_cities wci
ON TRIM(pdi.country)=TRIM(wci.lower_country) 
AND TRIM(pdi.city)=TRIM(wci.lower_city_ascii)
WHERE administrative_region is not NULL