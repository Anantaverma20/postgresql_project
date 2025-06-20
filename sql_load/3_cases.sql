SELECT
    job_title_short AS title,
    job_location AS location,
 -- job_posted_date:: DATE 
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(MONTH FROM job_posted_date)
FROM
    job_postings_fact
LIMIT 5;

SELECT 
    COUNT(job_id),
    EXTRACT(MONTH FROM job_posted_date) AS month 
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month


CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact 
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;


CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact 
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

    
CREATE TABLE february_jobs AS
    SELECT *
    FROM job_postings_fact 
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

    
CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact 
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

    
SELECT job_posted_date
FROM march_jobs

SELECT
    job_title_short,
    job_location,
    CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact;\

SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM 
    job_postings_fact
WHERE 
    job_title_short = 'Data Scientist'
GROUP BY
    location_category;


SELECT 
        MIN(salary_year_avg),
        MAX(salary_year_avg)
FROM  job_postings_fact


SELECT 
    job_title_short AS job_title,
    salary_year_avg AS salary,
    job_location,
    CASE
        WHEN salary_year_avg <= 70000 THEN 'Low'
        WHEN salary_year_avg > 150000 THEN 'High'
        ELSE 'Median'
    END AS salary_category
FROM job_postings_fact
WHERE 
    job_title = 'Data Analyst' AND
    salary_year_avg IS NOT Null
