--Selecting all records from the respective tables and views
SELECT * FROM realtor_filtered;

SELECT * FROM stateregion;

SELECT * FROM usgeocode;

SELECT * FROM realtor_region_view;

SELECT * from realtor_region_extended_view;

--Queries to answer specific questions using only the realtor_region_view

--Counts by regions
SELECT region, COUNT(region)AS RegionCount
FROM realtor_region_view
group by region


--Counts by regions and states
SELECT region, state, COUNT(state) AS StateCount
FROM realtor_region_extended_view
group by region, state;

--Average square footage by states
SELECT  state, ROUND(AVG(house_size),2) AS AverageSQFT
FROM realtor_region_view
group by state;

Select status, Count(status)
FROM realtor_region_view
group by status;

--Average house price by state and status

Select state,status, count(status),SUM(price)/COUNT(*) AS AvgCostPerHouse
FROM realtor_region_view
group by state, status
order by state

--Average house price by region and status

Select region,status, count(status),SUM(price)/COUNT(*) AS AvgCostPerHouse
FROM realtor_region_view
group by region, status
order by region;

--Average house price by division and status

Select division ,status, count(status),SUM(price)/COUNT(*) AS AvgCostPerHouse
FROM realtor_region_view
group by division, status
order by division;


--Average house price by state and status with 3 baths

Select state,status, count(status),SUM(price)/COUNT(*) AS AvgCostPerHouse
FROM realtor_region_view
WHERE bath = 3
group by state, status
order by state

