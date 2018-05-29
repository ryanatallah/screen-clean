#!/bin/bash

DESKTOP=$HOME/Desktop
FILES=$DESKTOP/*
SCREEN_FOLDER=$DESKTOP/Screenshots
if [ ! $EXP_TIME ]; then EXP_TIME=21600; fi # 6 hours
if [ ! $LOG_FILE ]; then LOG_FILE=/dev/stdout; fi
SCREEN_REGEXP="Screen Shot [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]*"

function age() {
  local filename=$1
  local changed=`date -r "$filename" +%s`
  local now=`date +%s`
  local elapsed

  let elapsed=now-changed
  echo $elapsed
}

for path in $FILES
do
  f=$(basename "$path")
  if [[ $f =~ $SCREEN_REGEXP ]] && [[ $(age "$path") -gt $EXP_TIME ]]; then
    if [ ! -d $SCREEN_FOLDER ]; then
      mkdir $SCREEN_FOLDER
    fi
    newpath=$SCREEN_FOLDER/$f
    mv "$path" "$newpath"
    echo "$(date) $path -> $newpath" >> $LOG_FILE
  fi
done

