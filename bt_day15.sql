__ex1
WITH cte 
AS (SELECT EXTRACT(YEAR FROM transaction_date) AS year,
product_id,
spend AS curr_year_spend,
LAG(spend) OVER(PARTITION BY product_id ORDER BY EXTRACT(YEAR FROM transaction_date) ASC) AS prev_year_spend
FROM user_transactions )
SELECT year,
product_id,
curr_year_spend,
prev_year_spend,
ROUND(100.0 * ((curr_year_spend/prev_year_spend) -1 ),2) AS yoy_rate
FROM cte
__ex2
SELECT DISTINCT card_name, 
first_value(issued_amount) OVER(PARTITION BY card_name ORDER BY make_date(issue_year,issue_month,'01')) as amount
FROM monthly_cards_issued
ORDER BY amount DESC;
__ex3
SELECT user_id, spend, transaction_date from 
(SELECT *, DENSE_RANK() OVER (PARTITION BY user_id ORDER BY transaction_date ASC) 
as dr FROM transactions) as ranked_transaction
WHERE dr = 3
__ex4
SELECT transaction_date,user_id,
COUNT(product_id)
FROM user_transactions
WHERE (user_id,transaction_date) IN (SELECT user_id,MAX(transaction_date) 
FROM user_transactions GROUP BY user_id)
GROUP BY 2,1
ORDER BY 1
__ex5
select user_id,tweet_date,
ROUND(AVG(tweet_count)
OVER(PARTITION BY user_id ORDER BY tweet_date 
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2)
AS rolling_avg_3d
from tweets
__ex6
WITH cte AS 
(SELECT *, lag(transaction_timestamp, 1) OVER(PARTITION BY merchant_id,credit_card_id,amount ORDER BY transaction_timestamp)
FROM transactions)
SELECT count(*) AS payment_count 
FROM cte 
WHERE cte.lag IS NOT NULL AND 
EXTRACT(MINUTE FROM AGE(transaction_timestamp,LAG))<= 10 AND 
EXTRACT(HOUR FROM AGE(transaction_timestamp,LAG)) =00
__ex7
with cte as (select product, category, sum(spend) as total_spend, rank()
over(partition by category order by sum(spend) desc) as rk from product_spend
where extract(year from transaction_date) = '2022'
group by 1,2)
select category, product, total_spend from cte
where rk <= 2
__ex8
with cte AS(
SELECT a.artist_name,
dense_rank() over(ORDER BY COUNT(*) desc)
FROM artists a
JOIN songs s on a.artist_id=s.artist_id
JOIN global_song_rank gsr on gsr.song_id=s.song_id
where gsr.rank<=10
GROUP BY a.artist_name)
SELECT * from cte
where dense_rank<=5

