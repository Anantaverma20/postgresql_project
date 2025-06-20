/*
Question: what are the most optimal skills to learn (high demand and high pay)
- Identify skills in high dmeand and asssociated with high average slaaries for DS roles
- Why? targets skills that offer job security high demand and financial benefits high pay,
offering strategic insights for career development in DS
*/

WITH skills_demand AS (
    SELECT 
        skills,
        skills_dim.skill_id,
        COUNT(skills_job_dim.job_id) AS number_of_jobs
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Scientist' AND
    salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id
), Average_salary AS (
    SELECT 
        skills,
        skills_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Scientist' AND
        salary_year_avg IS NOT NULL
    GROUP BY 
        skills_dim.skill_id
)

SELECT skills_demand.skill_id,
        skills_demand.skills,
        number_of_jobs,
        avg_salary
FROM
    skills_demand
INNER JOIN Average_salary ON skills_demand.skill_id = Average_salary.skill_id
ORDER BY number_of_jobs DESC

-- rewriting the above query to make it look simpler and shorter

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Scientist'
    AND salary_year_avg IS NOT NULL
GROUP BY skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id)> 10
ORDER BY 
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
