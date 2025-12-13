-- QUE3
-- Create table
CREATE TABLE person (
    id INT PRIMARY KEY,
    email VARCHAR(100)
);

-- 23BCS80343 Tejinderpal Singh
-- 23BCS80343 Tejinderpal Singh
-- Insert data
INSERT INTO person (id, email) VALUES
(1, 'john@example.com'),
(2, 'bob@example.com'),
(3, 'john@example.com');

DELETE FROM Person
WHERE ID IN (
    SELECT * FROM (
        SELECT p1.ID
        FROM Person p1
        JOIN Person p2
            ON p1.email = p2.email
           AND p1.id > p2.id
    ) AS temp
);

select * from person;
-- 23BCS80343 Tejinderpal Singh
