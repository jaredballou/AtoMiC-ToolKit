#!/bin/bash
# shellcheck disable=SC2034
APPNAME='jackett'
APPSHORTNAME='jk'
APPPATH='/opt/jackett'
APPTITLE='Jackett'
APPDEPS='libcurl4-openssl-dev'
APPDPORT='9117'
APPSETTINGSDIR="/home/$UNAME/.config/Jackett"
APPSETTINGS=$APPSETTINGSDIR'/ServerConfig.json'
PORTSEARCH='"Port": '
USERSEARCH='NA'
PASSSEARCH='NA'
APPSYSTEMD='jackett.service'
APPSYSTEMDLOC=$SCRIPTPATH'/jackett/'$APPSYSTEMD
APPINITDLOC=$SCRIPTPATH'/jackett/jackett.init'
