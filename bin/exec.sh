#!/bin/sh

CID=$(mktemp) &&
    cleanup(){
        docker stop $(cat ${CID}) &&
            docker rm --force --volume $(cat ${CID}) &&
            rm -f ${CID}
    } &&
    (nohup ssh -i bin/blacklogbook.pem -fN -L 0.0.0.0:25139:0.0.0.0:8181 sshd </dev/null >/tmp/sshd1.log 2>&1 &) &&
    docker login --username ${DOCKERHUB_USERNAME} --password ${DOCKERHUB_PASSWORD} &&
    docker image pull endlessplanet/holding:$(git rev-parse --verify HEAD) &&
    rm -f ${CID} &&
    docker container create --cidfile ${CID} endlessplanet/holding:$(git rev-parse --verify HEAD) &&
    docker container start $(cat ${CID}) &&
    docker inspect $(cat ${CID})