FROM ubuntu:20.04

ENV TZ=Europe/Berlin \
    DEBIAN_FRONTEND=noninteractive \
    USER=root \
    HOME=/root

## Install tools
RUN apt-get update && apt-get install -y \
    x11-utils \
    x11-xserver-utils \
    x11-apps

## OpenBox
RUN apt-get install -y openbox obconf \
    && apt-get clean

## alternative: icewm
RUN apt-get install -y icewm 

## alternative: fluxbox
RUN apt-get install -y fluxbox 


## Background image
RUN apt-get install -y feh
COPY hardware-4955429_1920.jpg /root/bgimage.jpg

## Cleanup
RUN apt-get clean

## Entrypoint
COPY start-wm.sh /root/start-wm.sh
RUN chmod +x /root/start-wm.sh
CMD ["/root/start-wm.sh"]
