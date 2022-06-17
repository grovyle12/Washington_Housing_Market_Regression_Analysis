SELECT count(*) FROM house_price_regression.house_price_data;

use house_price_regression;

-- 5. Use the alter table command to drop the column date from the database, as we would not use it in the analysis with SQL. 
-- Select all the data from the table to verify if the command worked. Limit your returned results to 10. :o

alter table house_price_regression.house_price_data drop column date;   

-- 6. Use sql query to find how many rows of data you have.

SELECT count(*) FROM house_price_regression.house_price_data;

-- Now we will try to find the unique values in some of the categorical columns:

-- What are the unique values in the column bedrooms?
select distinct bedrooms
from house_price_data
order by bedrooms desc;  
-- What are the unique values in the column bathrooms?
select distinct bathrooms
from house_price_data
order by bathrooms desc;  
-- What are the unique values in the column floors?
select distinct floors
from house_price_data
order by floors desc;  
-- What are the unique values in the column condition?
select distinct condition
from house_price_data
order by condition desc;
-- What are the unique values in the column grade?
select distinct grade
from house_price_data
order by grade desc;


-- 8. Arrange the data in a decreasing order by the price of the house. 
-- Return only the IDs of the top 10 most expensive houses in your data.
select id, price
from house_price_data
order by price desc
limit 10; 

-- 9. What is the average price of all the properties in your data?

select avg(price)
from house_price_data;

-- 10. In this exercise we will use simple group by to check the properties of some of the categorical variables in our data

-- What is the average price of the houses grouped by bedrooms? The returned result should have only two columns, bedrooms and Average of the prices. Use an alias to change the name of the second column.
select bedrooms, avg(price) as Cost
from house_price_data
group by bedrooms
order by bedrooms desc;

-- check to see how much the 33 bedroom house costs
select id,bedrooms, price
from house_price_data
order by bedrooms desc;

-- What is the average sqft_living of the houses grouped by bedrooms? 
-- The returned result should have only two columns, bedrooms and Average of the sqft_living. Use an alias to change the name of the second column.
select bedrooms, round(avg(sqft_living),2)
from house_price_data
group by bedrooms
order by bedrooms desc; 


-- What is the average price of the houses with a waterfront and without a waterfront? 
-- The returned result should have only two columns, waterfront and Average of the prices. Use an alias to change the name of the second column.

select waterfront, avg(price)
from house_price_data
group by waterfront
order by waterfront desc;


-- Is there any correlation between the columns condition and grade? 
-- You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. 
-- Visually check if there is a positive correlation or negative correlation or no correlation between the variables.

-- NOTE: Conditions seems to be a key word, i will change this to grade and price
-- It is tough to tell, i believe there may be a small postive correlation

select id, grade, price
from house_price_data
order by price
limit 100;

# One of the customers is only interested in the following houses:

# Number of bedrooms either 3 or 4
select *
from house_price_data
where bedrooms in (3,4);
# Bathrooms more than 3
select *
from house_price_data
where bathrooms > 3;
# One Floor
select *
from house_price_data
where floors = 1;
# No waterfront
select *
from house_price_data
where waterfront = 0;
# Condition should be 3 at least
# ...
# Grade should be 5 at least
select *
from house_price_data
where grade > 5;
# Price less than 300000
select *
from house_price_data
where price < 300000;
-- For the rest of the things, they are not too concerned. Write a simple query to find what are the options available for them?
select *
from house_price_data
where price < 200000 and price> 100000 and grade = 5 and floors = 2;


# 12. Your manager wants to find out the list of properties whose prices are twice more than the average of all the properties in the database. 
# Write a query to show them the list of such properties. You might need to use a sub query for this problem.
select *
from house_price_data
where price >=
(
select (2*avg(price))
from house_price_data
);
# 13. Since this is something that the senior management is regularly interested in, create a view of the same query.
CREATE VIEW house_price_regression.twice_avg AS
select *
from house_price_data
where price >=
(
select (2*avg(price))
from house_price_data
);
# 14. Most customers are interested in properties with three or four bedrooms. What is the difference in average prices of the properties with three and four bedrooms?
select bedrooms as amount_of_bedrooms, round(avg(price),2) as average_cost
from house_price_data
where bedrooms in (3,4)
group by bedrooms
order by bedrooms;

# 15. What are the different locations where properties are available in your database? (distinct zip codes)
select distinct zipcode
from house_price_data;

# 16. Show the list of all the properties that were renovated.
SELECT 
    *
FROM
    house_price_data
where
	yr_renovated > 0;

# 17. Provide the details of the property that is the 11th most expensive property in your database.

select *
from house_price_data
order by price desc
limit 10,1;





















