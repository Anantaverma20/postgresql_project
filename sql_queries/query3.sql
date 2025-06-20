/*
Question: What are the most in-demand skills for DS?
- Join job postings to inner join table similar to query 2
-Identify the top 5 in-demand skills for a data Scienitst
- Focus on all job postings
-Why? Retrieves the top 5 skills with the highest dmeand in the job market,
providing insights into the most valuable skills for job seekers
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS number_of_jobs
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Scientist'
GROUP BY skills
ORDER BY number_of_jobs DESC
LIMIT 5;