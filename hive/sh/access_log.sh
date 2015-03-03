#!/bin/bash

day=$1

[ -z $day ] && echo 'Please input day.' && exit

/opt/hive/bin/hive -e "
FROM access_log

INSERT OVERWRITE TABLE wa_bounce_visits_day
PARTITION (site, created_date)
    SELECT session_id, COUNT(DISTINCT url), site, created_date
	WHERE created_date = '"$day"'
	GROUP BY site, created_date, session_id
	HAVING COUNT(DISTINCT url) = 1
"