# Write your MySQL query statement below
  
WITH friendsCount as
(
    SELECT requester_id as id, COUNT(DISTINCT accepter_id) as num
    FROM RequestAccepted
    GROUP BY requester_id
    UNION ALL
    SELECT accepter_id as id, COUNT(DISTINCT requester_id) as num
    FROM RequestAccepted
    GROUP BY accepter_id
),
TotalFriends as
(
    SELECT id, SUM(num) as total_friends
    FROM friendsCount
    GROUP BY id
)
SELECT id, total_friends as num
FROM TotalFriends
WHERE total_friends = (
    SELECT MAX(total_friends) 
    FROM TotalFriends
    )
;
