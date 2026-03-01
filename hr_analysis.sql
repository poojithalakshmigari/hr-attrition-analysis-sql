-- Create Table
CREATE TABLE employees (
    emp_id INT,
    department VARCHAR(50),
    job_role VARCHAR(50),
    salary DECIMAL(10,2),
    years_at_company INT,
    attrition VARCHAR(10)
);

-- Total Employees
SELECT COUNT(*) AS total_employees
FROM employees;

-- Attrition Count
SELECT COUNT(*) AS attrition_count
FROM employees
WHERE attrition = 'Yes';

-- Attrition Rate
SELECT 
    (SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) 
    AS attrition_rate_percentage
FROM employees;

-- Department-wise Attrition
SELECT department,
       COUNT(*) AS total_employees,
       SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM employees
GROUP BY department;

-- Salary vs Attrition
SELECT 
    CASE 
        WHEN salary < 30000 THEN 'Low Salary'
        WHEN salary BETWEEN 30000 AND 60000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END AS salary_range,
    COUNT(*) AS employee_count
FROM employees
GROUP BY salary_range;
