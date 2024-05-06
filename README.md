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

To reduce the size of the dataset, it was decided to remove the columns:[brokered by, street], because they were not featured data. To further reduce the size of the dataset, noncontiguous states were removed (Guam, Virgin Islands, Puerto Rico, New Brunswick, Alaska and Hawaii) as well as any rows with null values. This reduced the dataset to 1,360,347 rows and 10 columns. This eliminated all rows with the status of 'ready_to_build'.

Data processing was performed using Pandas. This included reading the raw data zipped csv file.  The file is too large to upload to github and too large to open in Excel. Several dataframes were created to be used in various data exploration. 

SQLite was used to create a connection for accessing the data to be used in machine language modeling.  

A few charts were created using matplotlib.

## Exploratory Data Analysis:
The purpose is to explore the data sets and find hidden patterns and relationships of the current real estate market. To view the full analysis and graphics, please follow this link: https://public.tableau.com/app/profile/zac.blankenship/viz/Project4-ExploratoryDataAnalysis/Project4-ExploratoryDataAnalysis?publish=yes

* What states are in which regions of the US? - Provides a visual representation of the United States and how it is broken down into 4 distinctregions: The Midwest, South, Northeast, and West. The map also provides each states average acreage, number of baths, number of beds, house size, price, and price by sqft.
* Which regions of the United States have the highest average price per sqft? The West region has the highest price per sqft which can indicate that region has the most desirable homes while the Midwest has the least.
* What is the distribution of prices of the different states? Once again proving that the West region has the highest prices, seven of the top ten states with the highest home prices are found in the West (California being #1). The bottom ten states (or those with the cheapest home prices) are evenly split between the South and Midwest. Many factors, such as state economic conditions or geographic location, can be leading factors as to why home prices are much higher in some areas versus others.
* What is the average number of bedrooms, number of baths, and average price per sqft for each region of the United States? Average price per sqft has the largest range of regional differences, indicating some regions are more desirable than others. The average number of beds is fairly similar in all regions implying a consisten demand for 3-4 bedrooms homes across the US regions. Similar to beds, baths are fairly similar across the board except for the South where there there are a few states with higher than average number of baths. It's possible this is due to that region placing more emphasis on private baths for bedrooms.
* Does average price have a strong relationship to avearge number of baths, average number of bedrooms, or average house size? With all three dimensions, there does appear to be a relationship however it's a fairly weak one. The avearge r-squared value was around 0.2731 which implies these variables don't explain much when it comes to the house price. However, it's very possible that linear regression is not the best model to use given these circumstances. It's well known that house size, more bedrooms, and more bathrooms typically lead to a higher price on a house so this data should be taken cautiously.

## Postgresql:
Due to organized structure of the data, Postgresql was the choice in creating a database.

The realestate_db database contains 3 tables:
* realtor_filtered - main table
* usgeocode - table with latitude and longitude codes
* stateregion - table with region and division listing
  
While importing data into the realtor_filtered table, several fields had to be altered. These fields were coming in as decimal instead of integer (bath, bed) and the zip_code had to be altered from decimal to VARCHAR and then formatted to take leading zeros. 

Two views were made:
* realtor_region_view - includes the main table with the region and division fields added.  This is the table to use eliminating the need to do joins each time.
* realtor_region_extended_view = includes everything in the first view but added the latitude and longitude columns. This is basically for anyone needing the latitude and longitude for mapping purposes

The table schema is included in tables.sql

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

#### Removing Outliers:
To improve the fit of the machine learning models, rows that contain extreme outliers need to be filtered out. Removing these reduced the dataset to 935,674 rows from 1,360,347 rows. The downside to filtering out these outliers is that the resulting machine learning models are less robust than they would be if the outliers had been filtered out. However, due to time constraints, removing the outliers resulted in a dataset that is more agreeable to train into an accurate machine learning model. 

The code used to determine the extreme outliers is the file titled 'finding_outliers.ipynb'.

#### Multivariate Linear Regression
The first model we used to fit our data was multivariate linear regression. “Linear regression analysis is a set of statistical procedures designed to examine relationships between one or more independent variables (IV) and one dependent (i.e., outcome) variable (DV)”(Randolph & Myers, 2013). For our linear regression model, we used sklearn's linear_model. The price column of the dataset was used as the target and the number of bedrooms, number of bathrooms, lot size (in acres), zip code, and house size (in square feet) were used as the features. 

This model produced an R-squared value of approximately 0.298 on the training data and 0.301 on the testing data (split of 60% training, 40% testing), which is a poor fit. This make sense, however, as it is difficult for a complex dataset with several features to be fit linearly. The upside to this algorithm is that it runs fairly quickly and doesn't consume a lot of resources. 

The code to run this model is available in the Jupyter notebook titled, 'linear_regression.ipynb'.

#### Extreme Gradient Boosting (XGBRegressor)
We also used an XGBRegressor to fit our data. “XGBoost stands for Extreme Gradient Boosting, which applies a Gradient Boosting technique based on decision trees. It constructs short, basic decision trees iteratively”(Subasi et al., 2022). For our XGBRegressor model, we used xgboots's XGBRegressor model. The price column of the dataset was used as the target and the number of bedrooms, number of bathrooms, lot size (in acres), zip code, and house size (in square feet) were used as the features. This model was also tested with the dataset containing the outliers and the dataset where the extreme outliers had been filtered out.

Before removing the extreme outliers, the model was tested with the entire dataset, which produced R-squared values between 0.5 and 0.75 and mean absolute values between 100,000 and 200,000 for the testing and training data.

After removing the extreme outliers, the initial trial used:
- 50 estimators
- max tree depth of 6
- learning rate of 0.1
- training set comprised of 60% of the dataset
The results were:
- R-squared of ~0.6907 on the training data
- R-squared of ~0.6895 on the testing data
- Mean absolute error of ~90,716 on the training data

The model parameters were then adjusted in multiple trials (documented in the Jupyter notebook).

The best results were from a trial that used:
- 5000 estimators
- max tree depth of 8
- learning rate of 0.1
- training set comprised of 60% of the dataset
The results were:
- R-squared of ~0.8899 on the training data
- R-squared of ~0.7355 on the testing data
- Mean absolute error of: ~53,221 on the training data
- Mean squared error of ~5,855,348,972 on the training data

The code to run this model is available in the Jupyter notebook titled, 'xgbregressor.ipynb'.

#### Random Forest Regression
The second model we used to fit our data was Random Forest Regression. “A random forest is a meta estimator that fits a number of decision tree regressors on various sub-samples of the dataset and uses averaging to improve the predictive accuracy and control over-fitting”(Sklearn.ensemble.randomforestregressor, n.d.). For our random forest model, we used sklearn's random forest model. The price column of the dataset was used as the target and the number of bedrooms, number of bathrooms, lot size (in acres), zip code, and house size (in square feet) were used as the features. This model was also tested with the dataset containing the outliers and the dataset where the extreme outliers had been filtered out. 

Before removing the extreme outliers, the model was tested with the entire dataset, which produced R-squared values between 0.51 and 0.86 and very high mean squared error (>100,000,000,000) for the testing and training data.

After removing the extreme outliers, the initial trial used:
- 50 estimators
- training set comprised of 90% of the dataset
The results were:
- R-squared of ~0.978
- Mean squared error of 1,150,758,901.8

The model parameters were then adjusted in multiple trials (documented in the Jupyter notebook).

The best results were from a trial that used:
- 200 estimators
- training set comprised of 90% of the dataset
The results were:
- R-squared of ~0.9796 on the training data
- R-squared of ~0.8563 on the testing data
- Mean absolute error of ~21,363 on the training data

The code to run this model is available in the Jupyter notebook titled, 'random_forest.ipynb'.

## Results
Both the Random Forest model and the XGBRegressor model produced R-squared values greater than 0.8 when the parameters were tuned. However, the Random Forest model ended up producing better R-squared values for both the testing and the training data. Linear Regression had the worst performance overall, as the R-squared value was only ~0.3.

## Limitations
Since extreme outliers were filtered out from our dataset, the resulting models are less robust. The models will not be able to accurately predict the price of very large and/or expensive homes. The only properties that could have their value predicted using this model would be smaller homes (less than 4,000 sqft) with less than 6 beds, less than 6 baths, and on a lot smaller than 1 acre.

Future work to improve this model or similar models could include a feature that details the property type (single family home, duplex, apartment building, etc.).

## Resources:
- An introduction to XGBoost regression: https://www.kaggle.com/code/carlmcbrideellis/an-introduction-to-xgboost-regression
- Detect and Remove the Outliers using Python: https://www.geeksforgeeks.org/detect-and-remove-the-outliers-using-python/
- Feature importance for random forest: https://mljar.com/blog/feature-importance-in-random-forest/
- House Price Prediction: https://github.com/MYoussef885/House_Price_Prediction/blob/main/House_Price_Prediction.ipynb
- House Price Prediction using Machine Learning in Python: https://www.geeksforgeeks.org/house-price-prediction-using-machine-learning-in-python/
- Housing Price Prediction - (Best ML Algorithms): https://www.kaggle.com/code/yasserh/housing-price-prediction-best-ml-algorithms
- Randolph, K. A., & Myers, L. L. (2013). Bivariate and Multivariate Linear Regression Analysis. Basic Statistics in Multivariate Analysis, 109–132. https://doi.org/10.1093/acprof:oso/9780199764044.003.0005
- Sklearn.ensemble.randomforestregressor. scikit. (n.d.). https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.RandomForestRegressor.html
- Subasi, A., Panigrahi, S. S., Patil, B. S., Canbaz, M. A., & Klén, R. (2022). Advanced pattern recognition tools for disease diagnosis. 5G IoT and Edge Computing for Smart Healthcare, 195–229. https://doi.org/10.1016/b978-0-323-90548-0.00011-5
- USA Real Estate Dataset: https://www.kaggle.com/datasets/ahmedshahriarsakib/usa-real-estate-dataset/data
- Using xgboost with sklearn: https://xgboost.readthedocs.io/en/stable/python/examples/sklearn_parallel.html#sphx-glr-python-examples-sklearn-parallel-py
- USA Real Estate Dataset: https://www.kaggle.com/datasets/ahmedshahriarsakib/usa-real-estate-dataset/data
- XGBoost documentation: https://xgboost.readthedocs.io/en/stable/python/python_api.html
- XGBoost for Regression: https://machinelearningmastery.com/xgboost-for-regression/
- XGBoost Parameters: https://xgboost.readthedocs.io/en/stable/parameter.html


