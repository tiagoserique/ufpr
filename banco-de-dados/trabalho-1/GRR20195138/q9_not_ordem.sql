select count(*)
from (
    select distinct(c_custkey)
    from customer left join orders on c_custkey=o_custkey
    except 
    select distinct(c_custkey)
    from customer inner join orders on c_custkey=o_custkey
);
