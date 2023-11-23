__ex1
SELECT 
SUM(CASE WHEN device_type='laptop' THEN 1 ELSE 0 END) AS laptop_reviews,
SUM(CASE WHEN device_type IN ('phone','tablet') THEN 1 ELSE 0 END) AS mobile_reviews
FROM viewership
__ex2
select x,y,z,
case when x+y<=z then 'no'
when y+z<=x then 'no'
when z+x<=y then 'no'
else 'yes' end as triangle
from triangle
__ex3

