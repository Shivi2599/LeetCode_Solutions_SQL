# Write your MySQL query statement below
SELECT a.employee_id,
a.name,
COUNT(b.reports_to) as reports_count,
ROUND(AVG(b.age)) as average_age
FROM Employees as a
INNER JOIN Employees as b
ON a.employee_id = b.reports_to
GROUP BY a.employee_id
ORDER BY a.employee_id;
