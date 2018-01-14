#!/bin/bash
cd src/main/resources
docker build --no-cache .  -t docker-example-with-dockerfile:latest