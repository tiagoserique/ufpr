select count(*)
from (
    select distinct(c_custkey)
    from (
        select c_custkey, o_comment
        from customer inner join orders on c_custkey=o_custkey
        where o_comment like '%special request%'
    )
    where o_comment not like '%unusual package%'
);
