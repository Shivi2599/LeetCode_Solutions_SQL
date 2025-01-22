# Write your MySQL query statement below

SELECT s.product_id, s.year as first_year, s.quantity, s.price
FROM Sales as s
INNER JOIN (
    SELECT product_id, MIN(year) as first_year
    FROM Sales
    GROUP BY product_id
) as fy
ON s.product_id = fy.product_id AND fy.first_year = s.year 
;
