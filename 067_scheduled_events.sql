CREATE SCHEMA schema_for_events;
USE schema_for_events;
CREATE TABLE sillytable (
timestamps_via_event DATETIME
);

CREATE EVENT myfirstevent
	ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 7 second
    DO
		INSERT INTO sillytable VALUES (NOW());

SELECT * FROM sillytable;


CREATE EVENT mysecondevent
	ON SCHEDULE EVERY 5 second
    DO
		INSERT INTO sillytable VALUES (NOW());
        
DROP EVENT mysecondevent;