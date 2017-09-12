#!/bin/sh

CID=$(mktemp) &&
    cleanup(){
        docker stop $(cat ${CID}) &&
            docker rm --force --volume $(cat ${CID}) &&
            rm -f ${CID}
    } &&
    docker login --username ${DOCKERHUB_USERNAME} --password ${DOCKERHUB_PASSWORD} &&
    docker image pull endlessplanet/holding:$(git rev-parse --verify HEAD) &&
    rm -f ${CID} &&
    docker container create --cidfile ${CID} endlessplanet/holding:$(git rev-parse --verify HEAD) &&
    docker container start $(cat ${CID}) &&
    docker inspect $(cat ${CID})