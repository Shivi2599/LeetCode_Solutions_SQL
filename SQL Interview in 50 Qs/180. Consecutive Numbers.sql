# Write your MySQL query statement below
  
SELECT DISTINCT num AS ConsecutiveNums
FROM 
(
SELECT 
num,
LAG(num) OVER (ORDER BY id) as previous_num,
LEAD(num) OVER (ORDER BY id) as next_num
FROM 
Logs
) consecutive_table
WHERE num = previous_num AND num =next_num
;
