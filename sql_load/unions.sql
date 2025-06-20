-- UNION 
SELECT 
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION

SELECT 
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION

SELECT 
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs

-- UNION ALL
SELECT 
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION ALL

SELECT 
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION ALL

SELECT 
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs

/* Find job postings from the firat quarter thay have a salary greater than $70k
combine job posting tables from the first quarter of 2023 (jan-mar)
gets job psotings with an average yearly salary > 70,000
*/

SELECT 
    q1_job_postings.job_title_short,
    q1_job_postings.job_location,
    q1_job_postings.job_via,
    q1_job_postings.job_posted_date::DATE,
    q1_job_postings.salary_year_avg
FROM(   SELECT *
        FROM
            january_jobs
        UNION ALL
        SELECT *
        FROM
            february_jobs
        UNION ALL
        SELECT *
        FROM
            march_jobs
) AS q1_job_postings
WHERE 
    q1_job_postings.salary_year_avg > 70000
ORDER BY 
    q1_job_postings.salary_year_avg DESC

