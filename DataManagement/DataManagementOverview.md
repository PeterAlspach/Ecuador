Data Management Overview
========================================================
author: Peter Alspach
date: July 2017
autosize: true
font-family: "Times New Roman", Times, serif

Why is data management important?
========================================================

* Data is an important asset for INIAP and you as a researcher
* Good data management can
    + Increase efficiency
    + Improve data quality
    + Improve ability to use historical data
    + Reduce wastage
    + Enhance reproducibility

What is data?
========================================================

* It is __not__ just the numbers collected
* It includes
    + Trial protocol (e.g., researchers, treatments, trial design, field plan, sample layout, units of measurement, and so on)
    + Trial history (e.g., when measurements were collected, what went on, weather, __audit trail__ of data)
* Meta-data

FAIR data
========================================================

[FAIR](https://www.nature.com/articles/sdata201618) data are

* Findable
* Accessible
* Interoperable
* Reusable

The data-chain
========================================================

* Research planning
* Plan data collection and storage
* Data collection
* Entering and checking data
* Reorganising data
* Calculation and analysis
* Publicatiion (internal or external)
* Long-term storage

Data collection and storage
========================================================

* For many projects, flat-files (i.e., Excel spreadsheets) are satisfactory if [well used](https://github.com/PlantandFoodResearch/BestPractices/blob/master/general/best_practices_excel_data_file.md)
* For projects with larger amounts of data from different sources (e.g., manually and automatically collected, using complex equipment) and intended to run over a number of years, [relational databases](https://en.wikipedia.org/wiki/Relational_database), using [SQL](https://en.wikipedia.org/wiki/SQL) are advisable (i.e., __not__ MicroSoft Access).  [NoSQL](https://en.wikipedia.org/wiki/NoSQL) is becoming increasingly popular
