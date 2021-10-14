-- explain

create temporary table l3 stored as orc as 
select l_orderkey, count(distinct l_suppkey) as cntSupp
from lineitem
where l_receiptdate > l_commitdate and l_orderkey is not null
group by l_orderkey
having cntSupp = 1
;
