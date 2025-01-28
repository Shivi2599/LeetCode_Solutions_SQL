# Write your MySQL query statement below
  
WITH etable as
(
    SELECT e.id, e.name as employee_name, e.salary , e.departmentId, d.name as department_name,
    DENSE_RANK() OVER(PARTITION BY e.departmentId ORDER BY e.salary DESC) as DenseRank
    FROM Employee e
    LEFT JOIN Department d
    ON d.id = e.departmentId
    )
SELECT department_name as Department, employee_name as Employee, salary as Salary
FROM etable
WHERE DenseRank <=3
;
