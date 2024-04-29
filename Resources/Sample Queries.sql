--Selecting all records from the respective tables and views
SELECT * FROM realtor_filtered;

SELECT * FROM stateregion;

SELECT * FROM usgeocode;

SELECT * FROM realtor_region_view;

SELECT * from realtor_region_extended_view;

--QUERIES TO ANSWER SPECIFIC QUESTIONS USING MAINLY THE REALTOR_FILTERED_VIEW

--NOTE:Using the realtor_filtered table,the dataset contains data that is questionable. 
--For example, if the largest house in the U.S. has 43 bathrooms, 
--Max number of bathrooms in the dataset is more than that

Select state, MAX(bath) as MaxBaths
From realtor_filtered
GROUP BY state
Order by MaxBaths DESC

Select state, MAX(bed) as MaxBeds
From realtor_filtered
GROUP BY state
Order by MaxBeds DESC





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

Select division ,status, count(status) as CountbyDivision, SUM(price)/COUNT(*) AS AvgCostPerHouse
FROM realtor_region_view
group by division, status
order by division;


--Cost per square foot with 4 or less bath and 4 beds by state

Select state,sum(price)/sum(house_size) AS CostPerSQFT
FROM realtor_region_view
Where bath <4
	and bed = 4
GROUP BY state
ORDER BY state

--Cost per house_size with house with 6 or less beds and 5 or less baths by state

Select state,sum(price)/sum(house_size) AS CostPerSQFT
FROM realtor_region_view
Where bath <=5 
	AND bed <=6
GROUP BY state
ORDER BY state

--Cost per house_size with house with 6 or less beds and 5 or less baths by region
Select region,sum(price)/sum(house_size) AS CostPerSQFT
FROM realtor_region_view
Where bath <=5 
	AND bed <=6
GROUP BY region
ORDER BY region


--Cost per house_size with house with 6 or less beds and 5 or less baths by division

Select division,sum(price)/sum(house_size) AS CostPerSQFT
FROM realtor_region_view
Where bath <=5 
	AND bed <=6
GROUP BY division
ORDER BY costpersqft desc



