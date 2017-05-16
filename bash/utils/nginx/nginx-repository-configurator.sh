#!/bin/bash
# shellcheck disable=SC2034
# Script Name: AtoMiC Nginx Repo config Script
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

CODENAME=$(lsb_release -c -s)

    case "$CODENAME" in
       'squeeze'|'wheezy'|'jessie'|'stretch'|'sid')
            ARCH=$(uname -m)
            ARCHSHORT=${ARCH:0:3}
            if [[ ! $ARCHSHORT = 'arm' ]]; then
                APPREPOSITORYNAME='nginx'
                APPREPOSITORYLINK="deb http://nginx.org/packages/debian/ $CODENAME nginx"
                APPREPOSITORYLINKBACKUP="deb-src http://nginx.org/packages/debian/ $CODENAME nginx"
                REPRECVKEYSASC='http://nginx.org/keys/nginx_signing.key'
                REPRECVKEYSHORT='7BD9BF62'
                REPOKEYSREQ='YES'
            fi
            ;;
        *)
            APPREPOSITORYNAME='nginx'
            REPOPPA='YES'
            APPREPOSITORYLINK='ppa:nginx/stable'
            REPRECVKEYSHORT='C300EE8C'
            ;;
    esac
