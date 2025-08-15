#!/bin/bash

# Wait for X server
echo "Waiting for X server $DISPLAY..."

while ! xdpyinfo -display $DISPLAY >/dev/null 2>&1; do
    sleep 0.5
done

echo "X server is now available!"

# Set background image
feh --bg-scale /root/bgimage.jpg &


# Start the selected window manager
# Check environment for fluxbox, icewm, or openbox
if [ "$WM" = "fluxbox" ]; then
    fluxbox
elif [ "$WM" = "icewm" ]; then
    icewm   
else
    openbox-session
fi
