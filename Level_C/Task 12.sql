use Level_C;
create table Jobs(job_id int primary key, job_family varchar(50), location varchar(50), cost decimal(10,2));
insert into Jobs(job_id,job_family,location,cost) values
	(1, 'Software Development', 'India', 50000),
	(2, 'Software Development', 'USA', 80000),
	(3, 'Software Development', 'India', 45000),
	(4, 'Software Development', 'UK', 70000),
	(5, 'Data Science', 'India', 60000),
	(6, 'Data Science', 'USA', 90000),
	(7, 'Data Science', 'India', 55000),
	(8, 'Quality Assurance', 'India', 40000),
	(9, 'Quality Assurance', 'Canada', 65000),
	(10, 'Quality Assurance', 'India', 42000);

--Query
select job_family, round(
	(sum(case when location='India' then cost else 0 end)*100.0)/sum(cost), 2) as India_percentage,
round(sum(case when location !='India' then cost else 0 end)*100.0/ sum(cost), 2)
as International_percentage
from Jobs group by job_family order by job_family;