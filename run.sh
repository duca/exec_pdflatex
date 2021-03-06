#!/bin/bash
XSOCK=/tmp/.X11-unix/X0
XAUTH=/tmp/.docker.xauth
chmod 644 ${XAUTH}
xauth nlist ${DISPLAY} | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
# XSOCK=$(ls /tmp/.X11-unix/*) && docker run --rm --network=host -it -e DISPLAY:$DISPLAY -v $XSOCK:$XSOCK -v $HOME/work:/home/compass/work:Z  compass-compilation

xauth nlist ${DISPLAY} | sed -e 's/^..../ffff/' | xauth -f ${XAUTH} nmerge - &&\
    docker run --rm \
           -it\
	   -m 20G \
	   -e LC_ALL=en_US.utf8 \
           -v $PWD/data:/source \
	   tex_texlive
