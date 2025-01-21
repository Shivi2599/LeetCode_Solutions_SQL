# Write your MySQL query statement below

SELECT 
     sell_date, 
     COUNT(DISTINCT product) as num_sold,
     group_concat(DISTINCT product) as products
FROM 
     Activities
GROUP BY
     sell_date
ORDER BY 
     sell_date;
