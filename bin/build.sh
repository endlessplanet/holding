#!/bin/sh

docker login --username ${DOCKERHUB_USERNAME} --password ${DOCKERHUB_PASSWORD} &&
    docker image build --tag endlessplanet/holding:$(git rev-parse --verify HEAD) image &&
    docker image push endlessplanet/holding:$(git rev-parse --verify HEAD)