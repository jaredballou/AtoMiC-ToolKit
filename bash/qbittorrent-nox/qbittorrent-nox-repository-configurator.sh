#!/bin/bash
# shellcheck disable=SC2034
# Script Name: AtoMiC qBittorent Restore Script
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

CODENAME=$(lsb_release -c -s)

case "$CODENAME" in
    'squeeze'|'wheezy'|'jessie'|'stretch'|'sid')
        APPREPOSITORYLINK=''
        ;;
    *)
        REPOPPA='YES'
        APPREPOSITORYLINK='ppa:qbittorrent-team/qbittorrent-stable'
        ;;
esac
