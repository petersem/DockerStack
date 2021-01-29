#!/bin/sh

# SYNOLOGY NAS DEVICES ONLY
# Required for openVPN containers & Integrated GPU Use
# -------------------------------------------------------------------
# To run at boot: Put this in your '/usr/local/etc/rc.d', 
# make it executable 'sudo chmod +X /usr/local/etc/rc.d/synology.sh'
# Will then auto execute on boot.

# Create the necessary file structure for /dev/net/tun
if ( [ ! -c /dev/net/tun ] ); then
  if ( [ ! -d /dev/net ] ); then
    mkdir -m 755 /dev/net
  fi
  mknod /dev/net/tun c 10 200
  chmod 0755 /dev/net/tun
fi

# Load the tun module if not already loaded
if ( !(lsmod | grep -q "^tun\s") ); then
  insmod /lib/modules/tun.ko
fi

# Set permissions for integrated GPU fro Plex / Jellyfin / Emby / Dizquetv / handbrake / etc...
chmod 777 /dev/dri /dev/dri/card0 /dev/dri/renderD128