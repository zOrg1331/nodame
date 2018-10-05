#!/bin/bash

SEASON="$1"

EPISODE="$2"

declare -a lines
let i=0
while IFS=$'\n' read -r line; do
    if [ -z "$line" ]; then
        continue
    fi
    lines[i]="$line"
    ((++i))
done

firstline=true
part=1

let i=0
while (( ${#lines[@]} > i )); do

    start=$(echo "${lines[i]}" | cut -f1 -d' ')
    duration=$(echo "${lines[i]}" | cut -f2 -d' ')

    if [ "$firstline" = true ]; then
        ./copy_title.sh $SEASON $EPISODE "$start" "$duration"

        firstline=0
    else
        ./copy.sh $SEASON $EPISODE "$start" "$duration" $part

        ((part++))
    fi

    ((i++))
done

((part--))
./merge.sh $SEASON $EPISODE $part
