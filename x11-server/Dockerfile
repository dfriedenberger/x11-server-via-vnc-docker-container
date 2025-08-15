FROM ubuntu:20.04

ENV TZ=DE \
    DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && apt-get install -y \
    xorg \
    xauth \
    x11-apps \
    tightvncserver \
    && apt-get clean

ENV USER=root
ENV HOME=/root

## Configure VNC server
RUN mkdir -p $HOME/.vnc 
RUN echo "ubuntu" | vncpasswd -f > $HOME/.vnc/passwd 
RUN chmod 600 $HOME/.vnc/passwd

#COPY xstartup $HOME/.vnc/xstartup
#RUN chmod +x $HOME/.vnc/xstartup

# Set environment variables
ENV DISPLAY :1

# Expose the necessary ports
EXPOSE 5901

## X11 Configs
COPY Xresources.txt $HOME/.Xresources
RUN touch $HOME/.Xauthority

COPY start-vnc.sh $HOME/start-vnc.sh
RUN chmod +x $HOME/start-vnc.sh

# Start the services
CMD $HOME/start-vnc.sh

