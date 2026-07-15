-- STARTUP FUNDING ANALYSIS

-- Q1 : Total number of records
select count(*) from startup_clean;

-- Q2 : Time span of the dataset
select MIN(funding_date) AS earliest_date,
       MAX(funding_date) AS latest_date
from startup_clean;

-- Q3 : Minimum and Maximum Funding ever recived
select MIN(amount_usd) AS minimum_funding,
       MAX(amount_usd) AS maximum_funding
from startup_clean;

-- Cardinality

-- Q4 : Number of unique startups
select count(distinct startup_name) AS unique_startups
from startup_clean;

-- Q5 : Number of Unique Cities
select count(distinct city_location) AS unique_cities
from startup_clean;    

-- Q6 : Number of Unique Industries
SELECT COUNT(DISTINCT industry_vertical) AS unique_industries
FROM startup_clean;

-- Q7 : Number of unique sub-verticals
SELECT COUNT(DISTINCT sub_vertical) AS unique_subvertical
FROM startup_clean;

-- Q8 : Number of Distinct Investors
SELECT COUNT(DISTINCT investors_name) AS unique_investors
FROM startup_clean;

-- Q9 : Number of Different kinds of investment types
SELECT COUNT(DISTINCT investment_type) AS unique_investments
FROM startup_clean;

-- Missing Value Analysis

-- Q10 : Find Null Count for the table
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

-- Q11 : What is the total amount of funding raised?
SELECT SUM(amount_usd) AS total_funding
FROM startup_clean;

-- Q12 : What is the average funding amount per funding round 
--      (considering only funding rounds where the amount is known)?
SELECT AVG(amount_usd) AS average_funding
FROM startup_clean;

-- Q13 : How many funding rounds have a reported funding amount?
SELECT COUNT(amount_usd) AS funding_rounds_with_amount
FROM startup_clean;

-- Q14 : How many funding rounds are associated with each city?
SELECT city_location,COUNT(*) AS funding_rounds
FROM startup_clean
GROUP BY city_location;

-- Q15 : Which cities have the highest number of startup funding rounds?
SELECT city_location,COUNT(*) AS funding_rounds
FROM startup_clean
GROUP BY city_location
ORDER BY funding_rounds DESC;

-- Q16 : Which are the Top 10 cities by number of funding rounds?
SELECT city_location,COUNT(*) AS funding_rounds
FROM startup_clean
GROUP BY city_location
ORDER BY funding_rounds DESC LIMIT 10;

-- Q17 : Which cities have recorded at least 10 funding rounds?
SELECT city_location,COUNT(*) AS funding_rounds FROM startup_clean
WHERE city_location IS NOT NULL
GROUP BY city_location
HAVING funding_rounds >= 10
ORDER BY funding_rounds DESC;

-- Q18 : How many funding rounds took place in each year?
SELECT
       YEAR (funding_date) AS year,
       COUNT(*) AS funding_rounds
       FROM startup_clean
       GROUP BY YEAR(funding_date)
       ORDER BY YEAR(funding_date);

-- Q19 : How many funding rounds occurred in each month 
--       (January, February, ..., December) across the entire dataset?
SELECT
       MONTHNAME(funding_date) AS month,
       COUNT(*) AS funding_rounds
FROM startup_clean
GROUP BY
       MONTH(funding_date),MONTHNAME(funding_date)
ORDER BY
       MONTH(funding_date);

-- Q20 : How many funding rounds fall into each funding size category?
-- Small  : < 1,000,000
-- Medium : 1,000,000 – 10,000,000
-- Large  : > 10,000,000
SELECT
    CASE
        WHEN amount_usd < 1000000 THEN 'small'
        WHEN amount_usd BETWEEN 1000000 AND 10000000 THEN 'medium'
        ELSE 'large'
    END AS funding_size,
    COUNT(*) AS funding_rounds
FROM startup_clean
WHERE amount_usd IS NOT NULL
GROUP BY funding_size
ORDER BY funding_size;

-- SUBQUERIES

-- Q21 : Which startup received the largest single funding round?
SELECT
    startup_name,
    amount_usd
FROM startup_clean
WHERE amount_usd =
(
    SELECT MAX(amount_usd)
    FROM startup_clean
);

-- Q22 : Which startups received funding greater than the average funding amount?
select startup_name,amount_usd from startup_clean
where amount_usd >= (select AVG(amount_usd) from startup_clean);

