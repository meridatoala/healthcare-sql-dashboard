-- analysis_queries.sql
-- Author: Merida Toala
-- Project: Healthcare SQL Dashboard - Patient Visit Analysis
-- Purpose: Explore patient visit trends and identify marketing opportunities

-- 1. Total number of patient visits by department
SELECT department, COUNT(*) AS total_visits
FROM patient_visits
GROUP BY department
ORDER BY total_visits DESC;

-- 2. Average visit duration by department
SELECT department, ROUND(AVG(visit_duration_minutes), 2) AS avg_visit_time
FROM patient_visits
GROUP BY department
ORDER BY avg_visit_time DESC;

-- 3. Top 5 most common diagnoses
SELECT diagnosis_code, COUNT(*) AS count
FROM patient_visits
GROUP BY diagnosis_code
ORDER BY count DESC
LIMIT 5;

-- 4. Patient age distribution
SELECT 
  CASE
    WHEN age < 18 THEN '0-17'
    WHEN age BETWEEN 18 AND 34 THEN '18-34'
    WHEN age BETWEEN 35 AND 54 THEN '35-54'
    WHEN age BETWEEN 55 AND 74 THEN '55-74'
    ELSE '75+'
  END AS age_group,
  COUNT(*) AS total_patients
FROM patient_visits
GROUP BY age_group
ORDER BY age_group;

-- 5. Follow-up needed percentage by department
SELECT 
  department,
  ROUND(SUM(CASE WHEN follow_up_needed = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS follow_up_rate_percent
FROM patient_visits
GROUP BY department
ORDER BY follow_up_rate_percent DESC;

