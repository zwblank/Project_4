DROP VIEW IF EXISTS realtor_region_extended_view;
DROP VIEW IF EXISTS realtor_region_view;
DROP TABLE IF EXISTS realtor_filtered;
DROP TABLE IF EXISTS usgeocode;
DROP TABLE IF EXISTS stateregion;

--Creating the realtor_filtered table (main table)

CREATE TABLE realtor_filtered (
	status varchar(30) NOT NULL,
	price money,
	bed decimal,
	bath decimal,
	acre_lot decimal(10,2),
	city varchar(100),
	state varchar(100),
	zip_code decimal(5,0),
	house_size decimal,
	prev_sold_date date
);

--Check to see if table is created with columns

--Import data from csv file

--Verify data has been imported
SELECT *
FROM realtor_filtered

--Alter the Table to the correct data types for bed, bath and zip_code

ALTER TABLE realtor_filtered
	ALTER COLUMN bath TYPE INT,
	ALTER COLUMN bed TYPE INT,
	ALTER COLUMN zip_code TYPE VARCHAR(5);

--UPDATE the zip_code field to display leading zeros as necessary

UPDATE realtor_filtered
	SET zip_code = RIGHT(CONCAT('00000',zip_code),5)
	WHERE length(zip_code)<5;

--Verify changes
	

--Creating the usgeocode table

CREATE TABLE usgeocode (
	state VARCHAR(5) NOT NULL PRIMARY KEY,
	latitude VARCHAR(15) NOT NULL,
	longitude VARCHAR(15) NOT NULL,
	Name VARCHAR(100)
);

--Creating the stateregion table
CREATE TABLE stateregion (
	state VARCHAR(5) NOT NULL,
	name VARCHAR (50) NOT NULL,
	region VARCHAR (50),
	division VARCHAR(50)
);

SELECT *
FROM stateregion

--CREATION OF VIEWS
--View with the region and division columns added

CREATE VIEW  realtor_region_view AS
	SELECT rf.*, sr.region, sr.division
	FROM realtor_filtered rf
	JOIN stateregion sr on rf.state = sr.name;

--View with the the region information and adding latitude and longitude coordinates. 
--This view is best used when using mapping

CREATE VIEW  realtor_region_extended_view AS
	SELECT rf.*, sr.region, sr.division, gr.latitude, gr.longitude
	FROM realtor_filtered rf
	JOIN stateregion sr on rf.state = sr.name
	JOIN usgeocode gr on sr.name = gr.name;
	
	