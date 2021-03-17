#!/bin/bash
set -e

#Mount smb share into /data
/sbin/mount.cifs //$SERVER/$SHARE_NAME /data/ -o username=$USER,password=$PASS,dom=$DOMAIN

/usr/local/sbin/urbackupclientbackend
