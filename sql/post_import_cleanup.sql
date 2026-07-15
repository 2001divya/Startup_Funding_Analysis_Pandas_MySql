-- ETL POST-IMPORT CLEANUP

UPDATE startup_clean
SET industry_vertical = NULL
WHERE industry_vertical = '';

UPDATE startup_clean
SET sub_vertical = NULL
WHERE sub_vertical = '';

UPDATE startup_clean
SET city_location = NULL
WHERE city_location = '';

UPDATE startup_clean
SET investors_name = NULL
WHERE investors_name = '';

UPDATE startup_clean
SET investment_type = NULL
WHERE investment_type = '';

UPDATE startup_clean
SET remarks = NULL
WHERE remarks = '';

-- Validation Query
SELECT
    COUNT(*) AS total_rows,
    COUNT(funding_date) AS funding_date_not_null,
    COUNT(startup_name) AS startup_name_not_null,
    COUNT(industry_vertical) AS industry_vertical_not_null,
    COUNT(sub_vertical) AS sub_vertical_not_null,
    COUNT(city_location) AS city_location_not_null,
    COUNT(investors_name) AS investors_name_not_null,
    COUNT(investment_type) AS investment_type_not_null,
    COUNT(amount_usd) AS amount_usd_not_null,
    COUNT(remarks) AS remarks_not_null
FROM startup_clean;