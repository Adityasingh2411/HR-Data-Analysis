# HR-Data-Analysis

📌 Overview:
This project analyzes employee attrition and workforce dynamics using SQL for data exploration and Power BI for dashboarding. It uses the IBM HR Analytics Attrition & Performance dataset.


📌 Project Objective:
The primary goal is to identify key factors contributing to employee attrition and offer data-driven insights to improve retention and employee satisfaction.

🧰 Tools Used

Data Processing - MySQL
 
Visualization  - Power BI
 
Data Cleaning & Preprocessing

EDA & Visualization

📁 Data Source:IBM HR Analytics Employee Attrition & Performance(https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)

Process overview:

* Data Cleaning - Dropped redundant columns:   “EmployeeCount”, “Over18”, “Standard Hours”.

* Feature Engineering - Added “AttritionFlag”: 1   if Attrition = 'Yes', else 0.Created   “Age_group” based on age bins.

* Mapped encoded values - (e.g., “Education”,   “JobSatisfaction”) to readable labels.

* Exploratory Data Analysis:Uncovered patterns   using visualizations.

* Suggestions & Recommendations: Based on   insights.

Understanding Requirements-

 - How many active employees are there?
 - How Does Attrition Differ by Gender? 
 - Department-wise Attrition Comparison
 - Attrition Risk Across Employee Age Bands
 - Attrition Hotspots by Role
 - Attrition Trends by Employee Education
 - How Does Overtime Impact Attrition?
 - Is Marital Status Linked to Attrition?
 
📌Result-

1) The company has total 1470 employees, out of    which 1233 employees (83.88%) are still    working with the company (active) while    237employees (16.12%) are those who resigned    the company or terminated by the HR .The    overall Attrition rate is 16.12%

2) Gender wise attrition ratio of employees         in the company male to female are 150:87.

3) Sales department has maximum attrition rate    (20.63%) and Research & Development    department has minimum attrition rate    (13.84%).

4) While the 25–34 age group had the highest    number of leavers,accounting for nearly       half of all leavers. Age 18-24 had the       highest attrition rate, making them the most     at-risk group for turnover. 

5) Sales Representatives have the highest    attrition rate at nearly 40%, significantly    above all other roles. Laboratory Technicians    and HR professionals also show elevated    attrition rates above 23%.Leadership and       technical roles, such as Managers and    Research Directors, experience the lowest    attrition.

6) Employees with Below College and Bachelor    degrees show the highest attrition rates at    18.24% and 17.31%, respectively.Attrition    gradually decreases with higher education    levels, reaching the lowest among Doctorate    holders (10.42%).

7) Employees who work overtime have a    significantly higher attrition rate.
   Male employees with overtime show the highest    attrition at 33.9%, followed by females at    26.1%.
   In contrast, those not working overtime have    much lower attrition (around 10%).

8) Single employees have the highest attrition    rate at 25.53%, nearly double that of married    and divorced employees.Married employees show    a moderate attrition rate (12.48%), while    divorced employees have the lowest at 10.09%.


⚠️ Limitations 
-  No date fields (like joining/resignation dates) are    available, so this is a static cross-sectional analysis.

You can find my project here:
GitHub - 


👤 Author

Name: Aditya Singh

Role: Aspiring Data Analyst

