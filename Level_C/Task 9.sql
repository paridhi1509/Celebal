use Level_C;
create table BST( N int primary key, P int, foreign key (P) references BST(n));
insert into BST(N,P) values
	(1, 2),
	(3, 2),
	(6, 8),
	(9, 8),
	(2, 5),
	(8, 5),
	(5, NULL);

--Query
select N,case when P is null then 'Root'
	when N in (select P from BST where P is not null) then 'Inner'
	else 'Leaf'
	end as node_type
from BST order by N;