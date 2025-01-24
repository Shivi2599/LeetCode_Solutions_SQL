# Write your MySQL query statement below
WITH DailyAmount as
(
    SELECT visited_on,
    SUM(amount) as daily_amount
    FROM Customer
    GROUP BY visited_on
),
MovingAverage AS (
    SELECT 
        visited_on,
        SUM(daily_amount) OVER (
            ORDER BY visited_on ASC 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS total_amount,
        COUNT(daily_amount) OVER (
            ORDER BY visited_on ASC 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS total_days
    FROM DailyAmount
)
SELECT 
    visited_on,
    total_amount AS amount,
    ROUND(total_amount / total_days, 2) AS average_amount
FROM MovingAverage
WHERE total_days = 7
ORDER BY visited_on ASC;
