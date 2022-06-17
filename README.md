# Washington_Housing_Market_Regression_Analysis
- Mid Semester Regression Analysis Project: Python, MySQL and Tableau Files included
- In addition, each .xlsx/.csv files used for each analysis is provided

### Purpose of Project
- Develop the optimum regression model to predict target (price). .ipynb files contains comparison of all possible regression models with Linear Regression and K-Nearest Neighbors.
- Use MySQL to explore insights into data, including unique values and average prices based on various features
- Use Tableu to garder further insights, including those of house built from 1900-1999, 2000-2010, and 2010-beyond

### Problem Definition
-Data: The data set consists of information on some 22,000 properties.  The dataset consisted of historic data of houses sold between May 2014 to May 2015. These are the definitions of data points provided: (Note: For some of the variables that are self explanatory, no definition has been provided)

- Id: Unique identification number for the property.
- date: date the house was sold.
- price: price of the house.
- waterfront: house which has a view to a waterfront.
- condition: How good the condition is (overall). 1 indicates worn out property and 5 excellent.
- grade: Overall grade given to the housing unit, based on King County grading system. 1 poor ,13 excellent.
- Sqft_above: square footage of house apart from basement.
- Sqft_living15: Living room area in 2015(implies - some renovations). This might or might not have affected the lotsize area.
- Sqft_lot15: lotSize area in 2015(implies - some renovations). 

### Methodology
- General exploration of data, Feature Extraction, general data cleaning/column dropping, checking for null values
- Exploratory Data Analysis
- Data Transformation/Outlier Removal
- Numerical/Categorical Transformation
- Results
- Tableau Results

### Description of data
- Name of the data: Historic data of houses sold between May 2014 to May 2015, from Seatle, Washington 
- Number of data points: 21597
- Number of features: 21
- Target attribute: Price

### General exploration of data, Feature Extraction, general data cleaning/column dropping, checking for null values
- We first explored the data in general, checking our data types, shape, and general info. I saw that we had infomation on the `yr_built` and saw it better to extract it as make a new column that gave us the actual age of the house. 
- From working with MySQL, I noticed that there were duplicate `ID` values, so I removed those as well. However, no entire duplicate rows were detected. I also wanted to use the date column, so i removed the specific day from the `date` column, reducing my individual datesfrom 372 to 13.
- In terms of dropping columns, `waterfront`,`view`,`yr_renovated` were all dropped because the majority of their data  (95%-99%) was represented by one column. This leads to over-represention by one data point, thus defeating the purpose of analysis to use that feature in our model. `ID` was dropped as it is of no value to us, and `zipcode` was dropped as there was no effective way to bin them, as geographicaly the zipcodes are not close to each other numerically. 
- I also wanted to see if the number of days since the property was sold had any bearing on price, so I extracted `date` and turned it into `days_sold` (I would later drop this column, as it has no bearing on the average price)
### Exploratory Data Analysis
- I took at look at the measures of central tendency and measures of variability, as well as creating IQR as well as creating lower and upper limits. We also created a heatmap (method='pearson') to check for colinearity. 
- We ploted almost all the data on distribtion plots to check for normally distributed data. Some data didn't behave well, which led me to believe that specific data is categorical in nature. This is common and taken into account
- I took a quick look at that count for each type of bathroom and floors, and the average price for `bathrooms`,`condition`,`grade`,`floors`,and `bedrooms`. I then took away data that, as a whole, only represented 5% of my data or less (for the sake of data preservation, I only removed 1%-2% of the data). A final note; when looking at `days_sold`, The average price was the same for each month/year, so i elected to drop the column
### Data Transformation/Outlier Removal
- This part of my analysis took the longest. For the columns `sqft_living`,`sqft_lot`,`sqft_above`,`sqft_living15`,`price`, I used a logarithmic transfomation, which is normally used where the data has a positively skewed distribution. However, for `age`, the log transformation didn't work well. I ended up using a boxcox transformation for that column, which still didn't give me a perfect normal distribution, but there was a big improvement overall. I used some boxplots to take a look at how many outliers we have in general, then i cleaned each column of outliers. I made a function to change the upper and lower limits at my discretion.
### Normalization/Encoding/Results
- In the code, I used OneHotEncoding for my categorical columns. I decided to see what they optimum transformer for a linear regression would be, as well as the optimum transformer for a k-nearest neighbors algorithm. In the code for linear regression, the resulting graph shows each transformation and the resulting r-squared, mean square error, mean absolute error, and adjusted r-squared as our measures of error. A min/max data transformation shows the best results, but only marginally. In terms of k-nearest neighbors, for k values 1 to 50, 
















