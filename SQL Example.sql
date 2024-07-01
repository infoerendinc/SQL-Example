SELECT name, surname FROM scholl.students WHERE name like '%Eren%';

INSERT INTO scholl.students (id, name, surname) VALUES (101, 'Mehmet', 'Çakır');

UPDATE scholl.students SET surname = 'Uygur' WHERE id = 101;

DELETE FROM scholl.students  WHERE id = 101;

CREATE TABLE scholl.teacher (
    id int,
    name varchar2(100 byte),
    surname varchar2(100 byte)
);

DROP TABLE scholl.deneme;

ALTER TABLE scholl.teacher ADD age int;

CREATE INDEX ind_teacher ON scholl.teacher (name);

DROP INDEX ind_teacher;

SELECT DISTINCT name, surname FROM scholl.teacher;

SELECT name, surname FROM scholl.teacher ORDER BY id ASC;

SELECT name,surname,age  FROM scholl.teacher WHERE name = 'Veli';

SELECT name, COUNT(*) FROM scholl.teacher GROUP BY surname;

SELECT name, COUNT(*) FROM scholl.teacher GROUP BY name HAVING COUNT(*) > 1;

SELECT a.name, a.surname, b.class_no FROM scholl.teacher a INNER JOIN scholl.class b ON a.teacher_no = b.teacher_no;

SELECT a.name, a.name, b.class_no FROM scholl.teacher a LEFT JOIN scholl.class b ON a.id = b.id;

SELECT a.name, a.name, b.class_no FROM scholl.teacher a RIGHT JOIN scholl.class b ON a.id = b.id;

SELECT name, surname FROM scholl.teacher
UNION
SELECT name, surname FROM scholl.students ;

TRUNCATE TABLE scholl.teacher;  -- data silmeye 

DELETE FROM scholl.teacher; -- data silmeye  commit;  roolback; 

DROP TABLE scholl.teacher; 

SELECT COUNT(*) FROM scholl.teacher;

SELECT SUM(SALARY) FROM scholl.salary;

SELECT AVG(SALARY) FROM scholl.salary;

SELECT MIN(SALARY) FROM scholl.salary;

SELECT MAX(SALARY) FROM scholl.salary;

SELECT NAME FROM scholl.salary WHERE SALARY LIKE '5%';
--5, 50, 500...

SELECT NAME FROM scholl.salary WHERE SALARY LIKE '%5';
--105, 15, 25...

SELECT NAME FROM scholl.salary WHERE SALARY LIKE '%5%';
--150, 250,..

SELECT NAME, SURNAME, SALARY FROM scholl.salary WHERE NAME IN ('VELİ', 'AHMET', 'HASAN');

SELECT NAME, SURNAME, SALARY FROM scholl.salary WHERE SALARY BETWEEN 10000 AND 20000;

SELECT NAME, SURNAME, SALARY FROM scholl.salary WHERE SALARY < 10000;

SELECT NAME, SURNAME, SALARY FROM scholl.salary WHERE SALARY > 20000;

SELECT NAME, SURNAME, SALARY FROM scholl.salary WHERE SALARY BETWEEN to_date('01.05.2023','dd.mm.yyyy') AND to_date('01.05.2024','dd.mm.yyyy');

SELECT NAME, SURNAME, SALARY FROM scholl.salary WHERE SALARY IS NULL;

SELECT NAME, SURNAME, SALARY FROM scholl.salary WHERE SALARY IS NOT NULL;

SELECT NAME, SURNAME 
       CASE 
           WHEN SALARY < 10000 THEN 'junior'
           WHEN SALARY > 10000 AND SALARY < 20000 THEN 'mid'
           WHEN SALARY > 20000 AND SALARY < 30000 THEN 'senior'
           ELSE 'manager' 
       END AS RUTBE 
FROM scholl.salary ;