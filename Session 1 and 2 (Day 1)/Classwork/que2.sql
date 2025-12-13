--QUE2

CREATE TABLE CUSTOMER(
CUST_ID INT  PRIMARY KEY,
NAME VARCHAR(20)
);
INSERT INTO CUSTOMER VALUES(101,'shalabh');

INSERT INTO CUSTOMER VALUES(102,'AJAY');

-- 23BCS80343 Tejinderpal Singh
CREATE TABLE ORDERS(
ORDER_ID INT,
CUST_ID INT  ,
-- 23BCS80343 Tejinderpal Singh
AMOUNT NUMERIC(10,2),
FOREIGN KEY (CUST_ID) REFERENCES CUSTOMER(CUST_ID) on update cascade on delete cascade
);

insert into ORDERS values (100, 101, 10000);
insert into ORDERS values (101, 102, 20000);

update CUSTOMER set CUST_ID =9
where cust_Id = 102;

select  * from ORDERS;

delete from CUSTOMER where CUST_ID = 9;
select  * from ORDERS;

