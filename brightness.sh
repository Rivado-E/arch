#!/bin/bash

# Usage: brightness.sh <brightness_value>
# Example: brightness.sh 0.5

# Check if an argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <brightness_value>"
    exit 1
fi

# Get the brightness value from the argument
brightness=$1

# Check if the brightness value is between 0 and 1
if (( $(echo "$brightness > 0" | bc -l) )) && (( $(echo "$brightness <= 1" | bc -l) )); then
    # Adjust the brightness using xrandr
    xrandr --output eDP --brightness $brightness
else
    echo "Error: Brightness value should be between 0 and 1."
fi

