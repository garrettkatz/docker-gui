# docker-gui
A template for docker images that can run GUIs using the host's X server

Based on the "isolated" method [here](https://wiki.ros.org/docker/Tutorials/GUI)
Follows that webpage's suggestion to assign uid/gid at runtime avoiding user-specific config in the container

First, the Dockerfile builds the image with a "gui" user.
Next, run.sh on the host runs the image in a container and passes in the host user's UID and GID
Last, startup.sh in the container updates the gui user's UID and GID to match, and runs xeyes to validate

Build the image: In the top-level of the repository run

`$ docker build -f ./docker/Dockerfile -t="docker-gui" .`

To run the image and launch xeyes:

`$ run.sh`

If it's working, you should see the xeyes window.  Close it to shut down the container.

