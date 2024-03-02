
/*SQL for Exploratory Data Analysis*/

/* 1. Testing hypothesis with statistics*/

SELECT Avg(number_purchase), Avg(amount_purchase) FROM customer_summary WHERE age > 40
go


/* 2. Check for Missing Values*/
SELECT * FROM store_values WHERE units_sold IS NULL
go


/* 3. Out of Range Values*/
SELECT * FROM employees WHERE (age < 0) AND (age > 40)

SELECT * FROM store_sales WHERE employee_shift > 10 OR employee_shift < 0
go


/* 4. Check Minimum, Maximum and Median*/
SELECT MIN(age) FROM employees

SELECT MIN(age), MIN (start_date), MIN(num_vacation_days) FROM employees

SELECT MAX(age) FROM employees
go



/* 5. Ordering and Counting*/
SELECT age FROM employees ORDER BY age

SELECT age FROM employees ORDER BY age DESC

SELECT age, start_date FROM employees ORDER BY age, start_date

SELECT COUNT(age) FROM employees # return non null values
go



/* 6. Histogram*/
SELECT FLOOR(age/5) as bucket FROM insured_persons

SELECT FLOOR(age/5) as bucket, FLOOR(age/5) * 5 AS bucket_floor FROM insured_persons
go


/* 7. Calculating Histogram and Visualization*/
SELECT FLOOR(age/5) * 5 AS bucket_floor, AVG(annual_cost) FROM insured_persons GROUP BY bucket_floor ORDER BY bucket_floor
REPEAT('*', 10): **********

CAST (variable AS INTEGER)
SELECT FLOOR(age/5) * 5 AS bucket_floor,  AVG(annual_cost), REPEAT('*', CAST(ROUND(FLOOR(age/5)*5) / 100)) AS INTEGER) AS bar FROM insured_persons GROUP BY bucket_floor ORDER BY bucket_floor
go


/* 8. Checking Correlation between Attributes */
/* Positively correlated*/
SELECT CORR(units_sold, total_revenue) FROM product_sales
/* Negatively Correlated*/
SELECT CORR(rooms_booked, rooms_avaliable) FROM hotel_rooms
/* Not correlated*/
SELECT CORR(distance_to_store, amount_spend) FROM hotel_rooms
