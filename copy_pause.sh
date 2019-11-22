#!/bin/sh

SEASON="$1"

EPISODE="$2"

START="$3"

DURATION="$4"

. "./config_s${SEASON}.sh"

FILE=$(printf "$EPISODE_FMT" "$EPISODE")

QUALITY="-c:v libx264 -preset slower -crf 20"

ffmpeg -y -loglevel 24 -i "${BASEPATH}/${FILE}" -ss "$START" -t "$DURATION" $QUALITY -c:a $ACODEC -map 0:v:0 -map $ASTREAM -af "volume=0" -vf "scale=${SCALE}" "S${SEASON}_PAUSE.mkv"
