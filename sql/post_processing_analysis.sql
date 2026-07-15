-- DATA QUALITY ISSUES DISCOVERED DURING EDA


-- DQ1
-- BYJU'S appears in two forms:
--   BYJU'S
--   Byju’s (Unicode apostrophe)
-- Standardized after investigation.

SELECT DISTINCT startup_name
FROM startup_clean
WHERE startup_name LIKE '%Byju%'
OR startup_name LIKE '%BYJU%';


SELECT DISTINCT startup_name
FROM startup_clean
WHERE startup_name LIKE '%Ola%';

SELECT DISTINCT startup_name
FROM startup_clean
WHERE startup_name LIKE '%Paytm%';

SELECT
    startup_name,
    COUNT(*) AS occurrences
FROM startup_clean
WHERE startup_name IN ('Ola', 'Ola Cabs', 'Olacabs', 'Ola Electric')
GROUP BY startup_name;

SELECT
    UPPER(startup_name) AS normalized_name,
    COUNT(DISTINCT startup_name) AS variations
FROM startup_clean
GROUP BY UPPER(startup_name)
HAVING COUNT(DISTINCT startup_name) > 1;
Empty set (0.05 sec)

SELECT
    funding_date,
    startup_name,
    amount_usd
FROM startup_clean
WHERE startup_name IN ('Ola','Ola Cabs','Olacabs')
ORDER BY funding_date;


SELECT startup_name, COUNT(*)
FROM startup_clean
WHERE startup_name IN ('BYJU''S','Byju’s','Byju\xe2\x80\x99s')
GROUP BY startup_name;


SELECT
           startup_name,
           HEX(startup_name) AS hex_value,
           COUNT(*) AS occurrences
       FROM startup_clean
       WHERE startup_name LIKE '%Byju%'
          OR startup_name LIKE '%BYJU%'
       GROUP BY startup_name;


SELECT
           startup_name,
           LENGTH(startup_name),
           CHAR_LENGTH(startup_name)
       FROM startup_clean
       WHERE startup_name LIKE '%Byju%'
          OR startup_name LIKE '%BYJU%';


SELECT startup_name
       FROM startup_clean
       WHERE startup_name = 'Byju\xe2\x80\x99s';


SELECT
           startup_name,
           HEX(startup_name),
           ASCII(SUBSTRING(startup_name,1,1)) AS c1,
           ASCII(SUBSTRING(startup_name,2,1)) AS c2,
           ASCII(SUBSTRING(startup_name,3,1)) AS c3,
           ASCII(SUBSTRING(startup_name,4,1)) AS c4,
           ASCII(SUBSTRING(startup_name,5,1)) AS c5,
           ASCII(SUBSTRING(startup_name,6,1)) AS c6,
           ASCII(SUBSTRING(startup_name,7,1)) AS c7,
           ASCII(SUBSTRING(startup_name,8,1)) AS c8,
           ASCII(SUBSTRING(startup_name,9,1)) AS c9
FROM startup_clean
WHERE startup_name LIKE '%Byju%';

SELECT startup_name
FROM startup_clean
WHERE startup_name LIKE '%\\%';


SHOW VARIABLES LIKE 'character_set%';


SHOW VARIABLES LIKE 'collation%';


SELECT startup_name
FROM startup_clean
WHERE HEX(startup_name) = '42796A755C7865325C7838305C78393973';


UPDATE startup_clean
       SET startup_name = 'BYJU''S'
       WHERE HEX(startup_name) = '42796A755C7865325C7838305C78393973';


SELECT startup_name, COUNT(*)
FROM startup_clean
WHERE startup_name LIKE '%BYJU%'
OR startup_name LIKE '%Byju%'
GROUP BY startup_name;