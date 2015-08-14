#!/bin/bash

year=`date +%Y`
month=`date +%m`
day=`date +%d`

for ip in 192.168.0.10 192.168.0.11 192.168.0.12
do
    file=`ls /data/rawlog/log/php_error_log/$ip/$year$month/err_log_*$year*$month*$day*.log`
    dest="/data/rawlog/log/php_error_log_stats/$year$month/$year$month$day/"

    mkdir -p $dest
    #cat "$file" | sed ':a;N;$!ba;s/\n//g' | sed 's/\(\[[0-9]\{2\}\)/\n\1/g' > $dest
    cat "$file" | \
    sed ':a;N;$!ba;s/\n//g' | \
    sed 's/\(\[[0-9]\{2\}-\)/\n\1/g' | \
    sed 's/[[:space:]]\{2,\}/ /g' | \
    grep -v 'Cache is null' | \
    grep -v 'Client ip' | \
    awk -F ']' '{print $2,$NF}' > $dest/$ip'.log'
done
