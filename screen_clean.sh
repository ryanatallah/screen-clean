#!/bin/bash

DESKTOP=$HOME/Desktop
FILES=$DESKTOP/*
SCREENFOLDER=$DESKTOP/Screenshots
if [ ! $EXPTIME ]; then EXPTIME=21600; fi # 6 hours
SCREENREGEXP="Screen Shot [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]*"

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
  if [[ $f =~ $SCREENREGEXP ]] && [[ $(age "$path") -gt $EXPTIME ]]; then
    if [ ! -d $SCREENFOLDER ]; then
      mkdir $SCREENFOLDER
    fi
    newpath=$SCREENFOLDER/$f
    mv "$path" "$newpath"
    echo "$path -> $newpath"
  fi
done
