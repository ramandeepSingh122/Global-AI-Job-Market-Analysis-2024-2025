# Global-AI-Job-Market-2024-2025

**Overview**
The Global AI Jobs Analysis 2024–2025 project provides a comprehensive examination of the worldwide AI job market, focusing on salaries, job roles, experience levels, skills demand, industries, and geographic trends. This project combines data cleaning, SQL-based analysis, Power BI visualizations, and predictive modeling to deliver actionable insights for job seekers, recruiters, and industry analysts.
Key objectives:
Analyze salary trends across job titles, companies, and countries,
Identify top-paying roles and most in-demand skills,
Examine company and industry hiring patterns,
Explore geographic trends and remote work adoption,
Provide predictive insights for AI job salaries using Python and machine learning.
This project is designed as an end-to-end workflow: raw dataset → cleaning → SQL analysis → CSV exports → Power BI dashboard → predictive modeling in Python.

**Dataset**
Source: Kaggle – Global AI Job Market Trends & Salary Insights 2025
 you can find dataset at : | `ai_job_dataset.csv` | [Original Kaggle dataset](datasets/ai_job_dataset.csv) |

**Data Cleaning**
First the dataset was imported in Microsoft Excel for Data cleaning 
Cleaning Steps:
1. Removed duplicate rows,
2. Corrected missing Job IDs (e.g., ID0001, ID0002…),
3. Standardized column names (snake_case),
4. Clarified coded fields:
Experience Level: EN → Entry, MI → Mid, SE → Senior, EX → Executive,Employment Type: CT → Contract, FT → Full-time, PT → Part-time, FL → Freelance,
5. Normalized salary fields: salary_usd → salary, kept currency in salary_currency,
6. Added clarity: min_experience_req in years, remote_ratio as %,
7. Added work_type column (Remote / Hybrid / On-site)
Tools Used: Microsoft Excel for cleaning, formatting, and validation

**Analysing Data**
Queries executed in MySQL to analyse data and determine underlying patters , trends to formulate meaningful insights
Some of analyses performed:
1.Average salary by job title.
2.Top 10 paying jobs,
3.Salary distribution by company size,
4.Jobs by experience level,
5.Top industries and companies,
6.Skills and education requirements,
7. Location analysis and top countries hiring,
8. Time trends and job posting analysis,
9. Advanced analyses like salary growth trend, benefit score correlation, and job description length impact on salary and many more
All the queries executed can be find here
All the results of queries were imported in MS excel as CSv file for visualization and Further analysis using Python.

**Visualization**
For visualizing data PowerBI desktop was used . entire report was divided into 5 pages for efficient storytelling.
1.Salary insights,
2.Experience & skills insights
3.Company & industry insights
4.Location analysis & insights
5.Time trends and analysis
Dashboard can be find in the following Power Bi file.

**Predictive Analysis**
We built a model to predict AI job salaries based on factors like job title, experience level, skills, location, and company size.
What we predicted:
Estimated salaries for different AI roles around the world,How experience, skills, remote work, and location affect salaries,Trends showing which jobs or countries pay more.
Results:
1. The model gives approximate salaries (MAE: 42,636 USD).
2. It helps understand general patterns in the AI job market, even if exact numbers vary.
Key Takeaway:
This prediction shows which roles, skills, and locations tend to pay higher, helping job seekers and recruiters make informed decisions.

