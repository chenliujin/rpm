#!/bin/bash

day=$1

[ -z $day ] && echo 'Please input day.' && exit

/opt/hive/bin/hive -e "
FROM nginx_access_log

INSERT OVERWRITE TABLE nginx_page_load_time
PARTITION (site, created_date, created_time)
    SELECT COUNT(*), SUM(field15), avg(field15), site, created_date, created_time
    WHERE created_date = '"$day"' AND field15 < 1800
    GROUP BY site, created_date, created_time
"