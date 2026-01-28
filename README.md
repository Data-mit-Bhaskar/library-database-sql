# **Library Database Management System (SQL)**
*A structured SQL-based database system for library operations, designed as part of my **MSc. Data Analytics** program at Berlin School of Business & Innovation (BSBI).*

---

## **📌 Overview**
This project demonstrates my expertise in **database design, SQL implementation, and data analysis**—skills I’ve applied professionally at **Sakon (GSG)** and **Mercedes-Benz** to optimize data workflows and improve decision-making. The system simulates a **library’s core operations**, including:
- **Cataloging books and members**
- **Tracking loans and returns**
- **Generating analytical reports** (e.g., overdue books, member borrowing trends)
- **Ensuring data integrity** through normalization (3NF) and indexing.

The project aligns with my **CV highlights**:
✅ **Reduced data errors by 11%** (Sakon) → Validated here via SQL constraints and data validation.
✅ **Optimized ETL processes by 20%** (Sakon) → Reflected in automated SQL scripts and indexed queries.
✅ **Developed Power BI dashboards** → Translated here into **SQL-based analytical queries** for reporting.

---

## **🔧 Technologies & Tools**
- **Database**: Microsoft SQL Server (SSMS)
- **Language**: SQL (DDL, DML, Joins, Subqueries, Indexing)
- **Concepts**:
  - **ER Diagrams** (Entity-Relationship Modeling)
  - **Normalization** (3NF compliance)
  - **CAP Theorem** (Trade-offs in distributed systems)
- **Validation**: Real-world library scenarios with **simulated datasets**.

## **📂 Project Structure**

library-database-sql/
│
├── sql_scripts/          # SQL scripts for table creation, indexing, and queries
│   ├── 01_create_tables.sql
│   ├── 02_insert_data.sql
│   ├── 03_indexing.sql
│   └── 04_analytical_queries.sql
│
├── documentation/        # Project report, ER diagrams, and CAP Theorem analysis
│   ├── Library_ER_Diagram.png
│   └── CAP_Theorem_Discussion.pdf
│
├── outputs/              # Sample query results (screenshots/tables)
│   ├── overdue_books.png
│   ├── member_borrowing_trends.png
│   └── category_stats.png
│
└── README.md
Copy

---

## **🚀 Key Features**
1. **Database Design**:
   - **4 Tables**: `Book`, `Member`, `Loan`, `Category` (with foreign key constraints).
   - **Normalized to 3NF** to eliminate redundancy and ensure data integrity.
   - **ER Diagram** to visualize relationships (1:M for `Book:Loan`, `Member:Loan`).

2. **Performance Optimization**:
   - **Indexing** on `BookID`, `MemberID`, and `CategoryID` for faster queries.
   - **Complex SQL Queries**:
     - Overdue book tracking (`WHERE ReturnDate IS NULL AND DueDate < GETDATE()`).
     - Member borrowing trends (`GROUP BY` + `HAVING`).
     - Category-wise book statistics (`AVG`, `COUNT`).

3. **CAP Theorem Analysis**:
   - Discusses trade-offs between **Consistency, Availability, and Partition Tolerance** in distributed library systems.
   - Explores how **SQL Server’s ACID properties** align with CAP principles.

---

## **📊 Why This Project?**
This project bridges my **academic training** (MSc. Data Analytics) and **professional experience**:
- **At Sakon**: Automated ETL processes and reduced errors → **Reflected here in SQL scripts for data validation**.
- **At Mercedes-Benz**: Developed time-series models → **Translated here into analytical queries for trend analysis**.
- **Thesis on RPA/ETL**: Inspired the **automation focus** in this project (e.g., indexing for performance).

---
## **🛠 How to Run**
1. **Prerequisites**:
   - Microsoft SQL Server (or [SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)).
   - SQL Server Management Studio (SSMS).

2. **Setup**:
   ```bash
   git clone https://github.com/yourusername/library-database-sql.git


Open sql_scripts/01_create_tables.sql in SSMS and execute.
Populate data using 02_insert_data.sql.
Run analytical queries from 04_analytical_queries.sql.

Example Query:
sql
Copy

-- List all overdue books with member details
SELECT b.Title, b.Author, m.FirstName, m.LastName, l.DueDate
FROM Book b
JOIN Loan l ON b.BookID = l.BookID
JOIN Member m ON l.MemberID = m.MemberID
WHERE l.ReturnDate IS NULL AND l.DueDate < GETDATE();



🔍 Validation with My CV
 
    ﻿CV Highlight,Project Validation
Reduced data errors by 11% (Sakon),SQL constraints (FOREIGN KEY, NOT NULL) ensure data integrity.
Optimized ETL by 20% (Sakon),Indexing (CREATE INDEX) and automated scripts improve performance.
Power BI Dashboards (Sakon),SQL queries here generate report-ready data (e.g., GROUP BY for KPIs).
MBA in Supply Chain Management,Process optimization (e.g., loan tracking) aligns with supply chain logic.
MSc. Data Analytics (BSBI),CAP Theorem discussion and normalization reflect academic rigor.
  

🌟 Future Enhancements

Integrate Python for automated report generation (e.g., pandas + matplotlib).
Extend to NoSQL (e.g., MongoDB) for unstructured data (e.g., member reviews).
Deploy on Cloud (AWS RDS) for scalability testing.

📄 License
This project is licensed under the MIT License—feel free to use, modify, and share!



