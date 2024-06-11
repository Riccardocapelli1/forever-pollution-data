
with pollution_data as (
   select * from {{ ref('pollution-data-raw') }} 
)

 
SELECT 
name
,lower(city) AS city
,lower(country) AS country
,matrix
,type
,sector
,CAST(pfas_sum AS VARCHAR) AS pfas_char
,CAST(year AS INT) AS year
,CAST(year AS VARCHAR) AS year_char
,CAST(pfas_sum AS FLOAT) AS pfas_value 
FROM pollution_data
where 1=1
AND CAST(pfas_sum AS FLOAT) > 0 
AND lower(matrix) like '%water%'
--AND country = 'Italy'