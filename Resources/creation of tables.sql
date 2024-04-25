DROP TABLE IF EXIST usgeocode
DROP TABLE IF EXIST stateregion
DROP TABLE IF EXIST realtor_filtered

--Creating the realtor_filtered table (main table)

CREATE TABLE realtor_filtered (
	status varchar(30) NOT NULL,
	price varchar,
	bed varchar(10),
	bath varchar(10),
	acre_lot varchar(10),
	city varchar(100),
	state varchar(100),
	zip_code varchar(30),
	house_size varchar(50),
	prev_sold_date varchar(20)
);


--Creating the usgeocode table

CREATE TABLE usgeocode (
	state VARCHAR(5) NOT NULL,
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

--Creating the realtor_filtered table (main table)
CREATE TABLE realtor_filtered (
	status varchar(30) NOT NULL,
	price varchar,
	bed varchar(10),
	bath varchar(10),
	acre_lot varchar(10),
	city varchar(100),
	state varchar(100),
	zip_code varchar(30),
	house_size varchar(50),
	prev_sold_date varchar(20)
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


