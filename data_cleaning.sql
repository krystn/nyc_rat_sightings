-- STAGING
CREATE TABLE data_staging
LIKE data;

INSERT data_staging
SELECT *
FROM data;

SELECT *
FROM data_staging; 


-- DATA CLEANING
-- Update borough names to be in lowercase and BRONX to the bronx
UPDATE data_staging SET Borough = 'the bronx' WHERE Borough = 'BRONX';
UPDATE data_staging SET Borough = 'manhattan' WHERE Borough = 'MANHATTAN';
UPDATE data_staging SET Borough = 'queens' WHERE Borough = 'QUEENS';
UPDATE data_staging SET Borough = 'brooklyn' WHERE Borough = 'BROOKLYN';
UPDATE data_stagingb SET Borough = 'staten island' WHERE Borough = 'STATEN ISLAND';

-- Fill in missing borough by zipcode
SELECT Borough, `Incident Zip`
FROM data_staging
ORDER BY Borough;

UPDATE data_staging 
SET Borough = 'brooklyn' 
WHERE `Incident Zip` IN (11237, 11208, 11206);

UPDATE data_staging 
SET Borough = 'the bronx' 
WHERE `Incident Zip` = 10451;

SELECT DISTINCT Borough
FROM data_staging;

SELECT *
FROM data_staging;