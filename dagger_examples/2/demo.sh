#!/bin/bash

#Start the local registry for image push
docker run -d -p 5555:5000 --name registry registry:2

#Run Dagger, that's why you are here...
REGISTRY_TOKEN="_" REGISTRY_USER="_" REGISTRY_URL="localhost:5555" dagger do build -p ci.cue --no-cache

#Start the container from local registry
docker stop demo2 || true
docker run -p 12345:5000 -d --rm --pull always --name demo2 localhost:5555/demo2:latest

