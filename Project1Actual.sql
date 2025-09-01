USE project_2;
DESCRIBE CleanedCSVproject1;
-- Salary Analysis --
-- Average salary by job Title --
SELECT job_title, ROUND(AVG(salary), 2) AS avg_salary, salary_currency
FROM project_2.CleanedCSVproject1
GROUP BY job_title, salary_currency
ORDER BY avg_salary DESC;
 -- Top 10 paying Jobs --
SELECT job_title, company_name, salary, salary_currency
FROM project_2.CleanedCSVproject1
ORDER BY salary DESC
LIMIT 10;
-- Salary distribution by company size
SELECT company_size, ROUND(AVG(salary), 2) AS avg_salary
FROM project_2.CleanedCSVproject1
GROUP BY company_size
ORDER BY avg_salary DESC;

-- Remote work & Remote Type --
-- job counts by work type --
SELECT work_type, COUNT(*) AS total_jobs
FROM project_2.CleanedCSVproject1
GROUP BY work_type;
--  Average salary by remote ratio --
SELECT remote_ratio, ROUND(AVG(salary), 2) AS avg_salary
FROM project_2.CleanedCSVproject1
GROUP BY remote_ratio
ORDER BY avg_salary ;

-- Experience Level --
-- Number of jobs per experience level --
SELECT experience_level, COUNT(*) AS job_count
FROM project_2.CleanedCSVproject1
GROUP BY experience_level
ORDER BY job_count DESC;
-- Average salary by experience level --
SELECT experience_level, ROUND(AVG(salary), 2) AS avg_salary
FROM project_2.CleanedCSVproject1
GROUP BY experience_level
ORDER BY avg_salary DESC;

-- Industry & company insights --
-- Top industries by number of postings --
SELECT industry, COUNT(*) AS total_jobs
FROM project_2.CleanedCSVproject1
GROUP BY industry
ORDER BY total_jobs DESC;
-- Companies offering the most jobs--
SELECT company_name, COUNT(*) AS job_count
FROM project_2.CleanedCSVproject1
GROUP BY company_name
ORDER BY job_count DESC
LIMIT 10;
-- Highest-paying companies (on average)--
SELECT company_name, ROUND(AVG(salary), 2) AS avg_salary
FROM project_2.CleanedCSVproject1
GROUP BY company_name
ORDER BY avg_salary DESC
LIMIT 10;

-- Skills & requirements --
-- Jobs requiring Python--
SELECT job_title, company_name, skills_required
FROM project_2.CleanedCSVproject1
WHERE skills_required LIKE '%Python%';
-- Most common education requirement--
SELECT Eduaction_Required, COUNT(*) AS job_count 
FROM project_2.CleanedCSVproject1
GROUP BY Eduaction_Required
ORDER BY job_count DESC;
-- Average salary by minimum experience required
SELECT Min_Experience_Required, ROUND(AVG(salary), 2) AS avg_salary
FROM project_2.CleanedCSVproject1
GROUP BY Min_Experience_Required
ORDER BY avg_salary DESC;

-- Location Analysis --
-- Top 10 countries hiring most
SELECT company_location, COUNT(*) AS job_count
FROM project_2.CleanedCSVproject1
GROUP BY company_location
ORDER BY job_count DESC
LIMIT 10;
-- Average salary by employee residence--
SELECT employee_residence, ROUND(AVG(salary), 2) AS avg_salary
FROM project_2.CleanedCSVproject1
GROUP BY employee_residence
ORDER BY avg_salary DESC;

-- Time based analysis --
-- Jobs posted per month--
SELECT DATE_FORMAT(STR_TO_DATE(posting_date, '%d-%m-%Y'), '%Y-%m') AS month, 
       COUNT(*) AS total_jobs
FROM project_2.CleanedCSVproject1
GROUP BY month
ORDER BY month;
-- Average days given to apply (Application Deadline – Posting Date)--
SELECT ROUND(AVG(DATEDIFF(STR_TO_DATE(application_deadline, '%d-%m-%Y'), 
                          STR_TO_DATE(posting_date, '%d-%m-%Y'))), 2) AS avg_days_to_apply
FROM project_2.CleanedCSVproject1;

-- Deep Insights --
-- Benefit score vs. salary correlation (grouped view)--
SELECT ROUND(benefit_score, 1) AS benefit_band, 
       ROUND(AVG(salary), 2) AS avg_salary, COUNT(*) AS job_count
FROM project_2.CleanedCSVproject1
GROUP BY benefit_band
ORDER BY benefit_band;
-- Job description length effect on salary
SELECT CASE 
          WHEN job_description_length < 500 THEN 'Short'
          WHEN job_description_length BETWEEN 500 AND 1500 THEN 'Medium'
          ELSE 'Long'
       END AS desc_category,
       ROUND(AVG(salary), 2) AS avg_salary,
       COUNT(*) AS job_count
FROM project_2.CleanedCSVproject1
GROUP BY desc_category
ORDER BY avg_salary DESC;

-- Advanced Analysis --
-- Salary Growth Trend by Year--
SELECT 
    YEAR(STR_TO_DATE(posting_date, '%d-%m-%Y')) AS year, 
    ROUND(AVG(salary), 2) AS avg_salary
FROM project_2.CleanedCSVproject1
GROUP BY year
ORDER BY year;
-- Top 10 Most Demanded Skills --
WITH RECURSIVE split_skills AS (
    SELECT  
        `ï»¿Job_Id` AS Job_Id,
        TRIM(SUBSTRING_INDEX(skills_required, ',', 1)) AS skill,
        SUBSTRING(skills_required, LENGTH(SUBSTRING_INDEX(skills_required, ',', 1)) + 2) AS remaining
    FROM project_2.CleanedCSVproject1

    UNION ALL

    SELECT  
        Job_Id,
        TRIM(SUBSTRING_INDEX(remaining, ',', 1)) AS skill,
        SUBSTRING(remaining, LENGTH(SUBSTRING_INDEX(remaining, ',', 1)) + 2)
    FROM split_skills
    WHERE remaining <> ''
)
SELECT 
    skill,
    COUNT(DISTINCT Job_Id) AS demand
FROM split_skills
WHERE skill <> ''
GROUP BY skill
ORDER BY demand DESC
LIMIT 10;

-- Salary by Company Size & Experience Level --
SELECT 
    company_size, 
    experience_level, 
    ROUND(AVG(salary), 2) AS avg_salary
FROM project_2.CleanedCSVproject1
GROUP BY company_size, experience_level
ORDER BY avg_salary DESC;




