#!/bin/bash

cp ./screen-clean.sh /usr/local/bin/screen-clean

PLIST_FILE=com.ryanatallah.screen-clean.plist
mkdir -p ~/Library/LaunchAgents
sed "s/{USER_NAME}/`whoami`/" $PLIST_FILE > ~/Library/LaunchAgents/$PLIST_FILE 
launchctl load -w ~/Library/LaunchAgents/$PLIST_FILE

