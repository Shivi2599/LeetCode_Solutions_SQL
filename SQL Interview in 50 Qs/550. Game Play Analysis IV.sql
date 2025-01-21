# Write your MySQL query statement below

WITH first_login as
(
    SELECT player_id,MIN(event_date) as first_login_date
    FROM Activity
    GROUP BY player_id
),
NextDayLogin as
(
    SELECT a.player_id
    FROM Activity a
    JOIN first_login as fl
    ON fl.player_id = a.player_id AND a.event_date = DATE_ADD(fl.first_login_date, INTERVAL 1 DAY)
),
count_of_players as
(
SELECT
    (SELECT COUNT(DISTINCT player_id)
    FROM NextDayLogin
    ) as players_logged,
    (
    SELECT COUNT(DISTINCT player_id)
    FROM Activity
    ) as total_players
)
SELECT
    ROUND(players_logged/total_players,2) as fraction
FROM
     count_of_players
;
