USE mavenbearbuilders;
/*
1) Import the latest order_items and order_item_refunds data below into the database, and 
verify the order summary trigger you created previously still works (if not, recreate it).
                                                                   
-- 17.order_items_2014_Mar          -- 19.order_item_refunds_2014_Mar                                                                    
-- 18.order_items_2014_Apr          -- 20.order_item_refunds_2014_Apr
*/

SELECT 
	YEAR(created_at) AS yr,
    MONTH(created_at) AS mo,
    COUNT(*) AS total_records 
FROM order_items -- order_item_refunds
GROUP BY 1, 2
ORDER BY 1, 2;


SELECT COUNT(*) AS total_records FROM order_item_refunds;

/*
2) Import the website_sessions and website_pageviews data for March and April, provided below:

-- 21.website_sessions_2014_Mar     -- 23.website_pageviews_2014_Mar                                                                   
-- 22.website_sessions_2014_Apr     -- 24.website_pageviews_2014_Apr
*/

SELECT 
	YEAR(created_at) AS yr,
    MONTH(created_at) AS mo,
    COUNT(*) AS total_records 
FROM website_sessions -- website_pageviews
GROUP BY 1, 2
ORDER BY 1, 2;



/*
3) The company is adding chat support to the website. You’ll need 
to design a database plan to track which customers and sessions 
utilize chat, and which chat representatives serve each customer.
*/


-- users
	-- user_id
    -- created_at
    -- first_name
    -- last_name

-- support_members
	-- support_member_id
    -- created_at
    -- first_name
    -- last_name

-- chat_sessions
	-- chat_session_id
    -- created_at
    -- user_id
    -- support_member_id
    -- website_session_id

-- chat_messages
	-- chat_message_id
    -- created_at
    -- chat_session_id
    -- user_id (will be null for support members)
    -- support_member_id (null for users)
	-- message_text




/*
4) Based on your tracking plan for chat support, create an EER diagram that incorporates 
your new tables into the existing database schema (including table relationships).
*/



/*
5) Create the tables from your chat support tracking plan in the 
database, and include relationships to existing tables where applicable.  
*/

CREATE TABLE users (
	user_id BIGINT,
    created_at DATETIME,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    PRIMARY KEY (user_id)
)
;
CREATE TABLE support_members (
	support_member_id BIGINT,
    created_at DATETIME,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    PRIMARY KEY (support_member_id)
)
;
CREATE TABLE chat_sessions (
	chat_session_id BIGINT,
    created_at DATETIME,
    user_id BIGINT,
    support_member_id BIGINT,
    website_session_id BIGINT,
    PRIMARY KEY (chat_session_id)
)
;
CREATE TABLE chat_messages (
	chat_message_id BIGINT,
    created_at DATETIME,
    chat_session_id BIGINT,
    user_id BIGINT,
    support_member_id BIGINT,
	message_text VARCHAR(200),
    PRIMARY KEY (chat_message_id)
)
;


/*
6) Using the new tables, create a stored procedure to allow the CEO 
to pull a count of chats handled by a chat representative for a given 
time period, with a simple CALL statement which includes two dates. 
*/


DELIMITER //

CREATE PROCEDURE support_member_chat
(IN supmemberid BIGINT, IN startdate DATE, IN enddate DATE)
BEGIN
	SELECT
		COUNT(chat_session_id) AS chats_handled
	FROM chat_sessions
    WHERE DATE(created_at) BETWEEN startdate AND enddate
		AND support_member_id = supmemberid;

END //

DELIMITER ;

CALL support_member_chat (1, '2014-01-01', '2014-01-31');



/*
7) The potential acquirers need some data. Create two Views, one detailing 
monthly order volume and revenue, the other showing monthly website traffic. 
Create a new User, with access just to these Views.
*/

CREATE VIEW monthly_orders_revenue AS
SELECT
	YEAR(created_at) AS yr,
    MONTH(created_at) AS mo,
    COUNT(order_id) AS orders,
    SUM(price_usd) AS revenue
FROM orders
GROUP BY 1, 2
ORDER BY 1, 2;


SELECT * FROM monthly_orders_revenue;

CREATE VIEW monthly_website_sessions AS
SELECT
	YEAR(created_at) AS yr,
    MONTH(created_at) AS mo,
    COUNT(website_session_id) AS sessions
FROM website_sessions
GROUP BY 1, 2
ORDER BY 1, 2;


SELECT * FROM monthly_website_sessions;




/*
8) The potential acquirers are commissioning a third-party security study. 
Your CEO wants to get in front of it. Provide her with a list of your top 
data security threats and anything you think you could do to mitigate risk. 
*/