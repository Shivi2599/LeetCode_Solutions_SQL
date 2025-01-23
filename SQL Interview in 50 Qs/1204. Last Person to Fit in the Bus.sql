# Write your MySQL query statement below

WITH CTE as
(
    SELECT *,SUM(weight) OVER(ORDER BY turn ASC) as total_weight
    FROM Queue
    GROUP BY turn, person_id,person_name
),
lastvalue as
(
SELECT person_name,total_weight
FROM CTE
WHERE total_weight <=1000
ORDER BY total_weight DESC
)
SELECT person_name
FROM lastvalue
LIMIT 1;

