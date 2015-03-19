#!/bin/bash
# Start a terminal from the current focused terminal's CWD

# Get ID of current focused window
ID=$(xdpyinfo | grep focus | cut -f4 -d " ")

# Check if it's an urxvt window, if not, don't use it's CWD
CLASS=$(xprop -id $ID | grep -m 1 CLASS | cut -d \" -f 2)
if [ "$CLASS" != "urxvt" ]; then
    exec urxvt
fi

# Get the process' PID
PID=$(xprop -id $ID | grep -m 1 PID | cut -d " " -f 3)
if [ -z "$PID" ]; then
    exec urxvt
fi

TREE=$(pstree -lpA $PID | tail -n 1)
PID=$(echo $TREE | awk -F'---' '{print $NF}' | sed -re 's/[^0-9]//g')

if [[ "$1" == "--connect-ssh" && $(cat /proc/$PID/comm) == "ssh" ]]; then
    SSH_CMD=$(cat /proc/$PID/cmdline | tr '\000' ' ')
    SSH_CWD=$(xprop -id $ID | grep "WM_NAME(STRING)" | cut -d \  -f 4 | tr -d \")
    exec urxvt -e $SSH_CMD -t  "cd $SSH_CWD; exec $SHELL"
fi

# If we find the working directory, run the command in that directory
if ! [ -e "/proc/$PID/cwd" ]; then
    exec urxvt
fi

exec urxvt -cd $(readlink /proc/$PID/cwd)
