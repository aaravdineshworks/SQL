/* What are the most optimal skills to learn(high-demand and high-paying)? */
WITH demand_skills AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title LIKE '%Engineer%' AND salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id
    ORDER BY demand_count DESC
), average_salary AS (
    SELECT
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg),0) AS average_salary
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short LIKE '%Engineer%' AND salary_year_avg IS NOT NULL
    GROUP BY skills_job_dim.skill_id
    ORDER BY average_salary DESC

)

SELECT
    demand_skills.skill_id,
    demand_skills.skills,
    demand_count,
    average_salary
FROM demand_skills
INNER JOIN average_salary ON demand_skills.skill_id = average_salary.skill_id
WHERE demand_count > 10
ORDER BY average_salary DESC, demand_count DESC
LIMIT 30;
