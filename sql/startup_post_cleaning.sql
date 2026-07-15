/*
 Startup Funding Analytics (Pandas + MySQL)
 File: startup_post_cleaning.sql

 Purpose:
 --------
 This script performs post-import data cleaning after importing
 startup_clean.csv into MySQL.

 It standardizes values that were easier to correct directly in SQL
 after import and validates each correction.

 Author: Divya Bariya
*/


/*
 STEP 1 : Fix BYJU'S Encoding Issue
*/

-- Diagnosis
SELECT
    startup_name,
    HEX(startup_name) AS hex_value,
    COUNT(*) AS occurrences
FROM startup_clean
WHERE startup_name LIKE '%BYJU%'
   OR startup_name LIKE '%Byju%'
GROUP BY startup_name;

-- Expected before update:
-- BYJU'S                    -> 3
-- Byju\\xe2\\x80\\x99s      -> 4

UPDATE startup_clean
SET startup_name = 'BYJU''S'
WHERE HEX(startup_name) =
'42796A755C5C7865325C5C7838305C5C78393973';

-- Validation
SELECT
    startup_name,
    COUNT(*) AS occurrences
FROM startup_clean
WHERE startup_name LIKE '%BYJU%'
GROUP BY startup_name;

-- Expected after update:
-- BYJU'S -> 7



/*
 STEP 2 : Fix Seed\\nFunding
*/

-- Diagnosis
SELECT
    investment_type,
    HEX(investment_type) AS hex_value,
    COUNT(*) AS occurrences
FROM startup_clean
WHERE investment_type LIKE '%Seed%'
GROUP BY investment_type;

-- Expected before update:
-- Seed Funding
-- Angel / Seed Funding
-- Seed\\nFunding

UPDATE startup_clean
SET investment_type = 'Seed Funding'
WHERE HEX(investment_type) =
'536565645C5C6E46756E64696E67';

-- Validation
SELECT
    investment_type,
    COUNT(*) AS occurrences
FROM startup_clean
WHERE investment_type LIKE '%Seed%'
GROUP BY investment_type;

-- Expected after update:
-- Seed Funding         -> 1531
-- Angel / Seed Funding -> 8



/*
 STEP 3 : Remove Escaped Unicode Prefix
*/

-- Diagnosis
SELECT
    startup_name,
    HEX(startup_name)
FROM startup_clean
WHERE HEX(startup_name)
LIKE '5C5C7863325C5C786130%';

-- Preview cleaned names
SELECT
    startup_name,
    SUBSTRING(startup_name,11) AS cleaned_name
FROM startup_clean
WHERE HEX(startup_name)
LIKE '5C5C7863325C5C786130%';

-- Expected examples:
--
-- \\xc2\\xa0CloudCherry
--          ↓
-- CloudCherry
--
-- \\xc2\\xa0Nudgespot
--          ↓
-- Nudgespot

UPDATE startup_clean
SET startup_name = SUBSTRING(startup_name,11)
WHERE HEX(startup_name)
LIKE '5C5C7863325C5C786130%';

-- Validation
SELECT
    startup_name,
    HEX(startup_name)
FROM startup_clean
ORDER BY startup_name
LIMIT 20;



/*
 FINAL VALIDATION
*/

-- BYJU'S Validation
SELECT
    startup_name,
    COUNT(*)
FROM startup_clean
WHERE startup_name LIKE '%BYJU%'
GROUP BY startup_name;


-- Seed Funding Validation
SELECT
    investment_type,
    COUNT(*)
FROM startup_clean
WHERE investment_type LIKE '%Seed%'
GROUP BY investment_type;


-- Escaped Prefix Validation
SELECT
    startup_name
FROM startup_clean
WHERE HEX(startup_name)
LIKE '5C5C7863325C5C786130%';


/*
 END
*/