use Level_C;
create table Students( ID int primary key, Name varchar(50));
create table Friends( ID int, Friend_ID int, primary key (ID, Friend_ID), foreign key(ID) references Students(ID));
create table Packages( ID int primary key, Salary float, foreign key(ID) references Students(ID));
insert into Students (ID, Name) values
	(1,'Ashley'),
	(2,'Samantha'),
	(3,'Julia'),
	(4,'Scarlet');
insert into friends(ID,Friend_ID) values
	(1,2),
	(2,3),
	(3,4),
	(4,1);
insert into Packages (ID, Salary) values
	(1,15.20),
	(2,10.06),
	(3,11.55),
	(4,12.12);

--Query
select s.Name from Students s
join Friends f on s.ID=f.ID
join Packages p1 on s.ID=p1.ID
join Packages p2 on f.Friend_ID=p2.ID
where p2.Salary>p1.Salary
order by p2.Salary;