#!/bin/sh

apk update &&
    apk upgrade &&
    adduser -D user &&
    mkdir /home/user/volumes &&
    mkdir /home/user/volumes/gitlab &&
    mkdir /home/user/volumes/gitlab/config &&
    mkdir /home/user/volumes/gitlab/logs &&
    mkdir /home/user/volumes/gitlab/data &&
    chown -R user:user /home/user/volumes &&
    rm -rf /var/cache/apk/*