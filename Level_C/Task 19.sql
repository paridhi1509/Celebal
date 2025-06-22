use Level_C;
create table Employees(ID int primary key, salary decimal(10,2));
insert into Employees(ID, salary) values
(1,3400.52),
(2,2534.78),
(3,1234.56);

--Query
SELECT 
    CEILING(
        AVG(CAST(salary AS FLOAT)) - 
        AVG(CAST(REPLACE(CAST(salary AS VARCHAR(20)), '0', '') AS FLOAT))
    ) AS error
FROM Employees
WHERE REPLACE(CAST(salary AS VARCHAR(20)), '0', '') <> '';