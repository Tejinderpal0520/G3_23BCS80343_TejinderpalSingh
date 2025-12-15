-- Write your PostgreSQL query statement below
WITH most_rated_by_user AS (
    SELECT u.name AS user_name, COUNT(*) AS nums_rating
    FROM MovieRating m
    INNER JOIN users u
    ON u.user_id = m.user_id
    GROUP BY u.user_id, u.name
    ORDER BY nums_rating DESC, u.name ASC
    LIMIT 1
),
most_rated_movie AS (
    SELECT m.title AS movie_name, AVG(mr.rating) AS nums_rating
    FROM MovieRating mr
    INNER JOIN movies m
    ON mr.movie_id = m.movie_id
    WHERE EXTRACT(YEAR FROM created_at) = 2020
      AND EXTRACT(MONTH FROM created_at) = 2
    GROUP BY mr.movie_id, m.title
    ORDER BY nums_rating DESC, m.title ASC
    LIMIT 1
) 
SELECT user_name AS results
FROM most_rated_by_user
UNION ALL
SELECT movie_name AS results
FROM most_rated_movie;