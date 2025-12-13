-- 23BCS80343 Tejinderpal Singh
CREATE OR REPLACE FUNCTION NthHighestSalary(N INT)
RETURNS TABLE (Salary INT)
LANGUAGE plpgsql
AS $$
BEGIN
    IF N <= 0 THEN
        RETURN QUERY
        SELECT NULL::INT AS Salary;  
    ELSE
        RETURN QUERY
        SELECT DISTINCT e.salary
        FROM employee e
        ORDER BY e.salary DESC
        OFFSET N - 1
        LIMIT 1;
    END IF;
END;
$$;
