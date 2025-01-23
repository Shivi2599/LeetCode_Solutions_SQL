# Write your MySQL query statement below
WITH username as
(
    SELECT u.user_id, u.name, COUNT(mr.user_id) as cnt_of_rating_of_movies
    FROM Users as u
    LEFT JOIN Movierating as mr
    ON u.user_id = mr.user_id
    GROUP BY u.user_id, u.name
    ORDER BY cnt_of_rating_of_movies DESC, u.name ASC
),
MovieAvgRating as
(
    SELECT m.movie_id,m.title,AVG(mr.rating) as avg_rating
    FROM Movies as m
    LEFT JOIN MovieRating as mr
    ON mr.movie_id = m.movie_id
    WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.movie_id
)
SELECT (
    SELECT name FROM username ORDER BY cnt_of_rating_of_movies DESC, name ASC LIMIT 1) as results
UNION ALL
SELECT (
    SELECT title FROM MovieAvgRating ORDER BY avg_rating DESC, title ASC LIMIT 1) as results;
