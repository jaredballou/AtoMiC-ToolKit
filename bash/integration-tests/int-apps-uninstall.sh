#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC1090
# Script Name: AtoMiC Integration Test Application uninstaller
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
CI='YES'
SCRIPTPATH="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

"$SCRIPTPATH/inc/app-toolkit-deps.sh"

if [[ ! -d $SCRIPTPATH/tmp ]]; then
    mkdir "$SCRIPTPATH/tmp"
fi

if [[ ! -f $SCRIPTPATH/tmp/userinfo ]]; then
    echo "UNAME=$SUDO_USER" > "$SCRIPTPATH/tmp/userinfo"
    echo "UGROUP=$SUDO_USER" >> "$SCRIPTPATH/tmp/userinfo"
fi

if [[ ! -f $SCRIPTPATH/tmp/consented ]]; then
    echo "Agreed to disclaimers: $(date)" > "$SCRIPTPATH/tmp/consented"
fi

source "$SCRIPTPATH/setup.sh" -u couchpotato
source "$SCRIPTPATH/setup.sh" -u deluged
source "$SCRIPTPATH/setup.sh" -u emby-server
source "$SCRIPTPATH/setup.sh" -u headphones
source "$SCRIPTPATH/setup.sh" -u htpcmanager
source "$SCRIPTPATH/setup.sh" -u jackett
source "$SCRIPTPATH/setup.sh" -u kodi
source "$SCRIPTPATH/setup.sh" -u lazylibrarian
source "$SCRIPTPATH/setup.sh" -u madsonic
source "$SCRIPTPATH/setup.sh" -u maximux
source "$SCRIPTPATH/setup.sh" -u mylar
source "$SCRIPTPATH/setup.sh" -u nzbget
source "$SCRIPTPATH/setup.sh" -u nzbhydra
source "$SCRIPTPATH/setup.sh" -u ombi
source "$SCRIPTPATH/setup.sh" -u plexmediaserver
source "$SCRIPTPATH/setup.sh" -u plexpy
source "$SCRIPTPATH/setup.sh" -u pyload
source "$SCRIPTPATH/setup.sh" -u qbittorrent-nox
source "$SCRIPTPATH/setup.sh" -u radarr
source "$SCRIPTPATH/setup.sh" -u sabnzbdplus
source "$SCRIPTPATH/setup.sh" -u sickgear
source "$SCRIPTPATH/setup.sh" -u sickrage
source "$SCRIPTPATH/setup.sh" -u sonarr
source "$SCRIPTPATH/setup.sh" -u subsonic
source "$SCRIPTPATH/setup.sh" -u transmission-daemon
source "$SCRIPTPATH/setup.sh" -u ubooquity
source "$SCRIPTPATH/setup.sh" -u watcher
source "$SCRIPTPATH/setup.sh" -u webmin
