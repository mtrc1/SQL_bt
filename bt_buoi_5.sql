__bt1
select distinct city from station
where id%2=0
__bt2
select count( city)- count( distinct city) from station
__bt4

