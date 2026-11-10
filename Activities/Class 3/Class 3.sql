
CREATE TABLE BOOKS (
id INT,
title TEXT,
authors TEXT, 
average_rating DECIMAL,
isbn VARCHAR (20),
isbn13 VARCHAR (20), 
language_code TEXT,
num_pages NUMERIC,
ratings_count NUMERIC, 
text_reviews_count NUMERIC, 
publication_date DATE, 
publisher VARCHAR (100)) ;
SELECT*FROM BOOKS

DROP TABLE BOOKS

COPY BOOKS 
FROM '/private/tmp/books -goodreads.csv' 
WITH (
    FORMAT csv, 
    HEADER true, 
    DELIMITER ',', 
    QUOTE '"', 
    ESCAPE '\', 
    ENCODING 'UTF8'
);

SELECT*
FROM BOOKS
WHERE average_rating>4.9

SELECT*
FROM BOOKS
WHERE publisher ='Broadway Books'

SELECT title, average_rating
FROM BOOKS
WHERE publisher ='Broadway Books' average_rating>4.5

SELECT publisher, average_rating
FROM BOOKS
WHERE publisher ='Broadway Books' AND average_rating>4.1 ;

SELECT*
FROM BOOKS
WHERE average_rating > 4.5 
LIMIT 5;

-----------------CLASS 4--------------

SELECT* 
FROM BOOKS
WHERE (average_rating > 4.5 AND publication_date > '2010-12-31')
OR publisher = 'Broadway Books' ; 

SELECT title, average_rating, publication_date
FROM BOOKS
WHERE average_rating BETWEEN 4.5 AND 5;

SELECT title, publication_date, publisher
FROM BOOKS
WHERE publication_date BETWEEN '2010-01-01' AND
'2020-12-31'
AND publisher = 'Penguin Books' ;

SELECT title, publisher
FROM BOOKS
WHERE publisher IN ('Penguin', 'HarperCollins');


SELECT title, average_rating
FROM BOOKS
WHERE average_rating >= 4.0
OR average_rating = 4.5
OR average_rating <= 5.0;

--FOR MULTIPLE CONDITIONS SAME GROUP (PROBLEM BC RATING ARE = NOT BETWEEN)
SELECT title, average_rating
FROM BOOKS
WHERE average_rating IN (4.0, 4.5, 5.0);

SELECT * FROM BOOKS
WHERE title LIKE '%Java%';

SELECT * FROM BOOKS
WHERE title NOT LIKE '%Python%';
