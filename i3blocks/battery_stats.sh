#!/bin/bash

BATTERY=$(acpi -b | grep -P -o '[0-9]+(?=%)')
STATUS=$(acpi -b | grep -P -o '[a-zA-Z]+(?=,)' | head -1)

if [ "$STATUS" = "Discharging" ]; then
    if [ "$BATTERY" -le 10 ]; then
        ICON=""
    elif [ "$BATTERY" -le 25 ]; then
        ICON=""
    elif [ "$BATTERY" -le 50 ]; then
        ICON=""
    elif [ "$BATTERY" -le 75 ]; then
        ICON=""
    else
        ICON=""
    fi
else
    ICON=""
fi

echo "$ICON $BATTERY%"

