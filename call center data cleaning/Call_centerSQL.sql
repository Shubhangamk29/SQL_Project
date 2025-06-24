use call_centerdata;
SELECT * FROM call_center;

---- Data cleaning ---
SET SQL_SAFE_UPDATES = 0;

--- changing date format---
UPDATE call_center 
SET call_timestamp = str_to_date(call_timestamp, "%m/%d/%Y");

--- updating empty values to NUll ----
UPDATE call_center 
SET csat_score = NULL
WHERE csat_score = '';
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM call_center LIMIT 10;

--- Count of num of rows and num of columns in table ---
SELECT COUNT(*) AS num_rows FROM call_center;
SELECT COUNT(*) AS num_columns
FROM information_schema.columns
WHERE table_name = 'call_center' AND table_schema = 'call_centerdata';

--- to select distinct values in each column ----
SELECT DISTINCT sentiment FROM call_center;
SELECT DISTINCT city FROM call_center;
SELECT DISTINCT call_center FROM call_center;
