#!/bin/bash

basedir=$1

if [[ $basedir == '' ]]; then
	echo 'pls input dir.';
	exit
fi

date=`date +%Y%m%d`
hms=`date +%H%M%S`

dest='/data/www/chenliujin/'

mkdir -p /home/backup_release/$date/$hms

for file in `find $basedir -type f`
do
	cd $dest

	dest_file=`echo $file | sed -e "s#$1##g"` 
	echo $dest_file

	cp --parents $dest_file /home/backup_release/$date/$hms/
done
