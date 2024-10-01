USE interviewsql;

-- now to craete and insert the table

CREATE TABLE computer(
  compid INT PRIMARY KEY,
  brand VARCHAR(50),
  compmodel VARCHAR (50),
  manufacturedate DATE
 ); 

CREATE TABLE employee(
 empid INT PRIMARY KEY,
 firstname VARCHAR(50),
 lastname VARCHAR(50),
 salary INT,
 email VARCHAR(20),
 managerid INT,
 dateofjoining DATE,
 dept VARCHAR(10),
 compid int,
 CONSTRAINT FOREIGN KEY(compid) REFERENCES computer(compid)
);

DROP TABLE computer;
DROP TABLE employee;

INSERT INTO COMPUTER VALUES (1001,'Lenovo','T480','12-06-19');
INSERT INTO COMPUTER VALUES (1002,'Lenovo','T490','24-08-20');
INSERT INTO COMPUTER VALUES (1003,'SONY','SQ112','01-12-19');
INSERT INTO COMPUTER VALUES (1004,'SONY','SX1001','21-12-20');

SELECT * FROM computer;

INSERT INTO employee VALUES(1, 'NANDA', 'KUMAR', 50000, 'NANDA@GMAIL.COM', NULL, '2015-06-12', 'IT', 1001);
INSERT INTO employee VALUES (2, 'BIPLAB', 'PARIDA', 30000, 'BPARIDA@YAHOO.COM', 1, '2015-12-21', 'IT', 1001);
INSERT INTO employee VALUES (3, 'DISHA', 'PATEL', 50000, 'DISHAP@GMAIL.COM', NULL, '2013-08-21', 'HR', NULL);
INSERT INTO employee VALUES (4, 'SIBA', 'PRASAD', 90000, 'SIBA@GMAIL.COM', 3, '2020-06-01', 'HR', 1002);
INSERT INTO employee VALUES (5, 'ANUSHKA', 'SHARMA', 20000, 'SHARMAA@GMAIL.COM', 1, '2021-03-01', 'IT', NULL);
INSERT INTO employee VALUES (6, 'SOMNATH', 'MAHARANA', 65000, 'SMAHA@GMAIL.COM', 3, '2019-05-07', 'IT', 1003);

SELECT * FROM employee;

-- CREATE TABLE DUPLICATE (
-- empid INT PRIMARY KEY,
-- firstname VARCHAR (50),
-- lastname VARCHAR (50),
-- salary INT,
-- emailid VARCHAR (50),
-- managerid INT,
-- dateofjoining DATE
--  );



-- INSERT INTO DUPLICATE VALUES (1,'NANDA','KUMAR',50000, 'NANDA@GMAIL.COM', NULL,'15-06-12');

-- INSERT INTO DUPLICATE VALUES (2,'BIPLAB','PARIDA',30000,'BPARIDA@YAHOO.COM',1,'21-12-15');

-- INSERT INTO DUPLICATE VALUES (3,'SIBA','PRASAD',90000,'SIBA@GMAIL.COM',3,'01-06-20');
-- INSERT INTO DUPLICATE VALUES (4,'ANUSHKA','SHARMA', 20000, 'SHARMAA@GMAIL.COM',1,'01-03-21');

-- INSERT INTO DUPLICATE VALUES (5,'BIPLAB','PARIDA', 30000, 'BPARIDA@YAHOO.COM',1,'21-12-15');

-- select * from employee;
-- select * from computer;
-- select * from duplicate; 

-- --------------------------------solve the questions-------------------------


-- 1. SQL Query to update DateOfJoining to 15-jul-2012 for empid =1.

UPDATE employee
SET dateofjoining='15-07-12' 
WHERE empid=1;
SELECT * FROM employee WHERE empid=5;
DELETE FROM employee WHERE empid=1;

UPDATE employee SET firstname = 'Achal' WHERE empid=5;
-- another example where we want to update the date and email for empid=2

UPDATE employee
SET dateofjoining='15-08-12', email='m@nish45@gmail.com'
WHERE empid=2;

UPDATE employee 
SET email='manish@gmail.com'
WHERE empid=2;

SELECT * FROM employee;

-- 2. SQL Query to select all employee name where age is salary than 30000

SELECT * FROM employee
WHERE salary > 30000;

-- 3. SQL Query to Find all employee with Salary between 40000 and 80000?

SELECT * FROM employee
WHERE salary BETWEEN 40000 AND 80000;

SELECT * FROM employee 
WHERE salary >= 40000 AND salary <= 80000;

-- 4. SQL Query to display full name?
SELECT CONCAT(FIRSTNAME," ",LASTNAME) AS FULL_NAME FROM EMPLOYEE;
SELECT firstname, lastname FROM employee; -- for table
SELECT CONCAT(firstname," ",lastname) AS fullname FROM employee;

-- 5. SQL Query to find name of employee beginning with S?

SELECT * FROM employee WHERE firstname LIKE 's%';

-- 6. Write a query to fetch details of employees whose firstname ends with an alphabet ‘A’
-- and contains exactly five alphabets ? 

SELECT * FROM employee WHERE firstname LIKE '____A';


-- 7. Write a query to fetch details of all employees excluding few Employees :

SELECT * FROM employee 
WHERE firstname NOT IN ('BIPLAB', 'DISHA');

