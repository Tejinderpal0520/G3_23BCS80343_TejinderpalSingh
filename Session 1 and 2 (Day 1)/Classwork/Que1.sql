-- QUES 1:
-- 23BCS80343 Tejinderpal Singh
-- CLIENT TABLE
CREATE TABLE client_master (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(100),
    email VARCHAR(100)
);

-- SERVICE TABLE
CREATE TABLE service_catalog (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(100),
    hourly_rate NUMERIC(10,2)
);

-- INVOICE TABLE
CREATE TABLE invoice_details (
    invoice_id INT PRIMARY KEY,
    client_id INT REFERENCES client_master(client_id),
    service_id INT REFERENCES service_catalog(service_id),
    hours_worked INT,
    discount_percent INT,
    invoice_date DATE
);

-- 23BCS80343 Tejinderpal Singh
-- INSERT INTO client_master
INSERT INTO client_master (client_id, client_name, email) VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com'),
(2, 'Anita Verma', 'anita@gmail.com'),
(3, 'Karan Singh', 'karan@gmail.com');

-- INSERT INTO service_catalog
INSERT INTO service_catalog (service_id, service_name, hourly_rate) VALUES
(101, 'Web Development', 1200.00),
(102, 'Data Analysis', 1500.00),
(103, 'SEO Optimization', 800.00);

-- INSERT INTO invoice_details
INSERT INTO invoice_details (invoice_id, client_id, service_id, hours_worked, discount_percent, invoice_date) VALUES
(1001, 1, 101, 10, 10, '2025-01-05'),
(1002, 2, 102, 8,  5,  '2025-01-07'),
(1003, 3, 103, 12, 0,  '2025-01-10');

CREATE VIEW vw_invoice_summary AS 
SELECT i.invoice_id, i.invoice_date, c.client_name, s.service_name,
((((s.hourly_rate * i.hours_worked) * (100 -i.discount_percent)) / 100)::NUMERIC(10, 2)) as final_Amount
from invoice_details as i join client_master as c
on i.client_id = c.client_id
join 
service_catalog as s 
on i.service_id = s.service_id;
-- 23BCS80343 Tejinderpal Singh

select current_user;

create role inder
with login password 'Khushman';
-- 23BCS80343 Tejinderpal Singh

Grant select on vw_invoice_summary to inder
