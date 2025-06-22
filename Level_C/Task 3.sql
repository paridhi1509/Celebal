use Level_C;
create table Functions( ID int identity(1,1) primary key, X int, Y int);
insert into Functions (X,Y) values
	(20,20),
	(20,20),
	(20,21),
	(23,22),
	(22,23),
	(21,20);

-- Query
select distinct f1.X, f1.Y
from Functions f1
join Functions f2 on f1.X=f2.Y and f1.Y=f2.X
where f1.X<=f1.Y
order by f1.X;
