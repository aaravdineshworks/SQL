
/* Q. What are the top-paying engineer related roles? */

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM 
    job_postings_fact
WHERE
job_title LIKE '%Engineer%' AND
job_location = 'Bengaluru, Karnataka, India' AND
salary_year_avg IS NOT NULL
ORDER BY
salary_year_avg DESC
LIMIT 10;

