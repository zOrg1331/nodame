#!/bin/sh

SEASON="$1"

EPISODE="$2"
EPNUM=$(printf "%02d" $EPISODE)

START="$3"

DURATION="$4"

source "config_s${SEASON}.sh"

FILE=$(printf "$EPISODE_FMT" $EPISODE)

QUALITY="-c:v libx264 -preset slower -crf 20"

ffmpeg -y -loglevel 24 -i "${BASEPATH}/${FILE}" -ss $START -t $DURATION $QUALITY -c:a $ACODEC -map 0:v:0 -map $ASTREAM -af "volume=0" S${SEASON}E${EPNUM}_title.mkv