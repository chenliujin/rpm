#!/bin/bash

# log sample:
# [24-Jul-2015 00:00:31 PRC] PHP Warning:  chmod(): No such file or directory in /ssd/www/zencart/website/v20131028/includes/modules/pages/popup_images_upload/header_php.php on line 210

cat 'err_log_2015 07 24.log' | \
sed ':a;N;$!ba;s/\n//g' | \
sed 's/[[:space:]]\{2,\}//g' | \
sed 's/\(\[[0-9]\{2\}\)/\n\1/g' | \
grep -v '/usr/lib/php/pear/cacheHubWeb' | \
grep -v 'Cache is null' |
grep -v 'Client ip' | \
awk -F ']' '{print $2,$NF}' \
> a
