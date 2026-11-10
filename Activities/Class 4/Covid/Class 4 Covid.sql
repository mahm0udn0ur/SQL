CREATE TABLE public.covid_data (
    country            TEXT,
    total_cases        NUMERIC,
    new_cases          NUMERIC,
    total_deaths       NUMERIC,
    new_deaths         NUMERIC,
    total_recovered    NUMERIC,
    new_recovered      NUMERIC,
    active_cases       NUMERIC,
    serious_critical   NUMERIC,
    tot_cases_1m_pop   NUMERIC,
    deaths_1m_pop      NUMERIC,
    total_tests        NUMERIC,
    tests_1m_pop       NUMERIC,
    population         NUMERIC
);


SELECT*
FROM public.covid_data

DROP TABLE public.covid_data

COPY public.covid_data
FROM '/private/tmp/COVID-19 Global Statistics Dataset.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ';',
    QUOTE '"',
    NULL '',
    ENCODING 'UTF8'
);
