select c_mktsegment, count(c_mktsegment) 
from CUSTOMER 
group by c_mktsegment
;