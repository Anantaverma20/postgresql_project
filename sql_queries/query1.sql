/*
Question: what are the top-paying data scientist jobs?
- Identify the top 10 highest-paying Data Science roels that are available remotely.
- FOcuses on job psotings with specified salaries (remove nulls).
- WHy? Highlight the top-paying oppertunities for Data Scientist, offering insights into 
*/

SELECT
    job_id,
    job_title,
    name AS company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date:: DATE
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Scientist'
    AND job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;