#!/usr/bin/env python3

import subprocess
import sys


def get_current_volume():
    result = subprocess.run(['pamixer', '--get-volume'],
                            capture_output=True, text=True)
    return int(result.stdout)


def set_volume(volume):
    volume = max(0, min(100, volume))  # Ensure volume is between 0 and 100
    subprocess.run(['pactl', 'set-sink-volume',
                   '@DEFAULT_SINK@', f'{volume}%'])
    subprocess.run(['notify-send', f'Volume {volume}'])


def toggle_mute():
    subprocess.run(['pactl', 'set-sink-mute', '@DEFAULT_SINK@', 'toggle'])
    subprocess.run(['notify-send', 'Toggled mute'])


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(
            "Invalid number of arguments. Usage: volume_control.py [mute|increase|decrease]")
        sys.exit(1)

    action = sys.argv[1]
    current_volume = get_current_volume()

    if action == "mute":
        toggle_mute()
    elif action == "increase":
        set_volume(current_volume + 10)
    elif action == "decrease":
        set_volume(current_volume - 10)
    else:
        print(
            "Invalid argument. Usage: volume_control.py [mute|increase|decrease]")
        sys.exit(1)
