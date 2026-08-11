UPI Transaction Analysis | Data Analytics Capstone

An end-to-end Data Analytics project focused on analyzing UPI transaction data to identify transaction trends, fraud patterns, operational issues, customer and merchant behavior, device-level risks, and regional performance.

Project Overview

Digital payment platforms process large volumes of transactions across customers, merchants, devices, and regions. With this growth, organizations need to monitor transaction performance, identify fraud risks, understand transaction failures, and improve operational efficiency.

This project analyzes UPI operational, transactional, customer, merchant, device, and risk data to generate meaningful KPIs, identify high-risk segments, and provide actionable business recommendations.

Business Objectives
Analyze UPI transaction trends and transaction performance.
Identify patterns associated with fraudulent transactions.
Analyze transaction failure rates and operational bottlenecks.
Identify high-activity and high-risk customers, merchants, and devices.
Compare transaction performance across regions and device types.
Develop KPIs for business and operational monitoring.
Build interactive Power BI dashboards for decision-making.
Provide data-driven recommendations for improving platform performance and risk management.
Tools & Technologies
Excel – Data validation, data quality checks and exploratory summaries
SQL / MySQL – Database design, data ingestion, joins, aggregations and analytical queries
Python – Data cleaning, EDA, statistical analysis and visualization
Pandas & NumPy – Data manipulation and analysis
Matplotlib & Seaborn – Data visualization
SciPy / Statistics – Hypothesis testing and statistical analysis
Power BI – Interactive dashboards, KPI reporting and business insights
Jupyter Notebook – Python-based analysis
Dataset

The project uses multiple related datasets covering:

Customer information
UPI account details
Merchant information
Device information
UPI transaction history
Customer feedback
Fraud alerts

The project validates relationships between customers, UPI accounts, merchants, devices, and transactions before analysis.

Data Analytics Process
1. Business Understanding

Defined business questions around:

Fraud risk
Transaction failures
Customer behavior
Merchant activity
Device risk
Regional performance

Key KPIs include transaction volume, transaction failure rate, fraud detection rate, merchant activity, customer retention, and device risk.

2. Data Validation & Cleaning

Performed data validation and quality checks including:

Missing-value identification
Duplicate/inconsistent records
Categorical value standardization
Date-format validation
Foreign-key consistency checks
Data-quality logging
3. SQL Database Analysis

Created and structured relational tables and used SQL for:

Data extraction
Table joins
Aggregations
KPI calculations
Customer, merchant and transaction analysis
Data integrity validation
4. Exploratory Data Analysis

Used Python to analyze:

Transaction amount distributions
Transaction trends
Merchant activity
Device usage
Regional performance
High-activity customers
High-risk segments
5. Fraud & Risk Analysis

Analyzed fraud patterns across:

Device types
Regions
Merchants
Transaction channels
Transaction values
Customer risk scores

Statistical techniques included t-tests, ANOVA, chi-square tests, and correlation analysis.

6. Power BI Dashboard

Developed interactive dashboards covering:

Total Transactions
Average Transaction Amount
Transaction Failure Rate
Fraud Rate
Top Merchants
Top Devices
Regional Performance
Transaction Trends
High-Risk Merchants and Devices

Dashboard filters include time period, region, device type, merchant, and transaction status.

Key Findings

The analysis of 100,000 UPI transactions from 2020–2022 identified several important business insights:

Overall fraud rate was 2%, indicating that most transactions were legitimate.
Transaction failure rate was 6%, making failed transactions a larger operational challenge than fraud.
Fraud transactions declined from 717 in 2020 to 604 in 2022.
The North region generated the highest transaction activity.
Android devices accounted for the largest share of transaction activity.
A relatively small group of merchants contributed a significant share of transaction volume and value.
Business Recommendations

Based on the analysis:

Reduce transaction failures through infrastructure improvements and retry mechanisms.
Strengthen merchant risk monitoring using automated alerts and anomaly detection.
Enhance security controls and fraud monitoring for high-volume device segments.
Focus merchant onboarding and customer acquisition efforts on growth regions.
Continue monitoring fraud trends while maintaining existing fraud-prevention controls.
Project Outcome

The project demonstrates an end-to-end analytics workflow:

Raw Data → Data Validation → SQL Database → Data Cleaning → EDA → Statistical Analysis → KPI Development → Power BI Dashboard → Business Insights → Recommendations

The project showcases practical skills in SQL, Python, Excel, Power BI, statistics, data visualization, and business analytics.

Repository Structure
UPI-Transaction-Analysis/
│
├── README.md
├── data/
│   └── sample_data/
│
├── sql/
│   ├── database_schema.sql
│   ├── data_validation.sql
│   └── analysis_queries.sql
│
├── python/
│   └── UPI_Transaction_Analysis.ipynb
│
├── powerbi/
│   └── UPI_Transaction_Dashboard.pbix
│
├── reports/
│   └── Strategic_Insights_Report.pdf
│
└── images/
    ├── dashboard.png
    └── analysis_charts.png
Author

Anurag Sharma
