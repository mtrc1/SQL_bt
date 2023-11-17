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
__bt7
SELECT card_name, (max(issued_amount)-min(issued_amount)) AS difference
FROM monthly_cards_issued
group by card_name
order by difference desc;
__bt8
  SELECT manufacturer,COUNT(drug),SUM(cogs-total_sales) AS total_loss 
FROM pharmacy_sales
WHERE cogs>total_sales
GROUP BY manufacturer
ORDER BY total_loss DESC
__bt9
select *from cinema
where id%2=1 and description<>'boring'
order by rating desc
__bt10
SELECT   teacher_id, 
 COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id
__bt11
select user_id , count(follower_id)as followers_count
from Followers
group by user_id
order by user_id
__bt12
select class from courses
group by class
having count(student)>=5
