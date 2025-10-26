/*
? Questions to Answer:
    1- What are the top-paying jobs for my role?
    2- What are the skills required for these top-paying roles?
    3- What are the most in-demand skills for my role?
    4- What are the top skills based on salary for my role?
    5- What are the most optimal skills to learn?
        a. Optimal: High Demand AND High Paying

Question #3: What are the most in-demand skills for data analysts?
    - Join job postings to inner join table similar to query 2.
    - Identify the top 5 in-demand skills for a data analyst.
    - Focus on all job postings.
    - Why? Retrieves the top 5 skills wtih the highest demand in the job market,
        providing insights into the most valuable skills for job seekers.
*/

SELECT
    skills,
    COUNT(skills) AS demand_count
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim USING (job_id)
INNER JOIN
    skills_dim USING (skill_id)
WHERE
    job_title_short = 'Data Analyst'
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;