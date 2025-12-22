
DROP TABLE PRODUCTS
DROP TABLE orders

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product VARCHAR(50),
    category VARCHAR(50)
);

INSERT INTO products (product_id, product, category) VALUES
(1, 'LAPTOP', 'ELECTRONICS'),
(2, 'SMARTPHONE', 'ELECTRONICS'),
(3, 'TABLETS', 'ELECTRONICS'),
(9, 'PRINTER', 'ELECTRONICS'),
(4, 'HEADPHONES', 'ACCESSORIES'),
(5, 'SMARTWATCH', 'ACCESSORIES'),
(6, 'KEYBOARD', 'ACCESSORIES'),
(7, 'MOUSE', 'ACCESSORIES'),
(8, 'MONITOR', 'ACCESSORIES');

-- 23BCS80343 Tejinderpal Singh
SELECT ROW_NUMBER() OVER(partition by category order by product_id desc) as new_product_id,
product,
category
from products order by  category desc;

with CTE1 as (
select 
row_number() over(partition by category order by product_id) as R,
count(*) over(partition by category) as CNT,
product, category
)

select CNT-R-1 as produc_id, product, category
from CTE1
order by category desc, product_id

