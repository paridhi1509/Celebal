use Level_C;
create table STATION(ID int primary key, CITY varchar(21), STATE varchar(2), LAT_N float, LONG_W float);
insert into STATION (ID,CITY,STATE,LAT_N,LONG_W) values
	(1, 'CityA', 'NY', 40.7128, 74.0060),
	(2, 'CityB', 'CA', 34.0522, 118.2437),
	(3, 'CityC', 'TX', 29.7604, 95.3698);

--Query
select round(abs(MIN(LAT_N)-MAX(LAT_N))+abs(MIN(LONG_W)-MAX(LONG_W)),4)
as manhattan_distance from STATION;
