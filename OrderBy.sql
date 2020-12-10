--ORDER BY Clause
SELECT * FROM workers 
ORDER BY name DESC; 
--Select records of the workers whose salary is less than the average salary and put them in descending order
SELECT * 
FROM workers 
WHERE salary<(SELECT AVG(salary) FROM Workers)
ORDER BY salary DESC; 
--Select records of the workers put them in descending order by using salary and put them in ascending order by using names.
SELECT * FROM workers 
ORDER BY salary DESC, name ASC;
CREATE TABLE employees1
(
  employee_id number(9),
  employee_first_name varchar2(20),
  employee_last_name varchar2(20)
);
INSERT INTO employees1 VALUES(14, 'Chris', 'Tae');
INSERT INTO employees1 VALUES(11, 'John', 'Walker');
INSERT INTO employees1 VALUES(12, 'Amy', 'Star');
INSERT INTO employees1 VALUES(13, 'Brad', 'Pitt');
INSERT INTO employees1 VALUES(15, 'Chris', 'Way');
CREATE TABLE addresses1
(
  employee_id number(9),
  street varchar2(20),
  city varchar2(20),
  state char(2),
  zipcode char(5)
);
INSERT INTO addresses1 VALUES(11, '32nd Star 1234', 'Miami', 'FL', '33018');
INSERT INTO addresses1 VALUES(12, '23rd Rain 567', 'Jacksonville', 'FL', '32256');
INSERT INTO addresses1 VALUES(13, '5th Snow 765', 'Hialeah', 'VA', '20121');
INSERT INTO addresses1 VALUES(14, '3rd Man 12', 'Weston', 'MI', '12345');
INSERT INTO addresses1 VALUES(15, '11th Chris 12', 'St. Johns', 'FL', '32259');
--Sometimes instead of using table names we use nick names(Aliases) for the tables tom make the code shorter
SELECT e.employee_first_name, e.employee_last_name, a.city
FROM employees1 e, addresses1 a
WHERE e.employee_id = a.employee_id;


CREATE TABLE employees2 
(  
  id number(9), 
  name varchar2(50), 
  state varchar2(50), 
  salary number(20),
  company varchar2(20)
);

INSERT INTO employees2 VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO employees2 VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO employees2 VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO employees2 VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO employees2 VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO employees2 VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO employees2 VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

--Create a report of total employees from each state

select state , COUNT(name)
from employees2
Group by state;

SELECT state, count(name)total_number
FROM employees2
GROUP BY state;

--Create a repor to display num of employeese whose salary is greate than 2000

select company , COUNT(name) AS NUM
from employees2
where salary >2000
Group by company;

Select * from employees2;

--Create a repor to display max and min salary in companies

select company , MAX(salary) as MaxS, MIN(salary) as MinS
from employees2
Group by company;

--1   LIKE Condition 
--     a) Wild Cards
--     b) Regexp
--2   NOT LIKE Condiiton
--     a) Wild Cards
--     b) Regexp
--3   ALiase for table names 

--4   ORDER BY
--     a) DESC
--     b) ASC
--     a) by column bame and column number

--5    GROUP BY

---ORDER BY and GROUP by is the last thing

---  sub query after select before FROM

