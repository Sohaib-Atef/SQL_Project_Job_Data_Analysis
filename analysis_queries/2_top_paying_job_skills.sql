/*
? Questions to Answer:
    1- What are the top-paying jobs for my role?
    2- What are the skills required for these top-paying roles?
    3- What are the most in-demand skills for my role?
    4- What are the top skills based on salary for my role?
    5- What are the most optimal skills to learn?
        a. Optimal: High Demand AND High Paying

Question #2: What skills are required for the top-paying data anaylyst jobs?
    - Use the top 10 highest-paying Data Analyst jobs from first query.
    - Add the specific skill required for these roles.
    - Why? It provides a detailed look at which high-paying jobs demand certain skills,
        helping job seekers understand which skills to develop that align with top salaries.
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        company_dim.name AS company_name,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN
        company_dim USING (company_id)
    WHERE
        job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
)
SELECT 
    top_paying_jobs.*,
    skills
FROM
    top_paying_jobs
INNER JOIN
    skills_job_dim USING (job_id)
INNER JOIN
    skills_dim USING (skill_id)
ORDER BY
    salary_year_avg DESC
LIMIT 10
