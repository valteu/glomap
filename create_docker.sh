#!/bin/bash
docker build --network=host -t glomap:latest .
docker tag glomap:latest valteu/glomap:latest
docker push valteu/glomap:latest

