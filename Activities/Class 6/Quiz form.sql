SELECT* from film

CREATE TABLE film (
    title VARCHAR(100),
    age_restriction SMALLINT,
    rating REAL,
    country VARCHAR(60)
);

ALTER TABLE film ADD COLUMN release_date DATE;

INSERT INTO film (title, release_date, age_restriction, rating, country) 
VALUES 
('Iron Man', '2008-05-02', 13, 7.9, 'USA'),
('Avengers: Endgame', '2019-04-26', 13, 8.4, 'USA');

UPDATE film  SET rating = 8.5  WHERE title = 'The Matrix';


CREATE TABLE country (
    name VARCHAR(100),
    currency VARCHAR(50),
    population INT
);

ALTER TABLE country ALTER COLUMN population TYPE BIGINT;

ALTER TABLE country RENAME COLUMN population TO country_pop;

