drop view q11_part_tmp_cached;
drop view q11_sum_tmp_cached;

create view q11_part_tmp_cached as
select
	ps_partkey,
	sum(ps_supplycost * ps_availqty) as part_value
from
	partsupp,
	supplier,
	nation
where
	ps_suppkey = s_suppkey
	and s_nationkey = n_nationkey
	and n_name = 'GERMANY'
group by ps_partkey;

create view q11_sum_tmp_cached as
select
	sum(part_value) as total_value
from
	q11_part_tmp_cached;
