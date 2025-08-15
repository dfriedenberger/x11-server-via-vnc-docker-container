FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive \
    NOVNC_PORT=6080 \
    VNC_HOST=desktop \
    VNC_PORT=5901

# Install noVNC + websockify
RUN apt-get update && apt-get install -y \
    novnc \
    websockify \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 6080

# Start noVNC and websockify
CMD ["bash", "-c", "websockify --web=/usr/share/novnc $NOVNC_PORT $VNC_HOST:$VNC_PORT"]
