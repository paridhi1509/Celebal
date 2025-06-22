use Level_C;
create table Hackers(hacker_id int primary key, name varchar(50));
create table Submissions(submission_id int primary key, submission_date date, hacker_id int, score int, foreign key(hacker_id) references Hackers(hacker_id));
insert into Hackers(hacker_id, name) values
	(15758, 'Rose'),
	(20703, 'Angela'),
	(36396, 'Frank'),
	(38289, 'Patrick'),
	(44065, 'Lisa'),
	(53473, 'Kimberly'),
	(62529, 'Bonnie'),
	(79722, 'Michael');
insert into Submissions(submission_date, submission_id, hacker_id, score) values
	('2016-03-01', 8494, 20703, 0),
	('2016-03-01', 22403, 53473, 15),
	('2016-03-01', 23965, 79722, 60),
	('2016-03-01', 30173, 36396, 70),
	('2016-03-02', 34928, 20703, 0),
	('2016-03-02', 38740, 15758, 60),
	('2016-03-02', 42769, 79722, 25),
	('2016-03-02', 44364, 79722, 60),
	('2016-03-03', 45440, 20703, 0),
	('2016-03-03', 49050, 36396, 70),
	('2016-03-03', 50273, 79722, 5),
	('2016-03-04', 50344, 20703, 0),
	('2016-03-04', 51360, 44065, 90),
	('2016-03-04', 54404, 53473, 65),
	('2016-03-04', 61533, 79722, 45),
	('2016-03-05', 72852, 20703, 0),
	('2016-03-05', 74546, 38289, 0),
	('2016-03-05', 76487, 62529, 0),
	('2016-03-05', 82439, 36396, 10),
	('2016-03-05', 90006, 36396, 40),
	('2016-03-06', 90404, 20703, 0);

--Query
with UniqueHackers as( 
	select submission_date, count (distinct hacker_id) as unique_hackers
	from Submissions
	where submission_date between '2016-03-01' and '2016-03-15'
	group by submission_date),
MaxSubmissions as(
	select s.submission_date, s.hacker_id, h.name, count (*) as submission_count, ROW_NUMBER() over (partition by s.submission_date order by count(*) desc, s.hacker_id asc) as rn 
	from Submissions s
	join Hackers h on s.hacker_id=h.hacker_id
	where s.submission_date between '2016-03-01' and '2016-03-15'
	group by s.submission_date,s.hacker_id,h.name)
select uh.submission_date, uh.unique_hackers, ms.hacker_id, ms.name
from UniqueHackers uh
join MaxSubmissions ms on uh.submission_date=ms.submission_date
where ms.rn=1
order by uh.submission_date;

