CREATE TABLE sales_ytd (
    month_name VARCHAR(10),
    ytd_sales INT
);
INSERT INTO sales_ytd (month_name, ytd_sales) VALUES
('Jan', 15),
('Feb', 22),
('Mar', 35),
('Apr', 45),
('May', 60);

with cte3 as(
select *, ytd_sales-lag(ytd_sales,1,0) over (order by to_date(month_name, 'Mon')) 
as periodic_sales from sales_ytd
)
select * from cte3;

-- 23BCS80343 Tejinderpal Singh
SELECT month_name, ytd_sales,
    ytd_sales - LAG(ytd_sales, 1, 0) 
        OVER (ORDER BY 
              CASE month_name
                  WHEN 'Jan' THEN 1
                  WHEN 'Feb' THEN 2
                  WHEN 'Mar' THEN 3
                  WHEN 'Apr' THEN 4
                  WHEN 'May' THEN 5
              END) AS periodic_sales FROM sales_ytd;