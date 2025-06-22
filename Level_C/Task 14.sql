use Level_C;
create table Employees_SubBand(employee_id int primary key, name varchar(100), sub_band varchar(20));
insert into Employees_SubBand(employee_id,name,sub_band) values
	(1, 'John Doe', 'A1'),
	(2, 'Jane Smith', 'A1'),
	(3, 'Mike Johnson', 'A2'),
	(4, 'Sarah Wilson', 'A2'),
	(5, 'Tom Brown', 'A2'),
	(6, 'Lisa Davis', 'B1'),
	(7, 'Chris Miller', 'B1'),
	(8, 'Anna Garcia', 'B2'),
	(9, 'David Lee', 'B2'),
	(10, 'Emily Chen', 'B2'),
	(11, 'Robert Taylor', 'C1'),
	(12, 'Maria Rodriguez', 'C1');

--Query
select sub_band, count(*) as headcount, round(count(*)*100.0 / sum(count(*)) over(), 2) as percentage
from Employees_SubBand group by sub_band order by sub_band;