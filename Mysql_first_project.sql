use sales_project;
-------------- when you want update any infomation in table you can use update command -------------------------
update retail_sales
set sale_date = str_to_date(sale_date,'%d-%m-%Y');

-- ------------- if you want change the date and time valuse menas there positions  -----------------------
select 
   str_to_date(sale_date, '%Y-%m-%d') as sales_date
  
   from retail_sales;
   select 
   str_to_date(sale_time, '%H:%i:%s') as sales_date
  
   from retail_sales;
 
 
 -- ------------- if you want change the type of your data type -----------------------
alter table retail_sales
modify sale_date date;
alter table retail_sales
modify sale_time time;



 --  ---------------------------------  DATA CLEANING ------------------------------

-- ---------- find any null values in your DB --------------------
select * from retail_sales
where transactions_id is null or
      sale_date is null or
      sale_time is null  or
	customer_id is null or
    gender is null or
    age is null or
    category is null or
    quantity is null or
    price_per_unit is null or
    cogs is null or
    total_sale is null
;
------------- To Delete Null valuse in your table -----------------
delete from retail_sales
where transactions_id is null or
      sale_date is null or
      sale_time is null  or
	customer_id is null or
    gender is null or
    age is null or
    category is null or
    quantity is null or
    price_per_unit is null or
    cogs is null or
    total_sale is null
;
select * from retail_sales;


-- ------------------------ DATA EXPLORATION ----------------------------------------------------------------------------------------------------

-- ------ 1) How Many sales we have ?
select count(*) from retail_sales; --  (1987 total sales we have )
-- -------2) How many unique customers we have ------------------------------------
select count(distinct customer_id) from retail_sales; -- (155 unique customers we have )
-- -------3)  how many categorys we have ------------------------------------------
select count(distinct category) from retail_sales; --  (we have three categorys)


-- --------------------------- Business Key Problems And Answers --------------------------------------------------------------------------------------
-- 1) write a SQL query to retrieve all columns for sales made on " 2022-11-05" ?

select sale_date from retail_sales
where sale_date >=  05-05-2022 ;

-- 2) write a SQL query to retrieve all transactions where the category is clothing and the quantity sold is more than 4 in the month of Nov-2022 ?

SELECT category  FROM retail_sales
WHERE category = 'Clothing' 
AND 
DATE_FORMAT(sale_date, '%m-%Y') = '11-2022'
AND
quantity >= 4;

-- --3) write a SQL query to calculate the total sales for each category ?

SELECT 
    category, SUM(total_sale) AS net_sales,
    count(*) as total_orders
FROM
    retail_sales
GROUP BY category;


-- ---4) write a sql  query to find the average age of customers who purchase items from the Beauty category ?

select avg(age)
 from retail_sales
 where category = 'Beauty';
