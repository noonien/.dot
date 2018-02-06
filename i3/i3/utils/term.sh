#!/bin/bash
# Start a terminal from the current focused terminal's CWD

# default CWD
CWD=$HOME

# Get ID of current focused window
ID=$(xdpyinfo | grep focus | cut -f4 -d " " | tr -d '[:space:],')

# Get the process' PID
PID=$(xprop -id $ID | grep -m 1 PID | cut -d " " -f 3)
if [ -z "$PID" ]; then
    exec xfce4-terminal --disable-server
fi

# Check if it's an xfce4-terminal window, if not, don't use it's CWD
CLASS=$(xprop -id $ID | grep -m 1 CLASS | cut -d \" -f 2)
if [ "$CLASS" == "xfce4-terminal" ]; then
    SHELL_PID=$(ps -o pid --no-headers --ppid $PID | tr -d '[:space:]')
    CWD=$(readlink /proc/$SHELL_PID/cwd)
fi

exec xfce4-terminal --disable-server --working-directory="$CWD"
