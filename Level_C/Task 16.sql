use Level_C;
create table Swap(id int primary key, first_name varchar(50), last_name varchar(50));
insert into Swap(id, first_name,last_name) values
(1, 'Lily', 'Evans'),
(2, 'James', 'Potter'),
(3, 'Sirius', 'Black'),
(4, 'Remus', 'Lupin'),
(5, 'Peter', 'Pettigrew');

--Query
select * from Swap;
update Swap
set first_name=last_name,last_name=first_name
where id in (1,2,3,4,5);
select*from Swap;
