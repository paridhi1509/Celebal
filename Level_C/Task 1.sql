use Level_C;
create table Projects (Task_ID int PRIMARY KEY, Start_Date DATE, End_Date DATE);
insert into Projects (Task_ID, Start_Date, End_Date) values
(1, '2015-10-01', '2015-10-02'),
(2, '2015-10-02', '2015-10-03'),
(3, '2015-10-03', '2015-10-04'),
(4, '2015-10-13', '2015-10-14'),
(5, '2015-10-14', '2015-10-15'),
(6, '2015-10-28', '2015-10-29'),
(7, '2015-10-30', '2015-10-31');
select * from Projects;

-- Query
with Groups as(
	select Task_ID,
		   Start_Date, 
		   End_Date, 
		   DATEADD(day,-row_number() over (order by Start_Date), Start_Date) as group_id
	from Projects),
GroupedProject as(
	select MIN(Start_Date) as Start_Date,
		   MAX(End_Date) as End_Date,
		   DATEDIFF(day, MIN(Start_Date), MAX(End_Date)) + 1 as Days
		from Groups
		group by group_id)
select Start_Date, End_Date
from GroupedProject
order by Days ASC, Start_Date ASC;