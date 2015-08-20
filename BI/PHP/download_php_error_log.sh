#!/bin/bash

m=$1

if [[ $m == '-1' ]]; then
    year=`date -d '-1 month' +%Y`;
    month=`date -d '-1 month' +%m`;
    day=`date -d '-1 month' +%d`

    [[ $day -gt '3' ]] && exit
else
    year=`date +%Y`;
    month=`date +%m`;
fi

ym=$year$month

for ip in 192.168.1.100 192.168.1.101
do
    src="/ssd/www/zencart/weblogs/err_log_$year\ $month*.log"
    dest=/data/rawlog/log/php_error_log/$ip/$ym/

    mkdir -p $dest

    rsync -avz --rsh="sshpass -p 'password' ssh -p 52254" tdss@$ip:"$src" $dest
done

#gzip
for ip in 192.168.1.100 192.168.1.101
do
    gzip_ym=`date -d '-3 month' +%Y%m`

    for file in /data/rawlog/log/php_error_log/$ip/$gzip_ym/*.log
    do
        [ -e "$file" ] && gzip "$file"
    done
done
