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

To reduce the size of the dataset, it was decided to remove the columns because [brokered by, street, prev_sold_date] they were not featured data. To further reduce the size of the dataset, noncontiguous states were removed (Guam, Virgin Islands, Puerto Rico, New Brunswick, Alaska and Hawaii) as well as any rows with null values.
This reduced the dataset to 1,086,263 rows and 9 columns. 

A second dataset was created that included the prev_sold_date column that was used for buildling the Postgresql database. This dataset had 1,353,433 rows.  
In the dataset, two views were created to be used in queries. 

## Postgresql
The database includes 3 tables and 2 views.

## Machine Learning Models:

## To Run:

## Resources:
- USA Real Estate Dataset: https://www.kaggle.com/datasets/ahmedshahriarsakib/usa-real-estate-dataset/data
