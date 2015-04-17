select count(1) from profiles;
select count(distinct user_id) from profiles;
select count(distinct user_id) from transfers;

select user_id, count(1) from profiles group by user_id order by count(1) asc; -- 00e902f9083c711620d48fd155945380 has 2014-12, 2015-02
select * from profiles where user_id = '00e902f9083c711620d48fd155945380'; -- distance is 1.41421
select *, histogram regexp '[1-9]' as full from profiles order by user_id, month, profile_kind_id;

select user_id, count(1) from transfers group by user_id order by count(1) desc; -- d70f57b9e07f2aa34e2b2c91860c5e03
select * from transfers where user_id = 'd70f57b9e07f2aa34e2b2c91860c5e03';
select * from profiles where user_id = 'd70f57b9e07f2aa34e2b2c91860c5e03' and profile_kind_id = 1 order by month;