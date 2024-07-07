# DBT-Snowflake-Orders Project

## Overview
This project is the culmination of a Database Bootcamp at Altia. It uses Snowflake and the TPCH sample database to simulate a delivery business database. The project employs DBT Cloud for data modeling.

## Workflow
To build the project, the following steps were undertaken:

1. **Analysis and Understanding**: Thorough analysis and comprehension of the TPCH database structure and data.
2. **Objective Setting**: Establishing the project's objectives.
3. **RAW Data in Snowflake**: Setting up raw data in Snowflake, designed to receive data from TPCH incrementally, simulating ongoing order receipt.
4. **Dimensional Modeling**: Building and implementing a dimensional model using DBT.
5. **Aggregate Tables**: Creating aggregate tables to facilitate analytics.
6. **Snowflake Dashboard**: Developing a dashboard in Snowflake.
7. **User Access**: Creating a customer user and granting access to the analytics and dashboard.

## Shops and events
In addition to the TPCH database, custom tables for Shops and Events were created. These tables simulate different real-world scenarios such as varying currency exchange rates and different time zones. This allows for more robust testing and analysis of the data under diverse conditions.

## Snowflake Dashboard
The dashboard includes graphics and tables for data analysis. It features several filters for easy data manipulation.

![filters](https://github.com/GoroMigue/dbt-snowflake-orders/assets/162487939/30b10839-679d-4290-a5af-3f016f79797b)
![overview](https://github.com/GoroMigue/dbt-snowflake-orders/assets/162487939/46534f82-40d7-43b0-a491-03929963bb9b)
![nations](https://github.com/GoroMigue/dbt-snowflake-orders/assets/162487939/42bd8949-c924-4939-8160-80368892d21e)
![shops](https://github.com/GoroMigue/dbt-snowflake-orders/assets/162487939/7079065a-8ef0-467f-a7a0-24fc6e858bd7)
![events](https://github.com/GoroMigue/dbt-snowflake-orders/assets/162487939/fa4ce9ec-82b3-4976-a654-677fc7c3c27e)
![parts](https://github.com/GoroMigue/dbt-snowflake-orders/assets/162487939/3ac8c3a4-71ac-4083-8838-ed04f4adb437)

## Models
![dbtmodel](https://github.com/GoroMigue/dbt-snowflake-orders/assets/162487939/c4c17dbb-3f4e-4b09-b325-c3f5128a7a0e)
![dimmodel](https://github.com/GoroMigue/dbt-snowflake-orders/assets/162487939/2fa8a866-3010-4df7-8e98-eb34dc03b837)

## Conclusion
This project demonstrates the integration of Snowflake and DBT Cloud to manage and analyze delivery business data effectively.

