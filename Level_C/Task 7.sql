--Query
with Numbers as(select 2 as n union all select n+1 from Numbers where n<1000),
primes as(select n from Numbers n1
where not exists(select 1 from Numbers n2 where n2.n between 2 and cast(sqrt(n1.n) as int)
and n1.n % n2.n=0))
select STRING_AGG(cast(n as varchar(10)),'&') within group (order by n) as prime_numbers
from primes option (maxrecursion 1000);