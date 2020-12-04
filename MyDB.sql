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