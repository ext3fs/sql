set @prev := '0000-00-00';
set @cnt := 0;

select min(tmp.s), max(tmp.e)
from(
      select if(@prev = ord.s, @cnt, @cnt := @cnt + 1) as idx, ord.s as s, @prev := ord.e as e
      from(
           select start_date as s, end_date as e
           from projects
           order by start_date
           ) ord
      ) tmp
group by tmp.idx
order by count(*), 1
