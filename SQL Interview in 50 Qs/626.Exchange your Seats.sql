# Write your MySQL query statement below

 WITH CTE AS 
(
SELECT id, student,
    ROW_NUMBER() OVER(ORDER BY id ASC) as row_num
FROM Seat
)
SELECT id,
CASE 
     WHEN row_num %2=0 THEN LAG(student) OVER(ORDER BY row_num)
     ELSE LEAD(student,1,student) OVER(ORDER BY row_num)
END AS student
FROM CTE ;
