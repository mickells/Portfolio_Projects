--This query contains different exploratory data analysis steps
--performed on the data science salaries dataset from kaggle

-- for clarity of Abbreviations, modifying experience_level
-- employment_type, remote_status, company_size
-- the abbreviations were clarified.

SELECT *,
CASE
    WHEN experience_level = 'EN' THEN 'Entry_Level'
    WHEN experience_level = 'EX' THEN 'Executive_Level'
    WHEN experience_level = 'MI' THEN 'Mid_Level'
    ELSE 'Senior_Level'
END AS exp_level,

CASE
    WHEN employment_type = 'FT' THEN 'Full_time'
    WHEN employment_type = 'PT' THEN 'Part_time'
    WHEN employment_type = 'CT' THEN 'Contract'
    ELSE 'Freelance'
END AS emp_type,

CASE
    WHEN remote_ratio = 0 THEN 'On_site'
    WHEN remote_ratio = 50 THEN 'Hybrid'
    ELSE 'Remote'
END AS remote_status, 

CASE
    WHEN company_size = 'S' THEN 'Small'
    WHEN company_size = 'L' THEN 'Large'
    ELSE 'Medium'
END AS comp_size

FROM Data_Science_Salaries.Data_Science_Salary;



--the file was saved after the column manipulation and loaded again
--the following codes are the Exploratory Data Analysis of the Data Science Salaries


-- the total salary for employees in the US.
--this is a filtered query, the next query covers all the locations
select job_title, employee_residence, sum(salary_in_usd) as sum_salary,

FROM Data_Science_Salaries.Data_Science

where employee_residence='US'
group by job_title, employee_residence

order by sum_salary desc;


--the total salary by year
select work_year, sum(salary_in_usd) as sum_salary,

FROM Data_Science_Salaries.Data_Science


group by work_year

order by sum_salary desc;


--the total salary for all regions
select job_title, employee_residence, sum(salary_in_usd) as sum_salary,

FROM Data_Science_Salaries.Data_Science


group by job_title, employee_residence

order by sum_salary desc;


--the total salary for the different job titles
select job_title, sum(salary_in_usd) as sum_salary,

FROM Data_Science_Salaries.Data_Science


group by job_title

order by sum_salary desc;


-- salary above 300000 shows they ae all in the us
select *

from Data_Science_Salaries.Data_Science

where salary_in_usd > 300000
order by salary_in_usd desc;


--the total salary for the different employment types
select employment_type, sum(salary_in_usd) as sum_salary,

FROM Data_Science_Salaries.Data_Science


group by employment_type

order by sum_salary desc;


--the total salary for the different experience level
select experience_level, sum(salary_in_usd) as sum_salary,

FROM Data_Science_Salaries.Data_Science


group by experience_level

order by sum_salary desc;


--the total salary for the different remote type
select remote_type, sum(salary_in_usd) as sum_salary,

FROM Data_Science_Salaries.Data_Science


group by remote_type

order by sum_salary desc;


--the total salary for the different company sizes
select company_size, sum(salary_in_usd) as sum_salary,

FROM Data_Science_Salaries.Data_Science


group by company_size

order by sum_salary desc;



--the total salary by company location and remote type
select company_location, remote_type, sum(salary_in_usd) as sum_salary,

FROM Data_Science_Salaries.Data_Science


group by company_location,remote_type

order by sum_salary desc;


--the total salary by experience level and work year
select experience_level, work_year, sum(salary_in_usd) as sum_salary,

FROM Data_Science_Salaries.Data_Science


group by experience_level,work_year

order by sum_salary desc;


--the total salary by work year and remote type
select work_year, remote_type, sum(salary_in_usd) as sum_salary,

FROM Data_Science_Salaries.Data_Science


group by work_year,remote_type

order by sum_salary desc;


--the total salary by company location and company size
select company_location, company_size, sum(salary_in_usd) as sum_salary,

FROM Data_Science_Salaries.Data_Science


group by company_location,company_size

order by sum_salary desc;



--the total salary by job title and remote type
select job_title, remote_type, sum(salary_in_usd) as sum_salary,

FROM Data_Science_Salaries.Data_Science


group by job_title,remote_type

order by sum_salary desc;
