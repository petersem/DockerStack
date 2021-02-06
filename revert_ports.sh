#! /bin/bash

HTTP_PORT=80
HTTPS_PORT=443

sed -i "s/^\([ \t]\+listen[ \t]\+[]:[]*\)81\([^0-9]\)/\1$HTTP_PORT\2/" /usr/syno/share/nginx/*.mustache
sed -i "s/^\([ \t]\+listen[ \t]\+[]:[]*\)444\([^0-9]\)/\1$HTTPS_PORT\2/" /usr/syno/share/nginx/*.mustache

sudo synoservicecfg --restart nginx

