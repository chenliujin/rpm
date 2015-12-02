#!/bin/bash


function print_help() {
    echo ""
    echo "Find the changed files between two paths, and then, build a package for incrementation upgrade."
    echo ""

    echo "$ $0 <NewPath> <OldPath>";
    echo ""
}

if [ "$1" != "" ]; then
   new_tag="$1"
else
   print_help
   exit
fi

if [ "$2" != "" ]; then
    old_tag="$2"
else
    print_help
fi

to_tag=`echo $new_tag | awk -F '/' '{if($NF==""){print $(NF-1)}else{print $NF}}'`
from_tag=`echo $old_tag | awk -F '/' '{if($NF==""){print $(NF-1)}else{print $NF}}'`


file=`date +%Y%m%d`.tar

diff -q -r -x *.svn* $new_tag $old_tag | sed 's/Files //g' | awk -F ' and ' '{print $1}' | sed 's/Only in //g' | sed 's/: /\//g' | xargs -I % tar rvf $file %
