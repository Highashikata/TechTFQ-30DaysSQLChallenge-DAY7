# TechTFQ-30DaysSQLChallenge-DAY7

Finding Relevant dates SQL challenge

going through the challenge of SQL interview questions featured in the TechTFQ channel



In this repository we will be going through the SQL interview questions featured in the following YouTube video [SQL Interview Questions](https://www.youtube.com/watch?v=0w5mx6lfx1Y&list=PLavw5C92dz9Hxz0YhttDniNgKejQlPoAn&index=7).

# **Day 7: The problem statement: Finding Relevant dates SQL**


PROBLEM STATEMENT:
In the given input table DAY_INDICATOR field indicates the day of the week with the first character being Monday, followed by Tuesday and so on.
Write a query to filter the dates column to showcase only those days where day_indicator character for that day of the week is 1.

![image](https://github.com/Highashikata/TechTFQ-30DaysSQLChallenge-DAY7/assets/96960411/00643dbd-f06e-428b-be70-dbf47e10cbbe)


**DDL & DML**
```
DROP TABLE IF EXISTS day_indicator;

CREATE TABLE day_indicator
  (
     product_id    VARCHAR(10),
     day_indicator VARCHAR(7),
     dates         DATE
  );

INSERT INTO day_indicator
VALUES      ('AP755',
             '1010101',
             To_date('04-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('AP755',
             '1010101',
             To_date('05-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('AP755',
             '1010101',
             To_date('06-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('AP755',
             '1010101',
             To_date('07-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('AP755',
             '1010101',
             To_date('08-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('AP755',
             '1010101',
             To_date('09-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('AP755',
             '1010101',
             To_date('10-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('XQ802',
             '1000110',
             To_date('04-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('XQ802',
             '1000110',
             To_date('05-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('XQ802',
             '1000110',
             To_date('06-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('XQ802',
             '1000110',
             To_date('07-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('XQ802',
             '1000110',
             To_date('08-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('XQ802',
             '1000110',
             To_date('09-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('XQ802',
             '1000110',
             To_date('10-Mar-2024', 'dd-mon-yyyy'));

SELECT *
FROM   day_indicator; 
```



**DQL**
```
-- Fecthing the data
SELECT *
FROM   day_indicator;


-- Solution

SELECT DISTINCT EXTRACT('isodow' FROM DATES) AS DOW
FROM DAY_INDICATOR
ORDER BY EXTRACT('isodow' FROM DATES);



SELECT *, EXTRACT('isodow' FROM DATES) AS DOW
FROM DAY_INDICATOR
WHERE product_id = 'AP755';


-- Using the substring to extract the wanted values from the day_indicator
/* In this uery below, the logic that it follows is that when we filter on the product_id = 'AP755'
, we obtain the DOW with all the number of days from 1 to 7. 
So, we've created a subquery that permets us to compare the extracted date with the number of days DOW generated 
using the filter. 
And with the substring function, SUBSTRING(day_indicator, *VARYING*, length = 1) */
SELECT 
	*, EXTRACT('isodow' FROM DATES) AS DOW, 
	CASE 
		WHEN substring(day_indicator, cast(EXTRACT('isodow' FROM DATES) as int),1) = '1' 
			then 'Include' 
		ELSE 'Exclude' 
	END as Flag
FROM 
	DAY_INDICATOR
WHERE 
	product_id = 'AP755';



/* Then we are going to fetch the wanted data rom the subquery */

SELECT product_id, day_indicator, dates
FROM (SELECT 
	*, EXTRACT('isodow' FROM DATES) AS DOW, 
	CASE 
		WHEN substring(day_indicator, cast(EXTRACT('isodow' FROM DATES) as int),1) = '1' 
			then 'Include' 
		ELSE 'Exclude' 
	END as Flag
FROM 
	DAY_INDICATOR) x
WHERE Flag = 'Include';


```
