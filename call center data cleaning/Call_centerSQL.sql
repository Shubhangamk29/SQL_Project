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
