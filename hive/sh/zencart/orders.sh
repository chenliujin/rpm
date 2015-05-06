#!/bin/bash

day=$1

[ -z $day ] && echo 'Please input day.' && exit

/opt/hive/bin/hive -e "
FROM orders

INSERT OVERWRITE TABLE wa_countries_sales_day
PARTITION (site, created_date)
    SELECT delivery_country, SUM(order_total), site, created_date
    WHERE created_date = '"$day"' AND orders_status IN (2,3,5)
    GROUP BY site, created_date, delivery_country

INSERT OVERWRITE TABLE h_wa_orders
SELECT CONCAT(site, '-', created_date), site, created_date, SUM(order_total), COUNT(orders_id), COUNT(DISTINCT customers_id), weekofyear(created_date), month(created_date), year(created_date)
WHERE created_date='"$day"' AND orders_status IN (2,3,5)
GROUP BY site, created_date
"