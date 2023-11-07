#!/bin/sh

BASE_DIR="$(dirname "$0")"

docker compose -f "${BASE_DIR}/toolchains/docker-compose.arm.yml" up
docker compose -f "${BASE_DIR}/toolchains/docker-compose.arm.yml" down
