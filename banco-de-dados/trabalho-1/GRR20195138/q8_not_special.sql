select count(*)
from (
    select distinct(c_custkey)
    from customer
    except
    select distinct(c_custkey)
    from customer inner join orders on c_custkey=o_custkey
    where o_comment like '%special request%'
);