-- que 1

CREATE TABLE seats (
    seat_id INT PRIMARY KEY,
    free_slot INT
);
INSERT INTO seats (seat_id, free_slot) VALUES
(1, 1),
(2, 0),
(3, 1),
(4, 0),
(5, 1),
(6, 1),
(7, 1),
(8, 0),
(9, 1),
(10, 1);

--23BCS80343 Tejinderpal Singh
with new_tbl as(
Select *,
    (
    free_slot = 1 and (
    free_slot = lag(free_slot, 1, 0) over()
    or 
    free_slot = lead(free_slot, 1, 0) over())
    )as mask
from seats)

select seat_id from new_tbl where mask = true
