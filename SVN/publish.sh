#!/bin/bash

basedir=$1
dest=/data/chenliujin/

if [[ $basedir == '' ]]; then
	echo 'pls input dir.';
	exit
fi

rsync -av "$basedir/includes" "$dest/"
