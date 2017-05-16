#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC NZBGet Menu
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

source "$SCRIPTPATH/inc/app-setup-check.sh"
SUBCHOICE=$(whiptail --title "AtoMiC Toolkit - Manage NZBGet" \
--menu "What would you like to do?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Install" "Install NZBGet" \
"Uninstall" "Uninstall NZBGet" \
"Backup" "Backup NZBGet settings" \
"Restore" "Restore NZBGet settings from a previous backup" \
"Reset Password" "Reset NZBGet WebUI password" \
"Access Details" "View NZBGet access details" \
"Access Switch" "Toggle NZBGet UI network accessibility" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/nzbget/nzbget-constants.sh"
    case "$SUBCHOICE" in
        "Install" ) source "$SCRIPTPATH/nzbget/nzbget-installer.sh" ;;
        "Uninstall" ) source "$SCRIPTPATH/nzbget/nzbget-uninstaller.sh" ;;
        "Backup" ) source "$SCRIPTPATH/inc/app-backup-controller.sh" ;;
        "Restore" ) source "$SCRIPTPATH/inc/app-restore-controller.sh" ;;
        "Reset Password" )
            source "$SCRIPTPATH/inc/app-password-reset-controller.sh" ;;
        "Access Details" ) source "$SCRIPTPATH/inc/app-access-details.sh" ;;
        "Access Switch" ) source "$SCRIPTPATH/inc/app-access-switch.sh" ;;
        "Go Back" ) source "$SCRIPTPATH/menus/menu-usenet.sh" ;;
        *) source "$SCRIPTPATH/inc/invalid-option.sh" ;;
    esac
else
    source "$SCRIPTPATH/inc/thankyou.sh"
    echo
    sleep 1
    exit 0
fi
