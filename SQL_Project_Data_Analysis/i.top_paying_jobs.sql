/*
What are the top-paying engineer related roles?
- Identify the top 10 highest-paying engineer related roles that are available in Bengaluru.
- Focus on job postings with salaries (no nulls)
- Highlight the opportunities 
*/

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

