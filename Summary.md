Executive Summary


1. Startup Ecosystem

- Bengaluru emerged as the leading startup ecosystem, recording the
  highest number of funding rounds as well as the highest total funding.
- Mumbai, Gurugram and New Delhi were the next most active startup hubs.

----------------

2. Industry Analysis

- Consumer Internet and E-commerce dominated the dataset in terms of
  funding activity.
- E-commerce attracted the highest total funding, followed by
  Consumer Internet and Technology.
- Several niche industries appeared only once or twice, indicating
  a highly concentrated funding landscape.

------------------

3. Investment Trends

- Seed Funding was the most common investment type by number of
  funding rounds.
- Private Equity accounted for the largest share of funding amount,
  indicating that mature startups attracted significantly larger
  investments.

-----------------

4. Investor Analysis

- Undisclosed Investors appeared most frequently in the dataset.
- Among identified investors, Indian Angel Network, Ratan Tata,
  Sequoia Capital, Kalaari Capital and SAIF Partners participated
  across multiple industries.
- Several funding rounds involved groups of investors stored together
  in a single field, limiting investor-level analysis.

---------------

5. Time Trends

- The majority of funding activity occurred between 2015 and 2017.
- Funding amounts varied considerably across years, with a few
  exceptionally large funding rounds contributing significantly to
  yearly totals.
- The dataset contains relatively few records for 2020.

----------------

6. Data Quality Issues

During data cleaning, several issues were identified and corrected:

- Missing values in multiple columns.
- Date conversion and datatype standardization.
- Startup name inconsistencies (e.g. BYJU'S).
- Escaped text sequences such as 'Seed\nFunding'.
- Escaped Unicode prefixes (e.g. '\xc2\xa0CloudCherry').
- Minor inconsistencies in city names and startup naming conventions.
- Multiple investors recorded within a single field, preventing
  individual investor-level normalization.

---------------

7. SQL Concepts Demonstrated

This project demonstrates practical usage of:

- SELECT
- WHERE
- GROUP BY
- HAVING
- ORDER BY
- LIMIT
- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()
- DISTINCT
- CASE
- Aggregate Functions
- Subqueries
- Multi-dimensional aggregation
- Exploratory Data Analysis using SQL

--------------

8. Conclusion

This project demonstrates an Python - SQL analytics workflow,
including data import, cleaning, exploratory data analysis,
cross-dimensional analysis and business reporting using a real-world
startup funding dataset.