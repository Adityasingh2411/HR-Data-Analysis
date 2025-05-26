CREATE DATABASE employees;
USE employees;

-- =========================================== Exploratory Data Analysis ==========================================================

SELECT COUNT(*) AS total_employees FROM employees;

SELECT * FROM employees LIMIT 10;

DESCRIBE employees;

SELECT 
    MIN(Age) AS min_age, MAX(Age) AS max_age,
    MIN(MonthlyIncome) AS min_income, MAX(MonthlyIncome) AS max_income,
    MIN(TotalWorkingYears) AS min_work_years, MAX(TotalWorkingYears) AS max_work_years
FROM employees;

SELECT 
    avg(Age) AS avg_age
FROM employees;

-- checking for null values
SELECT 
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS age_nulls,
    SUM(CASE WHEN Attrition IS NULL THEN 1 ELSE 0 END) AS attrition_nulls,
    SUM(CASE WHEN BusinessTravel IS NULL THEN 1 ELSE 0 END) AS travel_nulls,
    SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS dept_nulls,
    SUM(CASE WHEN JobRole IS NULL THEN 1 ELSE 0 END) AS role_nulls
    -- Add more columns as needed
FROM employees;

-- checking for duplicates
SELECT EmployeeNumber, COUNT(*) 
FROM employees 
GROUP BY EmployeeNumber 
HAVING COUNT(*) > 1;

-- Understanding Categorical Columns
SELECT Attrition, COUNT(*) AS total 
FROM employees 
GROUP BY Attrition;

SELECT Department, COUNT(*) AS total 
FROM employees 
GROUP BY Department;

SELECT Gender, COUNT(*) AS total 
FROM employees 
where AttritionFlag = 0
GROUP BY Gender;

SELECT OverTime, COUNT(*) AS total 
FROM employees 
GROUP BY OverTime;

-- ================================================== Cleaning ==========================================================

SELECT distinct(EmployeeCount)
from employees;

SELECT distinct(Over18)
from employees;

SELECT distinct(StandardHours)
from employees;

Set SQL_SAFE_UPDATES = 0;

Alter table employees
drop column EmployeeCount,
drop column  Over18,
drop column StandardHours;

SELECT DISTINCT Department FROM employees;
SELECT DISTINCT JobRole FROM employees;
SELECT DISTINCT EducationField FROM employees;

ALTER TABLE employees ADD COLUMN AttritionFlag INT;

UPDATE employees
SET AttritionFlag = CASE 
    WHEN Attrition = 'Yes' THEN 1
    ELSE 0
END;

select min(Age),max(Age)
from employees;

Alter table employees
add column Age_group varchar(10);

Update employees
SET Age_group = case 
	when Age between 18 and 24 THEN "18-24"
    when Age between 25 and 34 THEN "25–34"
    When Age between 35 and 44 THEN "35–44"
    When Age between 45 and 54 THEN "45–54"
    When Age between 55 and 60 THEN "55–60"
    Else 0
End;

-- ====================================================== Business Questions ===============================================

-- Q1. What is the overall attrition rate?
SELECT 
    COUNT(*) AS Total_employees,
    (select count(AttritionFlag) from employees where AttritionFlag = 0)as Active_employees,
    SUM(AttritionFlag) AS Employees_left,
    ROUND(SUM(AttritionFlag) / COUNT(*) * 100, 2) AS Attrition_rate_percentage
FROM employees;

-- Q2. How does attrition differ by gender?
SELECT 
    Gender,
    SUM(AttritionFlag) AS total
FROM employees
where AttritionFlag =1
GROUP BY Gender
ORDER BY SUM(AttritionFlag) DESC;

-- Q3. Department-wise Attrition Comparison
SELECT 
    Department,
    COUNT(*) AS total_in_dept,
    SUM(AttritionFlag) AS attrition_count,
    ROUND(SUM(AttritionFlag) / COUNT(*) * 100, 2) AS attrition_rate
FROM employees
GROUP BY Department
ORDER BY attrition_rate DESC;
SELECT * FROM employees LIMIT 10;

-- Q4. Attrition Risk Across Employee Age Bands
SELECT 
    Age_group,
    COUNT(*) AS total_employees,
    SUM(AttritionFlag) AS employees_left,
    ROUND(SUM(AttritionFlag) / COUNT(*) * 100, 2) AS attrition_rate
FROM employees
GROUP BY Age_group
ORDER BY attrition_rate DESC;

-- Q5. Attrition Hotspots by Job Role
SELECT 
    JobRole,
    COUNT(*) AS total,
    SUM(AttritionFlag) AS attrition_count,
    ROUND(SUM(AttritionFlag) / COUNT(*) * 100, 2) AS attrition_rate
FROM employees
GROUP BY JobRole
ORDER BY ROUND(SUM(AttritionFlag) / COUNT(*) * 100, 2) desc;

-- Q6. Attrition Trends by Employee Education
SELECT 
    CASE Education
        WHEN 1 THEN 'Below College'
        WHEN 2 THEN 'College'
        WHEN 3 THEN 'Bachelor'
        WHEN 4 THEN 'Master'
        WHEN 5 THEN 'Doctor'
    END AS EducationLevel,
    COUNT(*) as total,
    SUM(AttritionFlag) AS attrition_count,
    ROUND(SUM(AttritionFlag) / COUNT(*) * 100, 2) AS attrition_rate
FROM employees
GROUP BY Education
Order by Education;

-- Q7. How Does Overtime Impact Attrition?
SELECT gender,overtime,
 COUNT(*) AS total_employees,
    SUM(AttritionFlag) AS employees_left,
    ROUND(SUM(AttritionFlag) / COUNT(*) * 100, 2) AS attrition_rate
from employees
group by gender,overtime
order by  ROUND(SUM(AttritionFlag) / COUNT(*) * 100, 2) desc;

-- Q8. Is Marital Status Linked to Attrition?  
SELECT 
    MaritalStatus,
    COUNT(*) AS total_employees,
    SUM(AttritionFlag) AS employees_left,
    ROUND(SUM(AttritionFlag) / COUNT(*) * 100, 2) AS attrition_rate
FROM employees
GROUP BY MaritalStatus
ORDER BY MaritalStatus desc;
