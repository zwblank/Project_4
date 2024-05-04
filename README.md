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

To reduce the size of the dataset, it was decided to remove the columns:[brokered by, street, prev_sold_date], because they were not featured data. To further reduce the size of the dataset, noncontiguous states were removed (Guam, Virgin Islands, Puerto Rico, New Brunswick, Alaska and Hawaii) as well as any rows with null values. This reduced the dataset to 1,360,347 rows and 10 columns. This eliminated all rows with the status of 'ready_to_build'.

In the dataset, two views were created. 

Part of the data viewing and cleanup was performed using Pandas. This included reading the raw data zipped csv file.  The file is too large to upload to github and too large to open in Excel. Dataframes were made from subsets of the raw data. 

SQLite was used to create a connection for accessing the data to be used in machine language modeling.  

## Exploratory Data Analysis:
The purpose is to explore the data sets and find hidden patterns and relationships of the current real estate market. To view the full analysis and graphics, please follow this link: https://public.tableau.com/app/profile/zac.blankenship/viz/Project4-ExploratoryDataAnalysis/Project4-ExploratoryDataAnalysis?publish=yes

* What states are in which regions of the US? - Provides a visual representation of the United States and how it is broken down into 4 distinctregions: The Midwest, South, Northeast, and West. The map also provides each states average acreage, number of baths, number of beds, house size, price, and price by sqft.
* Which regions of the United States have the highest average price per sqft? The West region has the highest price per sqft which can indicate that region has the most desirable homes while the Midwest has the least.
* What is the distribution of prices of the different states? Once again proving that the West region has the highest prices, seven of the top ten states with the highest home prices are found in the West (California being #1). The bottom ten states (or those with the cheapest home prices) are evenly split between the South and Midwest. Many factors, such as state economic conditions or geographic location, can be leading factors as to why home prices are much higher in some areas versus others.
* What is the average number of bedrooms, number of baths, and average price per sqft for each region of the United States? Average price per sqft has the largest range of regional differences, indicating some regions are more desirable than others. The average number of beds is fairly similar in all regions implying a consisten demand for 3-4 bedrooms homes across the US regions. Similar to beds, baths are fairly similar across the board except for the South where there there are a few states with higher than average number of baths. It's possible this is due to that region placing more emphasis on private baths for bedrooms.
* Does average price have a strong relationship to avearge number of baths, average number of bedrooms, or average house size? With all three dimensions, there does appear to be a relationship however it's a fairly weak one. The avearge r-squared value was around 0.2731 which implies these variables don't explain much when it comes to the house price. However, it's very possible that linear regression is not the best model to use given these circumstances. It's well known that house size, more bedrooms, and more bathrooms typically lead to a higher price on a house so this data should be taken cautiously.

## Postgresql:
Due to structure of the data, Postgresql was the choice in creating a database.

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
#### Random Forest Regression
“A random forest is a meta estimator that fits a number of decision tree regressors on various sub-samples of the dataset and uses averaging to improve the predictive accuracy and control over-fitting”(Sklearn.ensemble.randomforestregressor, n.d.).

For our project, we trained a Random Forest Regression model to predict house prices based on the number of bedrooms, number of bathrooms, lot size, zip code, and house size. From several trials, we determined that ... estimators produced the best results for the dataset that was given to the model. It resulted in and R-squared value of ... and an Out-of-Bag score of ....

#### Multivariate Linear Regression
“Linear regression analysis is a set of statistical procedures designed to examine relationships between one or more independent variables (IV) and one dependent (i.e., outcome) variable (DV)”(Randolph & Myers, 2013).

#### Support Vector Regression
“Support Vector Machine (SVM) is a supervised machine learning algorithm used for… regression. The main objective of the SVM algorithm is to find the optimal hyperplane in an N-dimensional space that can separate the data points in different classes in the feature space”(Support Vector Machine (SVM) algorithm, 2023).


## To Run:

## Resources:
- USA Real Estate Dataset: https://www.kaggle.com/datasets/ahmedshahriarsakib/usa-real-estate-dataset/data
