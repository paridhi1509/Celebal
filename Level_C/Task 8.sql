use Level_C;
create table OCCUPATIONS(ID int identity(1,1) primary key, Name varchar(50), Occupation varchar(50));
insert into OCCUPATIONS (Name, Occupation) values
	('Samantha', 'Doctor'),
	('Julia', 'Actor'),
	('Maria', 'Actor'),
	('Meera', 'Singer'),
	('Ashely', 'Professor'),
	('Ketty', 'Professor'),
	('Christeen', 'Professor'),
	('Jane', 'Actor'),
	('Jenny', 'Doctor'),
	('Priya', 'Singer');

--Query
select max(case when Occupation='Doctor' then Name end)as Doctor,
	   max(case when Occupation='Professor' then Name end)as Professor,
	   max(case when Occupation='Singer' then Name end)as Singer,
	   max(case when Occupation='Actor' then Name end)as Actor
from ( select Name, Occupation, ROW_NUMBER() over (partition by Occupation order by Name)as rn
from OCCUPATIONS) t
group by rn
order by rn;