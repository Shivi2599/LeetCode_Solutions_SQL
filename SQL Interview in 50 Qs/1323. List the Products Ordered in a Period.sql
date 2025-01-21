# Write your MySQL query statement below

SELECT 
     p.product_name,
     SUM(o.unit) as unit
FROM 
     Products p 
LEFT JOIN  
     Orders o
ON
    p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY 
     product_name
HAVING 
     unit >=100
ORDER BY
     p.product_name;