-- 8. SQL query to display the current date ?

SELECT CURDATE();
SELECT CURRENT_DATE(); -- DATE
SELECT current_time(); -- TIME
SELECT current_timestamp(); -- DATE TIME BOTH
SELECT current_user(); -- GIVES USER LIKE LOCALHOST@ROOT

-- 9. SQL Query to get day of last day of the previous month:

SELECT date(current_date()-INTERVAL 1 month);

-- 10. Write an SQL query to fetch the employee FIRST names and replace the A with ‘@’:

SELECT REPLACE (firstname,'A','@') FROM employee;

-- 11. Write an SQL query to fetch the domain from an email address:

SELECT SUBSTR(email,INSTR(email,'@')+1) FROM employee;

-- 12. Write an SQL query to update the employee names by removing leading and trailing spaces :

UPDATE employee SET firstname='  manish  ' WHERE empid=2;

UPDATE employee
SET firstname=TRIM(firstname); 

SELECT * FROM  employee;

-- 13. Write an SQL query to fetch all the Employees details from Employee table who joined in the
-- Year 2020:

SELECT * FROM employee WHERE year(dateofjoining) = 2020;

-- 14. Write an SQL query to fetch only odd rows / Even rows from the table :

SELECT * FROM employee WHERE mod(empid,2)=1;

-- 15. Write an SQL query to create a new table with data and structure copied from another table:

CREATE TABLE emp AS (SELECT * FROM employee);
SELECT * FROM emp;

-- 16. Write an SQL query to create an empty table with the same structure as some other table :

CREATE TABLE emp3 AS (SELECT * FROM employee WHERE 6=456);
 -- anything we can write that should not be same if same means
 -- it come structure as well as data copied.
SELECT * FROM emp3;
drop table emp3;

-- 17. Write an SQL query to fetch top 3 HIGHEST salaries with name:

SELECT CONCAT(firstname,"  -> ", salary) AS Infromation FROM employee 
ORDER BY salary DESC LIMIT 3;


-- 18. Find the first employee and last employee from employee table :

(SELECT * FROM employee LIMIT 1)
UNION
(SELECT * FROM employee ORDER BY empid DESC LIMIT 1);

-- alternate way
SELECT * FROM employee WHERE empid = (SELECT min(empid) FROM employee)
UNION
SELECT * FROM employee WHERE empid=(SELECT max(empid) FROM employee);


-- 19. List the ways to get the count of records in a table:

SELECT COUNT(*) FROM employee;
SELECT COUNT(empid) FROM employee;
SELECT COUNT(1) FROM employee;

-- 20. Write a query to fetch the department-wise count of 
-- employees sorted by department’s count in ascending order:

SELECT dept, COUNT(*) FROM employee GROUP BY dept ORDER BY COUNT(*) ASC;

-- 21. Write a query to retrieve Departments who have less than 4 employees working in it :

SELECT dept, COUNT(*) FROM employee GROUP BY dept HAVING COUNT(*) < 4;

-- 22. Write a query to retrieve Department wise Maximum salary:

SELECT DEPT, MAX(SALARY) FROM EMPLOYEE GROUP BY DEPT;

-- 23. Write a query to Employee earning maximum salary in his department :

SELECT * FROM employee AS E1
JOIN
(SELECT dept, MAX(salary) Salary FROM employee GROUP BY dept) AS E2
ON E1.dept=E2.dept AND E1.salary=E2.salary;

-- 24. Write an SQL query to fetch the first 50% records from a table:
-- error because limit doesnot supports inside queries

SELECT * FROM employee
ORDER BY empid LIMIT (SELECT COUNT(*)/2 FROM employee);


-- 25. Query to fetch details of employees not having computer:

SELECT * FROM employee WHERE compid IS NULL;

-- 26. Query to fetch details of employees having computer:

SELECT * FROM employee WHERE compid IS NOT NULL;

-- 27. Query to fetch employee details along with the computer details who have been assigned
-- with a computer :

SELECT * FROM employee AS a JOIN computer AS b ON a.compid=b.compid;

-- 28. Fetch all employee details along with the computer name assigned to them:

SELECT E.empid, CONCAT(E.firstname," ",E.lastname) AS fullname,
IFNULL(C.brand,"Not Assigned") AS brand FROM employee AS E 
LEFT JOIN computer AS C ON E.compid = C.compid;

-- 29. Fetch all Computer Details along with employee name using it :

SELECT C.compid, C.brand, C.compmodel, 
ifnull(CONCAT(E.firstname," ",E.lastname), "Not Assigned" )AS fullname FROM employee AS E 
RIGHT JOIN computer AS C ON E.compid=C.compid;

-- 30. Delete duplicate records from a table:

DELETE D1
FROM DUPLICATE D1
JOIN DUPLICATE D2 
ON D1.firstname = D2.firstname
AND D1.lastname = D2.lastname
AND D1.salary = D2.salary
AND D1.managerid = D2.managerid
AND D1.dateofjoining = D2.dateofjoining
AND D1.empid > D2.empid;

-- 31. Find Nth Highest salary :

SELECT DISTINCT SALARY FROM EMPLOYEE E1
WHERE 4 = (SELECT COUNT(DISTINCT SALARY)
FROM EMPLOYEE E2 WHERE E2.SALARY > E1.SALARY);

-- ----------------------------------------




