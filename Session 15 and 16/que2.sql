CREATE TABLE session_table (
    session_id INT PRIMARY KEY,
    duration INT
);


INSERT INTO session_table (session_id, duration) VALUES
(1, 30),
(2, 199),
(3, 299),
(4, 580),
(5, 1000);

with abc as(
select *,(case
    when (duration/60) between 0 and 5 then '[0-5>'
    when (duration/60) between 5 and 10 then '[5-10>'
    when (duration/60) between 10 and 15 then '[10-15>'
    when (duration/60) > 15 then '15 minutes or more' end
) as category
from session_table
)
-- 23BCS80343 Tejinderpal Singh
select category as bin, count(category) as total from abc group by category