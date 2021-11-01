#!/usr/bin/env bash

export RESOLVER=$(grep nameserver /etc/resolv.conf | head -n 1 | awk '{ print $2 }')
cat /templates/nginx/nginx.tmpl.conf | envstache > /nginx/nginx.conf
cp /templates/nginx/mime.types /nginx/

echo "Starting nginx... RESOLVER=$RESOLVER"
/usr/local/openresty/bin/openresty -g 'daemon off;' -c /nginx/nginx.conf
