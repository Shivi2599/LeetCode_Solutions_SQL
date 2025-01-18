# Write your MySQL query statement below
SELECT
COALESCE( 
(SELECT DISTINCT num as num
FROM MyNumbers
GROUP BY num 
HAVING COUNT(num) = 1
ORDER BY num DESC
LIMIT 1),
NULL) as num;
