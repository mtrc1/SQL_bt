__ex1
WITH company AS
(SELECT
  company_id
FROM job_listings
GROUP BY company_id, title, description
HAVING COUNT(*) > 1)
SELECT COUNT(*)
FROM company

  __ex2
WITH products AS (
SELECT
category,
product,
spend,
SUM(spend) OVER(PARTITION BY product) AS total_spend,
ROW_NUMBER()  OVER(PARTITION BY category) AS row_number
FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date) = 2022
ORDER BY category, row_number
)

SELECT category, product, total_spend
FROM products
WHERE row_number IN (1 ,2)

__ex3
SELECT COUNT(policy_holder_id) member_count
FROM (SELECT policy_holder_id, COUNT(case_id)
FROM callers
GROUP BY policy_holder_id
HAVING COUNT(case_id)>= 3) call_count

__ex4
SELECT DISTINCT P.page_id
FROM pages P LEFT JOIN page_likes L
ON P.page_id = L.page_id
WHERE L.liked_date IS NULL
ORDER BY P.page_id ASC

__ex5
WITH active_users AS (
SELECT user_id,
EXTRACT(MONTH FROM event_date) AS mth
FROM user_actions
WHERE event_type IN ('sign-in','like','comment')
AND EXTRACT (MONTH FROM event_date) IN (6,7)
AND date_part ('year', event_date) = 2022
GROUP BY user_id, mth
HAVING COUNT(EXTRACT(MONTH FROM event_date))  = 2
)
SELECT mth, COUNT(user_id) AS active_user
FROM active_users
WHERE mth = 7
GROUP BY mth

__ex6
SELECT
DATE_FORMAT(trans_date, '%Y-%m') AS month,
country,
COUNT(*) AS trans_count,
SUM(IF(state = 'approved', 1, 0)) AS approved_count,
SUM(amount) AS trans_total_amount,
SUM(IF(state = 'approved', amount, 0)) AS approved_total_amount
FROM Transactions
GROUP BY DATE_FORMAT(trans_date, '%Y-%m'), country

__ex7
select
product_id,
year as first_year,
quantity,
price
from Sales
where (product_id, year) in (select product_id, min(year) from Sales group by 1)

__ex8
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING count(DISTINCT product_key) = (SELECT count(*) FROM Product)

__ex9
SELECT employee_id 
FROM Employees 
WHERE salary<30000 AND manager_id NOT IN (SELECT employee_id FROM Employees)
ORDER BY employee_id

__ex10
WITH company AS
(SELECT
  company_id
FROM job_listings
GROUP BY company_id, title, description
HAVING COUNT(*) > 1)
SELECT COUNT(*)
FROM company

__ex11
(Select u.name as results 
from MovieRating as m, Users as u 
where u.user_id = m.user_id Group By m.user_id 
Order by count(m.user_id) desc, u.name limit 1)
union all
(Select m.title as results
from MovieRating as r, Movies as m
where m.movie_id = r.movie_id 
and r.created_at like "2020-02-%"
Group By r.movie_id 
Order by avg(r.rating) desc, m.title limit 1);

__ex12
with base as(select requester_id id from RequestAccepted
union all
select accepter_id id from RequestAccepted)
select id, count(*) num  from base group by 1 order by 2 desc limit 1
