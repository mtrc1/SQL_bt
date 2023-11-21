__ex1
select name 
from students
where marks>75
order by right(name,3),id
__ex2
select user_id,
concat (upper( left (name,1)), lower(right(name,(length(name)-1))))as name
from users
order by user_id
__ex3
SELECT manufacturer,
('$' || round(sum(total_sales)/ 1000000) || ' million') as sale
FROM pharmacy_sales
group by 1 
ORDER BY SUM(total_sales) desc,manufacturer
__ex4
SELECT 
EXTRACT(Month from submit_date)as mth, product_id,
ROUND(AVG(stars),2) as avg_stars
FROM reviews
GROUP BY product_id, mth
ORDER BY mth, product_id
__ex5
SELECT sender_id,
COUNT(message_id) AS count_messages
FROM messages
WHERE EXTRACT(MONTH FROM sent_date) = '8'
AND EXTRACT(YEAR FROM sent_date) = '2022'
GROUP BY sender_id
__ex6
select sender_id,
count(message_id) as message_count
from messages
where EXTRACT(month from sent_date)=8
AND EXTRACT (year from sent_date)=2022
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2
__ex7
  select activity_date as day , count(distinct user_id ) as  active_users
from activity
WHERE activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
group by activity_date
__ex8
select count(employee_id) as number employ
from emloyees
where extract(month from joining_date) between 1 and 7
abd extract(year from joining_date)=2022
__ex9
select position('a'in first_name) as position
from worker
where first_name='amitah'
__ex10
select substring(title, length(winery)+2,4 )
from  winemag_p2
where country ='macedonia'
