select n_name, count(o_orderkey)
from NATION N, CUSTOMER C, ORDERS O
where n_nationkey=c_nationkey and c_custkey=o_custkey
group by n_name
order by count(o_orderkey) desc
;
