# Write your MySQL query statement below

SELECT r.contest_id, 
ROUND(COUNT(DISTINCT r.user_id)*100/
    (
  SELECT COUNT(*)
  FROM Users
  ),2) as percentage
FROM Register r
JOIN Users u
ON u.user_id = r.user_id
GROUP BY r.contest_id
ORDER BY percentage DESC,
r.contest_id ASC;
