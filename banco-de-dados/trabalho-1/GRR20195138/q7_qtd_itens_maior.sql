select n_name, sum(l_quantity)
from NATION N, CUSTOMER C, ORDERS O, LINEITEM L
where n_nationkey=c_nationkey and c_custkey=o_custkey and o_orderkey=l_orderkey
group by n_name
having sum(l_quantity) > 62000
order by sum(l_quantity) desc
;