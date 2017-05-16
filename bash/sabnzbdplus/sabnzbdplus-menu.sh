#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC SABnzbd+ Menu
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

source "$SCRIPTPATH/inc/app-setup-check.sh"
SUBCHOICE=$(whiptail --title "AtoMiC Toolkit - Manage SABnzbd+" \
--menu "What would you like to do?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Install" "Install SABnzbd+" \
"Uninstall" "Uninstall SABnzbd+" \
"Backup" "Backup SABnzbd+ settings" \
"Restore" "Restore SABnzbd+ settings from a previous backup" \
"Manual Update" "Manually update SABnzbd+" \
"Reset Password" "Reset SABnzbd+ WebUI password" \
"Access Details" "View SABnzbd+ access details" \
"Access Switch" "Toggle SABnzbd+ UI network accessibility" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/sabnzbdplus/sabnzbdplus-constants.sh"
    case "$SUBCHOICE" in
        "Install" ) source "$SCRIPTPATH/$APPNAME/$APPNAME-installer.sh" ;;
        "Uninstall" ) source "$SCRIPTPATH/$APPNAME/$APPNAME-uninstaller.sh" ;;
        "Backup" ) source "$SCRIPTPATH/inc/app-backup-controller.sh" ;;
        "Restore" ) source "$SCRIPTPATH/inc/app-restore-controller.sh" ;;
        "Manual Update" ) source "$SCRIPTPATH/$APPNAME/$APPNAME-update.sh" ;;
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
