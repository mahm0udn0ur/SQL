
CREATE TABLE Jan_2020 (
id 					INT,
startup_name 		TEXT,
founding_date 		NUMERIC,
city 				TEXT,
industry_vertical 	TEXT,
sub_vertical		TEXT,
founders			TEXT,
investors			TEXT,
amount				NUMERIC,
investment_stage	TEXT);


DROP TABLE Jan_2020

SELECT* 
FROM Jan_2020

COPY Jan_2020
FROM '/private/tmp/Jan_2020.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ';',
    QUOTE '"',
    NULL '',
    ENCODING 'UTF8'
);





CREATE TABLE Feb_2020 (
id 					INT,
startup_name 		TEXT,
founding_date 		NUMERIC,
city 				TEXT,
industry_vertical 	TEXT,
sub_vertical		TEXT,
founders			TEXT,
investors			TEXT,
amount				NUMERIC,
investment_stage	TEXT);


DROP TABLE Feb_2020

SELECT* 
FROM Feb_2020

COPY Feb_2020
FROM '/private/tmp/Feb_2020.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ';',
    QUOTE '"',
    NULL '',
    ENCODING 'UTF8'
);


CREATE TABLE Mar_2020 (
id 					INT,
startup_name 		TEXT,
founding_date 		NUMERIC,
city 				TEXT,
industry_vertical 	TEXT,
sub_vertical		TEXT,
founders			TEXT,
investors			TEXT,
amount				NUMERIC,
investment_stage	TEXT);


DROP TABLE Mar_2020

SELECT* 
FROM Mar_2020

COPY Mar_2020
FROM '/private/tmp/Mar_2020.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ';',
    QUOTE '"',
    NULL '',
    ENCODING 'UTF8'
);

--All Tables startup first quarter--
SELECT* 
FROM Jan_2020
SELECT* 
FROM Feb_2020
SELECT* 
FROM Mar_2020