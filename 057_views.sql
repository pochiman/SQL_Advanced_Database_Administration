USE survey;

SELECT * FROM salary_survey;

CREATE VIEW country_averages AS
SELECT
	country,
    COUNT(*) AS respondents,
    AVG(years_experience) AS yrs_experience,
    AVG(CASE WHEN is_manager = 'Yes' THEN 1 ELSE 0 END) AS pct_mgrs,
    AVG(CASE WHEN education_level = 'Masters' THEN 1 ELSE 0 END) AS pct_masters
FROM salary_survey
GROUP BY 1
ORDER BY 2 DESC;

SELECT * FROM country_averages;