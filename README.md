# Overview
This is a comprehensive, normalized relational database system designed to manage daily operations, inventory, and sales analytics for a pastry shop business.

# Used Tools
- **Oracle SQL Developer:** The primary IDE used for database administration, schema modeling, and developing PL/SQL packages.
- **Visual Studio Code:** The primary code editor used for writing, debugging, and managing the project codebase.
- **Git & GitHub:** Used for version control, tracking project iterations, and hosting the remote repository.

# The Goal
To architect a Third Normal Form (3NF) relational database that **automates business** logic via PL/SQL and delivers actionable business intelligence through advanced analytical SQL queries.

# Project Architecture
This repository is divided into two parts: the foundational schema definition (standard SQL) and advanced business logic implementation (PL/SQL).

# Database Schema
![ERD](images/entity_relationship_diagram.png)

These are the main roles of the tables we will be using:
- **Clients** (Clienti_v): Stores customer demographics, contact details, preferences, and accumulated loyalty points.   
- Employees (Angajati_v) & Roles (Functii_v): Manages staff records, hire dates, and maps employees to their respective job roles and base salaries. This table includes an id_manager attribute, allowing for recursive queries to model organizational hierarchies.   
- **Products** (Produse_v) & Reviews (Recenzii_v): Catalogs inventory, product categories, and customization options. It now connects to a reviews entity to track product-specific customer satisfaction scores and feedback dates.   
- **Orders** (Comenzi_v) & **Order Lines** (Rand_comenzi_v): Captures core transactional data, mapping multiple products, prices, and quantities to specific customer orders and processing employees.   
- **Payments** (Plati_v): Tracks financial transactions, linking payment amounts, dates, and methods directly to their corresponding orders.   
- **Deliveries** (Livrari_v): Manages order logistics by storing delivery addresses, current statuses, and delivery dates.   
- **Recipes** (Retete_v) & **Recipe Components** (Produse_retete_v): Details preparation times and maps specific recipes to their final products.

# Database Setup
To deploy this database locally, execute the scripts in the [schema/](schema) directory in the following order:
1. **tables_creation.sql**: Defines the base 3NF relational structures.   
2. **alter_tables.sql**: Applies structural modifications and schema updates.   
3. **constraints.sql**: Enforces primary keys, foreign keys, and data integrity rules.
4. **db_objects_setup.sql**: Defines auto-incrementing sequences, creates indexes for faster lookups, and establishes reporting views.
5. **data_insertion.sql**: Populates the tables with sample transactional records for testing.

# Business Intelligence & Analytics
The [business_intelligence/](business_intelligence) directory contains business-focused SQL scripts categorized by domain. These scripts demonstrate data extraction, transformation, and aggregation to drive business decisions.
- **customer_analytics.sql**: Analyzes customer demographics and loyalty program metrics.
- **sales_and_inventory.sql**: Tracks order values, product profitability, and recipe preparation times.
- **hr_and_operations.sql**: Manages employee roles, salary adjustments, and staff performance metrics.
- **analytical_reports.sql**: Advanced window functions for time-series analysis and ranked reporting.