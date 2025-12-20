-- Que 1:

drop table Departments;
drop table Employees;

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DeptID INT,
    Salary INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);


INSERT INTO Departments (DeptID, DeptName, Location) VALUES
(10, 'HR', 'Delhi'),
(20, 'IT', 'Mumbai'),
(30, 'Finance', 'Pune'),
(50, 'Marketing', 'Chennai');

INSERT INTO Employees (EmpID, EmpName, DeptID, Salary) VALUES
(1, 'Akash', 10, 50000),
(2, 'Nisha', 20, 60000),
(4, 'Simran', 30, 70000),
(5, 'Meena', 30, 55000);

-- 23BCS80343 Tejinderpal Singh
select d.deptName, count(e.empID) as Employee_count, avg(e.Salary)::numeric(10,0) as Dept_Avg,
case when avg(e.Salary) is null Then 'No Employees'
when Avg(e.Salary) >= 60000 Then 'High Average' 
when avg(e.Salary) Between 50000 and 59999 then 'Medium'
else 'Low Average' end as Salary_Category
from Departments as d 
left join 
Employees as e 
on
d.DeptID = e.DeptID 
group by d.DeptName

