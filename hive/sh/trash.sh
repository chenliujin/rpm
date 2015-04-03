#!/bin/bash

for file in `hadoop dfs -ls /tmp/hive-root/ | awk '{print $8}'`
do

    created_at=`echo $file | sed 's/.*\([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\).*/\1/'`
    now=`date +%Y-%m-%d`

    if [[ $created_at < $now ]]; then
        hadoop dfs -rmr $file
    fi

done