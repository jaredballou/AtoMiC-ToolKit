#!/bin/bash
# shellcheck disable=SC1090
source "$SCRIPTPATH/inc/app-setup-check.sh"
SUBCHOICE=$(whiptail --title "AtoMiC Toolkit - Manage Unrar" \
--menu "What would you like to do?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Install" "Latest Unrar from RARLAB source" \
"Uninstall" "Remove and revert back to stock Unrar" \
"Go Back" "to previous menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/utils/unrar/unrar-constants.sh"
    case "$SUBCHOICE" in
        "Install" ) source "$SCRIPTPATH/utils/unrar/unrar-installer.sh" ;;
        "Uninstall" ) source "$SCRIPTPATH/utils/unrar/unrar-uninstaller.sh" ;;
        "Go Back" ) source "$SCRIPTPATH/utils/utils-menu.sh" ;;
        *) source "$SCRIPTPATH/inc/invalid-option.sh" ;;
    esac
else
    source "$SCRIPTPATH/inc/thankyou.sh"
    echo
    sleep 1
    exit 1
fi
