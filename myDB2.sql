CREATE TABLE customers_products
( 
  product_id number(10),
  customer_name varchar2(50),
  product_name varchar2(50)
);
?
INSERT INTO customers_products VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_products VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_products VALUES (20, 'John', 'Apple');
INSERT INTO customers_products VALUES (30, 'Amy', 'Palm');
INSERT INTO customers_products VALUES (20, 'Mark', 'Apple');
INSERT INTO customers_products VALUES (10, 'Adem', 'Orange');
INSERT INTO customers_products VALUES (40, 'John', 'Apricot');
INSERT INTO customers_products VALUES (20, 'Eddie', 'Apple'); 


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


--EXISTS Condition is used before subquery and after WHERE Clause.
--If the subquery returns any data Exists Condition triggers the query.
SELECT product_id, customer_name
FROM customers_products
WHERE EXISTS (SELECT product_id
              FROM customers_likes
              WHERE customers_products.product_id = customers_likes.product_id);
              
--How to use Subquery after SELECT before FROM
?
CREATE TABLE workers
(
    id CHAR(5),
    name VARCHAR2(50),
    salary NUMBER(5),
    CONSTRAINT id4_pk PRIMARY KEY(id)
);
?
INSERT INTO workers VALUES(10001, 'Ali Can', 12000);
INSERT INTO workers VALUES(10002, 'Veli Han', 2000);
INSERT INTO workers VALUES(10003, 'Mary Star', 7000);
INSERT INTO workers VALUES(10004, 'Angie Ocean', 8500);
INSERT INTO workers VALUES(10005, 'Tam Hanks', 17000);
INSERT INTO workers VALUES(10006, 'Eddie Murphy', 9200);
INSERT INTO workers VALUES(10007, 'Mark J', 5000);
INSERT INTO workers VALUES(10008, 'Walker Tom', 7200);
?
--Create a report to display worker name, worker salary, and average for every record.
?
?
SELECT * FROM workers
WHERE name LIKE('%A');

select * FROM workers
Where name LIKE '%n';



--Select records whose names 2nd character is 'a', 4th character is 'y'


SELECT * FROM workers
WHERE name LIKE('A_____%n');

--Select records whose names 3rd character is 'r' and have 6 characters in total
?
SELECT * FROM workers
WHERE name LIKE('__r___%');


CREATE TABLE words
(
    word_id CHAR(3),
    word VARCHAR2(15),
    word_length NUMBER(2)
);
?
INSERT INTO words VALUES('101', 'hat', 3);
INSERT INTO words VALUES('102', 'hot', 3);
INSERT INTO words VALUES('103', 'hit', 3);
INSERT INTO words VALUES('104', 'hut', 3);
INSERT INTO words VALUES('104', 'selena', 6);
INSERT INTO words VALUES('104', 'yusuf', 5);
INSERT INTO words VALUES('104', 'adem', 4);
INSERT INTO words VALUES('104', 'hct', 3);


--Select the words starting with 'h', ending with 't' and 2nd character is from a to i in alphabet
SELECT *
FROM words
WHERE REGEXP_LIKE(word, 'h[a-i]t');


SELECT *
FROM words
WHERE REGEXP_LIKE(word, '[ae]');


--select starts  with s y a and all
SELECT *
FROM words
WHERE REGEXP_LIKE(word, '^[sya](*)');
--select ends with afm  and all
SELECT *
FROM words
WHERE REGEXP_LIKE(word, '[afm]$(*)');