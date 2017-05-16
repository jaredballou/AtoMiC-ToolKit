#!/bin/bash
# Script Name: AtoMiC HTPC Manager init.d update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
echo 'Updating init.d file'
sudo sed -i "s@APP_PATH=/path/to/htpc-manager@APP_PATH=$APPPATH@g" /etc/init.d/$APPNAME || { echo -e $RED'Replacing APP_PATH failed.'$ENDCOLOR ; exit 1; }
sudo sed -i "s@RUN_AS=root@RUN_AS=$UNAME@g" /etc/init.d/$APPNAME || { echo -e $RED'Replacing RUN_AS failed.'$ENDCOLOR ; exit 1; }
#sudo sed -i "s@PID_FILE=/var/run/htpcmanager.pid@PID_FILE=$APPPIDFILE@g" /etc/init.d/$APPNAME || { echo -e $RED'Replacing PIDFile failed.'$ENDCOLOR ; exit 1; }
