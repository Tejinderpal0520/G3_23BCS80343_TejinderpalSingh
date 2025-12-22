
-- Que 2

CREATE TABLE customers (
    id INT PRIMARY KEY,
    email VARCHAR(100)
);

INSERT INTO customers (id, email) VALUES
(1, 'john@example.com'),
(2, 'bob@example.com'),
(3, 'john@example.com');

--23BCS80343 Tejinderpal Singh
with CTE1 as (
    Select row_number() over(partition by email order by id) as R, id, email
    from customers
)

select id, email from CTE1 where R <= 1 order by id