-- Q23 : Which startups received funding less than the average funding amount?
select startup_name,amount_usd from startup_clean
where amount_usd <= (select AVG(amount_usd) from startup_clean);

-- Q24 : Which startups received funding equal to the maximum funding amount?
select startup_name,amount_usd
from startup_clean
where amount_usd = (select MAX(amount_usd) from startup_clean);

-- Q25 : Which startups received funding less than the minimum funding?
select startup_name,amount_usd
from startup_clean
where amount_usd < (select MIN(amount_usd) from startup_clean);

-- Q26 : Show startups that received funding above twice the average.
select startup_name,amount_usd
from startup_clean
where amount_usd > (2*(select AVG(amount_usd) from startup_clean));


-- SECTION 5 : EXPLORATORY DATA ANALYSIS (EDA)
-- UNIVARIATE ANALYSIS

-- Q27 : Which startups appear most frequently in the dataset?
select startup_name,count(*) as frequently_occured_startup_name
from startup_clean
group by startup_name
order by frequently_occured_startup_name desc limit 100;


-- Q28 : Which industries appear most frequently in the dataset?
SELECT
    industry_vertical,
    COUNT(*) AS funding_rounds
FROM startup_clean
WHERE industry_vertical IS NOT NULL
GROUP BY industry_vertical
ORDER BY funding_rounds DESC
LIMIT 20;

-- Q29 : Which investment types are most common?
SELECT investment_type,COUNT(*) AS common_investments
FROM startup_clean
WHERE investment_type IS NOT NULL
GROUP BY investment_type
ORDER BY common_investments DESC LIMIT 20;

-- Q30 : Who are the most common investors?
SELECT investors_name,COUNT(*) AS common_investors
FROM startup_clean
WHERE investors_name IS NOT NULL
GROUP BY investors_name
ORDER BY common_investors DESC LIMIT 20;

-- Q31 : Which startups have raised the highest total funding across all funding rounds?
select startup_name,SUM(amount_usd) as total_funding_raised,count(*) as funding_rounds
from startup_clean
where startup_name is not null
group by startup_name
order by total_funding_raised desc limit 20;

-- Q32 : Which startups have participated in the highest number of funding rounds?
select startup_name,count(*) as funding_rounds
from startup_clean
where startup_name is not null
group by startup_name
order by funding_rounds desc limit 20;

-- Q33 : Which industries have received the highest total funding?
 SELECT industry_vertical,SUM(amount_usd)
FROM startup_clean
WHERE industry_vertical IS NOT NULL
GROUP BY industry_vertical
ORDER BY SUM(amount_usd) DESC LIMIT 20;

-- Q34 : Which cities have attracted the highest total funding?
SELECT city_location,SUM(amount_usd) AS total_funding_received
FROM startup_clean
WHERE city_location IS NOT NULL
GROUP BY city_location
ORDER BY total_funding_received DESC LIMIT 20;

-- Q35 : Which investment types account for the highest total funding?
SELECT investment_type,SUM(amount_usd) AS total_funding
FROM startup_clean
WHERE investment_type IS NOT NULL
GROUP BY investment_type
ORDER BY total_funding DESC LIMIT 20;

-- Q36 : Which investors have participated in the largest total funding amount?
select investors_name,SUM(amount_usd) AS largest_funding_by_investor
FROM startup_clean
WHERE investors_name IS NOT NULL
GROUP BY investors_name
ORDER BY largest_funding_by_investor DESC LIMIT 20;

-- Q37 : Which cities have the highest average funding per funding round?
select city_location,SUM(amount_usd) AS total_funding,AVG(amount_usd) AS average_funding,COUNT(*) AS total_rounds
FROM startup_clean
WHERE city_location IS NOT NULL
GROUP BY city_location
ORDER BY average_funding DESC LIMIT 20;

-- Q38 : Which industries receive the highest average funding?
select industry_vertical,SUM(amount_usd) AS total_funding,AVG(amount_usd) AS average_funding,COUNT(*) AS total_rounds
FROM startup_clean
WHERE industry_vertical IS NOT NULL
GROUP BY industry_vertical
ORDER BY average_funding DESC LIMIT 20;

-- Q39: Which investment types have the highest average funding amount?
SELECT investment_type,
       SUM(amount_usd) AS total_funding,
       AVG(amount_usd) AS average_funding,
       COUNT(amount_usd) AS funding_rounds_with_amount
