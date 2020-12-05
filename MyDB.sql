CREATE TABLE workers 
(
    id CHAR(5),
    name VARCHAR2(50),
    salary NUMBER(5),
    CONSTRAINT id2_pk PRIMARY KEY(id)
);


select * from workers;

CREATE TABLE addresses 
(
    id CHAR(5),
    street VARCHAR2(30),
    city VARCHAR2(15),
    state CHAR(2),
    CONSTRAINT id2_fk FOREIGN KEY(id) REFERENCES workers(id) 
);
INSERT INTO addresses VALUES(null,'Cherry','St. Lucie','FL');

UPDATE workers
SET name ='Angie Oceans'
WHERE id=10004;

select * from workers;

UPDATE workers
SET salary = 11000
WHERE id = (SELECT id
            FROM addresses
            WHERE street = 'Flower'
            );
UPDATE addressess
SET city =‘Tallahasee’
where id = (SELECT id
           from workers
           where name=‘Ali Can’
);

CREATE TABLE suppliers
(
    supplier_id NUMBER(10),
    supplier_name VARCHAR2(50),
    contact_name VARCHAR2(50),
    CONSTRAINT supplier_id_pk PRIMARY KEY(supplier_id) 
);

INSERT INTO suppliers VALUES(1, 'IBM', 'John Walker');
INSERT INTO suppliers VALUES(2, 'APPLE', 'Steve Max');
INSERT INTO suppliers VALUES(3, 'SAMSUNG', 'Tae Shaun');

CREATE TABLE products2
(
    supplier_id NUMBER(10),
    product_id NUMBER(10),
    product_name VARCHAR2(30),
    customer_name VARCHAR2(50),
    CONSTRAINT supplier_id_fk FOREIGN KEY(supplier_id) REFERENCES suppliers(supplier_id)
);

INSERT INTO products2 VALUES(1, 11, 'Laptop', 'Ali Can');
INSERT INTO products2 VALUES(2, 22, 'Ipad', 'Eddie Murphy');
INSERT INTO products2 VALUES(3, 33, 'Galaxy 12', 'Mary Star');


UPDATE products2
SET product_name ='Radio'
where supplier_id = (SELECT supplier_id
                    from suppliers
                    where contact_name='John Walker')
                    
select * from products2;


Update the contact name to 'Ali Can' if the product name is Ipad

UPDATE products2
SET customer_name ='Ayse Han', product_name='TV'
where supplier_id = (SELECT supplier_id
                    from suppliers
                    where  supplier_name='SAMSUNG');
                    
                    select * from products2;

UPDATE products2
set product_name=(SELECT supplier_name from suppliers
where suppliers.supplier_name=products2.customer_name);

select * from products2;


CREATE TABLE people
(
 ssn char(9),
 name varchar2(50),
 address varchar2(50)
);

INSERT INTO people VALUES(34578901, null, 'New Jersey');
INSERT INTO people VALUES(34567890, null, null);
INSERT INTO people VALUES(45678901, 'Maryy Tien', null);

//write comments

INSERT INTO people VALUES(123456789, 'Mark Star', 'Florida');
INSERT INTO people VALUES(234567890, 'Angie Way', 'Virginia');
INSERT INTO people VALUES(345678901, 'Maryy Tien', 'New Jersey');
INSERT INTO people(ssn, address) VALUES(456789012, 'Michigan');
INSERT INTO people(ssn, address) VALUES(567890123, 'California');



CREATE TABLE parents
(
    id char(5),
    num_of_kids number(2),
    total_income number(5),
    CONSTRAINT id4_fk FOREIGN KEY(id) REFERENCES workers(id),
    CONSTRAINT check_num_of_kids CHECK(num_of_kids>=0)
);
?
INSERT INTO parents VALUES(10001, 4, 17000);
INSERT INTO parents VALUES(10002, 2, 11000);
INSERT INTO parents VALUES(10003, 1, 9100);
INSERT INTO parents VALUES(10004, 0, 10000);

DELETE FROM parents
where num_of_kids<2 or total_income<12000;


SELECT *
FROM workers
WHERE length(name)>8

SELECT *
FROM workers
WHERE salary = (SELECT MAX(salary) FROM workers);

SELECT name, salary
FROM workers
WHERE salary = (SELECT MIN(salary)
                FROM workers
                );
                
                
select name,salary from workers
where salary = (SELECT min(salary) from workers) OR salary= (SELECT max(salary) from workers);

select max(salary)
from workers
where salary <(Select max(salary) from workers);

SELECT MAX(salary) as second_high_salary
FROM workers
WHERE salary <(SELECT MAX(salary)
               FROM workers);
               
SELECT MIN(salary) AS second_minimum_Salary
FROM workers
WHERE salary > (SELECT MIN(salary) FROM workers);

select * from workers
where salary =( select max(salary)
from workers
where salary <(Select max(salary) from workers));

SELECT MAX(salary)
FROM workers
WHERE salary<(SELECT salary
FROM workers
WHERE salary=(select MAX(salary) from workers
WHERE salary<(SELECT MAX(salary) from workers)));

select * from workers; 

//subqueries
--select * from workers
--where salary  IN ( select salary < max(salary)
--                       from workers  );
                                                    
                                                    
CREATE TABLE customers_products
( 
  product_id number(10),
  customer_name varchar2(50),
  product_name varchar2(50)
);

INSERT INTO customers_products VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_products VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_products VALUES (20, 'John', 'Apple');
INSERT INTO customers_products VALUES (30, 'Amy', 'Palm');
INSERT INTO customers_products VALUES (20, 'Mark', 'Apple');
INSERT INTO customers_products VALUES (10, 'Adem', 'Orange');
INSERT INTO customers_products VALUES (40, 'John', 'Apricot');
INSERT INTO customers_products VALUES (20, 'Eddie', 'Apple');
                                                    
                                                    
 Select * from customers_products
 Where product_name in ('Orange', 'Apple', 'Apricot');


//third highest salary
SELECT Max(salary) 
FROM   workers 
WHERE  salary < (SELECT Max(salary) 
                 FROM   workers
                 WHERE  salary NOT IN(SELECT Max(salary) 
                                      FROM   workers)) ;

//Check the product id is less than 15 or 30

select * from customers_products
where product_id<15 OR product_id>30; 


CREATE TABLE customers_likes
( 
  product_id number(10),
  customer_name varchar2(50),
  liked_product varchar2(50)
);



INSERT INTO customers_likes VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_likes VALUES (50, 'Mark', 'Pineapple');
INSERT INTO customers_likes VALUES (60, 'John', 'Avocado');
INSERT INTO customers_likes VALUES (30, 'Lary', 'Cherries');
INSERT INTO customers_likes VALUES (20, 'Mark', 'Apple');
INSERT INTO customers_likes VALUES (10, 'Adem', 'Orange');
INSERT INTO customers_likes VALUES (40, 'John', 'Apricot');
INSERT INTO customers_likes VALUES (20, 'Eddie', 'Apple');      

Select customer_name
from customers_likes
where exists(  select product_id
               from customers_likes 
               where customers_products.product_id=ustomers_likes product_id );