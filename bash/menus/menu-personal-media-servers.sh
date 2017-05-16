#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC Media Servers Menu
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

source "$SCRIPTPATH/inc/app-setup-check.sh"
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - htpcBeginner.com" \
--menu "Which app would you like to manage?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Emby" "Organize, play, and stream audio and video" \
"Plex" "organizes all of your video, music and photo collections" \
"PlexPy" "Monitoring and tracking tool for Plex Media Server" \
"Subsonic" "web-based media streamer and jukebox" \
"Madsonic" "web-based media streamer and jukebox fork of Subsonic" \
"Ubooquity" "Home server for your comics and ebooks" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/inc/app-constant-reset.sh"
    case "$SUBCHOICE" in
        "Emby" )
            source "$SCRIPTPATH/emby-server/emby-server-menu.sh" ;;
        "Plex" )
            source "$SCRIPTPATH/plexmediaserver/plexmediaserver-menu.sh" ;;
        "PlexPy" )
            source "$SCRIPTPATH/plexpy/plexpy-menu.sh" ;;
        "Subsonic" )
            source "$SCRIPTPATH/subsonic/subsonic-menu.sh" ;;
        "Madsonic" )
            source "$SCRIPTPATH/madsonic/madsonic-menu.sh" ;;
        "Ubooquity" )
            source "$SCRIPTPATH/ubooquity/ubooquity-menu.sh" ;;
        "Go Back" )
            source "$SCRIPTPATH/menus/menu-main.sh" ;;
        *)
            source "$SCRIPTPATH/inc/invalid-option.sh" ;;
    esac
else
    source "$SCRIPTPATH/inc/thankyou.sh"
    echo
    sleep 1
    exit 0
fi
