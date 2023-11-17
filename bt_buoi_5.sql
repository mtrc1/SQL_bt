__bt1
select distinct city from station
where id%2=0
__bt2
select count( city)- count( distinct city) from station
__bt4
select 
ROUND (cast( SUM(item_count * order_occurrences)/SUM(order_occurrences)
decimal),1) as mean
from items_per_order
__bt5
SELECT candidate_id 
FROM candidates
GROUP BY candidate_id 
HAVING COUNT(CASE WHEN skill in ('Python','Tableau','PostgreSQL') THEN 1
ELSE NULL END)=3 
ORDER BY candidate_id
__bt6
SELECT user_id, max(DATE(post_date))-min(DATE(post_date)) as days_between 
FROM posts
where post_date>= '2021-01-01'and post_date < '2022-01-01'
group by user_id 
having count(*)>=2;

