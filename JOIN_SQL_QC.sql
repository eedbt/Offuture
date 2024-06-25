-- TABLE CREATION, GRANTING PERMISSIONS



/*
create table student.offuture_22
	(row_id int,
	order_id varchar(50),
	order_date varchar(20),
	ship_date varchar(20),
	ship_mode varchar(50),
	customer_id varchar(50),
	customer_name varchar(50),
	segment varchar(50),
	city varchar(50),
	state varchar(50),
	country varchar(50),
	postal_code varchar(20),
	market varchar(50),
	region varchar(50),
	product_id varchar(60),
	category varchar(50),
	sub_category varchar(50),
	product_name varchar(500),
	sales numeric,
	quantity int,
	discount numeric,
	profit numeric,
	shipping_cost numeric,
	order_priority varchar(50));


select * from student.offuture_22;


grant all on student.offuture_22 to da10_jaan, da10_akam, da10_egdu, da10_raor;

*/


-- [SQL01] COUNT OF ROWS ----------------------------------------------------------------------
-- counts number of rows using row_id
SELECT
	count(row_id)
FROM
	student.offuture_22;


-- [SQL02] COUNT OF DISTINCT ROWS -------------------------------------------------------------
-- counts number of distinct rows using row_id
SELECT
	count(DISTINCT(row_id))
FROM
	student.offuture_22;


-- [SQL03] COUNT OF COLUMNS -------------------------------------------------------------------
-- counts all the column names listed in the information schema
SELECT 
	COUNT(*)
FROM 
	information_schema.columns
WHERE 
	table_schema = 'student'
	AND 
	table_name = 'offuture_22';


-- [SQL04] SUM OF COLUMN SUMS -------------------------------------------------------------------
-- sums each numeric column then all sums the totals
SELECT 
	SUM(row_id) +
	SUM(sales) +
	SUM(quantity) +
	SUM(discount) +
	SUM(profit) +
	SUM(shipping_cost)
FROM 
	student.offuture_22;


-- [SQL05] SUM OF ROW SUMS ----------------------------------------------------------------------
-- sums the numeric values from each row then sums all the totals
SELECT 
	SUM( row_id +
		 sales +
		 quantity +
		 discount +
		 profit +
		 shipping_cost)
FROM 
	student.offuture_22;


-- [SQL06] SUM, MIN, MAX -------------------------------------------------------------------------
-- NOTE: some values were rounded to match Excel format

-- finds the sum of each numeric column
SELECT
	SUM(row_id) row_id ,
	ROUND(SUM(sales),3) sales ,
	SUM(quantity)  quantity ,
	ROUND(SUM(discount),3) discount ,
	ROUND(SUM(profit),3) profit ,
	ROUND(SUM(shipping_cost),3) shipping_cost
FROM
	student.offuture_22;

-- finds maximum values for all numeric columns
SELECT
	MAX(row_id) row_id ,
	ROUND(MAX(sales),3) sales ,
	MAX(quantity) quantity ,
	ROUND(MAX(discount),3) discount ,
	ROUND(MAX(profit),3) profit ,
	MAX(shipping_cost) shipping_cost
FROM
	student.offuture_22;

-- finds minimum values for all numeric columns
SELECT
	MIN(row_id) row_id ,
	ROUND(MIN(sales),3) sales ,
	MIN(quantity)  quantity ,
	ROUND(MIN(discount),3) discount ,
	ROUND(MIN(profit),3) proft ,
	MIN(shipping_cost) shipping_cost
FROM
	student.offuture_22;


-- min max for dates
     -- converts order_date to date format and finds the minimum and maximum values
SELECT 
	min(to_date(o.order_date, 'dd/mm/yyyy') ),
	max(to_date(o.order_date, 'dd/mm/yyyy') )
FROM
	student.offuture_22 o ;

     -- converts ship_date to date format and finds the minimum and maximum values
