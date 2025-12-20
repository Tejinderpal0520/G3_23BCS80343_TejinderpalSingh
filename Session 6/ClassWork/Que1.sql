
-- que 1
-- Ques1:

drop table Employees
drop table Departments

CREATE TABLE Employees (
    emp_id     INT PRIMARY KEY,
    name       VARCHAR(50),
    dept_id    INT,
    salary     INT
);


CREATE TABLE Departments (
    dept_id     INT PRIMARY KEY,
    dept_name   VARCHAR(50)
);

INSERT INTO Employees (emp_id, name, dept_id, salary) VALUES
(1, 'Asha', 10, 50000),
(2, 'Rohan', 10, 70000),
(3, 'Meera', 20, 40000),
(4, 'Kabir', 20, 55000),
(5, 'Isha', 30, 90000);

INSERT INTO Departments (dept_id, dept_name) VALUES
(10, 'HR'),
(20, 'Finance'),
(30, 'IT');

--23BCS80343 Tejinderpal Singh
select d.dept_name, e.name, e.salary, (select avg(salary)::numeric(10,2) from Employees where dept_id = e.dept_id) as dept_avg
from Employees as e 
join departments d on e.dept_id = d.dept_id
where e.emp_id = (
select emp_id from Employees where dept_id = e.dept_id
order by abs(salary - (select avg(salary) from Employees where dept_id = e.dept_id)), salary desc limit 1
)