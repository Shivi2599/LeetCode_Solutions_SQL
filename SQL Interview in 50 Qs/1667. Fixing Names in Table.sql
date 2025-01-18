# Write your MySQL query statement below
  
SELECT 
u.user_id, 
CONCAT(UPPER(LEFT(u.name,1)),LOWER(SUBSTRING(u.name,2))) as name 
FROM 
Users as u
ORDER BY 
user_id;