SELECT 
	min(to_date(o.ship_date , 'dd/mm/yyyy') ),
	max(to_date(o.ship_date , 'dd/mm/yyyy') )
FROM
	student.offuture_22 o ;



-- [SQL07] COUNT OF DISTINCT ENTRIES PER COLUMN ----------------------------------------------

SELECT 
	COUNT(DISTINCT(row_id))			row_id , 
	COUNT(DISTINCT(order_id))		order_id ,  
	COUNT(DISTINCT(order_date))		order_date ,  
	COUNT(DISTINCT(ship_date))		ship_date ,  
	COUNT(DISTINCT(ship_mode))		ship_mode ,  
	COUNT(DISTINCT(customer_id))	customer_id ,  
	COUNT(DISTINCT(customer_name))	customer_name ,  
	COUNT(DISTINCT(segment))		segment ,  
	COUNT(DISTINCT(city))			city ,  
	COUNT(DISTINCT(state))			state , 
	COUNT(DISTINCT(country))		country ,  
	COUNT(DISTINCT(postal_code))	postal_code ,  
	COUNT(DISTINCT(market))			market ,  
	COUNT(DISTINCT(region))			region ,  
	COUNT(DISTINCT(product_id))		product_id ,  
	COUNT(DISTINCT(category))		category ,  
	COUNT(DISTINCT(sub_category))	sub_category ,  
	COUNT(DISTINCT(product_name))	product_name ,  
	COUNT(DISTINCT(sales)) 			sales ,  
	COUNT(DISTINCT(quantity))		quantity ,  
	COUNT(DISTINCT(discount))		discount ,  
	COUNT(DISTINCT(profit))			profit ,  
	COUNT(DISTINCT(shipping_cost))	shipping_cost ,  
	COUNT(DISTINCT(order_priority))	order_priority 
FROM 
	STUDENT.offuture_22 ;

-- [SQL08] COUNT OF NULLS -------------------------------------------------------------------------
-- count of total rows minus the count of entries for each column gives number of null values
SELECT
	COUNT(ROW_ID) - COUNT(ROW_ID)			row_id ,
	COUNT(ROW_ID) - COUNT(order_id)			order_id ,
	COUNT(ROW_ID) - COUNT(order_date)		order_date ,
	COUNT(ROW_ID) - COUNT(ship_date)		ship_date ,
	COUNT(ROW_ID) - COUNT(ship_mode)		ship_mode ,
	COUNT(ROW_ID) - COUNT(customer_id)		customer_id ,
	COUNT(ROW_ID) - COUNT(customer_name)	customer_name,
	COUNT(ROW_ID) - COUNT(segment)			segment ,
	COUNT(ROW_ID) - COUNT(city)				city ,
	COUNT(ROW_ID) - COUNT(state)			state ,
	COUNT(ROW_ID) - COUNT(country)			country ,
	COUNT(ROW_ID) - COUNT(postal_code)		country_code ,
	COUNT(ROW_ID) - COUNT(market)			market ,
	COUNT(ROW_ID) - COUNT(region)			region ,
	COUNT(ROW_ID) - COUNT(product_id)		product_id ,
	COUNT(ROW_ID) - COUNT(category)			category ,
	COUNT(ROW_ID) - COUNT(sub_category)		sub_category ,
	COUNT(ROW_ID) - COUNT(product_name)		product_name ,
	COUNT(ROW_ID) - COUNT(sales) 			sales ,
	COUNT(ROW_ID) - COUNT(quantity)			quantity ,
	COUNT(ROW_ID) - COUNT(discount) 		discount ,
	COUNT(ROW_ID) - COUNT(profit)			profit ,
	COUNT(ROW_ID) - COUNT(shipping_cost)	shipping_cost ,
	COUNT(ROW_ID) - COUNT(order_priority)	order_priority
FROM
	STUDENT.offuture_22:

		
