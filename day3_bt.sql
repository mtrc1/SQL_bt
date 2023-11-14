__bt1
  select*from CITY where population >=100000 and CountryCode ="usa"
__bt2
Select*from City where countrycode="jpn"
__bt3
select City, State from station
__bt4
select city 
from station 
where city like "a%" or city like "i%" or city like "u%" or city like "e%" or city like "o%"
__bt5
select distinct city 
from station 
where city like "%a"or city like "%i" or city like "%u" or city like "%e" or city like "%o"
__bt6
select distinct city 
from  station
where city not like "a%"
And city not like "i%"
And city not like "u%"
And city not like "e%"
And city not like "o%"
__bt7
select name  from employee order by name
__bt8
select name
from employee 
where salary >2000 and months <10
__bt9
select product_id from products
where low_fats= "y" 
and recyclable= "y"
__bt10
select name from customer
where referee_id<> "2" or referee_id is null
__bt11
select name, population, area from world
where area > 3000000 or population> 25000000
order by name asc
__bt12
select distinct  author_id as id from views
where author_id= viewer_id order by id
__bt13
SELECT DISTINCT part from parts_assembly
WHERE finish_date is NULL
__bt14
select * from lyft_drivers
where yearly_salary <= 30000 or yearly_salary>=70000
__bt15
select advertising_channel from uber_advertising
where money_spent > 100000 and year = 2019
