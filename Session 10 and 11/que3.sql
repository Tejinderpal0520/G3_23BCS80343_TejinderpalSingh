
-- que 3
CREATE TABLE table_a (
    empid INT,
    ename VARCHAR(50),
    salary INT
);

CREATE TABLE table_b (
    empid INT,
    ename VARCHAR(50),
    salary INT
);

INSERT INTO table_a (empid, ename, salary) VALUES
(1, 'AA', 1000),
(2, 'BB', 300);

INSERT INTO table_b (empid, ename, salary) VALUES
(2, 'BB', 400),
(3, 'CC', 100);


with tbl as (
    Select * from table_a
    Union all
    Select * from table_b
), cte3 as (
select row_number() over(partition by empid order by salary) as R, empid, ename, salary from tbl
)
-- 23BCS80343 Tejinderpal Singh
select empid, ename, salary from cte3 where R <= 1