-- [SQL09] CHECK FOR FORMAT CONSISTENCY IN ORDER_ID, CUSTOMER_ID, PRODUCT_ID
/*
--- (1) We noticed a pattern in the positions of the dashes '-' in each of the ID's and decided to check if it was consistent
--- (2) We also checked that the number of dashes '-' in the IDs are consistent in each coulumn.
		This is done using a CTE that counts the number of dashes in each 
		and then we use the DISTINCT() function to make sure theres only one type of format
*/

-- order_id
--- (1) checks how many entries have a - as the 3rd and 8th character in order_id
SELECT
	count(order_id)
FROM
	student.offuture_22
WHERE
	substring(order_id FROM 3 FOR 1) = '-' AND 
	substring(order_id FROM 8 FOR 1) = '-' ;

--- (2)
WITH number_dashes (n_d)   -- count of number of dashes in EACH order id
AS 
	(SELECT 
		length(order_id) - length(REPLACE(order_id,'-','')) 
	 FROM
		student.offuture_22 o ) 

SELECT 
	DISTINCT(n_d)          --shows all the DISTINCT number of dashes
FROM 
	number_dashes ;        ---This shows 2---> which means every id (in order_id) has only 2 dashes
	

-- product_id
--- (1) checks how many entries have a - as the 4th and as the 7th or 8th character in product_id
SELECT
	count(product_id)
FROM
	student.offuture_22
WHERE
	 substring(product_id FROM 4 FOR 1) = '-' AND 
	(substring(product_id FROM 7 FOR 1) = '-' OR 
	 substring(product_id FROM 8 FOR 1) = '-') ;

--- (2)
WITH number_dashes (n_d)    -- count of number of dashes in EACH product id
AS 
	(SELECT 
		length(product_id) - length(REPLACE(product_id, '-','')) 
	 FROM
		student.offuture_22 o ) 
		
SELECT 
	DISTINCT(n_d)            --shows all the DISTINCT number of dashes
FROM 
	number_dashes ;          --This shows 2---> which means every id (in product_id) has only 2 dashes

	
-- customer_id
--- (1) checks how many entries have a - as the 3rd character in order_id
SELECT
	count(customer_id)
FROM
	student.offuture_22
WHERE
	substring(customer_id FROM 3 FOR 1) = '-' ;

--- (2)
WITH number_dashes (n_d)     -- count of number of dashes in EACH order id
AS 
	(SELECT 
		length(customer_id) - length(REPLACE(customer_id,'-','')) 
	 FROM
		student.offuture_22 o ) 

SELECT 
	DISTINCT(n_d)            --shows all the DISTINCT number of dashes
FROM 
	number_dashes ;          --This shows 1---> which means every id (in customer_id) has only 1 dashes

	
-- [SQL10] EYEBALL CHECK --------------------------------------------------------------------------------
-- checking the imported data here matchs that in the given file

-- selects just row 23988
SELECT
	*
FROM
	student.offuture_22 o
WHERE
	row_id = 23988;

-- selects just row 11407
SELECT
	*
FROM
	student.offuture_22 o
WHERE
	row_id = 11407;

-- selects just row 4278
SELECT
	*
FROM
	student.offuture_22 o
WHERE
	row_id = 4278;

-- selects just row 15850
SELECT
	*
FROM
	student.offuture_22 o
WHERE
	row_id = 15850;

-- selects just row 46370
SELECT
	*
FROM
	student.offuture_22 o
WHERE
	row_id = 46370;



-- [SQL11] COUNT OF ROWS WHERE ORDER DATE IS BEFORE OR EQUAL TO SHIP DATE  --------------------------------
--checking that the dates are logical

/*Converts ship_date and order_date to date format. 
  Counts all rows where order_date is before or the same as ship_date */
SELECT
	count(row_id)
FROM
	student.offuture_22 o
WHERE
	(to_date(o.ship_date,'dd/mm/yyyy') - to_date(o.order_date,'dd/mm/yyyy')) >= 0;




