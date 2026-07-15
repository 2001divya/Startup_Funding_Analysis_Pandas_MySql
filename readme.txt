# Startup Funding Analytics (Pandas + MySQL)

An end-to-end data analytics project that explores the Indian startup funding ecosystem using Python (Pandas)
for data cleaning and preprocessing, and MySQL for exploratory data analysis, business reporting, and insight generation.
The project demonstrates the complete workflow of transforming a messy real-world dataset into meaningful business insights 
through systematic data cleaning, SQL analysis, and documentation.

---

# Table of Contents

- Project Overview
- Objectives
- Dataset Information
- Technology Stack
- Data Cleaning & Preprocessing
- Database Design
- SQL Concepts Demonstrated
- Exploratory Data Analysis
- Business Questions Answered
- Key Insights
- Challenges Faced
- Data Quality Challenges
- Limitations
- Skills Demonstrated
- Lessons Learned
- Resume Highlights
- Author


# Project Overview

Startup funding data often contains inconsistent formatting, missing values, duplicated entities, encoding problems, and
mixed data types that prevent meaningful analysis. The objective of this project was not only to answer business questions
but also to build a complete analytics workflow similar to what a data analyst would perform in an industry setting.
The project begins with a raw CSV dataset, proceeds through extensive data cleaning using Pandas, imports the cleaned 
dataset into MySQL, performs exploratory data analysis using SQL, and concludes with business reporting and documentation.
Unlike many SQL practice projects, this repository documents the complete analytical process, including the challenges 
encountered during data cleaning and the reasoning behind each correction.

---

# Objectives

The primary objectives of this project were:

- Import and understand a real-world startup funding dataset.
- Clean inconsistent and missing data using Pandas.
- Import the cleaned dataset into MySQL.
- Validate data integrity after import.
- Perform descriptive statistical analysis.
- Conduct exploratory data analysis using SQL.
- Answer business-oriented analytical questions.

---

# Dataset Information
Dataset: Indian Startup Funding Dataset

Contains startup funding transactions between 2015 and 2020.

Major attributes include:

- Funding Date
- Startup Name
- Industry Vertical
- Sub-Vertical
- City Location
- Investors
- Investment Type
- Amount (USD)
- Remarks

After cleaning, the working dataset contains approximately 3,000 funding records
covering hundreds of startups, investors, industries, and cities.

---

# Technology Stack

## Python

- Pandas
- Sqlalchemy

Used for:

- Initial exploration
- Missing value analysis
- Data cleaning
- Datatype conversion
- Standardization

---

## MySQL

Used for:

- Data import
- Data validation
- SQL analysis
- Aggregation
- Business reporting


---

# Data Cleaning & Preprocessing

Several real-world data quality issues were identified and resolved during the project.

## Missing Values

- Examined null values for every column.
- Determined where missing values could be inferred and where they could not.
- Preserved records whenever reliable inference was possible.

## Date Conversion

Converted funding dates into proper SQL DATE format.

## Numeric Cleaning

Converted funding amounts into numeric values suitable for aggregation.

## Startup Name Standardization

Corrected inconsistencies such as:

- BYJU'S
- Escaped Unicode representations
- Duplicate naming conventions

## Investment Type Cleaning

Resolved escaped values including:

Seed\nFunding
to
Seed Funding

## Unicode / Encoding Issues

Investigated several encoding problems using SQL functions such as:

- HEX()
- LENGTH()
- CHAR_LENGTH()
- SUBSTRING()

Resolved escaped prefixes including:

\xc2\xa0CloudCherry
to
CloudCherry

---

# Database Design

Table:

startup_clean

Major columns:

- funding_date
- startup_name
- industry_vertical
- sub_vertical
- city_location
- investors_name
- investment_type
- amount_usd
- remarks

---

# SQL Concepts Demonstrated

This project demonstrates practical usage of:

- SELECT
- WHERE
- GROUP BY
- HAVING
- ORDER BY
- LIMIT
- DISTINCT
- Aggregate Functions
- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()
- CASE Expressions
- Subqueries
- Multi-dimensional Aggregation

---

# Exploratory Data Analysis

The project performs several levels of analysis.

## Dataset Understanding

- Record count
- Time span
- Funding range
- Cardinality
- Missing values

## Descriptive Statistics

- Average funding
- Total funding
- Funding counts
- Distribution analysis

## Geography Analysis

- Funding by city
- Most active startup ecosystems
- City-wise funding distribution

## Industry Analysis

- Industry-wise funding
- Most funded sectors
- Funding trends

## Investor Analysis

- Most active investors
- Investment diversity
- Funding participation

## Startup Analysis

- Funding history
- Funding progression
- Startup-level summaries

---

# Business Questions Answered

The project answers business-oriented SQL questions, including:

- Which startups raised the most funding?
- Which cities dominate startup funding?
- Which industries attract the highest investment?
- Which investors participate most frequently?
- How has funding changed over time?
- Which investment types dominate the ecosystem?
- Which startups received the largest individual funding rounds?

---

# Key Insights

Some major findings include:

- Bengaluru is the dominant startup ecosystem.
- Mumbai, Gurugram and New Delhi follow as major funding hubs.
- Consumer Internet and E-commerce dominate startup activity.
- Private Equity accounts for the highest funding amounts.
- Seed Funding is the most common funding type.
- Funding activity peaked during the middle years of the dataset.
- Several investors appear across multiple industries.

---
# Challenges Faced

During this project, several practical challenges were encountered:

- Importing the dataset into MySQL while preserving datatypes.
- Investigating discrepancies between Pandas and MySQL record counts.
- Resolving escaped Unicode strings such as `Byju\xe2\x80\x99s`.
- Cleaning escaped text values such as `Seed\nFunding`.
- Removing escaped prefixes (`\xc2\xa0`) from startup names.
- Deciding when to standardize records and when to preserve original values.

# Data Quality Challenges

The project encountered several practical challenges including:

- Missing values
- Escaped Unicode characters
- Startup naming inconsistencies
- Investment type inconsistencies
- Multiple investors stored within a single field
- Mixed city naming conventions
- Encoding artifacts introduced during import

Each issue was investigated before applying targeted corrections.

---

# Limitations

Some limitations remain intentionally documented:

- Investor names are not normalized into separate entities.
- Multiple investors appear within a single record.
- Some city names represent multiple locations.
- Historical naming differences remain where business identity was ambiguous.

---

# Skills Demonstrated

- Data Cleaning
- Data Validation
- Exploratory Data Analysis
- SQL
- MySQL
- Pandas
- Business Analytics
- Documentation
- GitHub

---
# Lessons Learned

This project provided practical experience in working with real-world data rather than perfectly cleaned datasets.

Some of the major lessons learned include:

- Investigating missing values before deciding whether to remove records.
- Understanding how inconsistent naming affects analytical results.
- Using SQL validation queries after every cleaning operation.
- Debugging encoding problems using HEX(), LENGTH(), CHAR_LENGTH(), and SUBSTRING().
- Applying aggregate functions and GROUP BY to answer business questions.
- Recognizing the importance of documenting the complete analytical workflow.

# Resume Highlights

- Cleaned and standardized a real-world startup funding dataset using Pandas and MySQL.
- Designed and executed over 60 SQL queries for exploratory and business analysis.
- Investigated and resolved multiple real-world data quality issues.

---

# Author
Divya Bariya