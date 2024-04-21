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