--[SQL12] DECIMAL PRECISION CHECKS ---------------------------------------------------------------------------
----max number of digits after decimal point---
/*
 (1) CASTing column_name as varchars since thats the format required for the functions to work
 (2) Using the POSITION() function to find where the decimal is then adding 1 so that the SUBSTRING() function gives all the digits after the decimal
 (3) taking the LENGTH() of that substring
 (4) find the MAX() length of the substring to find the maximum postion
 (5)if the POSITION() function returns 0 then its an integer so don't include that  in the calculation
 */

--id
SELECT 
	max(length(substring(CAST(o.row_id AS varchar) FROM POSITION ('.' IN CAST(o.row_id AS varchar)) + 1)))  --- (1-4) OF COMMENTS above
FROM 
	student.offuture_22 o 
WHERE 
	POSITION ('.' IN CAST(o.row_id AS varchar)) != 0 ;  --- (5) OF COMMENTS above

--sales
SELECT 
	max(length(substring(CAST(o.sales AS varchar) FROM POSITION ('.' IN CAST(o.sales AS varchar)) + 1)))  --- (1-4) OF COMMENTS above
FROM 
	student.offuture_22 o 
WHERE 
	POSITION ('.' IN CAST(o.sales AS varchar)) != 0 ;  --- (5) OF COMMENTS above

	--quantity
SELECT 
	max(length(substring(CAST(o.quantity AS varchar) FROM POSITION ('.' IN CAST(o.quantity AS varchar)) + 1)))  --- (1-4) OF COMMENTS above
FROM 
	student.offuture_22 o 
WHERE 
	POSITION ('.' IN CAST(o.quantity AS varchar)) != 0 ;   --- (5) OF COMMENTS above

--discount
SELECT 
	max(length(substring(CAST(o.discount AS varchar) FROM POSITION ('.' IN CAST(o.discount AS varchar)) + 1)))  --- (1-4) OF COMMENTS above
FROM 
	student.offuture_22 o 
WHERE 
	POSITION ('.' IN CAST(o.discount AS varchar)) != 0 ;   --- (5) OF COMMENTS above

--profit
SELECT 
	max(length(substring(CAST(o.profit AS varchar) FROM POSITION ('.' IN CAST(o.profit AS varchar)) + 1)))  --- (1-4) OF COMMENTS above
FROM 
	student.offuture_22 o 
WHERE 
	POSITION ('.' IN CAST(o.profit AS varchar)) != 0 ;  --- (5) OF COMMENTS above

--shipping cost
 SELECT 
	max(length(substring(CAST(o.shipping_cost AS varchar) FROM POSITION ('.' IN CAST(o.shipping_cost AS varchar)) + 1)))  --- (1-4) OF COMMENTS above
FROM 
	student.offuture_22 o 
WHERE 
	POSITION ('.' IN CAST(o.shipping_cost AS varchar)) != 0 ;  --- (5) OF COMMENTS above

--[SQL13] PRODUCT NAME VS PRODUCT ID ------------------------------------------------------------------------
/*found a scenario where different product_names had the same product_id
 * checking to see if that was a unique case
 * The code below show the number of different product names with the same product_id
 */
SELECT 
	product_id ,
	count(DISTINCT (product_name)) number_of_names
FROM 
	student.offuture_22 o 
GROUP BY 
	product_id 
ORDER BY 
	number_of_names DESC ;  ---> was NOT a UNIQUE CASE!!
	
/*
 * This code below looks at all the products with more than one name at the same time
 * we looked at region because we thought the names may differ in different regions ---not the case
 */
SELECT 
    order_date ,
    product_id ,
    region ,
    count (DISTINCT(product_name)) number_of_names
FROM 
    student.offuture_22 o 
GROUP BY 
    order_date , 
    product_id ,
    region 
HAVING 
    count (DISTINCT (product_name)) != 1
ORDER BY 
    order_date desc,
    number_of_names DESC ;