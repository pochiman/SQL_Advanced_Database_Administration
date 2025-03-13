USE mavenbearbuilders;

CREATE TABLE website_sessions (
	website_session_id BIGINT,
    created_at DATETIME,
    user_id BIGINT,
    is_repeat_session INT,
    utm_source VARCHAR(50),
    utm_campaign VARCHAR(50),
    utm_content VARCHAR(50),
    device_type VARCHAR(25),
    http_referer VARCHAR(100),
    PRIMARY KEY (website_session_id)
);

SELECT MAX(created_at) FROM website_sessions;