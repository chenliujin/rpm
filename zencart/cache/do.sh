#!/bin/bash

function search {
    if [ -n "$work_dir" ]; then
        # 转到cache目录
        cd $cache_path
        # 如果时间截文件不存在，生成一个足够老的时间
        if [ ! -f $work_dir/timestamp ] ; then
            touch -t 190001010000 $work_dir/timestamp
        fi
        # 找出上次更新后，有变更的文件，以及每个文件的变更日期
        find $dir -type f -newer $work_dir/timestamp -printf '%TY%Tm%Td%TH%TM %p\n' > $work_dir/new_file_list
        # 更新$pre"_timestamp"
        last_time=`cat $work_dir/new_file_list | sort -n | tail -n 1 | awk '{print $1}'`
        if [ -z $last_time ] ; then
            echo 'no update' | tee -a $work_dir/log/`date +%Y-%m-%d`.log
            exit 
        fi
        up_time=$[last_time + 1]
        touch -t $up_time $work_dir/timestamp
        if [ ! -f $work_dir/new_file_list ]; then
            exit
        fi
        cat $work_dir/new_file_list | awk '{print $2}' > $work_dir/rsync_file_list
        rsync_params="$rsync_params --files-from=$work_dir/rsync_file_list"
    fi
}

function do_rsync {
    cd $cache_path
    if [ -n "$file" ]
    then
        if [ -f $cache_path/$dir/$file ] || [ -d $cache_path/$dir/$file ]
        then
            loc=$dir/$file
        else
            loc=$dir
        fi
    else
        loc=$dir
    fi
    if [ -n "$s" ]; then
        loc="./"
    fi
    if [ -z "$config_file" ]; then
        config_file="upload_to_web.conf"
    fi
    config_dir=/data/conf/cacheHub/sync
    if [ ! -f $config_dir/$config_file ]; then
        echo $config_dir/$config_file not found
        exit
    fi
    for line in `cat $config_dir/$config_file`
    do
        hostname=`echo $line | awk -F : '{print $1}'`
        r_user=`echo $line | awk -F : '{print $2}'`
        r_pass=`echo $line | awk -F : '{print $3}'`
        r_port=`echo $line | awk -F : '{print $4}'`
        if [ -n "$r_port" ]
            then 
                port_sh=" -p $r_port"
            else
                port_sh=""
        fi
        echo $hostname | tee -a $work_dir/log/`date +%Y-%m-%d`.log
        #echo rsync -avzR $rsync_delete $rsync_params --rsh="sshpass -p $r_pass ssh$port_sh" $loc $r_user@$hostname:$r_path
        rsync -avzR $rsync_delete $rsync_params --rsh="sshpass -p $r_pass ssh$port_sh" $loc $r_user@$hostname:$r_path | tee -a $work_dir/log/`date +%Y-%m-%d`.log
    done
}

path=$(cd `dirname $0`; pwd)
while getopts d:f:s-:r:p:c: opt
do
    case "$opt" in
    d)
        dir=$OPTARG;;
    f)
        file=$OPTARG;;
    s)
        s=1;;
    r)
        rsync_params=$OPTARG;;
    p)
        base_path=$OPTARG;;
    c)
        config_file=$OPTARG;;
    -)
        if [ $OPTARG = "delete" ]; then
            rsync_delete="--delete"
        fi
        ;;
    esac
done
if [ -n "$base_path" ]; 
    then
        cache_path=$base_path
    else
        cache_path=/ssd/www/zencart/cache
fi
cache_dir=$cache_path/$dir
r_path=$cache_path
if [ -n "$dir" ]
then
    work_dir=$path$cache_dir
    if [ ! -d $work_dir/log ]; then
        mkdir -p $work_dir/log
    fi
    echo "===============================================================================" | tee -a $work_dir/log/`date +%Y-%m-%d`.log
    echo `date "+%Y-%m-%d %H:%M:%S"` | tee -a $work_dir/log/`date +%Y-%m-%d`.log
    if [ -n "$s" ]; then
        search
    fi
    do_rsync
    chmod -R 777 $work_dir
else
    echo "-d dir is empty"
fi
exit
