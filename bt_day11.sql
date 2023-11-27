__ex1
select country.continent,
floor(avg(city.population))
from city join country on city.countrycode= country.code
group by country.continent
  
__ex2
SELECT 
ROUND(SUM(CASE WHEN t.signup_action = 'Confirmed' THEN 1 ELSE 0 END)*1.0 / COUNT(t.signup_action),2)
FROM emails e LEFT JOIN texts t  
ON e.email_id  = t.email_id
WHERE e.email_id IS NOT NULL
  
__ex3
SELECT  age_bucket,
SUM(CASE WHEN activity_type = 'send' THEN perc ELSE 0 END) AS send_perc,
SUM(CASE WHEN activity_type = 'open' THEN perc ELSE 0 END) AS open_perc
FROM  (SELECT age_breakdown.age_bucket AS age_bucket,   activities.activity_type,
ROUND(time_spent / SUM(time_spent) OVER(PARTITION BY age_breakdown.age_bucket) * 100.0, 2)
AS perc
FROM  activities, age_breakdown
WHERE activities.user_id = age_breakdown.user_id
AND   activity_type IN ('open', 'send')) AS temp
GROUP BY age_bucket
  
__ex4
SELECT cc.customer_id from customer_contracts as cc 
LEFT JOIN products as p  
on cc.product_id = p.product_id
group by cc.customer_id
having COUNT(DISTINCT(p.product_category)) = (select COUNT(Distinct(product_category)) from products)
  
__ex5
SELECT M.employee_id, M.name, COUNT(*) as reports_count, ROUND(AVG(E.age),0) as average_age
FROM Employees as E JOIN Employees as M
ON E.reports_to = M.employee_id
GROUP BY E.reports_to
ORDER BY M.employee_id ASC

__ex6


