CREATE TABLE test_m(
Nom TEXT,
Age INT,
Nationality TEXT
);

ALTER TABLE test_m
ADD COLUMN participation VARCHAR(1);

ALTER TABLE test_m
ALTER COLUMN Age TYPE VARCHAR(2);

ALTER TABLE test_m RENAME TO sql_students;

ALTER TABLE sql_students RENAME COLUMN Age TO ID;


INSERT INTO sql_students (Nom, ID, Nationality, Participation) 
VALUES('Mahmoud', 21, 'Egyptian', 'A'),
('Eleonore', 21, 'French', 'A'),
('Ali', 21, 'American', 'C');

Update sql_students
SET id = 20 
WHERE nom = 'Ali';

SELECT*FROM sql_students;

SELECT nationality FROM sql_students;

TRUNCATE TABLE sql_students

DROP TABLE sql_students

DELETE FROM sql_students
WHERE participation = 'C';

COMMENT ON COLUMN sql_students.Id IS 'Age';