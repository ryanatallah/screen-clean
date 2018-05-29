#!/bin/bash

rm /usr/local/bin/screen-clean

PLIST_FILE=com.ryanatallah.screen-clean.plist
launchctl unload ~/Library/LaunchAgents/$PLIST_FILE
rm ~/Library/LaunchAgents/$PLIST_FILE

