#!/bin/sh

SEASON="$1"

EPISODE="$2"
EPNUM=$(printf "%02d" "$EPISODE")

START="$3"

DURATION="$4"

PART="$5"

. "./config_s${SEASON}.sh"

FILE=$(printf "$EPISODE_FMT" "$EPISODE")
FILE_ASS=$(printf "$SUB_FMT" "$EPISODE")

QUALITY="-c:v libx264 -preset slower -crf 20"

ffmpeg -y -loglevel 24 -i "${BASEPATH}/${FILE}" -ss "$START" -t "$DURATION" $QUALITY -c:a copy -vf "ass=${BASEPATH}/${FILE_ASS},scale=${SCALE}" -map 0:v:0 -map $ASTREAM "S${SEASON}E${EPNUM}_${PART}.mkv"
