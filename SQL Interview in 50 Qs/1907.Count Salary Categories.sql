# Write your MySQL query statement below

SELECT 'Low Salary' as category, SUM((income < 20000)) as accounts_count
FROM Accounts
UNION
SELECT 'Average Salary' as category, SUM((income >= 20000) & (income <=50000 )) as accounts_count
FROM Accounts
UNION
SELECT 'High Salary' as category, SUM((income > 50000)) as accounts_count
FROM Accounts
;
