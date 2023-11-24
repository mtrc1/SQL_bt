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
select ROUND(1.0* sum(case when call_category is null or call_category = 'n/a' 
then 1 else 0 end)/ count(*)*100,1) 
as call_percentage
from callers
__ex4
select name from customer
where referee_id<> "2" or referee_id is null
__ex5
select survived,
count(case when pclass = 1 then 1 end) first_class,
count(case when pclass = 2 then 1 end) second_class,
count(case when pclass = 3 then 1 end) third_class
from titanic
group by survived
