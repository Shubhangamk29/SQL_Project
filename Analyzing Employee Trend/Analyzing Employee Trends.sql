
use hr_data;
--- To read Data ---
SELECT * FROM hrdata;

--- 1. Count the number of employees in each department---
SELECT department, COUNT(*) AS employee_count
FROM hrdata
GROUP BY department;

--- 2.Calculate the average age for each department ---
SELECT department, AVG(age) AS average_age
FROM hrdata
GROUP BY department;

