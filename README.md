# Practical SQL Case Study  

## Overview  
This repository showcases a collection of practical SQL scenarios designed to address common real-world problems. From identifying duplicate records to fetching specific trends from data, these queries are tailored to illustrate advanced SQL techniques such as window functions, ranking, grouping, and pattern recognition.

## Case Studies and Solutions  

### 1. **Finding Duplicate Records**  
Fetch all duplicate records from a `users` table using window functions.  
**Key Techniques:** `RANK()`, `PARTITION BY`  
**Problem Statement:** Identify entries with the same user name.  

### 2. **Fetching the Second Last Record**  
Retrieve the second last record from an `employee` table.  
**Key Techniques:** `ROW_NUMBER()`, `ORDER BY DESC`  
**Problem Statement:** Rank employees in reverse order to extract the required data.  

### 3. **Highest and Lowest Salaries by Department**  
Display employees earning the highest and lowest salaries in each department.  
**Key Techniques:** `MAX()`, `MIN()`, `PARTITION BY`  
**Problem Statement:** Highlight salary extremes for better HR insights.  

### 4. **Doctors in the Same Hospital but Different Specialities**  
List doctors who work in the same hospital but belong to different specialties.  
**Key Techniques:** `JOIN`, `NOT EQUAL` conditions  
**Problem Statement:** Detect inter-departmental collaborations within hospitals.  

### 5. **Consecutive Logins**  
Identify users who logged in 3 or more times consecutively.  
**Key Techniques:** `LEAD()`, `CASE`, and pattern recognition  
**Problem Statement:** Spot repetitive user behavior for analysis.  

### 6. **Detecting Cold Streaks**  
Fetch records of extremely cold temperatures (<0°C) sustained for 3 or more consecutive days in `London`.  
**Key Techniques:** `LEAD()`, `LAG()`, `CASE`  
**Problem Statement:** Analyze weather anomalies.  

### 7. **Top 2 Accounts by Unique Monthly Patients**  
Identify the top 2 accounts with the highest number of unique patients each month.  
**Key Techniques:** `DISTINCT`, `RANK()`, `GROUP BY`  
**Problem Statement:** Recognize accounts with significant activity to prioritize operations.  

## Highlights  
- Each query is paired with a complete table structure and sample data for easy testing.  
- The solutions use advanced SQL techniques to make analysis efficient and scalable.  
- Suitable for learning and refining SQL skills through hands-on problem-solving.  

## How to Use  
1. Clone the repository.  
2. Run the queries in your preferred SQL environment (MySQL, PostgreSQL, etc.).  
3. Use the sample data provided to test and explore the results.  

## Conclusion  
These practical case studies bridge the gap between theory and real-world database challenges. Whether you're brushing up on SQL or solving operational problems, these queries serve as an excellent resource to enhance your skills.  
