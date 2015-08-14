#!/bin/bash

m=$1

if [ $m == -1 ]; then
    year=`date -d '-1 day' +%Y`;
    month=`date -d '-1 day' +%m`;
else
    year=`date +%Y`;
    month=`date +%m`;
fi

ym=$year$month

for ip in 192.168.0.10 192.168.0.11 192.168.0.12
do
    src="/ssd/www/zencart/weblogs/err_log_$year\ $month*.log"
    dest=/data/rawlog/log/php_error_log/$ip/$ym/

    mkdir -p $dest

    rsync -avz --rsh="sshpass -p password ssh -p 52254" tdss@$ip:"$src" $dest
done
