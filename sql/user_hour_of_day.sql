drop table if exists user_hour_of_day;
create table user_hour_of_day as
select userId, month(timestamp) month, hour(timestamp) hour, concat(lpad(month(timestamp),2,'0'), '-', lpad(hour(timestamp),2,'0')) month_hour, count(1) count
from transfers
group by userId, month(timestamp), hour(timestamp);
