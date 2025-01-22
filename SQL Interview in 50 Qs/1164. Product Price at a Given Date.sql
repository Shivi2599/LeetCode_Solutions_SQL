# Write your MySQL query statement below

WITH CTE as
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS rn
FROM Products
WHERE change_date <= '2019-08-16'
)
SELECT product_id,new_price AS price
FROM CTE
WHERE rn =1
UNION 
SELECT product_id, 10 as price
FROM Products
WHERE product_id NOT IN (
    SELECT product_id
    FROM CTE)
;

