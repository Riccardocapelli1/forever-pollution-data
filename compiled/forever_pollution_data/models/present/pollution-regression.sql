with 
regional_pollution as (
   select * from "memory"."main"."regional-pollution" 
)

SELECT 
country
,regr_slope(pfas_value, year) AS slope
,regr_intercept(pfas_value, year) AS intercept
FROM regional_pollution
GROUP BY 
country