FROM startup_clean
WHERE investment_type IS NOT NULL
GROUP BY investment_type
HAVING COUNT(amount_usd)>=8
ORDER BY average_funding DESC LIMIT 20;

-- Q40 : What was the average funding amount in each year?
SELECT
    YEAR(funding_date) AS year,
    SUM(amount_usd) AS total_funding,
    AVG(amount_usd) AS average_funding,
    COUNT(amount_usd) AS funding_rounds_with_amount
FROM startup_clean
GROUP BY YEAR(funding_date)
ORDER BY year;

-- BiVariate Analysis
-- Section 1 - Time Analysis

-- Q41 : How did funding change across industries over the years?
SELECT
    YEAR(funding_date) AS year,
    industry_vertical,
    SUM(amount_usd) AS total_funding
FROM startup_clean
WHERE industry_vertical IS NOT NULL
GROUP BY
    YEAR(funding_date),
    industry_vertical
ORDER BY
    year,
    total_funding DESC;

-- Q42 : How did funding change across cities over the years?
SELECT
    YEAR(funding_date) AS year,
    city_location,
    SUM(amount_usd) AS total_funding
FROM startup_clean
WHERE city_location IS NOT NULL
GROUP BY
    YEAR(funding_date),
    city_location
ORDER BY
    year,
    total_funding DESC;

-- Q43 : Total funding by investment type in each year?
SELECT
       YEAR(funding_date) AS year,
       investment_type,
       SUM(amount_usd) AS total_funding
FROM startup_clean
WHERE investment_type IS NOT NULL
AND amount_usd IS NOT NULL
GROUP BY
YEAR(funding_date),investment_type
ORDER BY
year,total_funding DESC;

-- Q44 : How much total funding has each industry received in each city?
SELECT
    city_location,
    industry_vertical,
    SUM(amount_usd) AS total_funding
FROM startup_clean
WHERE city_location IS NOT NULL
  AND industry_vertical IS NOT NULL
  AND amount_usd IS NOT NULL
GROUP BY
    city_location,
    industry_vertical
ORDER BY
    city_location,
    total_funding DESC;

-- Q45 : Which industries have the highest number of funding rounds in each city?
SELECT
    city_location,
    industry_vertical,
    COUNT(*) AS funding_rounds
FROM startup_clean
WHERE city_location IS NOT NULL
  AND industry_vertical IS NOT NULL
GROUP BY
    city_location,
    industry_vertical
ORDER BY
    city_location,
    funding_rounds DESC;

-- Q46 : What is the average funding amount received by each industry in each city?
SELECT
    city_location,
    industry_vertical,
    AVG(amount_usd) AS average_funding
FROM startup_clean
WHERE city_location IS NOT NULL
  AND industry_vertical IS NOT NULL
  AND amount_usd IS NOT NULL
GROUP BY
    city_location,
    industry_vertical
ORDER BY
    city_location,
    average_funding DESC;

-- Section 3 - Industry Analysis

-- Q47 : How much total funding has each investor invested in each industry?
SELECT
       investors_name,SUM(amount_usd) AS total_funding_invested_by_investor,industry_vertical
       From startup_clean
WHERE investors_name IS NOT NULL
AND amount_usd IS NOT NULL
AND industry_vertical IS NOT NULL
GROUP BY investors_name,industry_vertical
ORDER BY total_funding_invested_by_investor DESC LIMIT 30;

-- Q48 : How many funding rounds has each investor participated in within each industry?
SELECT
       investors_name,industry_vertical,COUNT(*) AS funding_rounds_invested_by_investor_in_industry
FROM startup_clean
WHERE investors_name IS NOT NULL
AND industry_vertical IS NOT NULL
GROUP BY
       investors_name,industry_vertical
ORDER BY
       investors_name,funding_rounds_invested_by_investor_in_industry DESC LIMIT 30;

-- Q49 : In how many different industries has each investor invested?
SELECT
       investors_name,COUNT(DISTINCT industry_vertical) AS industries_invested
FROM startup_clean
WHERE
       investors_name IS NOT NULL
AND industry_vertical IS NOT NULL
GROUP BY
       investors_name
ORDER BY
       industries_invested DESC LIMIT 30;

-- Section 4 — Investor Analysis

