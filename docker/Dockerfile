# Use an official Python runtime as a parent image
FROM python:3.7-slim

MAINTAINER Garrett Katz <garrett.katz@gmail.com>

COPY src/ /src

# Add new sudo user
# UID and GID will be assigned at runtime to match host
ENV USERNAME gui
RUN mkdir /etc/sudoers.d && \
    useradd -m $USERNAME && \
    echo "$USERNAME:$USERNAME" | chpasswd && \
    usermod --shell /bin/bash $USERNAME && \
    usermod -aG sudo $USERNAME && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME

# install x11-apps to validate image with xeyes
# install sudo to set gid at runtime
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        pkg-config \
        x11-apps \
        sudo \
    && rm -rf /var/lib/apt/lists/*

# Starts in a bash shell when you run the image in a container
# CMD ["/bin/bash"]
# CMD ["xeyes"]
CMD ["/src/startup.sh"]

