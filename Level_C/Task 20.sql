use Level_C;
create table SourceTable(ID int primary key, Name varchar(50));
create table TargetTable(ID int primary key, Name varchar(50));
insert into SourceTable(ID, Name) values
(1,'Hermione'),
(2,'Draco'),
(3,'Sirius');

--Query
insert into TargetTable
select * from SourceTable;
select * from TargetTable;