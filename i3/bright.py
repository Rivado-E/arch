#!/usr/bin/env python3

import subprocess
import sys


def get_current_brightness():
    try:
        result = subprocess.run(['xrandr', '--verbose'],
                                capture_output=True, text=True)
        lines = result.stdout.split('\n')
        for line in lines:
            if 'Brightness:' in line:
                brightness = line.split(' ')[1]
                return float(brightness)
    except Exception as e:
        print("Error:", e)
        return None


def set_brightness(brightness: int) -> None:
    subprocess.run(["xrandr", "--output", "eDP",
                   "--brightness", str(brightness)])
    subprocess.run(["notify-send", f"brightness: {brightness}"])


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(
            "Invalid number of arguments. Usage: bright.py [inc|dec]")
        sys.exit(1)

    action = sys.argv[1]
    current_brightness = get_current_brightness()

    if action == "inc":
        set_brightness(current_brightness + .1)
    elif action == "dec":
        set_brightness(current_brightness - .1)
