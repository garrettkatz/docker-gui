XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth

# # Might need this if xauth doesn't already exist
# touch $XAUTH
# xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

GUI_UID=$(id -u)
GUI_GID=$(id -g)

docker run -it --rm \
    --volume="$XSOCK:$XSOCK:rw" \
    --volume="$XAUTH:$XAUTH:rw" \
    --env="XAUTHORITY=${XAUTH}" \
    --env="DISPLAY" \
    --user="gui" \
    --env="GUI_UID=${GUI_UID}" \
    --env="GUI_GID=${GUI_GID}" \
    docker-gui


