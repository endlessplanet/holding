#!/bin/sh

dnf update --assumeyes &&
    dnf install --assumeyes git make python tar which bzip2 ncurses gmp-devel mpfr-devel libmpc-devel glibc-devel flex bison glibc-static zlib-devel gcc gcc-c++ nodejs &&
    mkdir /opt/docker/c9sdk &&
    git -C /opt/docker/c9sdk init &&
    git -C /opt/docker/c9sdk remote add origin git://github.com/c9/core.git &&
    git -C /opt/docker/c9sdk pull origin master &&
    /opt/docker/c9sdk/scripts/install-sdk.sh &&
    cp /opt/docker/docker.repo /etc/yum.repos.d/ &&
    dnf update --assumeyes &&
    dnf install --assumeyes docker-engine &&
    dnf install --assumeyes util-linux-user &&
    dnf update --assumeyes &&
    dnf clean all &&
    true