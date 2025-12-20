
-- que 2
-- Create Triangle table
CREATE TABLE Triangle (
	x INT,
	y INT,
	z INT,
	PRIMARY KEY (x, y, z)
);
 
-- Insert sample data
INSERT INTO Triangle (x, y, z) VALUES
(13, 15, 30),
(10, 20, 15);
--23BCS80343 Tejinderpal Singh
select *,
case when (x + y > z and x + z > y and z + y > x) then 'Yes' else 'No' End as Triangle_Fromed
from Triangle