-- Q50 : For every investor, which investment types do they participate in most frequently?
SELECT
       investors_name,investment_type,COUNT(*) AS frequent_investment_types
FROM startup_clean
WHERE investors_name IS NOT NULL
AND investment_type IS NOT NULL
GROUP BY
       investors_name,investment_type
ORDER BY
       frequent_investment_types DESC LIMIT 30;


-- Q51 : For every investor, which cities do they invest in most frequently?
SELECT
       investors_name,city_location,COUNT(*) AS how_many_types_investor_invested_in_this_city
FROM startup_clean
WHERE investors_name IS NOT NULL
AND city_location IS NOT NULL
GROUP BY
       investors_name,city_location
ORDER BY how_many_types_investor_invested_in_this_city DESC LIMIT 30;

-- Q52 : For every investor, which startups have they invested in most frequently?
SELECT
       investors_name,startup_name,COUNT(*) AS how_many_times_investor_invested_in_this_startup
FROM startup_clean
WHERE investors_name IS NOT NULL
AND startup_name IS NOT NULL
GROUP BY
       investors_name,startup_name
ORDER BY how_many_times_investor_invested_in_this_startup DESC LIMIT 30;

-- Section 5 — Startup Analysis

-- Q53 : For every startup, what kinds of investment types has it received?
SELECT
       startup_name,investment_type,COUNT(*) AS different_investments_type_received_by_startup
FROM startup_clean
WHERE startup_name IS NOT NULL
AND investment_type IS NOT NULL
GROUP BY
       startup_name,investment_type
ORDER BY different_investments_type_received_by_startup DESC LIMIT 30;

-- Q54 : For every startup, how has its funding progressed over time?
SELECT
       startup_name,YEAR(funding_date) AS year,SUM(amount_usd) AS funding_progressed_over_time
FROM startup_clean
WHERE startup_name IS NOT NULL
AND amount_usd IS NOT NULL
GROUP BY
       startup_name,year
ORDER BY
       startup_name,year limit 10;

-- Q55 : For every startup, which investors have invested in it?
SELECT
    startup_name,
    investors_name,
    COUNT(*) AS funding_rounds
FROM startup_clean
WHERE startup_name IS NOT NULL
AND investors_name IS NOT NULL
GROUP BY
    startup_name,
    investors_name
ORDER BY
    funding_rounds DESC
LIMIT 30;

-- Phase 6 — Business Questions

-- Q56 : Which startups have raised the highest total funding?
SELECT
       startup_name,SUM(amount_usd) AS total_funding_raised
FROM startup_clean
WHERE startup_name IS NOT NULL
GROUP BY startup_name
ORDER BY total_funding_raised DESC LIMIT 20;


-- Q57 : Which investors have invested the largest total amount?
SELECT
       investors_name,SUM(amount_usd) AS total_amount_invested
FROM startup_clean
WHERE investors_name IS NOT NULL
GROUP BY investors_name
ORDER BY total_amount_invested DESC LIMIT 20;

-- Q58 : Which investors have participated in the largest number of funding rounds?
SELECT
    investors_name,
    COUNT(*) AS funding_rounds
FROM startup_clean
WHERE investors_name IS NOT NULL
GROUP BY investors_name
ORDER BY funding_rounds DESC
LIMIT 20;

-- Q59 : Which cities have attracted the largest total funding?
SELECT
city_location, SUM(amount_usd) AS total_funding
FROM startup_clean
WHERE city_location IS NOT NULL
GROUP BY city_location
ORDER BY total_funding DESC LIMIT 20;

-- Q60 : Which industries have attracted the largest total funding?
SELECT
       industry_vertical,SUM(amount_usd) AS largest_total_funding
FROM startup_clean
WHERE industry_vertical IS NOT NULL
GROUP BY industry_vertical
ORDER BY largest_total_funding DESC LIMIT 20;

-- Q61 : What are the largest individual funding rounds in the dataset?
SELECT
       investment_type,startup_name,amount_usd
FROM startup_clean
WHERE investment_type IS NOT NULL
AND startup_name IS NOT NULL
ORDER BY amount_usd DESC LIMIT 20;

-- Q62 : Executive Summary (No SQL)

-- Write observations such as:

-- Top startup ecosystem
-- Top investors
-- Top industries
-- Funding trends
-- Data quality issues
-- Key conclusions
-- we will do it together as now all the queries are written
