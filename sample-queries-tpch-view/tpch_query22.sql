drop view q22_customer_tmp_cached;
drop view q22_customer_tmp1_cached;
drop view q22_orders_tmp_cached;

create view if not exists q22_customer_tmp_cached as
select
	c_acctbal,
	c_custkey,
	substr(c_phone, 1, 2) as cntrycode
from
	customer
where
	substr(c_phone, 1, 2) = '13' or
	substr(c_phone, 1, 2) = '31' or
	substr(c_phone, 1, 2) = '23' or
	substr(c_phone, 1, 2) = '29' or
	substr(c_phone, 1, 2) = '30' or
	substr(c_phone, 1, 2) = '18' or
	substr(c_phone, 1, 2) = '17';
 
create view if not exists q22_customer_tmp1_cached as
select
	avg(c_acctbal) as avg_acctbal
from
	q22_customer_tmp_cached
where
	c_acctbal > 0.00;

create view if not exists q22_orders_tmp_cached as
select
	o_custkey
from
	orders
group by
	o_custkey;
