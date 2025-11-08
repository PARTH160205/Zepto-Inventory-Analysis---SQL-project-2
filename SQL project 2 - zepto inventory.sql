create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),	
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
WeightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

SELECT * FROM zepto;

-- null values
SELECT * FROM zepto WHERE name IS NULL
OR
category IS NULL
OR
 mrp IS NULL
OR
 discountPercent IS NULL
OR
 availableQuantity IS NULL
OR
 discountedSellingPrice IS NULL
OR
 WeightInGms IS NULL
OR
 outOfStock IS NULL
OR
 quantity IS NULL;

 -- PRODUCT CATEGORIES IN DATA
 SELECT DISTINCT category FROM zepto
 ORDER BY category

 -- product stock
 SELECT outOfStock ,COUNT(sku_id)
 FROM zepto
 GROUP BY outOfStock;

 -- product present multiple times

 SELECT name,COUNT(sku_id) as "number of sku"
 FROM zepto
 GROUP BY name
 HAVING Count(sku_id) > 1
 order by count (sku_id) desc;

 -- data cleaning

 -- price = 0

 SELECT * FROM zepto 
 WHERE mrp= 0 or discountedSellingPrice=0

 DELETE FROM zepto 
 where mrp =0;

-- convert mrp to rupees

UPDATE zepto
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

SELECT mrp,discountedSellingPrice from zepto

--Found top 10 best-value products based on discount percentage
SELECT DISTINCT name,mrp,discountPercent
FROM zepto
Order by discountPercent Desc
LIMIT 10;

--Identified high-MRP products that are currently out of stock
SELECT  Distinct name,mrp FROM zepto
where outOfStock = TRUE and mrp >  300
ORDER BY mrp DESC
;

--Estimated potential revenue for each product category
SELECT category,
SUM(discountedSellingPrice*availableQuantity) as "total_revenue"
FROM zepto
GROUP BY category
order by total_revenue;

--Filtered expensive products (MRP > ₹500) with minimal discount
SELECT DISTINCT name,mrp,discountedSellingPrice,discountPercent 
FROM zepto
WHERE mrp >500 and discountPercent < 10
Order BY mrp DESC;

--Ranked top 5 categories offering highest average discounts
SELECT category,
round(avg(discountPercent),2) as "avg_discount"
from zepto
group by category
order by avg_discount desc
limit 5;

--Calculated price per gram to identify value-for-money products(weigh over 100 gms)
select distinct name,weightInGms,discountedSellingPrice,
round(discountedSellingPrice/weightInGms , 2) as "price_per_gram"
from zepto
where weightInGms>=100
order by price_per_gram;

--Grouped products based on weight into Low, Medium, and Bulk categories
SELECT distinct name , weightInGms,
CASE when weightInGms< 1000 then 'Low'
	 when weightInGms<5000 then 'Medium'
	 else 'Bulk'
	 end as weight_category
from zepto;

--Measured total inventory weight per product category
SELECT category,
sum(weightInGms*availableQuantity) as total_weight
from zepto
group by category
order by total_weight desc;
*/

