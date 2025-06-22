use Level_C;
create table Employees_Salary( employee_id int primary key, name varchar(100), salary decimal(10,2));
insert into Employees_Salary(employee_id,name,salary) values
(1, 'Harry Potter', 95000),
(2, 'Hermione Granger', 102000),
(3, 'Ron Weasley', 88000),
(4, 'Albus Dumbledore', 110000),
(5, 'Severus Snape', 99000),
(6, 'Minerva McGonagall', 98000),
(7, 'Rubeus Hagrid', 87000),
(8, 'Draco Malfoy', 90000),
(9, 'Sirius Black', 97000),
(10, 'Remus Lupin', 94000),
(11, 'Luna Lovegood', 91000),
(12, 'Neville Longbottom', 93000);

--Query
select employee_id, name,salary from (select employee_id,name,salary,ROW_NUMBER() over (order by salary desc) as rn
from Employees_Salary) ranked_employees
where rn<=5;

