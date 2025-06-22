use Level_C;
create table BU(record_id int primary key, business_unit varchar(50), month int, year int, cost decimal(12,2), revenue decimal(12,2));
insert into BU (record_id, business_unit, month, year, cost, revenue)values
	(1, 'BU_North', 1, 2023, 100000, 150000),
	(2, 'BU_North', 2, 2023, 110000, 160000),
	(3, 'BU_North', 3, 2023, 105000, 170000),
	(4, 'BU_North', 4, 2023, 120000, 180000),
	(5, 'BU_South', 1, 2023, 80000, 120000),
	(6, 'BU_South', 2, 2023, 85000, 130000),
	(7, 'BU_South', 3, 2023, 90000, 140000),
	(8, 'BU_South', 4, 2023, 95000, 150000),
	(9, 'BU_East', 1, 2023, 70000, 100000),
	(10, 'BU_East', 2, 2023, 75000, 110000);

--Query
SELECT 
    business_unit,
    month,
    year,
    cost,
    revenue,
    ROUND(cost / NULLIF(revenue, 0), 4) AS cost_to_revenue_ratio,
    LAG(ROUND(cost / NULLIF(revenue, 0), 4)) OVER (
        PARTITION BY business_unit 
        ORDER BY year, month
    ) AS previous_month_ratio,
    ROUND(
        (ROUND(cost / NULLIF(revenue, 0), 4) - 
         LAG(ROUND(cost / NULLIF(revenue, 0), 4)) OVER (
             PARTITION BY business_unit 
             ORDER BY year, month
         )) * 100, 2
    ) AS ratio_change_percentage
FROM BU
ORDER BY business_unit, year, month;

