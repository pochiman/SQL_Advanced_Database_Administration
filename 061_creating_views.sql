USE mavenbearbuilders;

CREATE VIEW monthly_sessions AS
SELECT
	YEAR(created_at) AS year,
    MONTH(created_at) AS month,
    utm_source,
    utm_campaign,
	COUNT(website_session_id) AS number_of_sessions
FROM website_sessions
GROUP BY 1, 2, 3, 4;

SELECT * FROM monthly_sessions;