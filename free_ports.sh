#! /bin/bash

# NEWLY ADDED BACKUP FUNCTIONALITY IS NOT FULLY TESTED YET, USE WITH CARE, ESPECIALLY DELETION
# Steps to install
# Save this script in one of your shares
# Run this script as root
# Reboot and ensure everything is still working
# If not, run the revert script_ports.sh script.
# To ensure this runs every startup, copy this file to: /usr/local/etc/rc.d (ensure it is executable)

HTTP_PORT=81
HTTPS_PORT=444

BACKUP_FILES=true # change to false to disable backups
BACKUP_DIR=/volume1/backup/portbu
DELETE_OLD_BACKUPS=true # change to true to automatically delete old backups.
KEEP_BACKUP_DAYS=30

DATE=$(date +%Y-%m-%d-%H-%M-%S)

if [ "$BACKUP_FILES" == "true" ]; then
  mkdir -p "$BACKUP_DIR/$DATE"
  cp /usr/syno/share/nginx/*.mustache "$BACKUP_DIR/$DATE"
fi

if [ "$DELETE_OLD_BACKUPS" == "true" ]; then
  find "$BACKUP_DIR/" -type d -mtime +$KEEP_BACKUP_DAYS -exec rm -r {} \;
fi

sed -i "s/^\([ \t]\+listen[ \t]\+[]:[]*\)80\([^0-9]\)/\1$HTTP_PORT\2/" /usr/syno/share/nginx/*.mustache
sed -i "s/^\([ \t]\+listen[ \t]\+[]:[]*\)443\([^0-9]\)/\1$HTTPS_PORT\2/" /usr/syno/share/nginx/*.mustache

# sudo synoservicecfg --restart nginx

synosystemctl restart nginx
