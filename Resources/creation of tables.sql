DROP TABLE IF EXISTS realtor_filtered
DROP TABLE IF EXISTS usgeocode
DROP TABLE IF EXISTS stateregion
DROP VIEW IF EXISTS realtor_region_view
DROP VIEW IF EXISTS realtor_region_extended_view

--Creating the realtor_filtered table (main table)

CREATE TABLE realtor_filtered (
	status varchar(30) NOT NULL,
	price money,
	bed decimal,
	bath decimal,
	acre_lot decimal(10,2),
	city varchar(100),
	state varchar(100),
	zip_code decimal(10),
	house_size decimal,
	prev_sold_date date
);
--Must Alter the zip code field to be correctly formatted include leading zeros 
ALTER TABLE realtor_filtered
ALTER COLUMN zip_code TYPE VARCHAR(5);

UPDATE realtor_filtered
SET zip_code = RIGHT(CONCAT('00000',zip_code),5)
WHERE length(zip_code)<5;

--Creating the usgeocode table

CREATE TABLE usgeocode (
	state VARCHAR(5) NOT NULL,
	latitude DOUBLE PRECISION NOT NULL,
	longitude DOUBLE PRECISION NOT NULL,
	Name VARCHAR(100)
);

--Creating the stateregion table
CREATE TABLE stateregion (
	state VARCHAR(5) NOT NULL,
	name VARCHAR (50) NOT NULL,
	region VARCHAR (50),
	division VARCHAR(50)
);

----Creation of the views for realtor_filtered and stateregion
CREATE VIEW realtor_region_view AS
SELECT rf.*, sr.region, sr.division
FROM realtor_filtered rf
JOIN stateregion sr ON rf.state = sr.name;

----Creation of view for realtor_filtered, stateregion, and usgeocode
CREATE VIEW realtor_region_extended_view AS
SELECT rf.*, sr.region, sr.division, gr.latitude, gr.longitude
FROM realtor_filtered rf
JOIN stateregion sr ON rf.state = sr.name
JOIN usgeocode gr on sr.name = gr.name;
