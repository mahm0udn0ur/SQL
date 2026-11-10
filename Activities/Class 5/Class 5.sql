CREATE TABLE students(
student_id VARCHAR (1),
name CHAR (10),
course_id VARCHAR (3)
)
INSERT INTO students (student_id, name, course_id)
VALUES
(1,'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 103) ;

SELECT* FROM students 
DROP TABLE students

CREATE TABLE courses(
course_id VARCHAR(3),
course_name CHAR(10)
)

INSERT INTO courses (course_id, course_name)
VALUES
(101, 'Math'),
(102, 'Sci'), 
(104, 'History');

SELECT* FROM courses
DROP TABLE courses

SELECT s.student_id, s.name, c.course_name
FROM students s
JOIN courses c 
ON s.course_id = c.course_id;

SELECT s.student_id, s.name, c.course_name
FROM students s
LEFT JOIN courses c 
ON s.course_id = c.course_id;

SELECT s.student_id, s.name, c.course_name
FROM students s
RIGHT JOIN courses c 
ON s.course_id = c.course_id;

SELECT s.student_id, s.name, c.course_name
FROM students s
INNER JOIN courses c 
ON s.course_id = c.course_id;

SELECT s.student_id, s.name, c.course_name
FROM students s
CROSS JOIN courses c
ORDER BY s.student_id ASC;



ON s.course_id = c.course_id;


