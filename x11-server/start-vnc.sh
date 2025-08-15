#!/bin/bash

echo "Warte auf X-Server $DISPLAY..."

# Remove old lock files
rm -f /tmp/.X1-lock /tmp/.X11-unix/X1

# Start VNC server
tightvncserver :1 -geometry $RESOLUTION -depth 24 -rfbport 5901


echo "Waiting for X server $DISPLAY..."
while ! xdpyinfo -display $DISPLAY >/dev/null 2>&1; do
    sleep 0.5
done
echo "X server is now available!"

# Allow connections to the X server
xhost +

# Load X resources
xrdb $HOME/.Xresources

# Keep container running
tail -f /dev/null
