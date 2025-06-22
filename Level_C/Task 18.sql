use level_c;
create table Employee_Costs (
    record_id int primary key,
    business_unit varchar(50),
    employee_id int,
    month int,
    year int,
    cost decimal(10,2),
    salary decimal(10,2),
    weight_factor decimal(5,2)
);
insert into Employee_Costs (record_id, business_unit, employee_id, month, year, cost, salary, weight_factor) values
(1, 'BU_Sales', 301, 1, 2024, 5300, 62000, 1.1),
(2, 'BU_Sales', 302, 1, 2024, 4800, 57000, 0.9),
(3, 'BU_Sales', 303, 1, 2024, 6500, 72000, 1.3),
(4, 'BU_Sales', 301, 2, 2024, 5500, 62000, 1.1),
(5, 'BU_Sales', 302, 2, 2024, 4900, 57000, 0.9),
(6, 'BU_Sales', 303, 2, 2024, 6700, 72000, 1.3),
(7, 'BU_Sales', 301, 3, 2024, 5400, 62000, 1.1),
(8, 'BU_Sales', 302, 3, 2024, 4700, 57000, 0.9),
(9, 'BU_Sales', 303, 3, 2024, 6600, 72000, 1.3),
(10, 'BU_HR', 401, 1, 2024, 4300, 51000, 1.0),
(11, 'BU_HR', 402, 1, 2024, 4500, 53000, 1.2),
(12, 'BU_HR', 401, 2, 2024, 4400, 51000, 1.0),
(13, 'BU_HR', 402, 2, 2024, 4600, 53000, 1.2),
(14, 'BU_HR', 401, 3, 2024, 4350, 51000, 1.0),
(15, 'BU_HR', 402, 3, 2024, 4550, 53000, 1.2);

--Query
select business_unit,month,year,round(sum(cost * weight_factor) / nullif(sum(weight_factor),0),2)
as weighted_average_cost_by_weight
from Employee_Costs
group by business_unit, year, month
order by business_unit,year, month;
