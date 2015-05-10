#!/bin/bash
DEFAULT_SINK=$(pactl info | grep 'Default Sink' | cut -d\  -f3)

case $1 in
    volume-up)
        pactl set-sink-volume $DEFAULT_SINK +5%;;
    volume-down)
        pactl set-sink-volume $DEFAULT_SINK -5%;;
    toggle-mute)
        pactl set-sink-mute $DEFAULT_SINK toggle;;
    *)
        echo "Usage: $0 [volume-up|volume-down|toggle-mute]" 1>&2
        exit 1
        ;;
esac
