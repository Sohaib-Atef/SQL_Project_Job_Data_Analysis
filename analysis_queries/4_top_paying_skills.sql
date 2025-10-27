/*
? Questions to Answer:
    1- What are the top-paying jobs for my role?
    2- What are the skills required for these top-paying roles?
    3- What are the most in-demand skills for my role?
    4- What are the top skills based on salary for my role?
    5- What are the most optimal skills to learn?
        a. Optimal: High Demand AND High Paying

Scenario:
Question #4: What are the top skills based on salary for data analysts?
    - Look at the average salary associated with each skill for Data Analyst positions.
    - Focuses on roles with specified salaries, regardless of location.
    - Why? It reveals how different skills impact salary levels for Data Analysts and helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim USING (job_id)
INNER JOIN
    skills_dim USING (skill_id)
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 10;