# Write your MySQL query statement below
  
With CTE as
(
SELECT id,
ROW_NUMBER() OVER(PARTITION BY email ORDER BY id) as row_num
FROM Person
)
DELETE FROM Person
WHERE id IN
(
    SELECT id
    FROM CTE
    WHERE row_num > 1
)
;
