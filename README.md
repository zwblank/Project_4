# Project_4

## Project Overview:
The aim of our project is to explore real estate data to predict home prices. In this project, we examine aspects of homes, such as square footage, number of bedrooms, etc. to predict the value of other homes.

The main question we ask of the data is what a home is worth based on its features. We also analyzed the data to determine which features are most important in determining home price.

The main machine learning model we used was a random forest regressor. We also compared it to multivariate linear regression, and support vector regression. We also used techniques, such as a correlation matrix to pick out the most important features to use for the model.

## Data Cleanup and Processing:
The original dataset consisted of 2,226,382 rows of data with 12 columns.  This dataset was too large to upload into github so decisions were made to streamline the file. This 'clean_realestate_data.csv is used for the machine learning aspect.The following is a list of the columns:
  * brokered by - removed from dataset
  * status - whether the house was "ready-to-build", "sold" or "for sale"
  * price
  * bed - number of bedrooms
  * bath - number of bathrooms
  * acre_lot - size of lot
  * street - removed from dataset
  * city
  * state
  * zip_code
  * house_size - squared footage
  * prev_sold_date - removed from dataset

To reduce the size of the dataset, it was decided to remove the columns because [brokered by, street, prev_sold_date) they were not featured data. To further reduce the size of the dataset, noncontiguous states were removed (Guam, Virgin Islands, Puerto Rico, New Brunswick, Alaska and Hawaii) as well as any rows with null values. This reduced the dataset to 1,086,263 rows and 9 columns. 

A second dataset was created that included the prev_sold_date column that was used for building the Postgresql database and used for Tableau. This dataset had 1,353,433 rows.  In the dataset, two views were created. 

Part of the data viewing and cleanup was performed using Pandas. This included reading the raw data zipped csv file.  The file is too large to upload to github and too large to open in Excel. Dataframes were made from subsets of the raw data. 

SQLite was used to create a connection for accessing the data to be used in machine language modeling.  

## Postgresql:
The realestate_db database contains 3 tables:
* realtor_filtered - main table
* usgeocode - table with latitude and longitude codes
* stateregion - table with region and division listing
  
While importing data into the realtor_filtered table, several fields had to be altered. These fields were coming in as decimal instead of integer (bath, bed) and the zip_code had to be altered from decimal to VARCHAR and then formatted to take leading zeros. 

Two views were made:
* realtor_region_view - includes the main table with the region and division fields added.  This is the table to use eliminating the need to do joins each time.
* realtor_region_extended_view = includes everything in the first view but added the latitude and longitude columns. This is basically for anyone needing the latitude and longitude for mapping purposes

The file used for this operation is under creation of tables.sql

## Queries:
Queries created to validate that data was populated in each table and visable with the views are listed at the beginning of the queries file.
Questions answered by the sample queries were: 
* the maximum number of baths grouped by state - this actually show that the data need further cleaning
* property counts by region
* property counts by region and states
* average cost per square foot(house_size) by region and status
* cost per square foot with 6 or less beds and 5 and less baths by state
* cost per square foot with 6 or less beds and 5 and less baths by region
* cost per square foot with 6 or less beds and 5 and less baths by division

This is located in the file Sample Queries.sql

## Machine Learning Models:

## To Run:

## Resources:
- USA Real Estate Dataset: https://www.kaggle.com/datasets/ahmedshahriarsakib/usa-real-estate-dataset/data
