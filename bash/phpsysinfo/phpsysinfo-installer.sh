#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC phpSysInfo Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/utils/php/php-installer.sh"
source "$SCRIPTPATH/utils/nginx/nginx-installer.sh"
source "$SCRIPTPATH/phpsysinfo/phpsysinfo-constants.sh"
source "$SCRIPTPATH/inc/app-move-previous.sh"
source "$SCRIPTPATH/inc/app-git-download.sh"
source "$SCRIPTPATH/phpsysinfo/phpsysinfo-settings-configurator.sh"
source "$SCRIPTPATH/inc/app-install-confirmation.sh"
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
