#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC FFmpeg Uninstaller
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

echo -e "${GREEN}AtoMiC FFmpeg Uninstaller Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
echo -e "$YELLOW--->Removing files...$ENDCOLOR"
sudo rm -r /usr/bin/ffmpeg    >/dev/null
sudo rm -r /usr/bin/ffprobe    >/dev/null
sudo rm -r /usr/bin/ffserver    >/dev/null
sudo rm -r /usr/bin/ffmpeg-10bit    >/dev/null
echo -e "${GREEN}--->All done. FFmpeg uninstalled.$ENDCOLOR"
